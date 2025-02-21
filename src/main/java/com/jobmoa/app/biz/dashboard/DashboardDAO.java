package com.jobmoa.app.biz.dashboard;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class DashboardDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "DashboardDAO.";

    public List<DashboardDTO> selectAll(DashboardDTO dashboardDTO) {
        log.info("DashboardDTO DashboardDAO selectAll : [{}]", dashboardDTO);
        List<DashboardDTO> datas = sqlSession.selectList(ns+ dashboardDTO.getDashboardCondition(), dashboardDTO);
        log.info("datas : [{}]",datas.toString());
        return datas;
    }

    public DashboardDTO selectOne(DashboardDTO dashboardDTO) {
        log.info("DashboardDTO DashboardDAO selectOne : [{}]", dashboardDTO);
        log.info("DashboardDTO DashboardDAO selectOne condition : [{}]", dashboardDTO.getDashboardCondition());
        DashboardDTO data = sqlSession.selectOne(ns+ dashboardDTO.getDashboardCondition(), dashboardDTO);

        log.info("DashboardDTO DashboardDAO data : [{}]",data);
        return data;
    }

    public boolean insert(DashboardDTO dashboardDTO) {
        return false;
    }

    public boolean update(DashboardDTO dashboardDTO) {
        return false;
    }

    public boolean delete(DashboardDTO dashboardDTO) {
        return false;
    }


}
