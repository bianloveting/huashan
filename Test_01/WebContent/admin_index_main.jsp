<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%pageContext.setAttribute("APP_PATH", request.getContextPath()); %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
/*$.ajax({
	url : "${APP_PATH}/upload/onFirstLoad",//我这里是进入后台查询数据库
	type : "post",
	async : false,
	datatype : "json",
	success : function(data) {
		window.location.href = "${APP_PATH}/upload/onload";
	//	window.location.reload();//当查询完成之后，查询成功，回来执行这个函数，所以在这个函数里面写刷新，
		//刷新的时候由于sessionStorage已经设置了，所以不会再次执行ajax,这样就实现了ajax只执行一次
		return false;
	},
})*/
$(function(){
	
	
	
	$("#searchClause").val("${clause}");
	$("button").click(function(){
		var $searchClause = $("#searchClause").val();
		if($searchClause == ""){
			alert("查询的条件不能为空!");
			return;
		}
		
	/* 	$.ajax({
			url:"${APP_PATH}/upload/search",
			data:{"clause":$searchClause},
			type:"post",
			dataType:"json",
			success:function(data){
				console.log(data);
			},
			error:function(){
				alert("访问错误!");
			}
		}); */
		
		
		window.location.href = "${APP_PATH}/upload/search?clause="+$searchClause;
		
	/* 	$.ajax({
			url:"${APP_PATH}/upload/search",
			data:{"clause":$searchClause},
			type:"post",
			success:function(data){
				console.log(data);
			},
			error:function(){
				alert("访问错误!");
			}
		});*/
	});
	
	
	
	 $(document).on("keypress",function(e){
    	 if(e.keyCode == 13){
    		 $("button").trigger('click');
    	 }
     });
	
	
});

</script>


<style type="text/css">
#main {
	width: 90%;
	/* height: 755px; */
	height: 800px;
	margin: auto;
	margin-top: -15px;
	box-shadow: -2px 0px 20px grey;
	background-color: #EAEAEA;
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
	background-color: white;
}

a:link {
	text-decoration: none;
	color: black;
}

a:hover  img {
	width: 245px;
	height: 155px;
	color: red;
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

h2 {
	padding-top: 35px;
}

button {
	margin-top: 20px;
}

.right_top {
	height: 180px;
	width: 883px;
	margin-left: 327px;
	box-shadow: 0px -2px 20px black;
	border-left: 7px solid #ABABAB;
}

.right_main {
	height: 500px;
	margin-top: 10px;
}

table {
	box-shadow: 5px 2px 20px grey;
	border-left: 7px solid #ABABAB;
	font-size: 14px;
	font-family: 宋体;
	width: 73%;
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

.right_footer div {
	float: left;
}

#page_info_area {
	margin-top: -10px;
	margin-left: -100px;
	float: left;
}

#page_nav_area {
	float: right;
	margin-top: -60px;
	margin-left: 475px;
}

