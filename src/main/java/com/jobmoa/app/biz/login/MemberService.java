package com.jobmoa.app.biz.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("loginService")
public class MemberService implements MemberServiceImpl {

    @Autowired
    private MemberDAO loginDAO;

    @Override
    public MemberDTO selectOne(MemberDTO loginDTO) {
        return loginDAO.selectOne(loginDTO);
    }

    @Override
    public List<MemberDTO> selectAll(MemberDTO loginDTO) {
        return loginDAO.selectAll(loginDTO);
    }

    @Override
    public boolean insert(MemberDTO loginDTO) {
        return loginDAO.insert(loginDTO);
    }

    @Override
    public boolean update(MemberDTO loginDTO) {
        return loginDAO.update(loginDTO);
    }

    @Override
    public boolean delete(MemberDTO loginDTO) {
        return loginDAO.delete(loginDTO);
    }
}
