package com.himedia.zoo.dao;

import com.himedia.zoo.dto.Paging;
import com.himedia.zoo.dto.QnaDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IQnaDao {

    List<QnaDto> getQnaList(Paging paging, String key);
    int getAllCount(String tablename, String fieldname, String key);
}
