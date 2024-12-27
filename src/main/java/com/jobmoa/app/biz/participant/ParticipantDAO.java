package com.jobmoa.app.biz.participant;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class ParticipantDAO {

    @Autowired
    SqlSession sqlSession;

    private static final String ns = "ParticipantDAO.";

    public List<ParticipantDTO> selectAll(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantDAO selectAll : [{}]", participantDTO.toString());
        List<ParticipantDTO> datas = sqlSession.selectList(ns+"");//SELECT Query 작성 완료하면 적어야함
        log.info("datas : [{}]",datas.toString());
        return datas;
    }

    public ParticipantDTO selectOne(ParticipantDTO participantDTO) {
        log.info("ParticipantDTO ParticipantDAO selectOne : [{}]",participantDTO.toString());
        ParticipantDTO data = sqlSession.selectOne(ns+"");
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
