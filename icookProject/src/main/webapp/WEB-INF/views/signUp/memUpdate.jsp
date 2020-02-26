<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>會員資料</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } 

</script>


<!-- //for-mobile-apps ${pageContext.request.contextPath}-->
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- load-more -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/main.css" />
<!-- //load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<style>
td{
height: 50px;

}
table{
border-bottom: 1px;

}
#aaa{
padding:5px 15px; 
background:#ccc; 
border:0 none;
cursor:pointer;
-webkit-border-radius: 5px;
border-radius: 5px; 
}


</style>
</head>
<body >
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	<!-- banner1 -->
	<div class="banner1">
		<div class="container"></div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.html">Home</a><i>|</i></li>
				<li>Update Page</li>
			</ul>
		</div>
	</div>
	<!-- //banner1 -->

	<!--  -->
	<div class="login">
		<div class="container">
			<h6>會員資料</h6>


			<jsp:useBean id="mem" scope="request"
				class="com.icook.model.MemberBean" />


			<form method='post' action='memUpdate2.jsp'>
				<div align=center>
<hr>
					<table width=60%>
						<tr>
							<div
									style="width: 300px; height: 300px; background-size: cover; background-repeat: no-repeat; background-position: center;">
									<img src="<c:url value='/getPicMem/${MemberBean.userId}' />"
										alt=" " class="img-responsive" style="width: 100%;" />
								</div>
						</tr>
						<tr>
							<td width=30%>會員編號:</td>
							<td>${MemberBean.userId}</td>	
						</tr>
						<tr>
							<td>信箱&emsp;:&emsp;</td>
							<td>${MemberBean.account}</td>
						</tr>
						<tr>
							<td>姓名&emsp;:&emsp;</td>
							<td>${MemberBean.lastname}${MemberBean.firstname}</td>
						</tr>	
						<tr>
							<td>暱稱&emsp;:&emsp;</td>
							<td>${MemberBean.nickname}</td>
						</tr>	
						<tr>
							<td>生日&emsp;:&emsp;</td>
							<td>${MemberBean.birthday}</td>
						</tr>	
						<tr>
							<td>性別&emsp;:&emsp;</td>
							<td>${MemberBean.gender}</td>
						</tr>	
						<tr>
							<td>電話&emsp;:&emsp;</td>
							<td>${MemberBean.phone}</td>
						</tr>	
						<tr>
							<td>地址&emsp;:&emsp;</td>
							<td>${MemberBean.address}</td>
						</tr>	
					</table>
				</div>
				<br>

			</form>

			<div class="agile_back_home">
				<a href="<c:url value='/SignUp/memUpdate2'/>">修改會員資料</a> <a
					href="<c:url value='/'/>">back to home</a>
			</div>
		</div>
	</div>
	<!-- // -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
</body>
</html>




