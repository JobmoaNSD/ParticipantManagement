package com.jobmoa.app.biz.participantCounsel;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("counselService")
public class CounselService implements CounselServiceImpl {
    @Autowired
    private CounselDAO counselDAO;

    @Override
    public CounselDTO selectOne(CounselDTO counselDTO) {
        return null;
    }

    @Override
    public List<CounselDTO> selectAll(CounselDTO counselDTO) {
        return List.of();
    }

    @Override
    public boolean insert(CounselDTO counselDTO) {
        return counselDAO.insert(counselDTO);
    }

    @Override
    public boolean update(CounselDTO counselDTO) {
        return false;
    }

    @Override
    public boolean delete(CounselDTO counselDTO) {
        return false;
    }
}
