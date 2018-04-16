package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.News;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer newsid);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer newsid);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);

	List<News> findNewsAll(@Param("type")String type);
}