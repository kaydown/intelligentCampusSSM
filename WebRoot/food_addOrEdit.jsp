<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="shortcut icon" href="images/favicon.png">

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>pageCss/js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/jquery.gritter/css/jquery.gritter.css" />

<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">

	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/jquery.nanoscroller/nanoscroller.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/jquery.easypiechart/jquery.easy-pie-chart.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/bootstrap.switch/bootstrap-switch.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/jquery.select2/select2.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/bootstrap.slider/css/slider.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/jquery.datatables/bootstrap-adapter/css/datatables.css" />
<link href="<%=basePath%>pageCss/css/style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/jquery.niftymodals/css/component.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>pageCss/js/bootstrap.daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet" href="<%=basePath%>pageCss/css/pygments.css">
<link href="<%=basePath%>pageCss/js/jquery.icheck/skins/square/blue.css" rel="stylesheet">
  
</head>

<body>
	<!-- Fixed navbar -->
	<div id="head-nav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="fa fa-gear"></span>
				</button>
				<a class="navbar-brand"><span>校园信息</span> </a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right user-nav">
					<li class="dropdown profile_menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img alt="Avatar" src="<%=basePath%>pageCss/images/avatar2.jpg" />${uname }
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li class="divider"></li>
							<li><a href="<%=basePath%>user/beforeAddOrUpdateUser?userId=${uid}">修改个人信息</a></li>
							<li><a href="<%=basePath%>user/logout">注销</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 菜单 -->
	<div id="cl-wrapper">
		<jsp:include page="left.jsp"></jsp:include>

		<div class="container-fluid" id="pcont">
			<div class="page-head">
				<ol class="breadcrumb">
					<li>首页</li>
					<li>
						食谱列表
					</li>
					<li class="active">
						添加食谱
					</li>
				</ol>
			</div>
			<div class="cl-mcont">
				<div class="row">
			      <div class="col-md-12">
			        <div class="block-flat">
			          <div class="header">							
			            <h3>
			            	添加食谱
			            </h3>
			          </div>
			          <div class="content">
			             <form class="form-horizontal group-border-dashed" action="<%=basePath%>food/addOrUpdateFood" style="border-radius: 0px;" method="post">
			              <input type="hidden" name="foodid" value="${food.foodid }">
			              <input type="hidden" name="date" value="${curdate }">
			              <div class="form-group">
			                <label class="col-sm-3 control-label">菜名：</label>
			                <div class="col-sm-6">
			                	<input  class="form-control" type="text" name="name" value="${food.name }">
			                </div>
			              </div>
			              <div class="form-group">
			                <label class="col-sm-3 control-label">上传图片：</label>
			                <div class="col-sm-6">
			                	<div class="col-sm-4">
			                		<input class="form-control" id="imgUrl" name="imgurl" type="text" value="${food.imgurl }" readonly="readonly"/>
			                	</div>
			                	<div class="col-sm-4">
			                		<input id="doc-form-file1" class="form-control" type="file" multiple/>
			                	</div>
			                	<div class="col-sm-4">
			                		<input class="btn btn-primary" name="file" type="button" value="上传" onclick="imgUrlAdd();"/>
			                	</div>
			                </div>
			              </div>
			              <div class="form-group" style="text-align: center;">
			                <button class="btn btn-primary" type="submit">保存</button>
			              </div>
			            </form>
			          </div>
			        </div>
			    </div>
			   </div>
			</div>
		</div>
	</div>
                
	<script src="<%=basePath%>pageCss/js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/behaviour/general.js"></script>
	<script src="<%=basePath%>pageCss/js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.nestable/jquery.nestable.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/bootstrap.switch/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=basePath%>pageCss/js/jquery.select2/select2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>pageCss/js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.datatables/jquery.datatables.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.datatables/bootstrap-adapter/js/datatables.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.niftymodals/js/jquery.modalEffects.js"></script>   
  	<script src="<%=basePath%>pageCss/js/jquery.parsley/dist/parsley.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.icheck/icheck.min.js"></script>
  	<script type="text/javascript" src="<%=basePath%>pageCss/js/bootstrap.daterangepicker/moment.min.js"></script>
  	<script type="text/javascript" src="<%=basePath%>pageCss/js/bootstrap.daterangepicker/daterangepicker.js"></script>
  
	<script type="text/javascript">
		$(document).ready(function() {
			App.init();
		});
	</script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=basePath%>pageCss/js/behaviour/voice-commands.js"></script>
	<script src="<%=basePath%>pageCss/js/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.flot/jquery.flot.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.flot/jquery.flot.pie.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.flot/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="<%=basePath%>pageCss/js/jquery.flot/jquery.flot.labels.js"></script>
	<script type="text/javascript">
	
	function checkbookTypeAndSizeimg(){
	    var filepath = $("#doc-form-file1").val();
        var extStart = filepath.lastIndexOf(".");
        var ext = filepath.substring(extStart, filepath.length).toUpperCase();
        if (ext != ".JPG" && ext != ".JPEG" && ext != ".PNG") {
        	alert("封面格式限于jpg,jpeg,png格式");
            return false;
        }
        var file_size = $("#doc-form-file1")[0].files[0].size;
        var size = file_size / 1024 / 1024;
        if (size > 1) {
        	alert("上传的图片大小不能超过1MB！");
           	return false;
        }
        return true;
	}
	
	function imgUrlAdd() {
		// 判断文件类型及大小
		if(checkbookTypeAndSizeimg()){
			var formData = new FormData();
			formData.append("file",$("#doc-form-file1")[0].files[0]);
			$.ajax({ 
				url : 'uploadFile', 
				type : 'POST', 
				data : formData, 
				// 告诉jQuery不要去处理发送的数据
				processData : false, 
				// 告诉jQuery不要去设置Content-Type请求头
				contentType : false,
				dataType:'text',
				beforeSend:function(){
					console.log("正在进行，请稍候");
				},
				success : function(data) {
					if(data=='no'){
						alert("上传失败");
					}else{
						$("#imgUrl").val(data);
					}
				}, 
				error : function(responseStr) { 
					console.log(responseStr);
				} 
			});
		}
	}
</script>
</body>
</html>