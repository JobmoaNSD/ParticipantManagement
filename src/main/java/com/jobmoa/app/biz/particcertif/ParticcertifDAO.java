package com.jobmoa.app.biz.particcertif;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class ParticcertifDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "ParticcertifDAO.";

    public boolean insert(ParticcertifDTO particcertifDTO) {
        log.info("particcertifDTO : [{}]",particcertifDTO);
        boolean flag = sqlSession.insert(ns+"particcertifInsert",particcertifDTO) > 0;
        log.info("particcertifDTO insert : [{}]",flag);
        return flag;
    }
    public boolean update(ParticcertifDTO particcertifDTO) {
        return false;
    }
    public boolean delete(ParticcertifDTO particcertifDTO) {
        return false;
    }
    public ParticcertifDTO selectOne(ParticcertifDTO particcertifDTO) {
        return null;
    }
    public ParticcertifDTO selectAll(ParticcertifDTO particcertifDTO) {
        return null;
    }
}
