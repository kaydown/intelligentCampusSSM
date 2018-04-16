package com.service;

import java.util.List;

import com.model.Evaluate;

public interface EvaluateService {

	List<Evaluate> findEvaluateAll(String date,Integer userid);

	Evaluate findSingleEvaluate(Integer id);

	int addEvaluate(Evaluate obj);

	int updateEvaluate(Evaluate obj);

	int deleteEvaluate(Integer id);
}
