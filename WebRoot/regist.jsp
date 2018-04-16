<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>智能校园信息交流平台</title>
    
    <meta name="viewport" content="width=device-width,initial-scale=1"
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="<%=basePath%>loginCss/iconfont/style.css" type="text/css" rel="stylesheet">
	<style>
		body{color:#fff; font-family:"微软雅黑"; font-size:14px;}
		.wrap1{position:absolute; top:0; right:0; bottom:0; left:0; margin:auto }/*把整个屏幕真正撑开--而且能自己实现居中*/
		.main_content{background:url(loginCss/images/main_bg.png) repeat; margin-left:auto; margin-right:auto; text-align:left; float:none; border-radius:8px;}
		.form-group{position:relative;}
		.login_btn{display:block; background:#3872f6; color:#fff; font-size:15px; width:100%; line-height:50px; border-radius:3px; border:none; }
		.login_input{width:100%; border:1px solid #3872f6; border-radius:3px; line-height:40px; padding:2px 5px 2px 30px; background:none;}
		.icon_font{position:absolute; bottom:15px; left:10px; font-size:18px; color:#3872f6;}
		.font16{font-size:16px;}
		.mg-t20{margin-top:20px;}
		@media (min-width:200px){.pd-xs-20{padding:20px;}}
		@media (min-width:768px){.pd-sm-50{padding:50px;}}
		#grad {
		  background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Safari 5.1 - 6.0 */
		  background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Opera 11.1 - 12.0 */
		  background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Firefox 3.6 - 15 */
		  background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */
		}
	</style>
  </head>
  
  <body style="background:url(loginCss/images/bg.jpg) no-repeat;">
    
    <div class="container wrap1" style="height:700px;">
            <h2 class="mg-b20 text-center">智能校园信息交流平台</h2>
            <div class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
                <p class="text-center font16">学生注册</p>
                <form action="<%=basePath%>user/regist" method="post">
                	<input type="hidden" name="role" value="1">
                	<input type="hidden" name="imgurl" value="1521905641950.jpg">
                    <div class="form-group mg-t20">
                        <input type="text" class="login_input" placeholder="请输入登录" name="username"/>
                    </div>
                    <div class="form-group mg-t20">
                        <input type="password" class="login_input"  placeholder="请输入密码" name="pwd"/>
                    </div>
                    <div class="form-group mg-t20">
                    	<textarea class="login_input" rows="10" cols="100" placeholder="请输入个人简介" name="content"></textarea>
                    </div>
                    <button style="submit" class="login_btn">注 册</button>
                    <a href="<%=basePath%>pageJump?jumpPath=/login">登 录</a>
               </form>
        </div>
    </div>
    <script src="<%=basePath%>pageCss/js/jquery.js"></script>
</body>
</html>