#page_info_search {
	margin-top: -58px;
	float: right;
	margin-right: 80px;
}
</style>
</head>
<body>

	<div id="left">
		<%-- <iframe src="${APP_PATH}/left" frameborder="0" scrolling="no" width="100%" height="100%"></iframe> --%>
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading"
					style="background-color: orange; height: 40px;">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne"> <span
							style="color: white; font-weight: bold;">JAVA</span>
						</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<ul>
							<li><a
								href="${APP_PATH}/upload/searchBySecondLesson?sId=1001">Java基础</a></li>
							<li><a
								href="${APP_PATH}/upload/searchBySecondLesson?sId=1002">JavaEE</a></li>
							<li><a
								href="${APP_PATH}/upload/searchBySecondLesson?sId=1003">JavaWeb</a></li>
							<li><a
								href="${APP_PATH}/upload/searchBySecondLesson?sId=1004">SSH框架</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading"
					style="background-color: orange; height: 40px;">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#Python">
							<span style="color: white; font-weight: bold;">人工智能与大数据</span>
						</a>
					</h4>
				</div>
				<div id="Python" class="panel-collapse collapse in">
					<div class="panel-body">
						<ul>
							<li><a href="#">Java基础</a></li>
							<li><a href="#">JavaEE</a></li>
							<li><a href="#">JavaWeb</a></li>
							<li><a href="#">SSH框架</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading"
					style="background-color: orange; height: 40px;">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#PHP">
							<span style="color: white; font-weight: bold;">PHP</span>
						</a>
					</h4>
				</div>
				<div id="PHP" class="panel-collapse collapse in">
					<div class="panel-body">
						<ul>
							<li><a href="#">Java基础</a></li>
							<li><a href="#">JavaEE</a></li>
							<li><a href="#">JavaWeb</a></li>
							<li><a href="#">SSH框架</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading"
					style="background-color: orange; height: 40px;">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#Test">
							<span style="color: white; font-weight: bold;">WEB全栈设计</span>
						</a>
					</h4>
				</div>
				<div id="Test" class="panel-collapse collapse in">
					<div class="panel-body">
						<ul>
							<li><a href="#">Java基础</a></li>
							<li><a href="#">JavaEE</a></li>
							<li><a href="#">JavaWeb</a></li>
							<li><a href="#">SSH框架</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div id="right">
		<div class="right_top">
			<h2>检索条件${ pageInfo.total }</h2>
			<div class="input-group input-group-sm">
				<span class="input-group-addon" id="basic-addon1">课程名称</span> <input
					type="text" class="form-control" placeholder="输入课程名称"
					id="searchClause" aria-describedby="basic-addon1"
					style="width: 300px">
			</div>
			<button type="button" class="btn btn-warning"
				style="width: 82px; height: 32px" id="btn">检索</button>
		</div>
		<div class="right_main">
			<div id="top">
				<c:if test="${c ne null}">
					<table>
						<tr style="height: 210px;">
							<td style="width: 80px;"></td>
							<c:if test="${course[0] ne null } ">
								<td style="width: 260px; height: 160px;"><a href="#"><img
										alt="" src="images/java01.jpg" width="240px" height="140px">${c[0].cName }</a></td>
								<td style="width: 50px;"></td>
							</c:if>
							<c:if test="${c[1] ne null } ">
								<td style="width: 260px; height: 160px;"><a href="#"><img
										alt="" src="images/java02.jpg" width="240px" height="140px">${c[1].cName }</a></td>
								<td style="width: 50px;"></td>
							</c:if>
							<c:if test="${c[2] ne null } ">
								<td style="width: 260px; height: 160px;"><a href="#"><img
										alt="" src="images/java03.jpg" width="240px" height="140px">${c[2].cName }</a></td>
								<td style="width: 50px;"></td>
							</c:if>
						</tr>
						<tr style="height: 40px;">
							<td style="width: 80px;"></td>
							<td style="width: 80px;"></td>
							<td style="width: 80px;"></td>
							<td style="width: 80px;"></td>
							<td style="width: 80px;"></td>
							<td style="width: 80px;"></td>
						</tr>
						<tr style="height: 200px;">
							<td style="width: 80px;"></td>
							<c:if test="${c[3] ne null } ">
								<td><a href="#"><img alt="" src="images/java04.jpg"
										width="240px" height="140px">${c[3].cName }</a></td>
								<td style="width: 50px;"></td>
							</c:if>
							<c:if test="${c[4] ne null } ">
								<td><a href="#"><img alt="" src="images/java05.jpg"
										width="240px" height="140px">${c[4].cName }</a></td>
								<td style="width: 50px;"></td>
							</c:if>
							<c:if test="${c[5] ne null } ">

								<td><a href="#"><img alt="" src="images/java06.jpg"
										width="240px" height="140px">${c[5].cName }</a></td>
								<td style="width: 50px;"></td>
							</c:if>
						</tr>
					</table>
				</c:if>	
			</div>
			<c:if test="${pageInfo.total == 0 }">
				<script type="text/javascript">alert('查询的结果为空');</script>
			</c:if>
			<c:if test="${ pageInfo.total != 0 && pageInfo.total ne null}">
				<table>
					<tr style="height: 210px;">
						<td style="width: 80px;"></td>
						<c:if test="${course[0] ne null }">
							<td style="width: 220px; height: 160px;"><a href="#"><img
									alt="" src="/images/${APP_PATH }/img/${course[0].cImg }.jpg"
									width="240px" height="140px"><br>${course[0].cName }</a></td>

						</c:if>

						<td style="width: 50px;"></td>
						<c:if test="${course[1] ne null }">
							<td style="width: 260px; height: 160px;"><a href="#"><img
									alt="" src="/images/${APP_PATH }/img/${course[1].cImg }.jpg"
									width="240px" height="140px"><br>${course[1].cName }</a></td>
							<td style="width: 50px;"></td>

						</c:if>

						<c:if test="${course[2] ne null }">
							<td style="width: 260px; height: 160px;"><div>
									<a href="#"><img alt=""
										src="//images/${APP_PATH }/img/${course[2].cImg }.jpg"
										width="240px" height="140px"><br>${course[2].cName }</a></td>
						</c:if>

						<td style="width: 50px;"></td>
					</tr>
					<tr style="height: 40px;">
						<td style="width: 80px;"></td>
						<td style="width: 80px;"></td>
						<td style="width: 80px;"></td>
						<td style="width: 80px;"></td>
						<td style="width: 80px;"></td>
						<td style="width: 80px;"></td>
					</tr>
					<tr style="height: 200px;">
						<td style="width: 80px;"></td>
						<c:if test="${course[3] ne null }">
							<td><a href="#"><img alt=""
									src="/images/${APP_PATH }/img/${course[3].cImg }.jpg"
									width="240px" height="140px"><br>${course[3].cName }</a></td>
							<td style="width: 50px;"></td>
						</c:if>

						<c:if test="${course[4] ne null }">
							<td><a href="#"><img alt=""
									src="/images/${APP_PATH }/img/${course[4].cImg }.jpg"
									width="240px" height="140px"><br>${course[4].cName }</a></td>
							<td style="width: 50px;"></td>
						</c:if>

						<c:if test="${course[5] ne null }">
							<td><a href="#"><img alt=""
									src="/images/${APP_PATH }/img/${course[5].cImg }.jpg"
									width="240px" height="140px"><br>${course[5].cName }</a></td>
							<td style="width: 50px;"></td>
						</c:if>
					</tr>
				</table>
			</c:if>

		</div>

		<div class="right_footer">
			<div class="col-sm-6" style="font-weight: bold;" id="page_info_area">
				当前第<span style="color: blue" id="pageNum">${pageInfo.pageNum}</span>
				页, 总<span style="color: blue" id="pages">${pageInfo.pages }</span>
				页, 总记录<span style="color: blue" id="pageTotal">${pageInfo.total }</span>
				条
			</div>
			<!-- 分页条信息 -->
			<div class="col-sm-6" id="page_nav_area">
				<nav aria-label="Page navigation" class="pull-right">
					<ul class="pagination pagination-sm">
						<li><a
							href="${APP_PATH}/upload/search?pageNo=1&&clause=${clause}"
							id="first_page">首页</a></li>
						<c:if test="${pageInfo.pageNum==1}">
							<li class="disabled"><a href="#" aria-label="Previous"
								class="prePage"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageInfo.pageNum!=1}">
							<li><a
								href="${APP_PATH}/upload/search?pageNo=${pageInfo.pageNum-1}&&clause=${clause}"
								aria-label="Previous" class="prePage"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${navigatePageNum[0]}"
							end="${navigatePageNum[navigatePageLength-1]}" step="1"
							var="itemPage">
							<c:if test="${pageInfo.pageNum == itemPage}">
								<li class="active"><a
									href="${APP_PATH}/upload/search?pageNo=${itemPage}&&clause=${clause}">${itemPage}</a></li>
							</c:if>
							<c:if test="${pageInfo.pageNum != itemPage}">
								<li><a
									href="${APP_PATH}/upload/search?pageNo=${itemPage}&&clause=${clause}">${itemPage}</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${pageInfo.pageNum == pageInfo.pages}">
							<li class="disabled" class="nextPage"><a href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageInfo.pageNum != pageInfo.pages}">
							<li><a
								href="${APP_PATH}/upload/search?pageNo=${pageInfo.pageNum+1}&&clause=${clause}"
								aria-label="Next" class="nextPage"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<li><a
							href="${APP_PATH}/upload/search?pageNo=${pageInfo.pages}&&clause=${clause}">尾页</a></li>
					</ul>
				</nav>
			</div>

		</div>
	</div>












</body>
</html>