<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>

<html>
<head>
<meta charset="UTF-8">
<title>创建课程</title>
<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function(){
		
		
		$("button").click(function(){
			var uploadFile = new FormData($("#form").get(0));
			var cType = uploadFile.get("cType");
			var cName = uploadFile.get("cName");
			var cContent = uploadFile.get("cContent");
			var cImg = uploadFile.get("cImg");
			var cTeacher = uploadFile.get("cTeacher");
			var vId = uploadFile.get("vId");
			var sId = uploadFile.get("sId");
			var cImg1 = $("input[type='checkbox']:eq(0):checked").val();
			var vId1 = $("input[type='checkbox']:eq(1):checked").val();		    
			
		    console.log(cImg.size);
		    
		    if(cType == "" || cName == "" || cContent == "" || cTeacher == "" ){
		    	alert("文本内容不能为空");
		    	return;
		    } 
		   
		    if(cImg1 == 0){
		    	if(cImg.size > 100000 || cImg.size <= 0){
			    	alert("上传课件背景图片大小不正确,应0-100K");
			    	return;
				 }
		    	if(cImg)
		    	upload(uploadFile);
		    	return;
		    }
		    if(cImg1 != 0){
		    	uploadFile.delete("cImg");
		    	alert("没有上传图片");
		    }
		    if(vId1 == 0){
		    	if(vId.size > 100000 || vId.size <= 0){
			    	alert("上传视频图片大小超出,应0-100K");
			    	return;
			    }
		    	upload(uploadFile);
		    	return;
		    }
		    if(vId != 0){
		    	uploadFile.delete("vId");
		    	alert("没有上传视频");
		    }
		    	
		    upload(uploadFile);  
		    
		   
		   
			
		});
		
		function upload(uploadFile){
			$.ajax({
				url:"${APP_PATH}/upload/updateInfo",
	   				type:'POST',
	   				data:uploadFile,
	   				async: false,  
	   				cache: false, 
	   				processData: false, //不处理数据
	   				contentType:false,
	   				success:function(data){
	   					console.log(data);
	   					if(data.code == 100){
	   						alert("上传数据成功!即将返回上一层页面!");
	   						window.location.href = '${APP_PATH}/adminMenu.jsp'; 
	   					}else{
	   						alert(data.extendInfo.msg);
	   					}
	   				},
	   				error:function(){
	   					alert("访问失败！");
	   				}
	   			}) 
			
		}
		
		
		$("#cId").change(function(){
			var cId = $("#cId option:selected").val();
		 	$.ajax({
				url:"${APP_PATH}/upload/getCourseByCId",
				type:"get",
				data:{"cId":cId},
				success:function(result){
				 	console.log(result);
				 	$("input[name='cName']").val(result.extendInfo.msg.cName);
				 	$("input[name='cTeacher']").val(result.extendInfo.msg.cTeacher);
				 	$("input[name='cContent']").val(result.extendInfo.msg.cContent);
				 	$("input[name='cType']").val(result.extendInfo.msg.cType);
				 	$.each($("#secondCourse option"),function(){
                		if($(this).val()==result.extendInfo.msg.sId){
                			$(this).prop("selected",true);
                		}
                	});
				 	
				 	
				},
				error:function(){
					console.log("访问失败");
				}
			}); 
			
		});
		
		
		//取出数据库中的二级课表中数据
		function secondLession(){
			
			$.ajax({
				url:"${APP_PATH}/upload/selectCourse",
				type:"get",
				success:function(result){
					console.log(result);
				 	$.each(result.extendInfo.msg,function(index,item){
  						 var $dept_options= $("<option></option>").append(item.secondCourse.sName).attr("value",item.secondCourse.sId);
  						 $dept_options.appendTo($("#secondCourse"));
					});  
				},
				error:function(){
					console.log("访问失败");
				}
			});
			
			$.ajax({
				url:"${APP_PATH}/upload/getVideoCourse",
				type:"get",
				success:function(result){
					$.each(result.extendInfo.msg,function(index,item){
  						 var $dept_options= $("<option></option>").append(item.cId+"----"+item.cName).attr("value",item.cId);
  						 $dept_options.appendTo($("#cId"));
					}); 
				},
				error:function(){
					console.log("访问失败");
				}
			});
		}
		secondLession();
	});
	
	
	
	
	
	


</script>



<style type="text/css">
       
       #header {width:100%;height:60px;}
	   #main {width: 100%;height:600px;background-color: buttonhighlight; text-align: center;margin-top: -19px}
	   #footer {widows: 100%;height:270px;}
	   table {margin:auto;}
	   h2 {padding-top:110px;;font-family: 宋体;font-weight: bold;}
	   table tr td {padding-top: 10px;}
	   

