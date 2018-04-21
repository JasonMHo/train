<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>火车信息查询</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link id="bs-css" href="statics/css/bootstrap-cerulean.css"
	rel="stylesheet">
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="statics/css/bootstrap-responsive.css" rel="stylesheet">
<link href="statics/css/charisma-app.css" rel="stylesheet">
<link href="statics/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
<link href='statics/css/fullcalendar.css' rel='stylesheet'>
<link href='statics/css/fullcalendar.print.css' rel='stylesheet'
	media='print'>
<link href='statics/css/chosen.css' rel='stylesheet'>
<link href='statics/css/uniform.default.css' rel='stylesheet'>
<link href='statics/css/colorbox.css' rel='stylesheet'>
<link href='statics/css/jquery.cleditor.css' rel='stylesheet'>
<link href='statics/css/jquery.noty.css' rel='stylesheet'>
<link href='statics/css/noty_theme_default.css' rel='stylesheet'>
<link href='statics/css/elfinder.min.css' rel='stylesheet'>
<link href='statics/css/elfinder.theme.css' rel='stylesheet'>
<link href='statics/css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='statics/css/opa-icons.css' rel='stylesheet'>
<link href='statics/css/uploadify.css' rel='stylesheet'>
<link href='statics/localcss/main.css' rel='stylesheet'>

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="statics/img/favicon.ico">

</head>

<body>
	<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="index.html"> <img alt="Charisma Logo"
					src="statics/img/logo20.png" /> <span>后台管理</span></a>

				<!-- nav selector starts -->
				<div class="btn-group pull-right theme-container">
					<ul class="nav">
						<li><a href="javascript:void();">你好, ${user.username }</a></li>
						<li><a href="main.html">首页</a></li>
						<li><a href="javascript:void();"
							class="btn-setting modifypwd">修改密码</a></li>
						<li><a href="logout.html">注销</a></li>
					</ul>
				</div>
				<!-- nav selector ends -->

			</div>
		</div>
	</div>
	<!-- topbar ends -->


	<!-- left menu starts -->
	<div class="span2 main-menu-span">
		<div class="well nav-collapse sidebar-nav">
			<ul class="nav nav-tabs nav-stacked main-menu" id="menus">
				<li class="nav-header hidden-tablet"
					onclick="$('#test1').toggle(500);">后台管理</li>
				<li>
					<ul class="nav nav-tabs nav-stacked" id="test1">
						<li><a class="ajax-link" href="backend/trainList.html"><i class="icon-home"></i>
						    <span class="hidden-tablet">火车信息管理</span></a></li>
						<li><a class="ajax-link" href="backend/userList.html"><i class="icon-home"></i>
						    <span class="hidden-tablet">用户信息管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx信息管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx信息管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx信息管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx信息管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx信息管理</span></a></li>
					</ul>
				
				</li>
				<li class="nav-header hidden-tablet"
					onclick="$('#test2').toggle(500);">数据管理</li>
				<li>
					<ul class="nav nav-tabs nav-stacked" id="test2">
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx数据管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx数据管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx数据管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx数据管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx数据管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void();"><i class="icon-home"></i>
						    <span class="hidden-tablet">xxx数据管理</span></a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!--/.well -->
	</div>
	<!--/span-->
	<!-- left menu ends -->