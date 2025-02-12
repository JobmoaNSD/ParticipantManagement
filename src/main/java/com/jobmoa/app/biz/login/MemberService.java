package com.jobmoa.app.biz.login;

import java.util.List;

public interface MemberService {
    public MemberDTO selectOne(MemberDTO loginDTO);
    public List<MemberDTO> selectAll(MemberDTO loginDTO);
    public boolean insert(MemberDTO loginDTO);
    public boolean update(MemberDTO loginDTO);
    public boolean delete(MemberDTO loginDTO);
}
