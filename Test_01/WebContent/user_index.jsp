<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>德州创新学堂</title>


<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>

<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
//searchClause  button 


</script>

<style type="text/css">

body{
   background-color:#FFFACD;
   
}

#header {
	width: 100%;
	height: 60px;
	margin:auto;
    
}

#main {
	width: 90%;
	/* height: 755px; */
	height:800px;
	margin: auto;
	margin-top:0px;
	box-shadow:-2px 5px 20px grey;
	background-color:	#EAEAEA;
}

#footer {
	width: 100%;
	height: 270px;
	color: white;
	font-size: 14px;
	font-family: 宋体;
	margin: 0 auto;
}

#left {
	width: 27%;
	height: 720px;
	float: left;
	background-color:white;
}

a:link {
	text-decoration: none;
	color:black;
}

 a:hover  img {  
   width: 245px;
   height:155px;
   color:red;
  
}

.panel-title a:hover {
	text-decoration: none;
	font-size: 20px;
	
}

a:visted {
	text-decoration: none;
}


.panel-body ul li {
	list-style: none;
}

#right {
	text-align: center;
}

.right_top div {
	width: 366px;
	margin: auto;
}

h2{
   padding-top: 35px;
   
}


button {
	margin-top: 20px;
}

.right_top {
	height: 180px;
	width: 883px;
	margin-left:327px;
	box-shadow:0px -5px 20px black;
	border-left: 7px solid #ABABAB;
}

.right_main {
	height: 500px;
	margin-top: 10px;
	
}

table{
    box-shadow:5px 2px 20px grey;
    border-left: 7px solid #ABABAB;
    font-size:14px;
    font-family:宋体;
}

.right_footer {
	height: 100px;
}



.right_main_img_1 div {
	float: left;
	margin-left: 36px;
}

.right_main_img_1 {
	margin-left: 50px;
}


.right_footer div{ float: left;}

#page_info_area {margin-top: -10px;margin-left:180px;float:left;}

#page_nav_area {float:left;margin-top: -45px;margin-left: 475px;}


#page_info_search {margin-top:-58px;float:right;margin-right: 80px;}


</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<iframe src="${APP_PATH}/header" id="header" frameborder="0" width="100%" height="60px"
				scrolling="no"></iframe>
		</div>
		<div id="main"> 
			<iframe src="${APP_PATH}/left"  frameborder="0" scrolling="no" width="100%" height="100%"></iframe> 
		</div>
		<div id="footer">
			<iframe src="${APP_PATH}/footer" id="footer" frameborder="no" scrolling="no"
				width="100%" height="280px" style="margin-top: -10px;"></iframe>
		</div>
	</div>


</body>
</html>