package com.himedia.zoo.service;

import com.himedia.zoo.dao.IMypageDao;
import com.himedia.zoo.dto.CommunityVO;
import com.himedia.zoo.dto.ContestDto;
import com.himedia.zoo.dto.ContestPetDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MypageService {
    @Autowired
    IMypageDao mpdao;

    public List<ContestDto> getMyContestList(String userid) {
        return mpdao.getMyContestList(userid);
    }

    public List<ContestPetDTO> mypetList(String userid) {
        return mpdao.mypetList(userid);
    }

    public ContestDto getMypetContest(int cseq) {
        return mpdao.getMypetContest(cseq);
    }

    public List<ContestDto> getClosedContests(String userid) {
        return mpdao.contestClosedList(userid);
    }

    public int getMyContestCount(String tableName, String userid) {
        return mpdao.getMyContestCount(tableName, userid);
    }

    public int getMyJoinedContestCount(String tableName, String userid) {
        return mpdao.getMyJoinedContestCount(tableName, userid);
    }

    public List<CommunityVO> getMyCommunityList(HashMap<String, Object> result) {
        return mpdao.getMyCommunityList(result);
    }

    public int getMyWriteAllCount(String tableName, String userid) {
        return mpdao.getMyWriteAllCount(tableName, userid);
    }

}