</style>
</head>
<body>
   <div id="container"> 
        <div id="header">
            <iframe src="header.jsp" frameborder="0" width="100%" height="60px" scrolling="no" ></iframe>
        </div>
        <div id="main">
            <div>
                <h2>修改课程</h2>
                <form id="form" action="#" method="post" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <td></td>
                            <td>
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1">课程编号:</span>
								   <select class="form-control" style="width: 300px" name="cId" id="cId">
								   
								   </select>
								</div>
								<span style="margin-left: 37px;"></span>
							</td>
                         </tr>
                         <tr>
                            <td></td>
                            <td>
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1">课程名称</span>
								  <input type="text" class="form-control" name="cName" placeholder="course name" aria-describedby="basic-addon1" style="width: 300px">
								</div>
								<span style="margin-left: 37px;"></span>
							</td>
                         </tr>
                         <tr>
                            <td></td>
                            <td>
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1">课程描述</span>
								  <input type="text" class="form-control" name="cContent" placeholder="XXX@XXX.com" aria-describedby="basic-addon1" style="width: 300px">
								</div>
								<span style="margin-left: 37px;"></span>
                            </td>
                         </tr>
                          <tr>
                            <td></td>
                            <td >
                                 <div class="input-group input-group-sm" >
								  	<span class="input-group-addon">课程修改</span>
										 <!--  <div class="col-lg-0" style="width: 255px">
										    <div class="input-group input-group-sm">
										      <input type="text" class="form-control" placeholder="Search for..." style="width:245px;"> -->
									       <input type="file" name="cImg" style="float:left;"> <input type="checkbox" value="0" style="float:left;" name="cImg1">是否修改
								</div>
								<span style="margin-left: 37px;"></span>
								</div>
                            </td>
                         </tr>
                         <tr>
                            <td></td>
                            <td >
                                 <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1">课程讲师</span>
								  <input type="text" class="form-control" name="cTeacher" placeholder="input course's Teacher" aria-describedby="basic-addon1" style="width: 300px">
								</div>
								<span style="margin-left: 37px;"></span>
                            </td>
                         </tr>
                         
                           <tr>
                           <td></td>
                            <td >
                                 <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1">课程类型</span>
								  <input type="text" class="form-control" name="cType" placeholder="input course Type" aria-describedby="basic-addon1" style="width: 300px">
								</div>
								<span style="margin-left: 37px;"></span>
                            </td>
                         </tr>
                         
                          <tr>
                            <td></td>
                            <td >
                                 <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1">课程所属</span>
								 <select class="form-control" style="width: 300px" name="sId"  id="secondCourse">
										 <option value="0" selected="selected">--请选择--</option>
								 </select>
								</div>
                            </td>
                         </tr>
                         
                         <tr>
                            <td></td>
                            <td >
                                 <div class="input-group input-group-sm">
								  	<span class="input-group-addon" id="basic-addon1">视频文件</span>
										 <!--  <div class="col-lg-0" style="width: 255px">
										    <div class="input-group input-group-sm">
										      <input type="text" class="form-control" placeholder="Search for..." style="width:245px;"> -->
									          <input type="file" name="vId" style="width:300px;float: left" ><input type="checkbox" name="vId1" value="0" style="float:left;">是否修改
								</div>
								<span style="margin-left: 37px;"></span>
								</div>
                            </td>
                         </tr>
                         
                         <!--  <tr>
                            <td></td>
                            <td>
                                 <div class="input-group input-group-sm">
									    <span class="input-group-addon" id="basic-addon1" style="width:69px;">二级ID</span>
										<div class="btn-group">
										  <button type="button" class="btn btn-default btn-sm" style="width: 275px">选择ID</button>
										  <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    <span class="caret"></span>
										    <span class="sr-only">Toggle Dropdown</span>
										  </button>
										<select class="form-control" style="width: 300px" name="">
											  <option value="0">--请选择--</option>
										</select>
								 </div>
								</div>
                            </td>
                         </tr> -->
                         <tr>
                            <td>
                            </td>
                            <td style="padding-top: 15px;">
                                <button type="button" class="btn btn-warning" style="width: 364px;" >修改课程</button>
                            </td>
                         </tr>
                         <tr>
                            <td></td>
                            <td>
                            </td>
                         </tr>
                    
                    </table>
                
                </form>
            
            </div>
        </div>
        
         <div id="footer">
             <iframe src="footer.jsp" frameborder="0" scrolling="no" width="100%" height="280px" style="margin-top: -15px;"></iframe>
        </div>
   
   </div>
</body>












</html>