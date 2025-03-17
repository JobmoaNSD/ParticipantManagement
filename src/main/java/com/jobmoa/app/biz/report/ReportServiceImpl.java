package com.jobmoa.app.biz.report;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("counselService")
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportDAO counselDAO;

    @Override
    public ReportDTO selectOne(ReportDTO counselDTO) {
//        log.info("counsel selectOne SQL counselDTO : [{}]",counselDTO);
        log.info("counsel selectOne SQL counselDTO : [{}]",counselDTO.getCounselCondition());
        // 데이터 초기화를 위해 선언
        ReportDTO data = null;
        //DAO에 selectOne 함수를 호출
        //만약 condition 값이 있고 DTO 데이터가 null이 아니면 selectOne 진행
        if(counselDTO != null && counselDTO.getCounselCondition() != null) {
            data = counselDAO.selectOne(counselDTO);
        }
        log.info("data : [{}]",data);
        return data;
    }

    @Override
    public List<ReportDTO> selectAll(ReportDTO counselDTO) {
        return List.of();
    }

    @Override
    public boolean insert(ReportDTO counselDTO) {
        return counselDAO.insert(counselDTO);
    }

    @Override
    public boolean update(ReportDTO counselDTO) {
        boolean flag = false;
        if(counselDTO != null && counselDTO.getCounselCondition() != null) {
            flag = counselDAO.update(counselDTO);
        }
        return flag;
    }

    @Override
    public boolean delete(ReportDTO counselDTO) {
        return false;
    }
}
