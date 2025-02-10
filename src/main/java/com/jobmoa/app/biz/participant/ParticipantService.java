package com.jobmoa.app.biz.participant;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("participant")
public class ParticipantService implements ParticipantServiceImpl {

    @Autowired
    private ParticipantDAO participantDAO;

    @Override
    public List<ParticipantDTO> selectAll(ParticipantDTO participantDTO) {
        log.info("List<ParticipantDTO> ParticipantService selectAll : [{}]",participantDTO);
        if(participantDTO == null || participantDTO.getParticipantCondition() == null) {
            log.error("selectAll participantDTO null OR participantCondition null");
            return null;
        }
        return participantDAO.selectAll(participantDTO);
    }

    @Override
    public ParticipantDTO selectOne(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantService selectOne : [{}]",participantDTO);
        if(participantDTO == null || participantDTO.getParticipantCondition() == null) {
            log.error("selectOne participantDTO null OR participantCondition null");
            return null;
        }
        return participantDAO.selectOne(participantDTO);
    }

    @Override
    public boolean insert(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantService insert : [{}]",participantDTO);
        return participantDAO.insert(participantDTO);
    }

    @Override
    public boolean update(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantService update : [{}]",participantDTO);
        return participantDAO.update(participantDTO);
    }

    @Override
    public boolean delete(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantService delete : [{}]",participantDTO);
        return participantDAO.delete(participantDTO);
    }
}
