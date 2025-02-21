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
        log.info("List<DashboardDTO> DashboardService selectAll : [{}]", dashboardDTO);
        if(dashboardDTO == null || dashboardDTO.getDashboardCondition() == null) {
            log.error("selectAll DashboardDTO null OR DashboardCondition null");
            return null;
        }
        return DashboardDAO.selectAll(dashboardDTO);
    }

    @Override
    public DashboardDTO selectOne(DashboardDTO dashboardDTO) {
        log.info("DashboardDTO DashboardService selectOne : [{}]", dashboardDTO);
        if(dashboardDTO == null || dashboardDTO.getDashboardCondition() == null) {
            log.error("selectOne DashboardDTO null OR DashboardCondition null");
            return null;
        }
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
