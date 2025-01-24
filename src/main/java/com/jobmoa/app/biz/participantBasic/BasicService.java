package com.jobmoa.app.biz.participantBasic;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("basicService")
public class BasicService implements BasicServiceImpl {

    @Autowired
    private BasicDAO basicDAO;

    @Override
    public boolean insert(BasicDTO basicDTO) {
        if(basicDAO.insert(basicDTO)) {
            return true;
        }
        return false;
    }

    @Override
    public boolean update(BasicDTO basicDTO) {
        return false;
    }

    @Override
    public boolean delete(BasicDTO basicDTO) {
        return false;
    }

    @Override
    public BasicDTO selectOne(BasicDTO basicDTO) {

        basicDTO = basicDAO.select(basicDTO);
        return null;
    }

    @Override
    public List<BasicDTO> selectAll(BasicDTO basicDTO) {
        return List.of();
    }
}
