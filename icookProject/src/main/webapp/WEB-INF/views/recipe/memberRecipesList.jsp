<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>熱門食譜</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<!-- load-more -->

<!-- //load-more -->
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />

	<!-- banner1 -->
	<div class="banner1">
		<div class="container"></div>
	</div>

	<div class="special-services">
		<div class="container">
			<h3>${LoginOK.nickname}的食譜列表</h3>
			<p class="quia">Recipes List</p>
			<a href="${pageContext.request.contextPath}/recipes/add" class="btn btn-success">寫食譜</a>
			<div class="wthree_special_services">
				<c:forEach var="recipe" items="${recipes}">
					<div class="col-md-4 wthree_special_service_left"
						style="height: 420px">
						<img src="<c:url value='/getPicture/${recipe.recipeNo}'/>" alt=" "
							class="img-responsive" />
						<h4>${recipe.recipeName}</h4>
						<h5><span class="glyphicon glyphicon-calendar" aria-hidden="true" style="color:#ff9900"></span><fmt:formatDate value="${recipe.lastUpdated}" pattern="yyyy-MM-dd HH:mm" /></h5>
						<div class="inline-buttons" style='position:absolute;bottom:15px;right:15px;'>
							<a href="<spring:url value='/recipe?no=${recipe.recipeNo}' />" 
								class="btn btn-success">Detail</a>
							<a href="<spring:url value='/recipes/updateRecipe?no=${recipe.recipeNo}' />"
								class="btn btn-primary">Update</a> 
							<a href="<spring:url value='/recipes/deleteRecipe?no=${recipe.recipeNo}' />"
								class="btn btn-danger" onclick="return confirm('確定要刪除這筆資料嗎?')">Delete</a> 
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- for bootstrap working -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	

</body>
</html>