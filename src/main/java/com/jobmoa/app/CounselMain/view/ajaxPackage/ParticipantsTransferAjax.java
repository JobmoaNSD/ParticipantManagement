package com.jobmoa.app.CounselMain.view.ajaxPackage;

import com.jobmoa.app.CounselMain.biz.participant.ParticipantDTO;
import com.jobmoa.app.CounselMain.biz.participant.ParticipantServiceImpl;
import com.jobmoa.app.CounselMain.view.function.ChangeJson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
public class ParticipantsTransferAjax {

    @Autowired
    private ParticipantServiceImpl participantService;

    @Autowired
    private ChangeJson changeJson;  // 컴포넌트로 주입받기

    @GetMapping("/transferGetAjax.login")
    public String ParticipantsTransfer(ParticipantDTO participantDTO){
        log.info("transferGetAjax.login : [{}]",participantDTO.getParticipantIDs());
        participantDTO.setParticipantCondition("transferSelect");
        List<ParticipantDTO> listData = this.participantService.selectAll(participantDTO);
        String json = this.changeJson.convertListToJsonArray(listData, item -> {
            ParticipantDTO dto = (ParticipantDTO) item;  // 객체 캐스팅
            String test = dto.getParticipantDob()==null?"":dto.getParticipantDob();
            return "{\"jobno\":\"" + dto.getParticipantJobNo() + "\"," //참여자 구직번호
                          + "\"userName\":\"" + dto.getParticipantUserName() + "\"," //상담사 성명
                          + "\"particName\":\"" + dto.getParticipantPartic() + "\"," //참여자 성명
                          + "\"dob\":\"" + test + "\"," //참여자 생년월일
                          + "\"gender\":\"" + dto.getParticipantGender() //참여자 성별
                          + "\"}";
        });
        return json;
    }

    @PostMapping("/transferPostAjax.login")
    public boolean ParticipantsTransferUpdate(@RequestBody ParticipantDTO participantDTO){
        log.info("transferPostAjax.login : [{}]",participantDTO.getParticipantIDs());
        participantDTO.setParticipantCondition("transferUpdate");
        boolean flag = this.participantService.update(participantDTO);
        return flag;
    }
}
