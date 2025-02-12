package com.jobmoa.app.biz.participantEmployment;

import java.util.List;

public interface EmploymentService {
    public boolean insert(EmploymentDTO employmentDTO);
    public boolean update(EmploymentDTO employmentDTO);
    public boolean delete(EmploymentDTO employmentDTO);
    public EmploymentDTO selectOne(EmploymentDTO employmentDTO);
    public List<EmploymentDTO> selectAll(EmploymentDTO employmentDTO);
}
