<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="cl-sidebar">
			<div class="cl-toggle">
				<i class="fa fa-bars"></i>
			</div>
			<div class="cl-navblock">
				<div class="menu-space">
					<div class="content">
						<div class="side-user">
							<div class="avatar">
								<img src="<%=basePath%>pageCss/images/avatar1_50.jpg" alt="Avatar" />
							</div>
							<div class="info">
								<a>${uname }</a> <img src="<%=basePath%>pageCss/images/state_online.png" alt="Status" /> <span>在线</span>
							</div>
						</div>
						<ul class="cl-vnavigation">
							<c:if test="${roler=='0' }">
								<li>
									<a><i class="fa fa-user"></i><span>用户管理</span></a>
									<ul class="sub-menu">
										<li><a href="<%=basePath%>user/findUserAll">学生管理</a></li>
									</ul>
								</li>
								<li>
									<a><i class="fa fa-list-alt"></i><span>学校信息管理</span></a>
									<ul class="sub-menu">
										<li><a href="<%=basePath%>news/findNewsAll?type=1">学校信息</a></li>
										<li><a href="<%=basePath%>news/findNewsAll?type=2">公寓信息</a></li>
										<li><a href="<%=basePath%>food/findFoodDateAll">菜谱管理</a></li>
									</ul>
								</li>
								<li>
									<a><i class="fa fa-smile-o"></i><span>贴吧管理</span> </a>
									<ul class="sub-menu">
										<li><a href="<%=basePath%>note/findNoteAll">贴吧管理</a></li>
									</ul>
								</li>
							</c:if>
							<c:if test="${roler=='1' }">
								<li><a href="<%=basePath%>pageJump?jumpPath=/maps">学校</a></li>
								<li><a href="<%=basePath%>note/blogList">校园步行街</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>