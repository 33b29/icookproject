<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<title>修改密碼</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
#pw2, #pw1, #lastname, #firstname, #nickname, #email, #birthday, #gender,
	#phone, #account, #address {
	margin: 14px 0px;
}
</style>

<script type="text/javascript">

</script>
	
	
	
	<!-- //for-mobile-apps ${pageContext.request.contextPath}-->
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- load-more -->
	
	<!-- //load-more -->
	<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/main.css" />
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />	
	<!-- banner1 -->
	<div class="banner1">
		<div class="container">
		</div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.html">Home</a><i>|</i></li>
				<li>Sign Up Page</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->



<script type="text/javascript">
$(document).ready(function(){
	$("#aaa").click(function(){
		var password = $("#pw1").val();
		var password2 = $("#pw2").val();
		
		if((password !="") && (password2 !="")){
			 
				if(password == password2){
 					$("#p1").html("<span style='color:green'>密碼一致</span>");
 				
 					if(password.length >7){
 			
 						$("#submit").click();
 			
 					}else{
 						$("#p1").html("<span style='color:red'>密碼需大於8個字元</span>")
 					}

				}else {

					$("#p1").html("<span style='color:red'>密碼不一致</span>");
				}

		}
		if(password == ""){
			$("#p1").html("<span style='color:red'>請輸入密碼</span>");
		}
		if(password2 == ""){
			$("#p2").html("<span style='color:red'>請輸入密碼</span>");
		}
	});
 	
});
</script>



<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } 
</script>


</head>
<body>
<div class="login">
	<div class="container">	
	
				<div class="col-md-12">
					<h6>修改密碼</h6>
				</div>
		<form class="form-horizontal templatemo-forgot-password-form templatemo-container" method="post">
			<div class="form-group">
				<div class="col-md-12">
					密碼<span style="color: red;">*</span>:</td>
					<input type="password" class="form-control" name="password" id="pw1"/><span id="p1"></span></td>
				</div>
				<div class="col-md-12">
					確認密碼<span style="color: red;">*</span>:</td>
					<input type="password" class="form-control" name="password2" id="pw2"/><span id="p2"></span></td>
				</div>
				<c:if test='${LoginOK.userId != null}'>
				<input type="hidden" class="form-control" name="userId" value="${LoginOK.userId}" />
				</c:if>
				<c:if test='${LoginOK.userId == null}'>
				<input type="hidden" class="form-control" name="userId" value="${userId}" id="userId" />
				<!-- type="hidden" -->
				</c:if>
				
			</div>
<!-- 			<a href="" id="aaa" type="button" class="button alt">修改密碼</a> -->
			<input type="button" id="aaa" class="button alt" value="修改">
			<input type="submit" id="submit" value="修改" style='display: none'/>
		</form>
	
	</div>
	</div>
</body>
</html>