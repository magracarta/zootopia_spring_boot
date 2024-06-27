package com.himedia.zoo.service;

import com.himedia.zoo.dao.ICommunityDao;
import com.himedia.zoo.dto.CoPaging;
import com.himedia.zoo.dto.CommunityVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

@Service
public class CommunityService {

    @Autowired
    ICommunityDao cdao;

    public HashMap<String, Object> getcommunityBoard(HttpServletRequest request) {

        HttpSession session = request.getSession();

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        } else if (session.getAttribute("page") != null) {
            page = (Integer) session.getAttribute("page");
        } else {
            session.removeAttribute("page");
        }

        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        } else if (session.getAttribute("key") != null) {
            key = (String) session.getAttribute("key");
        } else {
            session.removeAttribute("key");
        }

        CoPaging paging = new CoPaging();
        paging.setPage(page);
        int count = cdao.getAllCount(key);
        paging.setTotalCount(count);
        paging.calPaging();


        List<CommunityVO> list = cdao.getCommunityList(paging, key);

        HashMap<String, Object> result = new HashMap<>();
        result.put("communityList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public void insertCommunity(CommunityVO communityvo) {
        cdao.insertCommunity(communityvo);
    }

    public CommunityVO getCommunity(int gseq) {
        return cdao.getCommunity(gseq);
    }

    public void deleteBoard(int gseq) {
        cdao.deleteBoard(gseq);
    }

    public void increaseViewCount(int gseq) {
        cdao.increaseViewCount(gseq);
    }

    public void updateCommunity(int gseq) {
        cdao.updateCommunity(gseq);
    }

    public int updateRecommendations(int gseq) {
        return cdao.updateRecommendations(gseq);

    }

}
