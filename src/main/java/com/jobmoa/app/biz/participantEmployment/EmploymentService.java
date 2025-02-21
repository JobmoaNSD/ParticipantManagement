package com.jobmoa.app.biz.participantEmployment;

import java.util.List;

public interface EmploymentService {
    boolean insert(EmploymentDTO employmentDTO);
    boolean update(EmploymentDTO employmentDTO);
    boolean delete(EmploymentDTO employmentDTO);
    EmploymentDTO selectOne(EmploymentDTO employmentDTO);
    List<EmploymentDTO> selectAll(EmploymentDTO employmentDTO);
}
