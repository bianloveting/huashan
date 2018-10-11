<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%pageContext.setAttribute("APP_PATH", request.getContextPath()); %>

<html>
<head>
<meta charset="UTF-8">
<title>德州创新学堂</title>
<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>

<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<style type="text/css">
   #header {width:100%;height:60px;margin-top: -8px;}
   
   #main {width: 100%;height:1020px;}
   
   #footer {widows: 100%;height:270px;color:white;font-size: 14px;font-family: 宋体}

   .main_top {width: 100%;height:550px;background-color: purple;margin-top: -2px;}   
   /* .main_top {background-repeat: no-repeat;background-size:100% 230px;}
 */
   .main_footer{background-color:#FFFAF0;width: 100%;height:420px;}
   .main_main {width: 94%;height:80%;margin:0 auto;background-color: white;}
   
    .mmain_footer_top {height: 10%;width: 100%;text-align: center;}
     #title {padding-top: 10px;font-size: 23px;font-weight: bold;}
   .main_top {box-shadow:5px 6px 1px pink;}
   
   a:LINK {
	 text-decoration: none;
  }
  
  a:HOVER {
	font-size:26px;
	font-family: 宋体;
  }
  
  a:VISITED {
	color:red;
}
</style>
</head>
<body >
        <div id="header" >
            <iframe src="${APP_PATH}/header" frameborder="0" width="100%"  height="100%" scrolling="no" ></iframe>
        </div>
        <div id="main" >
          <!--  <div class="main_top"><img src="images/background.jpg" width="100%" height="230px"></div> -->
           <div class="main_top"><iframe src="${APP_PATH }/jiaoben5081/index.html" width="100%" height="550px" scrolling="no" frameBorder="0"></iframe></div>
           <div class="main_footer">
              <div class="mmain_footer_top"><p id="title"><a href="user_index.jsp">精品课程推荐</a></p></div>
              <div class="main_main">
              	   <iframe src="${APP_PATH}/courseContent" scrolling="no" width="100%" height="270px;" style="margin: auto;padding-top: 40px;" frameborder="no"></iframe>
              </div>
           </div>
        </div>
        <div id="footer">
               <iframe src="${APP_PATH}/footer" frameborder="no" scrolling="no" width="100%" height="280px" style="margin-top: -20px;" ></iframe>
        </div>
</body>
</html>