package com.himedia.zoo.dao;

import com.himedia.zoo.dto.CPaging;
import com.himedia.zoo.dto.ContestDto;
import com.himedia.zoo.dto.ContestPetDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface IContestDao {
    int getAllcount(String product, String useyn, String key);

    ArrayList<ContestDto> boardList(String key, String useyn, CPaging cPaging);

    ArrayList<ContestPetDTO> cpdList(int cseq);
}
