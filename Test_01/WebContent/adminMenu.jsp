<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<html>
<head>
<title>课程菜单</title>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


<script type="text/javascript">
	
	$(function(){
		$("#btn1").click(function(){
			window.location.href="${APP_PATH}/Admin_upload_course.jsp";
		});
		
		$("#btn2").click(function(){
			window.location.href="${APP_PATH}/Admin_upload_video.jsp";
		});
		
		/* $("button:eq(1)").click(function(){
			window.location.href="${APP_PATH}/Admin_upload_video.jsp";
		}); */
		
     	$("#btn3").click(function(){
			//$("#empModalEdit").modal("show");
			
			window.location.href="${APP_PATH}/admin_update_course.jsp";
			 
			 $.ajax({
					url:"${APP_PATH}/upload/selectCourse",
					type:"get",
					success:function(result){
						console.log(result);
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
					console.log(result.extendInfo.msg[0].secondCourse.sName);
                		/* if($(this).val()==result.extendInfo.emp.department.deptId){
                			$(this).prop("selected",true);
                		} */
				 	$.each(result.extendInfo.msg,function(index,item){
  						 var $dept_options= $("<option></option>").append(item.secondCourse.sName).attr("value",item.secondCourse.sId);
  						 $dept_options.appendTo($("#sId"));
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
	   #main {width: 100%;height:380px;background-color: buttonhighlight; text-align: center;margin-top: -19px}
	   #footer {widows: 100%;height:270px;}
	   table {margin:auto;margin-top: -15px;}
	   h2 {padding-top:40px;}
	   table tr td {padding-top: 20px;}
	   

</style>
</head>
<body>
	   <!-- 员工修改 -->
    <div class="modal fade" id="empModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title"  id="myModalLabel">员工修改</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal" enctype="multipart/form-data" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">课程名称:</label>
			    <div class="col-sm-10" >
			       <input type="hidden" id="txtId">
			      <input type="text" class="form-control" id="edit_empName" placeholder="员工姓名"  name="cName">
			      <span class="help-block"></span>
			    </div>
              </div>	
    	  
			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label" name="cTeacher">授课教师:</label>
			     <div class="col-sm-10">
			         <input type="text" class="form-control" id="edit_empEmail" name="cTeacher" placeholder="xxx@xx.com" >
			         <span  class="help-block"></span>
			      </div>
			  </div>
			  <div class="form-group">
			      <label for="inputPassword3" class="col-sm-2 control-label" >课程类型</label>
			       <div class="col-sm-10">
			         <select  class="form-control" name="sId" id="sId">
			        </select> 
			      </div>
			  </div>
			  <div class="form-group">
			      <label for="inputPassword3" class="col-sm-2 control-label">视频名称:</label>
			      <div class="col-sm-10">
			         <select  class="form-control" name="vName" id="vName">
			        </select> 
			      </div>
			  </div>
			 
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>


   <div id="container"> 
        <div id="header">
            <iframe src="header.jsp" frameborder="0" width="100%" height="60px"  scrolling="no" ></iframe>
        </div>
        <div id="main">
            <div>
                <h2>菜    单</h2>
                <form action="#">
                    <table>
                         <tr>
                            <td>
                            </td>
                            <td>
                                <button type="button" id="btn1" class="btn btn-warning" style="width: 330px;" >创建课程</button>
                            </td>
                         </tr>
                           <tr>
                            <td>
                            </td>
                            <td>
                                <button type="button" id="btn2"  class="btn btn-warning" style="width: 330px;">上传视频</button>
                            </td>
                         </tr>
                            <tr>
                            <td>
                            </td>
                            <td>
                                <button type="button" id="btn3"  class="btn btn-warning" style="width: 330px;">修改课程</button>
                            </td>
                         </tr>
                            <tr>
                            <td>
                            </td>
                            <td>
                                <button type="button" id="btn4"  class="btn btn-warning" style="width: 330px;">删除课程</button>
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