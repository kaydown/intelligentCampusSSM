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
					<li class="active">
						食谱列表
					</li>
				</ol>
			</div>
			<div class="cl-mcont">
				<c:if test="${roler=='0' }">
					<div class="row">
						<div class="col-md-12">
							<a href="<%=basePath%>food/beforeAddOrUpdateFood?foodId=" class="btn btn-primary btn-flat">添加当天食谱</a>
						</div>
					</div>
				</c:if>
				<div class="row">
					<div class="col-md-12">
						<div class="block-flat">
							<div class="header">
								<h3>
									食谱日期列表
								</h3>
							</div>
							<div class="content">
								<div class="table-responsive">
									<table class="table table-bordered" id="datatable">
										<thead>
											<tr>
												<th>日期</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${foodDateList }" var="obj">
												<tr class="odd gradeX">
													<td>${obj }</td>
													<td>
														<a class="btn btn-warning btn-xs" href="<%=basePath%>food/findFoodAll?date=${obj}">查看菜谱</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
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

	<script type="text/javascript">
		$(document).ready(function() {
			App.init();
			$("#datatable").dataTable();
			$(".md-trigger").modalEffects();
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
</body>
</html>
