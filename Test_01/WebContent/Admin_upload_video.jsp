<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>

<html>
<head>
<meta charset="UTF-8">
<title>创建课程</title>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function(){
		$("button").click(function(){
			var uploadFile = new FormData($("#form").get(0));
			var vName = uploadFile.get("video.vName");
			var vDesc = uploadFile.get("video.vDesc");
			var vId = uploadFile.get("video.vId");  //视频文件
			var sId = uploadFile.get("cId");
			
		    console.log(uploadFile.get("video.vId").size);
		    if(sId == "" || vDesc == "" || vId == "" || vName == "" || vId.size <= 0 ){
		    	alert("文本内容不能为空");
		    	return;
		    } 
			$.ajax({
				url:"${APP_PATH}/upload/uploadVideo",
	   				type:'POST',
	   				data:uploadFile,
	   				dataType:"json",
	   				async: false,  
	   				cache: false, 
	   				processData: false, //不处理数据
	   				contentType:false,
	   				success:function(data){
	   					console.log(data);
	   					//alert(data.msg+" "+data.extendInfo.msg);
	   					if(data.code == 100){
	   						alert("上传数据成功!即将返回上一层页面!");
	   						window.location.href = '${APP_PATH}/adminMenu'; 
	   					}else{
	   						alert("上传数据有问题");
	   					}
	   				},
	   				error:function(){
	   					alert("访问失败！");
	   				}
	   			}) 
		});
		
		
		
		
		
		//取出数据库中的tb_course课表中对应的课程
		function secondLession(){
			$.ajax({
				url:"${APP_PATH}/upload/getVideoCourse",
				type:"get",
				success:function(result){
					console.log(result);
					//console.log(result.extendInfo.msg[0].secondCourse.sName);
                		/* if($(this).val()==result.extendInfo.emp.department.deptId){
                			$(this).prop("selected",true);
                		} */
					$.each(result.extendInfo.msg,function(index,item){
  						 var $dept_options= $("<option></option>").append(item.cName).attr("value",item.cId);
  						 $dept_options.appendTo($("#secondCourse"));
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
            <iframe src="header.jsp" frameborder="0" width="100%"  scrolling="no" ></iframe>
        </div>
        <div id="main">
            <div>
                <h2>上传视频</h2>
                <form id="form" action="#" method="post" enctype="multipart/form-data">
                    <table>
                         <tr>
                            <td></td>
                            <td>
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1">视频名称</span>
								  <input type="text" class="form-control" name="video.vName" placeholder="course name" aria-describedby="basic-addon1" style="width: 300px">
								</div>
								<span style="margin-left: 37px;"></span>
							</td>
                         </tr>
                         <tr>
                            <td></td>
                            <td>
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1">视频描述</span>
								  <input type="text" class="form-control" name="video.vDesc" placeholder="XXX@XXX.com" aria-describedby="basic-addon1" style="width: 300px">
								</div>
								<span style="margin-left: 37px;"></span>
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
									          <input type="file" name="video.vId">
								</div>
								<span style="margin-left: 37px;"></span>
								</div>
                            </td>
                         </tr>
                         <tr>
                            <td></td>
                            <td >
                                 <div class="input-group input-group-sm">
								 <span class="input-group-addon" id="basic-addon1">对应课程</span>
								 <select class="form-control" style="width: 300px" name="cId" id="secondCourse">
										 <option value="" selected="selected">--请选择--</option>
								 </select>
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
                                <button type="button" class="btn btn-warning" style="width: 364px;" >上传视频</button>
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