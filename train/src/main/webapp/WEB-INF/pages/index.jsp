<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="statics/img/favicon.ico">

</head>

<body>

<div class="container-fluid">
		<div class="row-fluid">
		
			<div class="row-fluid">
				<div class="span12 center login-header">
					<h2>后台管理系统</h2><small>火车票查询</small>
				</div><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid">
				<div class="well span5 center login-box">
					<div class="alert alert-info">
						请输入用户名和密码...
					</div>
					<div class="form-horizontal">
						<fieldset>
							<div class="input-prepend" title="用户名" data-rel="tooltip">
								<span class="add-on"><i class="icon-user"></i></span><input autofocus class="input-large span10" name="username" id="username" type="text" value="" />
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend" title="密码" data-rel="tooltip">
								<span class="add-on"><i class="icon-lock"></i></span><input class="input-large span10" name="password" id="password" type="password" value="" />
							</div>
							<div class="clearfix"></div>

							
							<div class="clearfix"></div>
							<ul id="mylogin-tip"></ul>

							<p class="center span5">
							<button type="submit" class="btn btn-primary" id="loginBtn">登录</button>
							</p>
						</fieldset>
					</div>
				</div><!--/span-->
			</div><!--/row-->
				</div><!--/fluid-row-->
		
	</div><!--/.fluid-container-->






<%@include file="/WEB-INF/pages/common/foot.jsp"%>