package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Replies;
import com.service.RepliesService;
import com.util.DateUtil;

@Controller
@RequestMapping("/replies")
public class RepliesController {

	@Autowired
	private RepliesService repliesService;
	
	@RequestMapping("/findRepliesAll")
	public String findRepliesAll(Integer noteid,HttpServletRequest request) {
		List<Replies> repliesList = repliesService.findRepliesAll(noteid);
		request.setAttribute("repliesList", repliesList);
		request.setAttribute("noteid", noteid);
		return "/replies_list";
	}
	
	@RequestMapping("/findBoagRepliesList")
	public String findBoagRepliesList(Integer noteid,HttpServletRequest request) {
		List<Replies> repliesList = repliesService.findRepliesAll(noteid);
		for (int i = 0; i < repliesList.size(); i++) {
			repliesList.get(i).setDatetime(DateUtil.formatDate(repliesList.get(i).getAddtime(), "yyyy-MM-dd HH:mm"));
			repliesList.get(i).setDate(DateUtil.formatDate(repliesList.get(i).getAddtime(), "yyyy-MM-dd"));
			repliesList.get(i).setTime(DateUtil.formatDate(repliesList.get(i).getAddtime(), "HH:mm"));
		}
		request.setAttribute("repliesList", repliesList);
		request.setAttribute("noteid", noteid);
		return "/blog_replies_list";
	}

	@RequestMapping("/beforeAddOrUpdateReplies")
	public String beforeAddOrUpdateReplies(Integer repliesId,Integer noteid, HttpServletRequest request) {
		Replies replies = new Replies();
		if (repliesId != null && !repliesId.equals("")) {
			replies = repliesService.findSingleReplies(repliesId);
		}
		request.setAttribute("replies", replies);
		request.setAttribute("noteid", noteid);
		return "/replies_addOrEdit";
	}

	@RequestMapping("/addOrUpdateReplies")
	public String addOrUpdateReplies(Replies replies) {
		if(replies.getRepliesid()==null){
			repliesService.addReplies(replies);
		}else{
			repliesService.updateReplies(replies);
		}
		return "redirect:/replies/findBoagRepliesList?noteid="+replies.getNoteid();
	}

	@RequestMapping("/deleteReplies")
	public String deleteReplies(Integer repliesId,Integer noteid) {
		repliesService.deleteReplies(repliesId);
		return "redirect:/replies/findRepliesAll?noteid="+noteid;
	}
}
