<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>${recipe.recipeName}</title>
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

<style type="text/css">
	pre {
		border: 0px !important;
		background-color: #ffffff !important;
		white-space: pre-wrap !important;
	}


</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
	<!-- banner1 -->
	<div class="banner1">
		<div class="container"></div>
	</div>

	<div class="single">
		<div class="container" style="margin-left: 150px;">
			<div class="col-md-4 agile_single_left">
				<div class="agileits_recent_posts">
					<h3>Most Popular Recipes</h3>
					<c:forEach items="${top3Recipes}" var="top3Recipes">
					<div class="agileits_recent_posts_grid">
						<div class="agileits_recent_posts_gridl">
							<img src="<c:url value='/getPicture/${top3Recipes.recipeNo}'/>"
								alt=" " class="img-responsive" />
						</div>
						<div class="agileits_recent_posts_gridr">
							<h4>
								<a href="<spring:url value='/recipe?no=${top3Recipes.recipeNo}' />">
									${top3Recipes.recipeName}</a>
							</h4>
							<ul>
								<li><span class="glyphicon glyphicon-time"
									aria-hidden="true"></span>
									<fmt:formatDate value="${top3Recipes.lastUpdated}" pattern="yyyy-MM-dd HH:mm" /></li>
								<li><span class="glyphicon glyphicon-eye-open"
									aria-hidden="true"></span><a href="#">${top3Recipes.pageView}</a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-8 agile_single_right">
				<div class="w3_comments">
					<h3>${recipe.recipeName}</h3>
					<ul>
						<li><span class="glyphicon glyphicon-user" aria-hidden="true"></span><a
							href="#">作者 : ${recipe.memberBean.nickname}</a></li>
						<li><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>更新時間 : 
						<fmt:formatDate value="${recipe.lastUpdated}" pattern="yyyy-MM-dd HH:mm" /></li>
						<li><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
						<a href="#">觀看次數 : ${recipe.pageView}次</a></li>
					</ul>
				</div><br>

				<div class="w3_comments_bottom">
					<img src="<c:url value='/getPicture/${recipe.recipeNo}'/>"
						alt=" " class="img-responsive" style="display: block; margin-left: auto;
  															margin-right: auto; width: 70%;" />
					<pre>${recipe.description}</pre>
					<table class="table">
						<thead>
							<tr>
								<c:if test="${recipe.serving!='null'}">
								<th style="text-align: center">份量<br>${recipe.serving}人份</th></c:if>
								<c:if test="${recipe.cookingTime!='null'}">
								<th style="text-align: center">製作時間<br>${recipe.cookingTime}分鐘</th></c:if>
							</tr>
						</thead>
						<tbody style="text-align: center">
							<th>食材</th>
							<c:forEach var="ingredList" items="${ingredList}">
							<tr>
								<td>${ingredList[0]}</td>
								<td>${ingredList[1]}</td>
							</tr>
							</c:forEach>
							<c:if test="${recipe.group1!=null}">
							<th>${recipe.group1}</th>
							<c:forEach var="group1List" items="${group1List}">
							<tr>
								<td>${group1List[0]}</td>
								<td>${group1List[1]}</td>
							</tr>
							</c:forEach>
							</c:if>
							<c:if test="${recipe.group2!=null}">
							<th>${recipe.group2}</th>
							<c:forEach var="group2List" items="${group2List}">
							<tr>
								<td>${group2List[0]}</td>
								<td>${group2List[1]}</td>
							</tr>
							</c:forEach>
							</c:if>
							<c:if test="${recipe.group3!=null}">
							<th>${recipe.group3}</th>
							<c:forEach var="group3List" items="${group3List}">
							<tr>
								<td>${group3List[0]}</td>
								<td>${group3List[1]}</td>
							</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
					<table class="table">
						<tbody>
							<th>步驟</th>
							<c:forTokens var="step" varStatus="i" delims="," items="${recipe.step}">
							<tr>
								<td style="width: 30%; padding: 20px">
								<img src="<c:url value='/getPicture/${recipe.recipeNo}/${i.index+1}'/>"
									alt=" " class="img-responsive" /></td>
								<td>
									<h2>${i.index+1}</h2>
									<pre>${step}</pre>
								</td>
							</tr>
							</c:forTokens>
						</tbody>
						<c:if test="${recipe.remark!=''}">
						<tfoot>
						<tr><td colspan="2">
						<h4>備註</h4><hr>
						<pre>${recipe.remark}</pre>
						</td></tr>
						</tfoot>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- //footer -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->


</body>
</html>