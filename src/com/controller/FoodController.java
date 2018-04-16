package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Food;
import com.service.FoodService;
import com.util.DateUtil;

@Controller
@RequestMapping("/food")
public class FoodController {

	@Autowired
	private FoodService foodService;
	
	@RequestMapping("/findFoodDateAll")
	public String findFoodDateAll(HttpServletRequest request) {
		List<String> foodDateList = foodService.findFoodDateAll();
		request.setAttribute("foodDateList", foodDateList);
		return "/food_date_list";
	}
	
	@RequestMapping("/findFoodAll")
	public String findFoodAll(String date,HttpServletRequest request) {
		List<Food> foodList = foodService.findFoodAll(date);
		request.setAttribute("foodList", foodList);
		request.setAttribute("date", date);
		return "/food_list";
	}

	@RequestMapping("/beforeAddOrUpdateFood")
	public String beforeAddOrUpdateFood(Integer foodId, HttpServletRequest request) {
		Food food = new Food();
		if (foodId != null && !foodId.equals("")) {
			food = foodService.findSingleFood(foodId);
		}
		request.setAttribute("food", food);
		return "/food_addOrEdit";
	}

	@RequestMapping("/addOrUpdateFood")
	public String addOrUpdateFood(Food food) {
		if(food.getFoodid()==null){
			food.setDate(DateUtil.formatDate(new Date(), "yyyy-MM-dd"));
			foodService.addFood(food);
		}else{
			foodService.updateFood(food);
		}
		return "redirect:/food/findFoodAll?date="+food.getDate();
	}

	@RequestMapping("/deleteFood")
	public String deleteFood(Integer foodId,String date) {
		foodService.deleteFood(foodId);
		return "redirect:/food/findFoodAll?date="+date;
	}
}
