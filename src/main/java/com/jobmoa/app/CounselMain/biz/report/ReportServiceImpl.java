package com.jobmoa.app.CounselMain.biz.report;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("reportService")
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportDAO reportDAO;

    @Override
    public ReportDTO selectOne(ReportDTO reportDTO) {
        log.info("Report selectOne SQL ReportServiceImpl : [{}]",reportDTO.getReportCondition());
        // 데이터 초기화를 위해 선언
        ReportDTO data = null;
        //DAO에 selectAll 함수를 호출
        //만약 condition 값이 있고 DTO 데이터가 null이 아니면 selectOne 진행
        if(reportDTO.getReportCondition() != null) {
            data = reportDAO.selectOne(reportDTO);
        }
        return data;
    }

    @Override
    public List<ReportDTO> selectAll(ReportDTO reportDTO) {
        log.info("Report selectAll SQL ReportServiceImpl : [{}]",reportDTO.getReportCondition());
        // 데이터 초기화를 위해 선언
        List<ReportDTO> datas = null;
        //DAO에 selectAll 함수를 호출
        //만약 condition 값이 있고 DTO 데이터가 null이 아니면 selectOne 진행
        if(reportDTO.getReportCondition() != null) {
            datas = reportDAO.selectAll(reportDTO);
        }
        log.info("datas : [{}]",datas);
        return datas;
    }

    @Override
    public boolean insert(ReportDTO reportDTO) {
        return false;
    }

    @Override
    public boolean update(ReportDTO reportDTO) {
        return false;
    }

    @Override
    public boolean delete(ReportDTO reportDTO) {
        return false;
    }
}
