package com.jobmoa.app.biz.report;

import java.util.List;

public interface ReportService {
    ReportDTO selectOne(ReportDTO counselDTO);
    List<ReportDTO> selectAll(ReportDTO counselDTO);
    boolean insert(ReportDTO counselDTO);
    boolean update(ReportDTO counselDTO);
    boolean delete(ReportDTO counselDTO);
}
