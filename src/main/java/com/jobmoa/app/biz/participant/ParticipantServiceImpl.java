package com.jobmoa.app.biz.participant;

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
    public List<ParticipantDTO> selectALl(ParticipantDTO participantDTO) {
        log.info("List<ParticipantDTO> ParticipantService selectAll : [{}]",participantDTO.toString());
        return null;
    }

    @Override
    public ParticipantDTO selectOne(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantService selectOne : [{}]",participantDTO.toString());
        return null;
    }

    @Override
    public boolean insert(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantService insert : [{}]",participantDTO.toString());
        return false;
    }

    @Override
    public boolean update(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantService update : [{}]",participantDTO.toString());
        return false;
    }

    @Override
    public boolean delete(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantService delete : [{}]",participantDTO.toString());
        return false;
    }
}
