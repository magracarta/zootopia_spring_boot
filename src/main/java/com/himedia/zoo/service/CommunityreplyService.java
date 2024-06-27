package com.himedia.zoo.service;

import com.himedia.zoo.dao.ICommunityDao;
import com.himedia.zoo.dao.ICommunityreplyDao;
import com.himedia.zoo.dto.CommunityreplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityreplyService {

    @Autowired
    ICommunityreplyDao crdao;

    public void writeCommunityReply(CommunityreplyVO crvo) {
        crdao.writeCommunityReply(crvo);

    }
}
