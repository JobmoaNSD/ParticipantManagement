package com.jobmoa.app.biz.particcertif;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ParticcertifService implements ParticcertifServiceImpl {
    @Autowired
    private ParticcertifDAO particcertifDAO;

    @Override
    public ParticcertifDTO selectOne(ParticcertifDTO particcertifDTO) {
        return null;
    }

    @Override
    public List<ParticcertifDTO> selectAll(ParticcertifDTO particcertifDTO) {
        return null;
    }

    @Override
    public boolean insert(ParticcertifDTO particcertifDTO) {
        return particcertifDAO.insert(particcertifDTO);
    }

    @Override
    public boolean update(ParticcertifDTO particcertifDTO) {
        return false;
    }

    @Override
    public boolean delete(ParticcertifDTO particcertifDTO) {
        return false;
    }
}
