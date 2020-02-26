<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"
	import="com.icook.model.ProductTypeBean"
	import="com.icook.model.ProductBean"
%>
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

<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/shoppingCart.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 	加入文字編輯器ckEditor -->
<script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />
<div class="container align-items-center coverflow">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  	<!-- Indicators -->
       <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
       </ol>

       <!-- Wrapper for slides -->
       <div class="carousel-inner">
         <div class="item myModal active" 
         	  data-toggle="modal" data-target="#myModal4"
         	  style="cursor:pointer;">
           <img class="topImg" 
           		src="${pageContext.request.contextPath}/images/coffee_pot000.jpg"/>
         </div>
         <div class="item myModal" 
         	  data-toggle="modal" data-target="#myModal5"
         	  style="cursor:pointer;">
           <img class="topImg"
           		src="${pageContext.request.contextPath}/images/steak000.jpg"/>
         </div>
         <div class="item myModal" 
         	  data-toggle="modal" data-target="#myModal6"
         	  style="cursor:pointer;">
           <img class="topImg" 
           		src="${pageContext.request.contextPath}/images/Baking_home_appliances000.jpg"/>
         </div>
       </div>

       <!-- Left and right controls -->
       <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left"></span>
         <span class="sr-only">Previous</span>
       </a>
       <a class="right carousel-control" href="#myCarousel" data-slide="next">
         <span class="glyphicon glyphicon-chevron-right"></span>
         <span class="sr-only">Next</span>
       </a>
	</div>		
	
<!-- 搜尋功能 -->
<!-- <textarea name="editorDemo"></textarea> -->
		<fieldset>
			<form  method="GET" action="productList" class="form-horizontal" style="text-align: center">
				<div class="form-group row" style="margin:5px;">
				<input class="form-control" type="text" id="productName"
					placeholder="請輸入關鍵字" aria-label="Search" name="productName"/>
				&nbsp;&nbsp;<button class="btnSearch btn btn-outline-success">Search</button>
				</div>
			</form>
		</fieldset>
</div>
<div class="container containerPage">
  		<h2 style="margin:20px; text-align:center;display:none;">有<c:out value="${proCount}"/>件商品</h2>                
  		<h2 style="margin:20px; text-align:center;display:none;">有<c:out value="${picCount}"/>張商品圖</h2>                 
<!--   		<h3 style="text-align:center;">每頁&nbsp; -->
<!--   			<select class="selectCountPage" id="selectCountPage"> -->
<!--   				<option>4</option> -->
<!--   				<option selected>8</option> -->
<!--   				<option>12</option> -->
<!--   				<option>36</option> -->
<!--   			</select>項商品 &nbsp; -->
<!--   		到第&nbsp;<select class="selectPage" id="selectPage"></select>&nbsp;頁</h3> -->
  		<ul class="pager"></ul>
</div>
<div class="prosDiv container-fluid" style="width:100%;height:100%;">
	<fieldset style="width:100%;height:500px;margin:50px;display:inline-block;">
		<c:forEach items="${prosList}" var="pros" varStatus="vs">
			<c:set var="prodsSet" value="${pros.type}"></c:set>
<!-- 			proCount是紀錄商品數量,並作為外部索引代號 -->
			<c:set var="proCount" value="${proCount+1}" />
<!-- 			ImgList = {圖片陣列1(產品1),圖片陣列2(產品2),圖片陣列3(產品2),....圖片陣列n} -->
			<c:set var="imgArray" value="${ImgList[vs.index]}"></c:set>
