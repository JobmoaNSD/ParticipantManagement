package com.jobmoa.app.CounselMain.view.participantRandomAssignment;

import com.jobmoa.app.CounselMain.biz.participantRandomAssignment.ParticipantRandomAssignmentDTO;
import com.jobmoa.app.CounselMain.biz.participantRandomAssignment.ParticipantRandomAssignmentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
public class PraAsyncAPI {

    @Autowired
    private ParticipantRandomAssignmentService praService;

    @PostMapping("/api/pra.login")
    public ResponseEntity<?> praInsertAPI(@RequestBody List<ParticipantRandomAssignmentDTO> asyncList){
        //입력 데이터 확인
         log.info("praInsertAPI : [{}]",asyncList);
        try{
            boolean flag = false;
            //정보 업데이트
            for(ParticipantRandomAssignmentDTO dto : asyncList){
                dto.setCondition("praInsert");
                flag = praService.insert(dto);
            }

            return ResponseEntity.ok(flag);
        }
        catch (Exception e){
            log.error("praInsertAPI Exception : [{}]",e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        }

    }
}
