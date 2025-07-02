package com.jobmoa.app.jobPlacement.biz.jobPlacement;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class JobPlacementDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "JobPlacementDAO.";

    public boolean insert(JobPlacementDTO jobPlacementDTO) {
        String condition = jobPlacementDTO.getCondition();
        log.info("JobPlacementDTO insert : [{}]",condition);
        return sqlSession.insert(ns+condition,jobPlacementDTO) > 0;
    }

    public boolean update(JobPlacementDTO jobPlacementDTO) {
        String condition = jobPlacementDTO.getCondition();
        log.info("JobPlacementDTO update : [{}]",condition);
        return sqlSession.update(ns+condition,jobPlacementDTO) > 0;
    }

    public boolean delete(JobPlacementDTO jobPlacementDTO) {
        String condition = jobPlacementDTO.getCondition();
        log.info("JobPlacementDTO delete : [{}]",condition);
        return sqlSession.delete(ns+condition,jobPlacementDTO) > 0;
    }

    public JobPlacementDTO selectOne(JobPlacementDTO jobPlacementDTO) {
        String condition = jobPlacementDTO.getCondition();
        log.info("JobPlacementDTO selectOne : [{}]",condition);
        JobPlacementDTO data = sqlSession.selectOne(ns+condition,jobPlacementDTO);
        log.info("JobPlacementDTO selectOne jobPlacementDTO1 : [{}]",data);
        if(data == null) data = null;
        return data;
    }


    public List<JobPlacementDTO> selectAll(JobPlacementDTO jobPlacementDTO) {
        String condition = jobPlacementDTO.getCondition();
        log.info("JobPlacementDTO selectAll : [{}]",condition);
        List<JobPlacementDTO> datas = sqlSession.selectList(ns+condition,jobPlacementDTO);
        log.info("JobPlacementDTO selectAll jobPlacementDTO1 : [{}]",datas);
        if(datas == null) datas = null;

        return datas;
    }
}
