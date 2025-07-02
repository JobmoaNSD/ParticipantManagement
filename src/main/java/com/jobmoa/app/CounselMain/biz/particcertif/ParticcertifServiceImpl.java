package com.jobmoa.app.CounselMain.biz.particcertif;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ParticcertifServiceImpl implements ParticcertifService {
    @Autowired
    private ParticcertifDAO particcertifDAO;

    @Override
    public ParticcertifDTO selectOne(ParticcertifDTO particcertifDTO) {
        //log.info("particcertifDTO selectOne : [{}]",particcertifDTO);
        log.info("ParticcertifServiceImpl selectOne Start Log");
        ParticcertifDTO data = null;
        if(particcertifDTO != null || particcertifDTO.getParticcertifCondition() != null) {
            log.info("ParticcertifServiceImpl selectOne ParticcertifDTO Not Null Log");
            data = particcertifDAO.selectOne(particcertifDTO);
        }
        log.info("ParticcertifServiceImpl selectOne End Log");
        return data;
    }

    @Override
    public List<ParticcertifDTO> selectAll(ParticcertifDTO particcertifDTO) {
        //log.info("particcertifDTO selectAll : [{}]",particcertifDTO);
        log.info("ParticcertifServiceImpl selectAll Start Log");
        List<ParticcertifDTO> data = null;
        if(particcertifDTO != null || particcertifDTO.getParticcertifCondition() != null) {
            log.info("ParticcertifServiceImpl selectAll ParticcertifDTO Not Null Log");
            data = particcertifDAO.selectAll(particcertifDTO);
        }
        log.info("ParticcertifServiceImpl selectAll End Log");
        return data;
    }

    @Override
    public boolean insert(ParticcertifDTO particcertifDTO) {
        log.info("ParticcertifServiceImpl insert Start Log");
        particcertifDAO.delete(particcertifDTO);

        log.info("ParticcertifServiceImpl insert End Log");
        //log.info("particcertifDTO insert : [{}]",particcertifDTO);
        return particcertifDAO.insert(particcertifDTO);
    }

    @Override
    public boolean update(ParticcertifDTO particcertifDTO) {
        log.info("ParticcertifServiceImpl update Start Log");
        //log.info("particcertifDTO update : [{}]",particcertifDTO);
        log.info("ParticcertifServiceImpl update End Log");
        return particcertifDAO.update(particcertifDTO);
    }

    @Override
    public boolean delete(ParticcertifDTO particcertifDTO) {
        log.info("ParticcertifServiceImpl delete Start Log");
        //log.info("particcertifDTO delete : [{}]",particcertifDTO);
        log.info("ParticcertifServiceImpl delete End Log");
        return particcertifDAO.delete(particcertifDTO);
    }
}
