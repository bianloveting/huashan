<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>

<html>
<head>
<meta charset="UTF-8">
<title>header</title>

<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>

<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>



<style type="text/css">
   #header {width:100%;height:45px;box-shadow:2px 5px 20px grey;background-color:#D3D3D3  }
   .header_title {padding-top:0px;margin-left: 60px;float:left;height:40px;}
   ul li {list-style: none;float:right;margin-right: 20px;margin-top: 23px;font-size:13px;color:blue;font-family:宋体;text-decoration: none;}
   p {font-family: 宋体;font-size: 25px;font-weight: bold;color:  #809995;margin-top: 8px;text-decoration: none}
   
   #ul li {float:left;margin-top: 1px;color:blue;width: 110px;}
   
   p a:hover {text-decoration: none;
	font-size: 27px}
</style>
</head>
<body>
 <div id="header">
            <div class="header_title">
                 <p><a href="#" target="_parent">德州创新学堂</a></p>
            </div>
            <div>
               <ul>
                  <li><a href="${APP_PATH }/register" target="_parent">用户注册</a></li>
                  <li><a href="${APP_PATH }/login" target="_parent">用户登录</a></li>
                  <li>
					    <a href="${APP_PATH }/user_index" target="_parent">推荐课堂<span class="caret"></span></a>
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