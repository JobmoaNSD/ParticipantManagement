package com.jobmoa.app.biz.participant;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class ParticipantDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "ParticipantDAO.";

    public List<ParticipantDTO> selectAll(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantDAO selectAll : [{}]", participantDTO);
        List<ParticipantDTO> datas = sqlSession.selectList(ns+"selectAllParticipantBasic", participantDTO);
        log.info("datas : [{}]",datas.toString());
        return datas;
    }

    public ParticipantDTO selectOne(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantDAO selectOne : [{}]",participantDTO);
        ParticipantDTO data = sqlSession.selectOne(ns+"selectCountParticipant", participantDTO);
        log.info("ParticipantDTO ParticipantDAO data : [{}]",data);
        return data;
    }

    public boolean insert(ParticipantDTO participantDTO) {

        return false;
    }

    public boolean update(ParticipantDTO participantDTO) {

        return false;
    }

    public boolean delete(ParticipantDTO participantDTO) {

        return false;
    }


}
