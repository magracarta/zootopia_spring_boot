package com.himedia.zoo.dao;

import com.himedia.zoo.dto.CommunityreplyVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ICommunityreplyDao {

    void writeCommunityReply(CommunityreplyVO crvo);
}
