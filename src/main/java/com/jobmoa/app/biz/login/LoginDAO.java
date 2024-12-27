package com.jobmoa.app.biz.login;

import com.jobmoa.app.biz.common.JDBCUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class LoginDAO {
    @Autowired
    private SqlSession sqlSession;

    private static final String ns = "LoginDAO.";

    public List<LoginDTO> selectAll(LoginDTO loginDTO) {
        log.info("loginDTO : [{}]",loginDTO.toString());
        List<LoginDTO> datas = sqlSession.selectList(ns+"selectAll");
        log.info("datas : [{}]",datas.toString());
        return datas;
    }

    public LoginDTO selectOne(LoginDTO loginDTO) {
        LoginDTO data = sqlSession.selectOne(ns+"selectOne", loginDTO);
        log.info("data : [{}]",data.toString());
        return data;
    }

    public boolean insert(LoginDTO loginDTO) {
        return false;
    }

    public boolean update(LoginDTO loginDTO) {
        return false;
    }

    public boolean delete(LoginDTO loginDTO) {
        return false;
    }

}
