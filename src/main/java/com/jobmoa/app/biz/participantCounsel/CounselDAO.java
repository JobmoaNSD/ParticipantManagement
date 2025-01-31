package com.jobmoa.app.biz.participantCounsel;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class CounselDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "CounselDAO.";

    public CounselDTO selectOne(CounselDTO counselDTO) {
        CounselDTO data = sqlSession.selectOne(ns+"selectOne", counselDTO);
        log.info("data : [{}]",data);
        return data;
    }
    public List<CounselDTO> selectAll(CounselDTO counselDTO) {
        return null;
    }
    public boolean insert(CounselDTO counselDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.insert(ns+"counselInsert", counselDTO) > 0;
        log.info("counsel insert SQL flag : [{}]",flag);
        return flag;
    }
    public boolean update(CounselDTO counselDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.update(ns+"update", counselDTO) > 0;
        log.info("counsel update SQL flag : [{}]",flag);
        return flag;
    }
    public boolean delete(CounselDTO counselDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.delete(ns+"delete", counselDTO) > 0;
        log.info("counsel delete SQL flag : [{}]",flag);
        return flag;
    }
}
