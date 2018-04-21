<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>

<div id="content" class="span10">

	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void();">后台管理</a> <span class="divider">/</span></li>
			<li><a href="javascript:void();">用户信息管理</a></li>
		</ul>
	</div>

	<div class="row-fluid sortable">

		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2>
					<i class="icon-th"></i> 用户信息
				</h2>


			</div>
			<div class="box-content">
				<table
					class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th>编号</th>
							<th>登录名</th>
							<th>真实姓名</th>
							<th>电话</th>
							<th>地址</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${userList }" var="user">
							<tr>
								<td><a class="viewuser" id="${user.id }">${user.id }</a></td>
								<td>${user.username}</td>
								<td>${user.realname }</td>
								<td>${user.telphone }</td>
								<td>${user.address }</td>
							</tr >
						</c:forEach>
					</tbody>
				</table>
			</div>

			
		</div>
	</div>
</div>

<!-- 查看用户信息 -->
<div class="modal hide fade" id="myUserModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3>用户详细信息</h3>
	</div>
	<div class="modal-body">
		   <table class="table table-bordered bootstrap-datatable ">
			<tbody>
				<tr>
					<td>编号</td>
					<td id="userId"></td>
				</tr>
				<tr>
					<td>用户名</td>
					<td  id="userUsername"></td>
				</tr>
				<tr>
					<td>密码</td>
					<td  id="userPassword"></td>
				</tr>
				<tr>
					<td>真实姓名</td>
					<td  id="userRealname"></td>
				</tr>
				<tr>
					<td>生日</td>
					<td  id="userBirth"></td>
				</tr>
				<tr>
					<td>电话</td>
					<td  id="userTelphone"></td>
				</tr>
				<tr>
					<td>地址</td>
					<td  id="userAddress"></td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal">关闭</a> 
	</div>
</div>




<%@include file="/WEB-INF/pages/common/foot.jsp"%>