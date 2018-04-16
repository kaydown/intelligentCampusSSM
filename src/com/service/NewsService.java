package com.service;

import java.util.List;

import com.model.News;

public interface NewsService {

	List<News> findNewsAll(String type);

	News findSingleNews(Integer id);

	int addNews(News obj);

	int updateNews(News obj);

	int deleteNews(Integer id);
}
