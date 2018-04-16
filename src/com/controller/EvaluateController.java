package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Evaluate;
import com.service.EvaluateService;

@Controller
@RequestMapping("/evaluate")
public class EvaluateController {

	@Autowired
	private EvaluateService evaluateService;
	
	@RequestMapping("/findEvaluateAll")
	public String findEvaluateAll(String date,HttpServletRequest request) {
		String role = (String)request.getSession().getAttribute("roler");
		List<Evaluate> evaluateList = null;
		if("1".equals(role)){
			Integer uid = (Integer)request.getSession().getAttribute("uid");
			evaluateList = evaluateService.findEvaluateAll(date,uid);
		}else{
			evaluateList = evaluateService.findEvaluateAll(date,null);
		}
		request.setAttribute("evaluateList", evaluateList);
		request.setAttribute("date", date);
		
		return "/evaluate_list";
	}

	@RequestMapping("/beforeAddOrUpdateEvaluate")
	public String beforeAddOrUpdateEvaluate(Integer evaluateId,String date, HttpServletRequest request) {
		Evaluate evaluate = new Evaluate();
		if (evaluateId != null && !evaluateId.equals("")) {
			evaluate = evaluateService.findSingleEvaluate(evaluateId);
		}
		request.setAttribute("evaluate", evaluate);
		request.setAttribute("date", date);
		return "/evaluate_addOrEdit";
	}

	@RequestMapping("/addOrUpdateEvaluate")
	public String addOrUpdateEvaluate(Evaluate evaluate) {
		if(evaluate.getEvaluateid()==null){
			evaluateService.addEvaluate(evaluate);
		}else{
			evaluateService.updateEvaluate(evaluate);
		}
		return "redirect:/evaluate/findEvaluateAll?date="+evaluate.getDate();
	}

	@RequestMapping("/deleteEvaluate")
	public String deleteEvaluate(Integer evaluateId,String date) {
		evaluateService.deleteEvaluate(evaluateId);
		return "redirect:/evaluate/findEvaluateAll?date="+date;
	}
}