<!-- 	border:solid 1px;background-color:#ffefd0; -->
			<div  class="products myModal block_effect" 
				  data-toggle="modal" data-target="#myModal${proCount}"
				  style="width:30%;margin:3px;cursor:pointer;display:inline-block;text-align:center;" 
				   id="divTop${proCount}">
      			<c:choose>
      				<c:when test="${pros.productID==4 && pros.itemStatus==true}">
					    <c:choose>
      						<c:when test="${fn:substring(imgArray[3], 0, 4)=='http'}">
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${imgArray[3]}"></img>
      						</c:when>
      						<c:otherwise>
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${pageContext.request.contextPath}/${imgArray[3]}"></img>
      						</c:otherwise>
      					</c:choose>	
      				</c:when>
      				<c:when test="${pros.productID==5 && pros.itemStatus==true}">
					    <c:choose>
      						<c:when test="${fn:substring(imgArray[4], 0, 4)=='http'}">
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${imgArray[4]}"></img>
      						</c:when>
      						<c:otherwise>
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${pageContext.request.contextPath}/${imgArray[4]}"></img>
      						</c:otherwise>
      					</c:choose>	
      				</c:when>
      				<c:when test="${pros.productID==7 && pros.itemStatus==true}}">
					    <c:choose>
      						<c:when test="${fn:substring(imgArray[4], 0, 4)=='http'}">
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${imgArray[4]}"></img>
      						</c:when>
      						<c:otherwise>
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${pageContext.request.contextPath}/${imgArray[4]}"></img>
      						</c:otherwise>
      					</c:choose>	
      				</c:when>
      							
      				<c:when test="${pros.productID==10 && pros.itemStatus==true}">
					    <c:choose>
      						<c:when test="${fn:substring(imgArray[2], 0, 4)=='http'}">
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${imgArray[2]}"></img>
      						</c:when>
      						<c:otherwise>
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${pageContext.request.contextPath}/${imgArray[2]}"></img>
      						</c:otherwise>
      					</c:choose>	
      				</c:when>
      				<c:otherwise>
      					<c:choose>
      						<c:when test="${fn:substring(imgArray[0], 0, 4)=='http'}">
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${imgArray[0]}"></img>
      						</c:when>
      						<c:otherwise>
								<img class="img-rounded block_effect" width="300px" height="200px"  
						     	src="${pageContext.request.contextPath}/${imgArray[0]}"></img>
      						</c:otherwise>
      					</c:choose>	
      				</c:otherwise>
      			</c:choose>		     	
      			
				<p><h3>${pros.productName}</h3></p>
      			<p class="text_decribe"></p>
      			
				</div>
 					<!-- Modal商品卡  可加入aria-hidden="true" data-backdrop="static"設定後,只能用[X]or Close來關閉Modal --> 
  				<div class="modal fade myModal" id="myModal${proCount}" role="dialog">
    				<div class="modal-dialog" style="width:80%;">	
    				  <c:set var="imgArrayType" value="${ImgList[vs.index]}"></c:set>
					  
					  <c:forEach items="${prodsSet}" var="pbtt" varStatus="vs2">
					  
					  <!-- 	proCount是紀錄商品總數量(含款式),並作為索引代號 -->
						<c:set var="proContentCount" value="${proContentCount+1}" />
					   <input type="hidden" id="proContentCount" value="${proContentCount}"/>
					  	<c:forEach items="${prodsSet}" var="pbts" varStatus="vs3">
					 	 <!-- 	typeCount是紀錄每項商品有幾種款式 -->
								<c:set var="typeCount" value="${vs3.count}" />
					  	</c:forEach>
					  	<!-- 	取得每項商品款式數量 -->		
						<input type="hidden" id="typeCount${proCount}" value="${typeCount}"/>
					  </c:forEach>
      					<!-- Modal content商品卡內容-->
      					<div class="modal-content modalContent" id="modalContent${proCount}" 
      						style="width:100%;background-color:#f9f7f2;">
      						
        					<div class="modal-header" style="text-align:center;">
          						<button type="button" class="close"data-dismiss="modal" 
          							style="position:absolute;margin:0;right:0;top:0;">
          							&times;<!--這東西就是[X]的圖示 -->
          						</button>
          						<h1 class="modal-title">${pros.productName}</h1>
        					</div>
        					<div class="modal-body" data-ride="carousel" style="position:relative;">
      								<div class="dropdown divProSelect" style="float:right;width:45%;">
      									<h3 class="text_decribe_content"></h3>
  						    			<select class="proSelect" id="proSelect${proCount}" name="proSelect"
  						    				style="">
										</select>
									</div>
									<c:forEach items="${prodsSet}" var="pbt" varStatus="vs2">
