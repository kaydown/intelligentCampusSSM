package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Evaluate;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer evaluateid);

    int insert(Evaluate record);

    int insertSelective(Evaluate record);

    Evaluate selectByPrimaryKey(Integer evaluateid);

    int updateByPrimaryKeySelective(Evaluate record);

    int updateByPrimaryKey(Evaluate record);

	List<Evaluate> findEvaluateAll(@Param("date")String date, @Param("userid")Integer userid);
}