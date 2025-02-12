package com.jobmoa.app.biz.participantBasic;

import java.util.List;

public interface BasicService {
    public boolean insert(BasicDTO basicDTO);
    public boolean update(BasicDTO basicDTO);
    public boolean delete(BasicDTO basicDTO);
    public BasicDTO selectOne(BasicDTO basicDTO);
    public List<BasicDTO> selectAll(BasicDTO basicDTO);
}