<!-- 									給每個item依照type編號 -->
									<c:set var="typeCount2" value="${vs2.count}"></c:set>
      								<div class="item${typeCount2}" id="item${typeCount2}" style="width:100%;">
      									<div class="proPicture" style="float:left;width:40%;">
<!--       										圖片放大區 -->
      										<div class="targetImg" id="targetImg${vs2.index}" style="text-align:center;">
      											<c:choose>
      												<c:when test="${empty imgArray[vs2.index]}">
						                                <c:choose>
      					                                   <c:when test="${fn:substring(imgArray[0], 0, 4)=='http'}">
																<img class="targetOriImg img-rounded" src="${imgArray[0]}">
      					                                   </c:when>
      					                                   <c:otherwise>
																<img class="targetOriImg img-rounded" src="${pageContext.request.contextPath}/${imgArray[0]}">
      					                                   </c:otherwise>
      					                                </c:choose>		
      												</c:when>
      												<c:otherwise>
														<c:choose>
      					                                   <c:when test="${fn:substring(imgArray[0], 0, 4)=='http'}">
																<img class="targetOriImg img-rounded" src="${imgArray[vs2.index]}">
      					                                   </c:when>
      					                                   <c:otherwise>
																<img class="targetOriImg img-rounded" src="${pageContext.request.contextPath}/${imgArray[vs2.index]}">
      					                                   </c:otherwise>
      					                                </c:choose>
      												</c:otherwise>
      											</c:choose>
      										<br><br>
      										</div>
      									</div>
      									<div class="proContent" style="float:right;width:45%">
      									<section class="sectionContent">
      										<c:choose>
												<c:when test="${empty pbt.discount}">
													<h2 class="oriPrice">價格:NT ${pbt.unitPrice}元</h2>
   												</c:when>
												<c:when test="${pbt.discount==1}">
													<h2 class="oriPrice">價格:NT ${pbt.unitPrice}元</h2>
   												</c:when>
 												<c:otherwise>
   													<h2 class="discPrice" style="color:#f04646;">優惠價:NT <fmt:formatNumber pattern="#0" value="${pbt.unitPrice*pbt.discount}" type="currency" />元
														<span class="oriOriPrice" style="text-decoration:line-through;">原價:NT ${pbt.unitPrice}元</span>
													</h2>
   												</c:otherwise>
   											</c:choose>
      										<c:choose>
												<c:when test="${pbt.unitStock==0}">
													<h2 style="color:red">商品缺貨中</h2>
														<select class="selectpicker selectQty products${proContentCount} quantity${proContentCount}" id="qty${proContentCount}">
														</select>
   												</c:when>
 												<c:otherwise>
 													<h2>購買數量
														<select class="selectpicker selectQty products${proContentCount} quantity${proContentCount}" id="qty${proContentCount}">
														</select>
													</h2>
	   											</c:otherwise>
   											</c:choose>
   											
   											<c:choose>
												<c:when test="${pbt.unitStock<=5 && pbt.unitStock>0}">
													<h3 style="color:red">商品即將完售</h3>
													<h3 style="color:red">剩餘庫存量:${pbt.unitStock}</h3>
   												</c:when>
												<c:when test="${pbt.unitStock==0}">
   												</c:when>
 												<c:otherwise>
 													<h3>庫存量:${pbt.unitStock}</h3>
   												</c:otherwise>
   											</c:choose>
   											
   											<c:choose>
												<c:when test="${pbt.unitStock==0}">
   													<button class="btn btn-primary" id="sendMsg">
														到貨後立即通知
													</button>
   												</c:when>
 												<c:otherwise>
   													<button name="cmd" id="press${proContentCount}" class="addToCar btn btn-primary" 
   															data-toggle="modal" data-target="#addToMyCarModal">
														<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" style="width:100%;">
															加入購物車
														</span>
													</button>
													
   												</c:otherwise>
   											</c:choose>
   											
   											      										<!-- picCount是紀錄圖片數量,並作為索引代號 -->
											<c:set var="picCount" value="${picCount+1}" />
											<div class="" style="width:100% height:90px;margin: 0;
											">
      										<c:forEach items="${imgArray}" var="prodImg" varStatus="vsImg">
      											<c:set var="pImg" value="${prodImg}"></c:set>
        										<div class="smallImgBox block_effect" id="prodImg${picCount}" style="float:left;margin:2px;cursor:pointer;">
      												<c:choose>
      					                            	<c:when test="${fn:substring(prodImg, 0, 4)=='http'}">
        													<img class="smallImg img-rounded"  id="smallImg${picCount}" src="${prodImg}" width="100px" height="80px">
      					                            	</c:when>
      					                            	<c:otherwise>
        													<img class="smallImg img-rounded"  id="smallImg${picCount}" src="${pageContext.request.contextPath}/${prodImg}" width="100px">
      					                             	</c:otherwise>
      					                            </c:choose>
      											
      											</div>
      										</c:forEach>
											</div>
      										</section>
						                    <input type="hidden" class="products${proContentCount} productId${proContentCount}"   id="pId${proContentCount}"     		name="productId" value="${pros.productID}" />
						                    <input type="hidden" class="products${proContentCount} productName${proContentCount}" id="pName${proContentCount}"   		name="productName" value="${pros.productName}" />
						                    <input type="hidden" class="products${proContentCount} productInfo${proContentCount}" id="pInfo${proContentCount}"   		name="productInfo" value="" />
