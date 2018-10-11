<%@page import="java.util.UUID"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
<title>header</title>

<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>

<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(function(){
    	console.log("${_user.privilege}" == "");
    	if("${_user.privilege}" == ""){ 
    		$("ul>li:eq(0)").hide();
    		$("ul>li:eq(1)").show();
    		$("ul>li:eq(2)").show();
    		$("ul>li:eq(3)").show();
    		$("ul>li:eq(4)").show();
    	    $("ul>li:eq(5)").show();
    	}
        if("${_user.privilege}" == "1" ){ //管理员
    	//	alert($("ul>li:eq(2)").text());
    		$("ul>li:eq(0)").show();
    		$("ul>li:eq(1)").show();
    		$("ul>li:eq(2)").show();
    		$("ul>li:eq(3)").hide();
    		$("ul>li:eq(4)").show();
    		$("ul>li:eq(5)").show();
        }
    	if("${_user.privilege}" == "0"){ //普通
    		$("ul>li:eq(0)").show();
    		$("ul>li:eq(1)").show();
    		$("ul>li:eq(2)").hide();
    		$("ul>li:eq(3)").hide();
    		$("ul>li:eq(4)").show();
    		$("ul>li:eq(5)").show();
    	}        
    	
    	$("ul>li:eq(0) a").click(function(){
    		var p = confirm("您确定要注销登录吗?");
    		if(p){
				$.ajax({
					url:"${APP_PATH}/user/invaliadate",
					type:"post",
					success:function(data){
						console.log(data);
						alert("注销成功");
						window.location.reload();
					},
					error:function(){
						alert("访问错误");
					}
				});    			
    		}
    	});
    	
    
    }); 
    
</script>

<style type="text/css">
#header {
	width: 100%;
	height: 45px;
	box-shadow: 2px 5px 20px grey;
	background-color: #D3D3D3
}

.header_title {
	padding-top: 0px;
	margin-left: 60px;
	float: left;
	height: 40px;
}

ul li {
	list-style: none;
	float: right;
	margin-right: 20px;
	margin-top: 23px;
	font-size: 13px;
	color: blue;
	font-family: 宋体;
	text-decoration: none;
}

p {
	font-family: 宋体;
	font-size: 25px;
	font-weight: bold;
	color: #809995;
	margin-top: 8px;
	text-decoration: none
}

#ul li {
	float: left;
	margin-top: 1px;
	color: blue;
	width: 110px;
}

p a:hover {
	text-decoration: none;
	font-size: 27px
}
</style>
</head>
<body>
	<div id="header">
		<div class="header_title">
			<p>
				<a href="#" target="_parent">德州创新学堂</a>
			</p>
		</div>
		<div>
			<ul>
				<li><a href="javascript:;" target="_parent">注销</a></li>
				<li style="font-weight: bold;">
				     <a href="#" target="_parent">
						<img src="${APP_PATH }/images/person1.png" alt="" width="18px"
						height="18px" class="img-circle" style="margin-bottom: 5px">
						欢迎<span style="color: red">${_user.userName}</span> <c:if
							test="${_user.privilege == 0 }">
                   			会员
                   		</c:if> <c:if test="${_user.privilege == 1 }">
                   			管理员
                   		</c:if> <c:if test="${_user.privilege eq null}">
							<%=UUID.randomUUID().toString().substring(0, 8)  %>
                   			游客
                   		</c:if>
                   	 </a>
				</li>
				<li><a href="${APP_PATH }/register" target="_parent">用户注册</a></li>
				<li><a href="${APP_PATH }/login" target="_parent">用户登录</a></li>
				<li><c:if test="${_user.privilege == 1}">
						<a href="${APP_PATH}/adminMenu" target="_parent"> 开设课堂</a>
					</c:if> <c:if test="${_user.privilege != 1 }">
						<a href="${APP_PATH }/user_index" target="_parent">课堂推荐</a>
					</c:if>
			    </li>
				<li><a href="${APP_PATH }/index" target="_parent">网站首页</a></li>
			</ul>
		</div>
		<div>
			<img alt="" src="">
		</div>
	</div>



</body>
</html>