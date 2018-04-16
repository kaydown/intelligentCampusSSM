package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.EvaluateMapper;
import com.model.Evaluate;
import com.service.EvaluateService;

@Service
public class EvaluateServiceImpl implements EvaluateService {

    @Resource
    private EvaluateMapper evaluateMapper;

    @Override
    public List<Evaluate> findEvaluateAll(String date,Integer userid) {
        return evaluateMapper.findEvaluateAll(date,userid);
    }

    @Override
    public Evaluate findSingleEvaluate(Integer id) {
        return evaluateMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addEvaluate(Evaluate obj) {
        return evaluateMapper.insertSelective(obj);
    }

    @Override
    public int updateEvaluate(Evaluate obj) {
        return evaluateMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteEvaluate(Integer id) {
        return evaluateMapper.deleteByPrimaryKey(id);
    }
}
