<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>愛料理首頁</title>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<!-- 商品套版 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/course/main.css" />
	<!-- //商品套版 -->

</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />	
	<!-- 搜尋功能 -->
	
		<fieldset >
			<form method="POST" class="form-horizontal" style="text-align: center">
				<div class="form-group row" style="margin-bottom: 1%; margin-top: 2%;">
				<input class="form-control" type="text"
					placeholder="請輸入關鍵字" aria-label="Search" name="courseName" style="margin-left: 30%;">
				&nbsp;&nbsp;<button class="btn btn-outline-success" type="submit" style="height: 48px;">Search</button>
				</div>
			</form>
		</fieldset>
	
			
<!-- 		<section id="one" class="wrapper style1 justify-content-center"> -->
			
	<div class="container-fluid" style="width: 1800px;">     
    	<div class="row">
      		<c:forEach var='course' items='${courses}'>
		  		<div class="col-6 col-sm-6">
					<article class="feature left" style="margin-left: 12%">
						<span><img src="<c:url value='/getPic/${course.courseId}'/>"
								class="image" style="width: 300px;height: 220px;margin-left: 15px;"/></span>
						<div class="content">
							<table border="1">
								<tr><h3>${course.courseName}</h3>
								<tr><h4 style="color:red; margin-top:10px">課程價格: <fmt:formatNumber value="${course.coursePrice*course.courseDiscount}" pattern="#,###" /></h4>								
								<tr><h4 id="coursetime">上課日期: ${course.courseStartDate}</h4>
								<tr><h4 id="coursetime">上課時間: ${course.courseTime}</h4>
								<tr><h4 style="color:blue;margin-top: 50px;">內容簡介:</h4>
								<tr><h4>${course.courseIntrod}</h4>
							</table>	
							<br>
							<ul class="actions">
								<li>
									<a href="<spring:url value='/courseOrder/courseInfo?id=${course.courseId}' />" class="button alt">詳細資料</a>
								</li>
							</ul>
						</div>
					</article>
				</div>
			</c:forEach> 
   		 </div>
	</div>
<!-- 		</section> -->
	
	<!-- 		Scripts -->
	<script src="/js/course/jquery.min.js"></script>
	<script src="/js/course//skel.min.js"></script>
	<script src="/js/course/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif] -->
	<script src="/js/course/main.js"></script>
			
</body>
</html>