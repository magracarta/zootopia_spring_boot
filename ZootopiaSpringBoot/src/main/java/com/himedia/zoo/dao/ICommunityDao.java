package com.himedia.zoo.dao;

import com.himedia.zoo.dto.CoPaging;
import com.himedia.zoo.dto.CommunityVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ICommunityDao {

    int getAllCount(@Param("key") String key);

    List<CommunityVO> getCommunityList(@Param("paging") CoPaging paging, @Param("key") String key);

    void insertCommunity(CommunityVO communityvo);

    CommunityVO getCommunity(int gseq);

    void deleteBoard(int gseq);

    void increaseViewCount(int gseq);

    void updateCommunity(int gseq);

    int updateRecommendations(int gseq);

/*
    void updateCommunity(CommunityVO communityVO);
*/
}
