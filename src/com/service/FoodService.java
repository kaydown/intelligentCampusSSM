package com.service;

import java.util.List;

import com.model.Food;

public interface FoodService {

	List<Food> findFoodAll(String date);

	Food findSingleFood(Integer id);

	int addFood(Food obj);

	int updateFood(Food obj);

	int deleteFood(Integer id);
	
	List<String> findFoodDateAll();
}
