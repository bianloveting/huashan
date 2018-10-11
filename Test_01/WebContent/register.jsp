<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<html>
<head>
<meta charset="UTF-8">
<title>注册界面</title>
<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


<style type="text/css">
       #header {width:100%;height:60px;}
	   #main {width: 100%;height:450px;margin:0 atuo;background-color: buttonhighlight; margin-top: -19px}
	   #footer {widows: 100%;height:270px;}
	   table {margin:auto;margin-top: -15px;}
	   h2 {padding-top:40px;text-align: center;}
	   table tr td {padding-top: 20px;}
	   
</style>
</head>
<body>
   <div id="container"> 
        <div id="header">
            <iframe src="header.jsp" frameborder="0" width="100%"  scrolling="no" ></iframe>
        </div>
        <div id="main">
            <div>
                <h2>用户注册</h2>
                <form action="#">
                    <table>
                         <tr>
                            <td></td>
                            <td >
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
								  <input type="text" class="form-control" name="userName" placeholder="userName" aria-describedby="basic-addon1" style="width: 300px">
								  <span></span>
								</div>
								<span style="margin-left: 37px;"></span>
							</td>
							
                         </tr>
                         <tr>
                            <td></td>
                            <td>
                                <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
								  <input type="text" class="form-control" name="mail" placeholder="XXX@XXX.com" aria-describedby="basic-addon1" style="width: 300px">
								</div>
								<span style="margin-left: 37px;"></span>
                            </td>
                            <td></td>
                         </tr>
                         <tr>
                            <td></td>
                            <td >
                                 <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
								  <input type="text" class="form-control" id="pass1" name="pass" placeholder="Password" aria-describedby="basic-addon1" style="width: 300px">
									
								</div>
								<span style="margin-left: 37px;"></span>
                            </td>
                            <td></td>
                         </tr>
                         <tr>
                            <td></td>
                            <td >
                                 <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
								  <input type="text" class="form-control" id="pass2" name="pass2"  placeholder="Confirm Password" aria-describedby="basic-addon1" style="width: 300px">
								</div>
								<span style="margin-left: 37px;"></span>
                            </td>
                            <td></td>
                         </tr>
                         <tr>
                            <td></td>
                            <td>
                               <div class="input-group input-group-sm">
								  <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></span>
								  <input type="radio" name="privilege" value="0" id="sex" checked>一般用户 &nbsp;&nbsp;
								  <input type="radio" name="privilege" value="1">系统管理员
								</div>
                            </td>
                         </tr>
                         
                         <tr>
                            <td>
                            </td>
                            <td>
                                <button type="button" class="btn btn-warning" style="width: 330px;">创建账号</button>
                            </td>
                            <td></td>
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




