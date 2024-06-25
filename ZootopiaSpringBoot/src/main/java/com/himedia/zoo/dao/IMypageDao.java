package com.himedia.zoo.dao;

import com.himedia.zoo.dto.CommunityVO;
import com.himedia.zoo.dto.ContestDto;
import com.himedia.zoo.dto.ContestPetDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IMypageDao {

    List<ContestDto> getMyContestList(String userid);

    List<ContestPetDTO> mypetList(String userid);

    ContestDto getMypetContest(int cseq);

    List<ContestDto> contestClosedList(String userid);

    int getMyContestCount(String tableName,String userid);
    int getMyJoinedContestCount(String tableName, String userid);

    List<CommunityVO> getMyCommunityList(HashMap<String, Object> result);

    int getMyWriteAllCount(String tableName, String userid);
}
