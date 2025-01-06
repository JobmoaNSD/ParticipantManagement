package com.jobmoa.app.biz.login;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class MemberDAO {
    @Autowired
    private SqlSession sqlSession;

    private static final String ns = "MemberDAO.";

    public List<MemberDTO> selectAll(MemberDTO loginDTO) {
        log.info("loginDTO : [{}]",loginDTO);
        List<MemberDTO> datas = sqlSession.selectList(ns+"selectAll");
        log.info("datas : [{}]",datas);
        return datas;
    }

    public MemberDTO selectOne(MemberDTO loginDTO) {
        MemberDTO data = sqlSession.selectOne(ns+"selectOne", loginDTO);
        log.info("data : [{}]",data);
        return data;
    }


    public boolean insert(MemberDTO loginDTO) {
        return false;
    }

    public boolean update(MemberDTO loginDTO) {
        return false;
    }

    public boolean delete(MemberDTO loginDTO) {
        return false;
    }

}
