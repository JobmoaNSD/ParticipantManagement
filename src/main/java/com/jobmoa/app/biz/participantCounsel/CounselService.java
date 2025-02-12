package com.jobmoa.app.biz.participantCounsel;

import java.util.List;

public interface CounselService {
    public CounselDTO selectOne(CounselDTO counselDTO);
    public List<CounselDTO> selectAll(CounselDTO counselDTO);
    public boolean insert(CounselDTO counselDTO);
    public boolean update(CounselDTO counselDTO);
    public boolean delete(CounselDTO counselDTO);
}
