package com.jobmoa.app.biz.particcertif;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Slf4j
@Service
public class ParticcertifService implements ParticcertifServiceImpl {
    @Autowired
    private ParticcertifDAO particcertifDAO;

    @Override
    public ParticcertifDTO selectOne(ParticcertifDTO particcertifDTO) {
        log.info("particcertifDTO selectOne : [{}]",particcertifDTO);
        ParticcertifDTO data = null;
        if(particcertifDTO != null || particcertifDTO.getParticcertifCondition() != null) {
            data = particcertifDAO.selectOne(particcertifDTO);
        }
        return data;
    }

    @Override
    public List<ParticcertifDTO> selectAll(ParticcertifDTO particcertifDTO) {
        log.info("particcertifDTO selectAll : [{}]",particcertifDTO);
        List<ParticcertifDTO> data = null;
        if(particcertifDTO != null || particcertifDTO.getParticcertifCondition() != null) {
            data = particcertifDAO.selectAll(particcertifDTO);
        }
        return data;
    }

    @Override
    public boolean insert(ParticcertifDTO particcertifDTO) {
        particcertifDAO.delete(particcertifDTO);
        log.info("particcertifDTO insert : [{}]",particcertifDTO);
        return particcertifDAO.insert(particcertifDTO);
    }

    @Override
    public boolean update(ParticcertifDTO particcertifDTO) {
        log.info("particcertifDTO update : [{}]",particcertifDTO);
        return particcertifDAO.update(particcertifDTO);
    }

    @Override
    public boolean delete(ParticcertifDTO particcertifDTO) {
        log.info("particcertifDTO delete : [{}]",particcertifDTO);
        return particcertifDAO.delete(particcertifDTO);
    }
}
