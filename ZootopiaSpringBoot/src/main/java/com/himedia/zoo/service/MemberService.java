package com.himedia.zoo.service;

import com.himedia.zoo.dao.IMemberDao;
import com.himedia.zoo.dto.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    IMemberDao mdao;

    public MemberVO getMember(String userid) {
        return mdao.getMember(userid);
    }
}
