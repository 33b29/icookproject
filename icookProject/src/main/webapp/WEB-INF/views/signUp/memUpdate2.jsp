<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>會員資料修改</title>
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

<!-- //load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/main.css" />

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
			<h6>會員資料修改</h6>


			<jsp:useBean id="mem" scope="request"
				class="com.icook.model.MemberBean" />


			<form method="post" modelAttribute="MemberBean" enctype='multipart/form-data' id="myform">
				<div align=center>
					<table width=60%>
						<tr>
							<div id="upload_img" style="position: relative; overflow: hidden; height: 250px; width: 250px">
									<img src="<c:url value='/getPicMem/${LoginOK.userId}' />" alt=" " name="userimage" class="img-responsive"
											style="position: absolute; top: 50%; left: 50%; display: block; min-width: 100%; min-height: 100%; transform: translate(-50%, -50%);" />
							</div>
						</tr>
						<tr>
							<div>
								<label class="btn btn-info" style="margin: 3%;">修改圖片 <input onchange="readURL(this)" style="display: none;" name="userimage" type="file" accept="image/jpg" /> <i class="fa fa-photo"></i> </label>
							</div>
						
						<tr>
						<tr>
							<td style="width: 100px;">會員編號:
							<td><input type="text"  class="form-control" value="${LoginOK.userId}" disabled />
							<input type="hidden" class="form-control" name="userId" value="${LoginOK.userId}" />
							<td>
							<td>
						</tr>
						<tr>
							<td>信箱:
							<td><input type="text"  class="form-control" value="${LoginOK.account}" disabled />
							<input type="hidden" class="form-control" name="account" value="${LoginOK.account}" />
							<td>
							<td>
						</tr>
						<tr>
							<td>姓:
							<td><input type="text" class="form-control" name="lastname" value="${LoginOK.lastname}" />
							<td>名:
							<td><input type="text" class="form-control" name="firstname" value="${LoginOK.firstname}" />
						</tr>
						<tr>
							<td>暱稱:
							<td><input type="text" class="form-control" name="nickname" value="${LoginOK.nickname}" />
							<td>
							<td>
						</tr>
						<tr>
							<td>生日:
							<td><input type="date" class="form-control" name="birthday" value="${LoginOK.birthday}" />
							<td>
							<td>
						</tr>
						<tr>
							<td>性別:
							<td><input name="gender" value="${LoginOK.gender}" id="gender" type="text" list="sexlist" class="form-control"/> 
								<datalist id="sexlist">
									<option>男生</option>
									<option>女生</option>
									<option>其他</option>
								</datalist>
							<td>
							<td>
						</tr>
						<tr>
							<td>電話:
							<td><input type="text" class="form-control" name="phone" value="${LoginOK.phone}" />
							<td>
							<td>
						</tr>
						<tr>
							<td>地址:
							<td><input type="text" class="form-control" name="address" value="${LoginOK.address}" />
							<td>
							<td> 
						</tr>
						
					</table>
					<div>
					<a href="<c:url value='/signUp/updatePassword/${LoginOK.userId}' />" class="button alt">修改密碼</a>
					<a onclick="document.getElementById('myform').submit()" class="button alt">送出</a>
					<input type="hidden" class="form-control" name="password" value="${LoginOK.password}" />
					<input type="hidden" class="form-control" name="checkstatus" value="${LoginOK.checkstatus}" />
							
				</div>
				<br>

			</form>

		</div>
	</div>
	<!-- // -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
</body>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				var html = "";
				html += "<img width='320px' height='200px' src='"+e.target.result+"'>";
				$("#upload_img").html(html);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</html>




