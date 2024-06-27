package com.himedia.zoo.service;

import com.himedia.zoo.dao.IMemberDao;
import com.himedia.zoo.dto.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    IMemberDao mdao;

    public MemberVO getMember1(String userid) {
        return mdao.getMember1(userid);
    }

    public MemberVO getMember2(String nickname) {
        return mdao.getMember2(nickname);
    }

    public void insertMember(MemberVO mvo) {
        mdao.insertMember(mvo);
    }
}
