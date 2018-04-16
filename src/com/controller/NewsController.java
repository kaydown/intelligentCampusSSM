package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.News;
import com.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	@RequestMapping("/findNewsAll")
	public String findNewsAll(String type,HttpServletRequest request) {
		List<News> newsList = newsService.findNewsAll(type);
		request.setAttribute("newsList", newsList);
		request.setAttribute("type", type);
		return "/news_list";
	}

	@RequestMapping("/beforeAddOrUpdateNews")
	public String beforeAddOrUpdateNews(Integer newsId,String type, HttpServletRequest request) {
		News news = new News();
		if (newsId != null && !newsId.equals("")) {
			news = newsService.findSingleNews(newsId);
		}
		request.setAttribute("news", news);
		request.setAttribute("type", type);
		return "/news_addOrEdit";
	}

	@RequestMapping("/addOrUpdateNews")
	public String addOrUpdateNews(News news) {
		if(news.getNewsid()==null){
			newsService.addNews(news);
		}else{
			newsService.updateNews(news);
		}
		return "redirect:/news/findNewsAll?type="+news.getType();
	}

	@RequestMapping("/deleteNews")
	public String deleteNews(Integer newsId,String type) {
		newsService.deleteNews(newsId);
		return "redirect:/news/findNewsAll?type="+type;
	}
}
