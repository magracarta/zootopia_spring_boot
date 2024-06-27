package com.himedia.zoo.service;

import com.himedia.zoo.dao.IContestDao;
import com.himedia.zoo.dto.CPaging;
import com.himedia.zoo.dto.ContestDto;
import com.himedia.zoo.dto.ContestPetDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class ContestService {
    @Autowired
    IContestDao contestDao;

    public HashMap<String, Object> listBoard(String ctg, int pagenum , String key) {
        HashMap<String, Object> result = new HashMap<>();
        CPaging cPaging = new CPaging();
        cPaging.setPage(pagenum);

        //result.put("boardList", );
        String useyn = " and useyn ='Y' ";
        if(ctg.equals("wating")) useyn = " and useyn ='W' ";
        else if(ctg.equals("all")) useyn = "  ";
        else if(ctg.equals("playing")) useyn = "and now() < lastdate  and useyn ='Y' ";
        else if(ctg.equals("accomplished"))useyn = " and now() > lastdate and useyn ='Y'";


        int count = contestDao.getAllcount("contest", useyn , key);
        cPaging.setTotalCount(count);
        cPaging.calPaging();

        ArrayList<ContestDto> cdtoList = contestDao.boardList(key, useyn ,cPaging);
        for( ContestDto contestDto : cdtoList) contestDto.setCpdList(contestDao.cpdList(contestDto.getCseq()));

        result.put("allcout", count);
        result.put("cdtoList", cdtoList);
        result.put("paging", cPaging);
        result.put("search", key);

        return result;
    }
}
