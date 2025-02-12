package com.jobmoa.app.biz.participantEducation;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class EducationServiceImpl implements EducationService {
    @Autowired
    private EducationDAO educationDAO;

    @Override
    public EducationDTO selectOne(EducationDTO educationDTO) {
        log.info("EducationDTO selectOne : [{}]", educationDTO);
        EducationDTO data = null;
        if(educationDTO != null || educationDTO.getEducationCondition() != null) {
            data = educationDAO.selectOne(educationDTO);
        }
        return data;
    }

    @Override
    public List<EducationDTO> selectAll(EducationDTO educationDTO) {
        log.info("EducationDTO selectAll : [{}]", educationDTO);
        List<EducationDTO> data = null;
        if(educationDTO != null || educationDTO.getEducationCondition() != null) {
            data = educationDAO.selectAll(educationDTO);
        }
        return data;
    }

    @Override
    public boolean insert(EducationDTO educationDTO) {
        educationDAO.delete(educationDTO);
        log.info("EducationDTO insert : [{}]", educationDTO);
        return educationDAO.insert(educationDTO);
    }

    @Override
    public boolean update(EducationDTO educationDTO) {
        log.info("EducationDTO update : [{}]", educationDTO);
        return educationDAO.update(educationDTO);
    }

    @Override
    public boolean delete(EducationDTO educationDTO) {
        log.info("EducationDTO delete : [{}]", educationDTO);
        return educationDAO.delete(educationDTO);
    }
}
