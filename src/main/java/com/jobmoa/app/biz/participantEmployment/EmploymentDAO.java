package com.jobmoa.app.biz.participantEmployment;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class EmploymentDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "EmploymentDAO.";

    public boolean insert(EmploymentDTO employmentDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.insert(ns+"employmentInsert", employmentDTO) > 0;
        log.info("employment insert SQL flag : [{}]",flag);
        return flag;
    }
    public boolean update(EmploymentDTO employmentDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.update(ns+"update", employmentDTO) > 0;
        log.info("employment update SQL flag : [{}]",flag);
        return flag;
    }
    public boolean delete(EmploymentDTO employmentDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.delete(ns+"delete", employmentDTO) > 0;
        log.info("employment delete SQL flag : [{}]",flag);
        return flag;
    }
    public EmploymentDTO selectOne(EmploymentDTO employmentDTO) {
        EmploymentDTO data = sqlSession.selectOne(ns+"selectOne", employmentDTO);
        log.info("employment selectOne data : [{}]",data);
        return data;
    }
    public List<EmploymentDTO> selectAll(EmploymentDTO employmentDTO) {
        return null;
    }

}
