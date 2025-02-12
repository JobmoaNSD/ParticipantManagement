package com.jobmoa.app.biz.particcertif;

import java.util.List;

public interface ParticcertifService {
    public ParticcertifDTO selectOne(ParticcertifDTO particcertifDTO);
    public List<ParticcertifDTO> selectAll(ParticcertifDTO particcertifDTO);
    public boolean insert(ParticcertifDTO particcertifDTO);
    public boolean update(ParticcertifDTO particcertifDTO);
    public boolean delete(ParticcertifDTO particcertifDTO);
}
