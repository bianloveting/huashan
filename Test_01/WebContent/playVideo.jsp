<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.3.1.min.js"></script>

<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<link href="https://unpkg.com/video.js/dist/video-js.css" rel="stylesheet">
<script src="https://unpkg.com/video.js/dist/video.js"></script>

<style type="text/css">
   	table {margin: 0 auto;}

</style>

</head>
<body style="background-image: url('${APP_PATH}/images/bg.png');">
   
   
<%--     <video 
	    id="my-player"
	    class="video-js vjs-big-play-centered"
	    controls
	    preload="auto"
	    poster="${course.cImg }.jpg" 
	    data-setup='{}'
	    width="840px"
	    height="560px" style="float:left"
	   >
	    </source>
	    <source  src="images/movie.mp4"" type="video/mp4"  >
	    </source> 	
	     <source  src="images/movie.mp4" type="video/ogg"  >
	    </source>
	     <source src="images/movie.mp4" type="video/webm"  >
	    </source>
	</video>
	 --%>
	<video 
	    src="${course.video.vId }"    
	    poster="/images/${APP_PATH }/img/${course.cImg}.jpg" 
	    width="840px"
	    height="560px" 
	    style="float:left"
	    controls="controls">
	 </video>
	 <h1 style="text-align: center;">${course.cName }6666</h1>
    
    <table class="table table-condensed table-striped table-hover " style="width: 30%;float:right;">
           <tr>
           		<td>标题:</td>
           		<td>${course.cName }6666</td>
           </tr>
		   <tr class="warning">
	    		<td>课程编号:</td>
	    		<td>${course.cId }</td>
	    	</tr>
    		<tr>
	    		<td>课程名:</td>
	    		<td>${course.cName }</td>
	    	</tr >
    		<tr class="warning">
	    		<td>老师:</td>
	    		<td>${course.cTeacher }</td>
	    	</tr>
    		<tr>
	    		<td>类型:</td>
	    		<td>${course.cType }</td>
	    	</tr>
    		<tr class="warning">
	    		<td>内容名:</td>
	    		<td>${course.cContent }</td>
	    	</tr>
	
	</table>
	
	<div>
	
	</div>     
</body>
</html>