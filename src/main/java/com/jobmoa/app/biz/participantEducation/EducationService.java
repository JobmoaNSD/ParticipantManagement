package com.jobmoa.app.biz.participantEducation;

import java.util.List;

public interface EducationService {
    public EducationDTO selectOne(EducationDTO educationDTO);
    public List<EducationDTO> selectAll(EducationDTO educationDTO);
    public boolean insert(EducationDTO educationDTO);
    public boolean update(EducationDTO educationDTO);
    public boolean delete(EducationDTO educationDTO);
}
