package com.jobmoa.app.jobPlacement.biz.jobPlacement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("jobPlacementService")
public class JobPlacementServiceImpl implements JobPlacementService{
    @Autowired
    private JobPlacementDAO jobPlacementDAO;

    @Override
    public JobPlacementDTO selectOne(JobPlacementDTO jobPlacementDTO) {
        return jobPlacementDAO.selectOne(jobPlacementDTO);
    }

    @Override
    public List<JobPlacementDTO> selectAll(JobPlacementDTO jobPlacementDTO) {
        return jobPlacementDAO.selectAll(jobPlacementDTO);
    }

    @Override
    public boolean insert(JobPlacementDTO jobPlacementDTO) {
        return jobPlacementDAO.insert(jobPlacementDTO);
    }

    @Override
    public boolean update(JobPlacementDTO jobPlacementDTO) {
        return jobPlacementDAO.update(jobPlacementDTO);
    }

    @Override
    public boolean delete(JobPlacementDTO jobPlacementDTO) {
        return jobPlacementDAO.delete(jobPlacementDTO);
    }
}
