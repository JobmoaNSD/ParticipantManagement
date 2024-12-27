package com.jobmoa.app.biz.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("loginService")
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDAO loginDAO;

    @Override
    public LoginDTO selectOne(LoginDTO loginDTO) {
        return loginDAO.selectOne(loginDTO);
    }

    @Override
    public List<LoginDTO> selectAll(LoginDTO loginDTO) {
        return loginDAO.selectAll(loginDTO);
    }

    @Override
    public boolean insert(LoginDTO loginDTO) {
        return loginDAO.insert(loginDTO);
    }

    @Override
    public boolean update(LoginDTO loginDTO) {
        return loginDAO.update(loginDTO);
    }

    @Override
    public boolean delete(LoginDTO loginDTO) {
        return loginDAO.delete(loginDTO);
    }
}
