package com.service.impl;

import com.dao.RepliesMapper;
import com.model.Replies;
import com.service.RepliesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RepliesServiceImpl implements RepliesService {

    @Resource
    private RepliesMapper repliesMapper;

    @Override
    public List<Replies> findRepliesAll(Integer noteid) {
        return repliesMapper.findRepliesAll(noteid);
    }

    @Override
    public Replies findSingleReplies(Integer id) {
        return repliesMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addReplies(Replies obj) {
        return repliesMapper.insertSelective(obj);
    }

    @Override
    public int updateReplies(Replies obj) {
        return repliesMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteReplies(Integer id) {
        return repliesMapper.deleteByPrimaryKey(id);
    }
}
