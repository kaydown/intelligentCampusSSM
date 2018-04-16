package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.User;
import com.service.UserService;
import com.util.DateUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(String uname, String pwd, String role,HttpServletRequest request) {
		User user = userService.findUserByUsernameAndPwdAndRole(uname, pwd,role);
		if (user == null) {
			request.setAttribute("msg", "该用户不存在，请重新登录！");
			return "/login";
		} else {
			request.getSession().setAttribute("uname", user.getUsername());
			request.getSession().setAttribute("uid", user.getUserid());
			request.getSession().setAttribute("roler", user.getRole());
			
			request.getSession().setAttribute("curdate", DateUtil.formatDate(new Date(), "yyyy-MM-dd"));
			request.setAttribute("msg", "");
			if("1".equals(role)){
				return "redirect:/note/blogList";
			}else{
				return "redirect:/news/findNewsAll?type=1";	
			}
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().setAttribute("uname", null);
		request.getSession().setAttribute("uid", null);
		request.getSession().setAttribute("roler", null);

		request.setAttribute("msg", null);
		return "/login";
	}

	@RequestMapping("/findUserAll")
	public String findUserAll(HttpServletRequest request) {
		List<User> userList = userService.findUserAll("1");
		request.setAttribute("userList", userList);
		return "/user_list";
	}

	@RequestMapping("/beforeAddOrUpdateUser")
	public String beforeAddOrUpdateUser(Integer userId, HttpServletRequest request) {
		User user = new User();
		if (userId != null && !userId.equals("")) {
			user = userService.findSingleUser(userId);
		}
		request.setAttribute("user", user);
		
		String roler = (String)request.getSession().getAttribute("roler");
		if(!"0".equals(roler)){
			return "/userInfo";
		}else{
			return "/user_addOrEdit";	
		}
	}

	@RequestMapping("/addOrUpdateUser")
	public String addOrUpdateUser(User user, HttpServletRequest request) {
		if(user.getUserid()==null){
			userService.addUser(user);
		}else{
			userService.updateUser(user);
		}
		String roler = (String)request.getSession().getAttribute("roler");
		if("1".equals(roler)){
			return "redirect:/user/beforeAddOrUpdateUser?userId="+user.getUserid();	
		}else{
			return "redirect:/user/findUserAll";
		}
	}
	
	@RequestMapping("/regist")
	public String regist(User user, HttpServletRequest request) {
		userService.addUser(user);
		return "/login";
	}

	@RequestMapping("/deleteUser")
	public String deleteUser(Integer userId) {
		userService.deleteUser(userId);
		return "redirect:/user/findUserAll";
	}
	
}
