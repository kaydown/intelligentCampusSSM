package com.service.impl;

import com.dao.NewsMapper;
import com.model.News;
import com.service.NewsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Resource
    private NewsMapper newsMapper;

    @Override
    public List<News> findNewsAll(String type) {
        return newsMapper.findNewsAll(type);
    }

    @Override
    public News findSingleNews(Integer id) {
        return newsMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addNews(News obj) {
        return newsMapper.insertSelective(obj);
    }

    @Override
    public int updateNews(News obj) {
        return newsMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteNews(Integer id) {
        return newsMapper.deleteByPrimaryKey(id);
    }
}
