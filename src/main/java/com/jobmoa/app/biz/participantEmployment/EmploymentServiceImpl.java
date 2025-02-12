package com.jobmoa.app.biz.participantEmployment;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("employmentService")
public class EmploymentServiceImpl implements EmploymentService {

    @Autowired
    private EmploymentDAO employmentDAO;

    @Override
    public boolean insert(EmploymentDTO employmentDTO) {
        log.info("employment insert data : [{}]",employmentDTO);
        return employmentDAO.insert(employmentDTO);
    }

    @Override
    public boolean update(EmploymentDTO employmentDTO) {
        log.info("employment update data : [{}]",employmentDTO);
        return employmentDAO.update(employmentDTO);
    }

    @Override
    public boolean delete(EmploymentDTO employmentDTO) {
        return false;
    }

    @Override
    public EmploymentDTO selectOne(EmploymentDTO employmentDTO) {
        log.info("employment selectOne data : [{}]",employmentDTO);
        EmploymentDTO data = null;
        //DTO 가 null이 아니고 condition 이 null 이 아니면 selecone 함수 실행
        if(employmentDTO != null && employmentDTO.getEmploymentCondition() != null) {
            data = employmentDAO.selectOne(employmentDTO);
        }
        log.info("employment selectOne data : [{}]",data);
        return data;
    }

    @Override
    public List<EmploymentDTO> selectAll(EmploymentDTO employmentDTO) {
        return null;
    }
}
