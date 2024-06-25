package com.himedia.zoo.dao;

import com.himedia.zoo.dto.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {

    MemberVO getMember(String userid);
}
