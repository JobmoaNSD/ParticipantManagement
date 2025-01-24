package com.jobmoa.app.biz.participantEmployment;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("employmentService")
public class EmploymentService implements EmploymentServiceImpl {

    @Autowired
    private EmploymentDAO employmentDAO;

    @Override
    public boolean insert(EmploymentDTO employmentDTO) {
        log.info("employment insert data : [{}]",employmentDTO);
        boolean flag = employmentDAO.insert(employmentDTO);
        return flag;
    }

    @Override
    public boolean update(EmploymentDTO employmentDTO) {
        return false;
    }

    @Override
    public boolean delete(EmploymentDTO employmentDTO) {
        return false;
    }

    @Override
    public EmploymentDTO selectOne(EmploymentDTO employmentDTO) {
        return null;
    }

    @Override
    public List<EmploymentDTO> selectAll(EmploymentDTO employmentDTO) {
        return null;
    }
}
