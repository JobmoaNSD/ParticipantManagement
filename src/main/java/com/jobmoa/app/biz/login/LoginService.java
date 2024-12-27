package com.jobmoa.app.biz.login;

import java.util.List;

public interface LoginService {
    public LoginDTO selectOne(LoginDTO loginDTO);
    public List<LoginDTO> selectAll(LoginDTO loginDTO);
    public boolean insert(LoginDTO loginDTO);
    public boolean update(LoginDTO loginDTO);
    public boolean delete(LoginDTO loginDTO);
}