<%-- 						                    <input type="hidden" class="products${proContentCount} productInfo${proContentCount}" id="pInfo${proContentCount}"   		name="productInfo" value="${pros.productInfo}" /> --%>
						                    <input type="hidden" class="products${proContentCount} typeId${proContentCount}"      id="tTypeId${proContentCount}" 		name="typeId" value="${pbt.typeID}" />
						                    <input type="hidden" class="products${proContentCount} typeTitle${proContentCount}"   id="tTitle${proContentCount}"  		name="typeTitle" value="${pbt.typeTitle}" />
						                    <input type="hidden" class="products${proContentCount} image1${proContentCount}"      id="tImage1${proContentCount}" 		name="image1" value="${pImg}" />
						                    <input type="hidden" class="products${proContentCount} unitPrice${proContentCount}"   id="uPrice${proContentCount}"  		name="unitPrice" value="${pbt.unitPrice}" />
						                    <input type="hidden" class="products${proContentCount} unitStock${proContentCount}"   id="uStock${proContentCount}"  		name="unitStock" value="${pbt.unitStock}" />
						                    <input type="hidden" class="products${proContentCount} describe${proContentCount}"    id="theDescribe${proContentCount}"    name="describe" value="${pros.productName}(${pbt.typeTitle})" />
						                    <input type="hidden" class="products${proContentCount} discount${proContentCount}"    id="theDiscount${proContentCount}"    name="discount" value="${pbt.discount}" />   					
      									</div>
      								</div>
      								</c:forEach>
      								<div class="container pppInfo" style="width:100%;padding:100px;">
      									${pros.productInfo}
      								</div>
      								
<!--     							</div> -->
    													
<!--         					</div> -->
        					</div>	
        					<div class="modal-footer">
          						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        					</div>
      					</div>
      				</div>
			</div>				
		</c:forEach>
	</fieldset>
</div>

<input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
<input type="hidden" id="proCount" value="${proCount}">
<!-- <div class="container" id="setMap" style="display:none;"></div> -->
<div class="container" id="setMap"  style="display:none;"></div>
<div class="container" id="setMap2" style="display:none;"></div>

<div class="modal fade" id=addToMyCarModal role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="margin:8px;background-color:#E9E9E9;">
        <button type="button" class="close" data-dismiss="modal" 
        	style="position:absolute;margin:0;right:0;top:0;">&times;</button>
        <h5 class="modal-title">Message</h5>
      </div>
      <div class="modal-body"style="width:100%;height:100px;text-align:center;margin:auto;">
        <p>已將您的商品加入購物車。</p>
        	<span class="glyphicon glyphicon-shopping-cart img-circle" aria-hidden="true" 
        		style="width:100%;font-size:xx-large;">
        	</span>
      </div>
      <div class="modal-footer" style="height:60px;">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>



<!-- for bootstrap working -->
<!-- 放到head會導致modal無法使用 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/productList.js">
</script>
</body>
</html>
