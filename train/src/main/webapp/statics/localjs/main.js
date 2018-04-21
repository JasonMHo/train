$("#myDelTrainBtn").click(function(){
	 var trs = $("table").find("tr"); //获取表格每一行
	 var selectIds = "";
	    trs.each(function() {  // 遍历
	        var isChecked = $(this).find(".checkbox").prop("checked");  // 获取当前行checkbox选择状态；
	        if(isChecked == true || isChecked == "true") { // 如果选中
	        	selectIds += $(this).find(".checkbox").val()+" "; // checkbox的value
	        }
	    })
	    
    	if(selectIds != "" && selectIds != null){
    		
    	  	$.ajax({
    			type: "POST",
    			url: "delete.html",
    			data: {"trainNos":selectIds},
    			dataType: "html",
    	  		timeout:1000,
    			error: function () {
    			   alert("删除失败error");
    				window.location.href = "backend/trainList.html";
    	        },
    	        success: function(result){
    	        	if(result == "success"){
    	 			   window.location.href = "backend/trainList.html";
    	 			  alert("车次"+selectIds+"删除成功了");
    	        	}else if(result == "failed"){
    	        		window.location.href = "backend/trainList.html";
    	        		 alert("删除失败");
    	        	}
    	        },
    		});
    	  	
    	}else{
	    	alert("请选择车次");
	    }
	    
});



$('.viewtrain').click(function(e){
	var m_id = $(this).attr('id');
	$.ajax({
		url: 'backend/getTrain.html',
		type: 'POST',
		data: {id:m_id},
		dataType: 'html',
		timeout: 1000,
		error: function(){
			alert("error");
		},
		success:function(result){
			if("failed" == result){
				alert("操作超时！");
			}else if("nodata" == result){
				alert("没有数据！");
			}else{
				m = eval('(' + result + ')');
				$("#trainNo").html(m.train_no);
				$("#trainStartStation").html(m.start_station);
				$("#trainAarrivalStation").html(m.arrival_station);
				$("#trainStartTime").html(m.start_time);
				$("#trainAarrivalTime").html(m.arrival_time);
				$("#trainType").html(m.type);
				$("#trainRuntime").html(m.runtime);
				$("#trainMile").html(m.mile);
			}
		}
	});
	
	e.preventDefault();
	$('#viewTrainModal').modal('show');
});



$('.viewuser').click(function(e){
	var m_id = $(this).attr('id');
	$.ajax({
		url: 'backend/getUser.html',
		type: 'POST',
		data: {id:m_id},
		dataType: 'html',
		timeout: 1000,
		error: function(){
			alert("error");
		},
		success:function(result){
			if("failed" == result){
				alert("操作超时！");
			}else if("nodata" == result){
				alert("没有数据！");
			}else{
				m = eval('(' + result + ')');
				$("#userId").html(m.id);
				$("#userUsername").html(m.username);
				$("#userPassword").html(m.password);
				$("#userRealname").html(m.realname);
				$("#userBirth").html(m.birthday);
				$("#userTelphone").html(m.telphone);
				$("#userAddress").html(m.address);
				
			}
		}
	});
	
	e.preventDefault();
	$('#myUserModal').modal('show');
});

//Date日期类型以json形式显示到前台时，显示为[object Object]问题
//解决方法二：在js中转换
//function toDate(v,r,i) {
//    var date = new Date();
//    date.setTime(v.time);
//    var y = date.getFullYear();
//    var m = date.getMonth()+1;
//    m = m<10?'0'+m:m;
//    var d = date.getDate();
//    d = d<10?("0"+d):d;
//    var h = date.getHours();
//    h = h<10?("0"+h):h;
//    var M = date.getMinutes();
//    M = M<10?("0"+M):M;
//   // var str = y+"-"+m+"-"+d+" "+h+":"+M;
//    var str = y+" 年 "+m+" 月 "+d+" 日";
//    return str;
//
//}

$('.addTrain').click(function(e){
	$("#add_formtip").html('');
	e.preventDefault();
	$('#addTrainDiv').modal('show');
});


function addTrainFunction(){
	$("#add_formtip").html("");
	var result = true;
	if($("#a_trainNo").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，车次不能为空。</li>");
		result = false;
	}
	if($("#a_trainStartStation").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，发车不能为空。</li>");
		result = false;
	}
	if($("#a_trainArrStation").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，到达不能为空。</li>");
		result = false;
	}
	if($("#a_trainStartTime").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，发时不能为空。</li>");
		result = false;
	}
	if($("#a_trainArrTime").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，到时不能为空。</li>");
		result = false;
	}
	if($("#a_trainType").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，车型不能为空。</li>");
		result = false;
	}
	if(result == true) alert("添加成功 ^_^");
	return result;
}

$('.addtraincancel').click(function(e) {
	$('#a_trainNo').val('');
	$('#a_trainMile').val('');
	$('#a_trainStartStation').val('');
	$('#a_trainArrStation').val('');
	$('#a_trainStartTime').val('');
	$('#a_trainArrTime').val('');
	$('#a_trainType').val('');
	$('#a_trainRuntime').val('');
});




