package com.jobmoa.app.CounselMain.biz.participant;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("participant")
public class ParticipantServiceImpl implements ParticipantService {

    @Autowired
    private ParticipantDAO participantDAO;

    @Override
    public List<ParticipantDTO> selectAll(ParticipantDTO participantDTO) {
        //log.info("ParticipantDTO ParticipantService selectOne : [{}]",participantDTO);
        if(participantDTO == null || participantDTO.getParticipantCondition() == null) {
            log.error("selectAll participantDTO null OR participantCondition null");
            return null;
        }

        sanitizeSearchTerm(participantDTO);

        return participantDAO.selectAll(participantDTO);
    }

    private void sanitizeSearchTerm(ParticipantDTO participantDTO) {
        String search = participantDTO.getSearch();

        if(search != null && !search.isEmpty()){
            search = search.replaceAll("[!@#$%^&*]", "");

            participantDTO.setSearch(search);
        }
    }


    @Override
    public ParticipantDTO selectOne(ParticipantDTO participantDTO) {
        //log.info("ParticipantDTO ParticipantService selectOne : [{}]",participantDTO);
        if(participantDTO == null || participantDTO.getParticipantCondition() == null) {
            log.error("selectOne participantDTO null OR participantCondition null");
            return null;
        }
        return participantDAO.selectOne(participantDTO);
    }

    @Override
    public boolean insert(ParticipantDTO participantDTO) {
        //log.info("ParticipantDTO ParticipantService insert : [{}]",participantDTO);
        return participantDAO.insert(participantDTO);
    }

    @Override
    public boolean update(ParticipantDTO participantDTO) {
        //log.info("ParticipantDTO ParticipantService update : [{}]",participantDTO);
        return participantDAO.update(participantDTO);
    }

    @Override
    public boolean delete(ParticipantDTO participantDTO) {
        //log.info("ParticipantDTO ParticipantService delete : [{}]",participantDTO);
        //반환용 boolean flag 변수
        boolean flag = false;

        //기본정보 condition 이 null이 아니고 기본정보 dto 가 null이 아니라면
        if(participantDTO == null || participantDTO.getParticipantCondition() == null) {
            log.error("delete participantDTO not null OR participantCondition null");
            return false;
        }
        log.info("delete participantDTO not null OR participantCondition not null");
        //기본정보 삭제를 진행하고
        if(participantDAO.delete(participantDTO)){
            //각 삭제 쿼리를 실행할 condition
            String[] conditions = {"Particcertif","Education"};
            //삭제가 되었다면 반복문을 용해 각 정보를 삭제한다.
            for(String condition : conditions){
                //각 condition으로 검색해 값이 있으면 삭제 진행
                log.info("delete participantDTO condition : [{}]",condition);
                if(selectCount(participantDTO,condition)){
                    //정보에 맞는 삭제 쿼리를 실행하기 위해 condition 을 추가하고
                    log.info("Start delete participantDTO condition : [{}]",condition);
                    participantDTO.setParticipantCondition("participant"+condition+"Delete");
                    //삭제를 진행한다.
                    if(!participantDAO.delete(participantDTO)){
                        log.error("delete participantDTO condition : [{}] \n return false",condition);
                        //만약 삭제가 되지 않았다면 오류를 반환하여 트랜젝션을 실행시킨다.
                        throw new RuntimeException("Failed to delete participant data");
                    }
                    log.info("End delete participantDTO condition : [{}]",condition);
                }
            }
            //문제없이 끝나면 true 로 전달한다.
            flag = true;
        }
        log.info("End delete participantDTO flag : [{}]",flag);
        return flag;
    }

    private boolean selectCount(ParticipantDTO participantDTO, String condition){
        //값이 넘어올때 jobno는 있으니 condition 만 추가하여 값을 전달한다.
        participantDTO.setParticipantCondition("selectOne"+condition);
        //자격증 개수를 받고
        int count = participantDAO.selectOne(participantDTO).getParticipantCount();
        //자격증이 0 보다 크면 true, 0이거나 작으면 false 반환
        return count > 0;
    }
}
