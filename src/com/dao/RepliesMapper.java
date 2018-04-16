package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Replies;

public interface RepliesMapper {
    int deleteByPrimaryKey(Integer repliesid);

    int insert(Replies record);

    int insertSelective(Replies record);

    Replies selectByPrimaryKey(Integer repliesid);

    int updateByPrimaryKeySelective(Replies record);

    int updateByPrimaryKey(Replies record);

	List<Replies> findRepliesAll(@Param("noteid")Integer noteid);
}