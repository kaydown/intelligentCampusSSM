package com.service.impl;

import com.dao.FoodMapper;
import com.model.Food;
import com.service.FoodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FoodServiceImpl implements FoodService {

    @Resource
    private FoodMapper foodMapper;

    @Override
    public List<Food> findFoodAll(String date) {
        return foodMapper.findFoodAll(date);
    }

    @Override
    public Food findSingleFood(Integer id) {
        return foodMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addFood(Food obj) {
        return foodMapper.insertSelective(obj);
    }

    @Override
    public int updateFood(Food obj) {
        return foodMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteFood(Integer id) {
        return foodMapper.deleteByPrimaryKey(id);
    }

	@Override
	public List<String> findFoodDateAll() {
		return foodMapper.findFoodDateAll();
	}
}
