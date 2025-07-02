package com.jobmoa.app.CounselMain.biz.report;

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

    private static final String ns = "ReportDAO.";

    public ReportDTO selectOne(ReportDTO reportDTO) {
        String condition = reportDTO.getReportCondition();
        log.info("Report selectOne SQL reportDTO : [{}]",condition);
        ReportDTO data = sqlSession.selectOne(ns+condition, reportDTO);
        return data;
    }
    public List<ReportDTO> selectAll(ReportDTO reportDTO) {
        String condition = reportDTO.getReportCondition();
        log.info("Report selectAll SQL reportDTO : [{}]",condition);
        List<ReportDTO> datas = sqlSession.selectList(ns+condition, reportDTO);
        //log.info("data : [{}]",datas);
        return datas;
    }
    public boolean insert(ReportDTO reportDTO) {
        return false;
    }
    public boolean update(ReportDTO reportDTO) {
        return false;
    }
    public boolean delete(ReportDTO reportDTO) {
        return false;
    }
}
