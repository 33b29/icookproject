<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="com.icook.model.orderItem"
	import="com.icook.model.ShoppingCart"
	import="com.icook.model.ProductTypeBean"
	import="com.icook.model.ProductBean"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>市集</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/shoppingCart.css"
	rel="stylesheet" type="text/css" media="all" />

<link href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<style>
.choosepage {
	position: absolute;
	bottom: 45px;
	left: 50%;
}

@media screen( max-width: 300px) {
	body {
        background-color:lightblue;
    }
	.div-height {
		/* 調整分頁按鈕與上面的距離 */
		height: 545px;
	}
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />

<div class="container">
<!-- 		<table id="shopCarTable" border="1"> -->
		<table class="sc_table table table-hover" id="sc_table" style="margin:0px auto;">
<!-- 			<tr style="background-color: #a8fefa"> -->
			<tr class="">
				<th class="" width="5%"><input type="checkbox" class="leaderCheckBox" style="zoom:150%;"/>
<!-- 				<th> -->
				<th class="" width="15%">產品名稱
				<th class="" width="15%">單價
				<th class="" width="10%">優惠
				<th class="" width="15%">特價
				<th class="" width="14%">數量
				<th class="" width="16%">小計
				<th class="" width="10%" colspan="2">編輯
			<c:if test="${empty ShoppingCart.content}">
				<tr style="text-align:center;"><td colspan="9">
					<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" style="width:100%;">目前沒有任何商品</span>
				</td></tr>
			</c:if>
				<c:forEach  items="${ShoppingCart.content}" var="cart"
						varStatus="vs">
						<tr class="trIndex " id="trIndex${vs.index}">
							<td><input type="checkbox" class="fromCheck" style="zoom:120%;" name="doCheckbox" id="fromCheck${vs.index}" value="${cart.key}"/>
							<td>${cart.value.describe}
							<td id="unitPrice${vs.index}"><fmt:formatNumber
									pattern="#0" value="${cart.value.unitPrice}" type="currency" />元
							<td class="discount" id="discount${vs.index}"><fmt:formatNumber
									pattern="#0.0" value="${cart.value.discount}" type="currency" />折
							<td id="onSale${vs.index}"><fmt:formatNumber pattern="#0" value="${cart.value.onSale}" type="currency" />元
							<td>
								<div class="list-cart-notice-wrap">
									<div class="item-qty-control">
										<button title="減少" id="minus${vs.index}"
											class="item-qty-button item-qty-button-minus">-</button>
										<input type="text" name="qty${vs.index}" id="qty${vs.index}" 
											class="item-qty-input" value="${cart.value.qty}" readonly="readonly">
										<button title="增加" id="plus${vs.index}"
											class="item-qty-button item-qty-button-plus">+</button>
									</div>
								</div>
							</td>
							<td id="subTotal${vs.index}" style="text-align:right;"><fmt:formatNumber pattern="#0"
									value="${cart.value.unitPrice * cart.value.qty}"
									type="currency" />元
							<td><img name="cmd" class="MOD" id="MOD${vs.index}" width="24px" style="cursor:pointer;" src="${pageContext.request.contextPath}/images/save.png"/>
<%-- 							<td><span class="MOD glyphicon glyphicon-saved" id="MOD${vs.index}" width="24px" aria-hidden="true" style="color:green; cursor:pointer;"></span></td> --%>
							<td><img name="cmd" class="DEL" id="DEL${vs.index}" width="24px" style="cursor:pointer;" src="${pageContext.request.contextPath}/images/recycle_bin2.png"/>
<%-- 							<td><span class="DEL glyphicon glyphicon-trash" id="DEL${vs.index}" width="24px" aria-hidden="true" style="color:red;cursor:pointer;"></span></td> --%>
									<input type="hidden" id="mapKey${vs.index}" name="mapKey${vs.index}" value="${cart.key}"/>
									<input type="hidden" id="listIndex${vs.index}" name="listIndex${vs.index}" value="${vs.index}" />
					</c:forEach>
			<form id="formSubmit" action="" method="GET">		
				<tr class="" >
					<td colspan="9" id="tdSubmit">
						<button class="btn btn-default btn-sm" id="btnSubmit">確定購買</button>
						<input  class="btn btn-default btn-sm"type="button" id="dd" value="刪除" />
					</td>
				</tr>
			</form>
		</table>
</div>
<div id="demo"></div>

<!-- <table id="table1"> -->
<!--     <thead> -->
<!--         <tr> -->
<!--             <th>股票名稱</th> -->
<!--             <th>股票名稱</th> -->
<!--         </tr> -->
<!--     </thead> -->
<!--     <tbody> -->
<!--         <tr> -->
<!--             <td>台積電</td> -->
<!--             <td>2330</td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>中華電</td> -->
<!--             <td>2412</td> -->
<!--         </tr> -->
<!--     </tbody> -->
<!-- </table> -->
<input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/shopCart.js"></script>
</body>
</html>