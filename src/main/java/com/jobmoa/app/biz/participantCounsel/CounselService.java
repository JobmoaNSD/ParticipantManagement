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
        log.info("counsel selectOne SQL counselDTO : [{}]",counselDTO);
        // 데이터 초기화를 위해 선언
        CounselDTO data = null;
        //DAO에 selectOne 함수를 호출
        //만약 condition 값이 있고 DTO 데이터가 null이 아니면 selectOne 진행
        if(counselDTO != null && counselDTO.getCounselCondition() != null) {
            data = counselDAO.selectOne(counselDTO);
        }
        log.info("data : [{}]",data);
        return data;
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
        return counselDAO.update(counselDTO);
    }

    @Override
    public boolean delete(CounselDTO counselDTO) {
        return false;
    }
}
