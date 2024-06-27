package com.himedia.zoo.service;

import com.himedia.zoo.dao.IQnaDao;
import com.himedia.zoo.dto.Paging;
import com.himedia.zoo.dto.QnaDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class QnaService {

    @Autowired
    IQnaDao qdao;

    public HashMap<String, Object> getQnaList(HttpServletRequest request) {
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

        Paging paging = new Paging();
        paging.setPage(page);
        int count = qdao.getAllCount("qnareply", "QnaList", key);
        paging.setTotalCount(count);
        paging.calPaging();
        paging.setStartNum(paging.getStartNum() - 1);

        List<QnaDto> list = qdao.getQnaList(paging, key);
        System.out.println("레코드 갯수 : " + list.size());

        HashMap<String, Object> result = new HashMap<>();
        result.put("QnaList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }
    
}
