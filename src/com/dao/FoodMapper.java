package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Food;

public interface FoodMapper {
    int deleteByPrimaryKey(Integer foodid);

    int insert(Food record);

    int insertSelective(Food record);

    Food selectByPrimaryKey(Integer foodid);

    int updateByPrimaryKeySelective(Food record);

    int updateByPrimaryKey(Food record);

	List<Food> findFoodAll(@Param("date")String date);
	
	List<String> findFoodDateAll();
}