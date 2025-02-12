package com.jobmoa.app.biz.participantEducation;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class EducationDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "EducationDAO.";

    public boolean insert(EducationDTO educationDTO) {
        log.info("EducationDTO insert : [{}]", educationDTO);
        boolean flag = sqlSession.insert(ns+"educationInsert", educationDTO) > 0;
        log.info("EducationDTO insert : [{}]",flag);
        return flag;
    }
    public boolean update(EducationDTO educationDTO) {
        log.info("EducationDTO update : [{}]", educationDTO);
        boolean flag = sqlSession.update(ns+educationDTO.getEducationCondition(), educationDTO) > 0;
        log.info("EducationDTO update : [{}]",flag);
        return flag;
    }
    public boolean delete(EducationDTO educationDTO) {
        log.info("EducationDTO delete : [{}]", educationDTO);
        boolean flag = sqlSession.delete(ns+"educationDelete", educationDTO) > 0;
        log.info("EducationDTO delete : [{}]",flag);
        return flag;
    }
    public EducationDTO selectOne(EducationDTO educationDTO) {
        log.info("EducationDTO selectOne : [{}]", educationDTO);
        return sqlSession.selectOne(ns+ educationDTO.getEducationCondition(), educationDTO);
    }
    public List<EducationDTO> selectAll(EducationDTO educationDTO) {
        log.info("EducationDTO selectAll : [{}]", educationDTO);
        return sqlSession.selectList(ns+ educationDTO.getEducationCondition(), educationDTO);
    }
}
