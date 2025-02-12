package com.jobmoa.app.biz.participantBasic;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("basicService")
public class BasicServiceImpl implements BasicService {

    @Autowired
    private BasicDAO basicDAO;

    @Override
    public boolean insert(BasicDTO basicDTO) {
        log.info("basic insert SQL basicDTO : [{}]",basicDTO);
        return basicDAO.insert(basicDTO);
    }

    @Override
    public boolean update(BasicDTO basicDTO) {
        log.info("basic update SQL basicDTO : [{}]",basicDTO);
        if(basicDTO == null || basicDTO.getBasicCondition() == null) {
            return false;
        }
        return basicDAO.update(basicDTO);
    }

    @Override
    public boolean delete(BasicDTO basicDTO) {

        return false;
    }

    @Override
    public BasicDTO selectOne(BasicDTO basicDTO) {
        BasicDTO data = null;
        // 기본정보 DTO 가 null 이거나 기본정보의 condition 값이 null 이라면 null을 반환한다.
        if (basicDTO == null || basicDTO.getBasicCondition() == null){
            return data;
        }
        log.info("basic selectOne SQL basicDTO : [{}]",basicDTO);
        //기본 정보 DTO가 있고 condition 값이 있다면 select 를 진행
        data = basicDAO.selectOne(basicDTO);
        return data;
    }

    @Override
    public List<BasicDTO> selectAll(BasicDTO basicDTO) {
        return List.of();
    }
}
