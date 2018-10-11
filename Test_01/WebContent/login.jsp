<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
<html>
<head>
<title>登录界面</title>
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>

<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function(){
			function rememberMe(){
				$.ajax({
					url:"${APP_PATH}/user/rememberMe",
					type:"GET",
					data:$("form").serialize(),
					dataType:"json",
					success:function(data){
						console.log(data);
						if(data.code == 100){
							console.log("记住密码..");
						}else{
							console.log("记住失败..");
						} 
					},
				    error:function(){
				    	alert("访问错误!");
				    }
				});
			}
			
			$("button").click(function(){
				var userName = $("input[name='userName']").val();
				var pass = $("input[name='pass']").val();
				var privilege = $("input[name='privilege']:checked ").val();
				if(userName == "" || pass == ""){
					alert("用户名或密码不能为空!");
					return;
				}
				$.ajax({
					url:"${APP_PATH}/user/login",
					type:"POST",
					data:$("form").serialize(),
					success:function(data){
						if(data.code == 100){
							alert("登录成功!即将进入登录页面...");
							var p = confirm("是否记住密码?");
							if(p){
							   rememberMe();
							}
						 	if(privilege == 0){
								window.location.href="${APP_PATH}/index";
							}
							if(privilege == 1){
								window.location.href="${APP_PATH}/adminMenu.jsp";
							} 
						}else{
							alert("账号密码有误!请重新核实后登录.....");
						}
					},
				    error:function(){
				    	alert("访问错误!");
				    }
				});
			});
			$("input[name='userName']").keyup(function(){
				if($(this).val() == ""){
					$("input[name='pass']").val("");
				}
			});
			
			 $(document).on("keypress",function(e){
		    	 if(e.keyCode == 13){
		    		 $("button").trigger('click');
		    	 }
		     });
	});

    





</script>


<style type="text/css">
       #header {width:100%;height:60px;}
	   #main {width: 100%;height:350px;background-color: buttonhighlight; text-align: center;margin-top: -19px}
	   #footer {widows: 100%;height:270px;}
	   table {margin:auto;}
	   h2 {padding-top:40px;}
	   table tr td {padding-top: 20px; text-decoration: none;}
	   a:LINK {
		}
	   a:hover{
	      text-decoration: none;
	   }
	   
	   
	  

</style>
</head>
<body>
   <div id="container"> 
        <div id="header">
            <iframe src="${APP_PATH}/LoginHeader.jsp" frameborder="0" width="100%"  height="60px" scrolling="no" id="header"></iframe>
        </div>
        <div id="main">
            <div>
                <h2>用户登录</h2>
                <form action="#">
                    <table>
                         <tr>
                            <td></td>
                            <td>
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
								  <input type="text" class="form-control" name="userName" placeholder="Username" aria-describedby="basic-addon1" style="width: 300px">
								</div>
							</td>
                         </tr>
                         <tr>
                            <td></td>
                            <td >
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
								  <input type="text" class="form-control" name="pass" placeholder="Password" aria-describedby="basic-addon1" style="width: 300px">
								</div>
                            </td>
                         </tr>
                          <tr>
                            <td></td>
                            <td style="font-size: 14px;">
                                <div class="input-group input-group-sm">
                                <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></span>
								 &nbsp;&nbsp; <input type="radio" name="privilege" value="0" checked="checked">普通用户
								  <input type="radio" name="privilege" value="1">管理员&nbsp;&nbsp;
								  <input type="radio" name="privilege" value="2">游客
								</div>
                            </td>
                         </tr>
                         <tr>
                            <td>
                            </td>
                            <td>
                                <button type="button" class="btn btn-warning" style="width: 330px;">登录</button>
                            </td>
                         </tr>
                         <tr>
                            <td>
                            </td>
                            <td align="center"><a href="javascript:;"><span style="font-size: 13px;color: blue;text-align: center;">忘记密码?</span></a></td>
                         </tr>
                    </table>
                </form>
            </div>
        </div>
        
         <div id="footer">
             <iframe src="${APP_PATH }/footer" id="footer" frameborder="0" scrolling="no" width="100%" height="280px" style="margin-top: -15px;"></iframe>
        </div>
   
   </div>
</body>












</html>