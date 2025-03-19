package com.jobmoa.app.biz.login;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class MemberDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    private static final String ns = "MemberDAO.";

    public List<MemberDTO> selectAll(MemberDTO memberDTO) {
        log.info("MemberCondition : [{}]",memberDTO.getMemberCondition());
        log.info("memberDTO : [{}]",memberDTO);
        List<MemberDTO> datas = sqlSession.selectList(ns+memberDTO.getMemberCondition(), memberDTO);
        if(datas == null) datas = null;
        log.info("datas : [{}]",datas);
//        return null;
        return datas;
    }

    public MemberDTO selectOne(MemberDTO memberDTO) {
        MemberDTO data = sqlSession.selectOne(ns+"loginSelect", memberDTO);
        log.info("Login data : [{}]",data);
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
