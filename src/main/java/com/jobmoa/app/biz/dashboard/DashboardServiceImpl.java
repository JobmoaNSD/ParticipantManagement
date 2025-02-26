package com.jobmoa.app.biz.dashboard;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("Dashboard")
public class DashboardServiceImpl implements DashboardService {

    @Autowired
    private DashboardDAO DashboardDAO;

    @Override
    public List<DashboardDTO> selectAll(DashboardDTO dashboardDTO) {
        log.info("DashboardServiceImpl selectAll Start");
        //log.info("List<DashboardDTO> DashboardService selectAll : [{}]", dashboardDTO);
        if(dashboardDTO == null || dashboardDTO.getDashboardCondition() == null) {
            log.info("List<DashboardDTO> DashboardService selectAll DashboardDTO null OR DashboardCondition null");
            log.error("selectAll DashboardDTO null OR DashboardCondition null");
            return null;
        }
        log.info("List<DashboardDTO> DashboardService selectAll end");
        return DashboardDAO.selectAll(dashboardDTO);
    }

    @Override
    public DashboardDTO selectOne(DashboardDTO dashboardDTO) {
        log.info("DashboardServiceImpl selectOne Start");
//        log.info("DashboardDTO DashboardService selectOne : [{}]", dashboardDTO);
        if(dashboardDTO == null || dashboardDTO.getDashboardCondition() == null) {
            log.info("DashboardDTO DashboardService selectOne DashboardDTO null OR DashboardCondition null");
            log.error("selectOne DashboardDTO null OR DashboardCondition null");
            return null;
        }
        log.info("DashboardServiceImpl selectOne End");
        return DashboardDAO.selectOne(dashboardDTO);
    }

    @Override
    public boolean insert(DashboardDTO dashboardDTO) {
        return false;
    }

    @Override
    public boolean update(DashboardDTO dashboardDTO) {
        return false;
    }

    @Override
    public boolean delete(DashboardDTO dashboardDTO) {
        return false;
    }
}
