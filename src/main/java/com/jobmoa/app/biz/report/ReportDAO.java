package com.jobmoa.app.biz.report;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class ReportDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "CounselDAO.";

    public ReportDTO selectOne(ReportDTO counselDTO) {
        String condition = counselDTO.getCounselCondition();
        log.info("counsel selectOne SQL counselDTO : [{}]",condition);
        ReportDTO data = sqlSession.selectOne(ns+condition, counselDTO);
        log.info("data : [{}]",data);
        return data;
    }
    public List<ReportDTO> selectAll(ReportDTO counselDTO) {
        return null;
    }
    public boolean insert(ReportDTO counselDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.insert(ns+"counselInsert", counselDTO) > 0;
        log.info("counsel insert SQL flag : [{}]",flag);
        return flag;
    }
    public boolean update(ReportDTO counselDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.update(ns+counselDTO.getCounselCondition(), counselDTO) > 0;
        log.info("counsel update SQL flag : [{}]",flag);
        return flag;
    }
    public boolean delete(ReportDTO counselDTO) {
        // 0보다 크면 True (성공)
        // 0보다 작거나 같으면 False (실패)
        boolean flag = sqlSession.delete(ns+"counselDelete", counselDTO) > 0;
        log.info("counsel delete SQL flag : [{}]",flag);
        return flag;
    }
}
