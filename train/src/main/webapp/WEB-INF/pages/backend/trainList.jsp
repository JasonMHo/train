<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>

<div id="content" class="span10">

	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void();">后台管理</a> <span class="divider">/</span></li>
			<li><a href="javascript:void();">火车信息管理</a></li>
		</ul>
	</div>

	<div class="row-fluid sortable">

		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-th"></i> 列车信息</h2>
				  <div class="box-icon"><span class="btn btn-small btn-primary addTrain" >
								<i class="icon-plus icon-white"></i> 添加 </span>
				  </div>
			  	
			 </div>
			<div class="box-content">
				<table class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th><input type="button" value="删除" id="myDelTrainBtn" ></th>
							<th>车次</th>
							<th>发车 —— 到达</th>
							<th>发时 —— 到时</th>
							<th>车型</th>
							<th>运行时间（小时）</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${trainList }" var="train">
							<tr>
								<td><input type="checkbox" class="checkbox" name="delTrain"
									value="${train.train_no }"></td>
								<td><a class="viewtrain" id="${train.train_no }">${train.train_no }</a></td>
								<td>${train.start_station }——${train.arrival_station }</td>
								<td>${train.start_time }——${train.arrival_time }</td>
								<td>${train.type }</td>
								<td>${train.runtime }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</div>


<!-- 查看火车信息 -->
<div class="modal hide fade" id="viewTrainModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3>火车车次详情</h3>
	</div>
	<div class="modal-body">

 				<table class="table table-bordered bootstrap-datatable ">
			<tbody>
				<tr>
					<td>车次</td>
					<td id="trainNo"></td>
				</tr>
				<tr>
					<td>发车 —— 到达</td>
					<td><span id="trainStartStation"></span>  —— 
						<span id="trainAarrivalStation"></span></td>
				</tr>
				<tr>
					<td>发时 —— 到时</td>
					<td><span id="trainStartTime"></span>  ——  
					<span id="trainAarrivalTime"></span></td>
				</tr>
				<tr>
					<td>车型</td>
					<td id="trainType"></td>
				</tr>
				<tr>
					<td>运行时间（小时）</td>
					<td id="trainRuntime"></td>
				</tr>
				<tr>
					<td>里程（千米）</td>
					<td id="trainMile"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal">关闭</a>
	</div>
</div> 





<!-- 添加信息的表单 -->
<div class="modal hide fade" id="addTrainDiv" > 
 <form action="backend/addTrain.html"  method="post" onsubmit="return addTrainFunction();" >
	<div class="modal-header">
		<button type="button" class="close  addtraincancel" data-dismiss="modal">×</button>
		<h3>添加火车车次</h3>
	</div>
	<div class="modal-body">
			<ul id="add_formtip"></ul>
               <ul class="topul">
                  <li><label>车次：</label><input type="text" id="a_trainNo" name="train_no" value="" />
                    				<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>里程：</label><input type="text" id="a_trainMile" name="mile" value=""></li>
                  <li><label>发车：</label><input type="text" id="a_trainStartStation" name="start_station" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>到达：</label><input type="text" id="a_trainArrStation" name="arrival_station" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>发时：</label><input type="text" id="a_trainStartTime" name="start_time" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>到时：</label><input type="text" id="a_trainArrTime" name="arrival_time" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>车型：</label><input type="text" id="a_trainType" name="type" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>运行时间：</label><input type="text" id="a_trainRuntime" name="runtime" value=""></li>
               </ul>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn addtraincancel" data-dismiss="modal">关闭</a>
		<input type="submit"  class="btn btn-primary" value="保存" />
	</div>
	</form>
</div>



<%@include file="/WEB-INF/pages/common/foot.jsp"%>
