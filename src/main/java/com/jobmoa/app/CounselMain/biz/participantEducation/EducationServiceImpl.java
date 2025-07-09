package com.jobmoa.app.CounselMain.biz.participantEducation;

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
//        log.info("EducationDTO selectOne : [{}]", educationDTO);
        EducationDTO data = null;
        if(educationDTO != null || educationDTO.getEducationCondition() != null) {
            log.info("selectOne educationDTO Not Null Start EducationDAO Start");
            data = educationDAO.selectOne(educationDTO);
        }
        return data;
    }

    @Override
    public List<EducationDTO> selectAll(EducationDTO educationDTO) {
//        log.info("EducationDTO selectAll : [{}]", educationDTO);
        List<EducationDTO> data = null;
        if(educationDTO != null || educationDTO.getEducationCondition() != null) {
            log.info("selectAll educationDTO Not Null Start EducationDAO Start");
            data = educationDAO.selectAll(educationDTO);
        }
        return data;
    }

    @Override
    public boolean insert(EducationDTO educationDTO) {
        log.info("EducationServiceImpl insert Start");
        log.info("EducationServiceImpl Delete Start");
        educationDAO.delete(educationDTO);
        log.info("EducationServiceImpl Delete End");
        log.info("EducationServiceImpl insert End");
//        log.info("EducationDTO insert : [{}]", educationDTO);
        return educationDAO.insert(educationDTO);
    }

    @Override
    public boolean update(EducationDTO educationDTO) {
//        log.info("EducationDTO update : [{}]", educationDTO);
        log.info("EducationDTO update Start");
        log.info("EducationDTO update End");
        return educationDAO.update(educationDTO);
    }

    @Override
    public boolean delete(EducationDTO educationDTO) {
//        log.info("EducationDTO delete : [{}]", educationDTO);
        log.info("EducationDTO delete Start");
        log.info("EducationDTO delete End");
//        return educationDAO.delete(educationDTO);
        return false;
    }
}
