<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>愛料理首頁</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>

<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<!-- <!-- <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script> -->
<!-- //for-mobile-apps ${pageContext.request.contextPath}-->
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<!-- //js -->
<!-- load-more -->

<!-- //load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<style>
	.error {
  color: red;
  margin-left: 5px;
}


label.error {
  display: inline;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.html">Home</a><i>|</i></li>
				<li>Mail Us</li>
			</ul>
		</div>
	</div>
	<!-- //banner1 -->
	
	<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>聯絡我們</h3>

			<div class="col-md-10 wthree_contact_left"
				style="padding: 0 200px 0 200px; width: 100%">
				<br>
				<br>
				
				<form action="<c:url value='/sendQuestion'/>" method="post" id="commontForm">
					<div class="col-md-6 wthree_contact_left_grid">
						<div><h5>&nbsp;&nbsp;Email * : </h5></div>
						<input type="text" name="Email" value="" id="Email"
							onfocus="if (this.value == 'Email*') {this.value = '';}"
							onblur="if (this.value == '') {this.value = '';}" required=""/>
					</div>
					<div class="col-md-6 wthree_contact_left_grid">
						<div><h5>&nbsp;&nbsp;Title * : </h5></div>
						<input type="text" name="fname" value="" id="fname"
							onfocus="if (this.value == 'Title*') {this.value = '';}"
							onblur="if (this.value == '') {this.value = '';}" required=""/>
					</div>
					<div class="clearfix"></div>
					<textarea name="Message" id="Message"
						onfocus="if (this.value == 'Message...') {this.value = '';}"
						onblur="if (this.value == '') {this.value = 'Message...';}"
						required="" >Message...</textarea>
					<input class="submit" type="submit" value="提交"> 
					<input type="submit" onclick="oneKeySend(event)" value="一鍵輸入">
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //mail -->
	<!-- footer -->
	
	<!-- //footer -->
	<!-- for bootstrap working -->
	<script>
		function oneKeySend(event) {
			$("#Email").val("changapo010098@gmail.com");
			$("#fname").val("市集 商品問題 ");
			$("#Message").val("想問產品編號2的平底鍋除了紅色以外\n有沒有其他顏色的型號\n另外銀色的型號現在有沒有存貨");
			event.preventDefault();
		}
 		
		$(function() {
			$("#commontForm").validate({
				rules: {
					  fname: {
			            required: true
			          },
			          phone:{
			            required: true,
			            minlength: 8,
			                    number: true
			          },
			          address: 'required',
			          url:{
			            url: true
			          },
			          Email: {
			            required: true,
			            email: true
			          },
			        },
			        messages: {
			          fname: {
			            required:'必填'
			          },
			          phone: {
			            required:'必填',
			            minlength:'不得少於8位',
			            number:'電話需為數字'
			          },
			          address: '必填',
			          Email: {
			            required:'必填',
			            email:'Email格式不正確'
			          },
			          url:'網址格式不正確'
			        },
			        submitHandler: function(form) {
			        	var str = $("#Message").val();
			       		content = content.replace(/\n|\r\n/g,"<br>");
			        	form.submit();
			        	alert("提交成功");
			        }
			});
		})
	</script>
	<!-- //for bootstrap working -->



</body>
</html>