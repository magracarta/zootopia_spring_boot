package com.himedia.zoo.dao;

import com.himedia.zoo.dto.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {
    MemberVO getMember1(String userid);

    MemberVO getMember2(String nickname);

    void insertMember(MemberVO mvo);
}