<script type="text/javascript">
	function checkUserNameHasExists($ele){
		if(checkEmpNameIstrue($ele)){
			$.ajax({
				url:"${APP_PATH}/user/checkUserNameHasExists/"+$ele.val(),
				type:"PUT",
				success:function(data){
					console.log(data);
					if(data.code == 100){
						$($ele).parent().addClass("has-error");
						$ele.parent().next("span").text("该用户名已存在").css({"color":"red","font-size":"11px"});
						return false;
					}else{
						$($ele).parent().removeClass("has-error").addClass("has-success");
						$ele.parent().next("span").text("该用户名可以使用").css({"color":"green","font-size":"11px"});
					}
				},
			    error:function(){
			    	alert("访问错误!");
			    }
			});
			return true;
		}
		return false;
		
	}

	$("input[name='userName']").blur(function(){
		checkUserNameHasExists($(this));
		
	});    
	
	$("input[name='mail']").blur(function(){
		checkEmpNameEmail2($(this));
	});
	
	$("input[name='pass']").blur(function(){
		checkPassIstrue($(this));
	});
    
	$("input[name='pass2']").blur(function(){
		checkPassIstrue($(this));
		var pass1 = $("input[name='pass']");
		var pass2 = $("input[name='pass2']");
		if(pass2.val() != pass1.val()){
			pass1.parent().next("span").text("两次密码不一致!").css({"color":"red","font-size":"11px"});
			pass2.parent().next("span").text("两次密码不一致!").css({"color":"red","font-size":"11px"});
		}else{
			pass1.parent().next("span").hide();
			pass2.parent().next("span").hide();
		}
	
	});
	
	function formatIsCurrect(){
		console.log(checkUserNameHasExists($("input[name='userName']")));
		console.log(checkEmpNameEmail2($("input[name='mail']")));
		console.log(checkPassIstrue($("input[name='pass']")));
		console.log(checkPassIstrue($("input[name='pass2']")));
		
		return  (checkUserNameHasExists($("input[name='userName']")) == true
		       &&checkEmpNameEmail2($("input[name='mail']")) == true
		       &&checkPassIstrue($("input[name='pass']")) == true
		       &&checkPassIstrue($("input[name='pass2']")) == true ) ? true : false;
	}
	
	
	$("button").click(function(){
		var userName = $("input[name='userName']").val();
		var mail = $("input[name='mail']").val();
		var pass = $("input[name='pass']").val();
		var pass2 = $("input[name='pass2']").val();
		console.log(userName+mail+pass+pass2);
		if(mail == "" || userName == "" || pass2 == "" || pass == ""){
			alert("注册的内容不能为空");
			return;
		}
		alert(formatIsCurrect());
		if(!formatIsCurrect()){
			checkUserNameHasExists($("input[name='userName']"));
			checkEmpNameEmail2($("input[name='mail']"));
			checkPassIstrue($("input[name='pass']"));
			checkPassIstrue($("input[name='pass']"));
		}else{
			$.ajax({
					url:"${APP_PATH}/user/registerUser",
					type:"POST",
					data:$("form").serialize(),
					success:function(data){
						console.log(data);
						if(data.code == 100){
							alert("注册成功!即将返回登录页面...");
							window.location.href="${APP_PATH}/login";
						}else{
							alert("注册失败!");
						}
					},
				    error:function(){
				    	alert("访问错误!");
				    }
				});
		}
	});
	
	
	////验证用户名是否正确(简洁版)
	function checkEmpNameIstrue($ele){
		var empName = $($ele).val();
		var regName = new RegExp("^[a-zA-Z0-9_-]{6,16}|[\u2E80-\u9FFF]{2,5}$");
		if(!regName.test(empName)){
			$($ele).parent().addClass("has-error");
			$($ele).parent().next("span").text("用户名是2-5位中文或6-16英文和数字的组合").show().css({"color":"red","font-size":"11px"});
			return false;
		}
		$($ele).parent().removeClass("has-error").addClass("has-success");
	    $($ele).next("span").text("").hide();;
		return true;
	}
	
	
    //验证密码是否正确(简洁版)
	function checkPassIstrue($ele){
		var empName = $($ele).val();
		var regName = new RegExp("^[a-zA-Z0-9]{6,16}$");
		if(!regName.test(empName)){
			$($ele).parent().addClass("has-error");
			$($ele).parent().next("span").text("密码是6-16英文和数字的组合").show().css({"color":"red","font-size":"11px"});
			return false;
		}
		$($ele).parent().removeClass("has-error").addClass("has-success");
	    $($ele).next("span").text("").hide();;
		return true;
	}

	//验证员工邮箱是否正确   (简洁版)
	function checkEmpNameEmail2($ele){
		var result = false;
		var empEmail = $ele.val();
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(empEmail)){
			$ele.parent().addClass("has-error");
			$ele.parent().next("span").text("邮箱格式不正确!").show().css({"color":"red","font-size":"11px"});
			return false;
		}
		$ele.parent().removeClass("has-error").addClass("has-success");
		$ele.parent().next("span").text("").hide();
		return true;
		
	}
	
	




</script>








</html>