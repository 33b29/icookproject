<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>註冊</title>
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

span.error {
	color: red;
	display: inline-block;
	font-size: 1em;
}
#confirm{
    background: #ff9900;
    color: #FFF;
    font-size: 1em;
    padding: 10px 0;
    width: 100%;
    outline: none;
    border: none;
    
}
#confirm.header{
background:black;
transition: .5s ease-in;
    -webkit-transition: .5s ease-in;
    -moz-transition: .5s ease-in;
    -o-transition: .5s ease-in;
    -ms-transition: .5s ease-in;
    }
    
#div_wait {
 margin-left: 33%;
}
#ui-id-3 {
 margin-left: 38%;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	//一鍵輸入正確資料
	$("#correctmem").click(function(){
		$("#account").val("aaa123@gmail.com");
		$("#pw1").val("aA123456");
		$("#pw2").val("aA123456");
		$("#lastname").val("Ga");
		$("#firstname").val("One");
		$("#nickname").val("臺中彭于晏");
		$("#birthday").val("1995-05-04");
		$("#gender").val("男生");
		$("#phone").val("0977302207");
		$("#address").val("臺中市豐原區豐東路190號");
	});
	//一鍵輸入錯誤資料
	$("#errormem").click(function(){
		$("#account").val("aaa123@gmail.com");
		$("#pw1").val("00000");
		$("#pw2").val("00000");
		$("#lastname").val("");
		$("#firstname").val("");
		$("#nickname").val("");
		$("#birthday").val("");
		$("#gender").val("");
		$("#phone").val("0900000000");
		$("#address").val("");
		
	});
	
	$("#confirm").click(function(){
			
			var account = $("#account").val();
			var password = $("#pw1").val();
			var password2 = $("#pw2").val();
			var last = $("#lastname").val();
			var first = $("#firstname").val();
			var nick = $("#nickname").val();
			var birth = $("#birthday").val();
			var ph = $("#phone").val();
			var add = $("#address").val();
			var a = 0;
			var b = 0;
			var c = 0;
			var d = 0;
			var e = 0;
			var f = 0;
			var g = 0;
			var h = 0;
			
			


			
	 		if((password !="") && (password2 !="")){
	 
	 				if(password == password2){
		 				$("#p1").html("<span style='color:green'>密碼一致</span>");
		 				
		 				if(password.length >7){
		 			
		 				var a = 1;
		 			
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
	 		
	 		
	 		if(last == ""){
	 			$("#last").html("<span style='color:red'>請輸入姓</span>");
	 		}else {
	 			var b = 1;
	 		}
	 		
	 		if(first ==""){
	 			$("#first").html("<span style='color:red'>請輸入名</span>");
	 		}else {
	 			var c = 1;
			}
	 		
	 		
	 		if(nick ==""){
	 			$("#nick").html("<span style='color:red'>請輸入暱稱</span>");
	 		}else {
	 			var d = 1;
			}
	 		
	 		
	 		if(birth ==""){
	 			$("#birth").html("<span style='color:red'>請輸入生日</span>");
	 		}else {
	 			var e = 1;
			}
	 		
		
	 		if(ph ==""){
	 			$("#ph").html("<span style='color:red'>請輸入電話</span>");
	 		}else {
	 			var g = 1;
			}
	 		
	 		if(add ==""){
	 			$("#add").html("<span style='color:red'>請輸入地址</span>");
	 		}else {
	 			var h = 1;
			}
	 		
	 		if(a==1 && b==1 && c==1 && d==1 && e==1 && g==1 && h==1 ){
	 			$("#submit").click();
	 		}
	 		
	 		
	    
	});
 	
});
</script>


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
<link rel="stylesheet"
 href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	<div id="dialog_div_wait" title="等待中"></div>
	<div class="banner1">
		<div class="container"></div>
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

	<!--  -->
	<div class="login">
		<div class="container">
			<h6>註冊</h6>
			


			<form:form method="post" modelAttribute="MemberBean"
				enctype='multipart/form-data'>

				<table>
					<c:if test='${mb.userId == null}'>
						<tr>
							<td>信箱<span style="color: red;">*</span>:
							</td>
							<td><form:input type="email" class="form-control"
									path='account' id='account' /><br> <form:errors
									path="account" cssClass="error" /></td>
						</tr>
					</c:if>
					<c:if test='${mb.userId != null}'>
						<tr>
							<td>信箱<span style="color: red;">*</span>:
							</td>
							<td><form:hidden path='account' /> ${mb.account}<br></td>
						</tr>
					</c:if>
					<tr>
						<td>密碼<span style="color: red;">*</span>:
						</td>
						<td><form:input type="password" path='password'
								class="form-control" name="password" id="pw1" /><span id="p1">
						</span></td>

					</tr>
					<tr>
						<td>確認密碼<span style="color: red;">*</span>:
						</td>
						<td><input type="password" class="form-control"
							name="password2" id="pw2"/><span id="p2"></span></td>
					</tr>
					<tr>
						<td>姓<span style="color: red;">*</span> :
						</td>
						<td><form:input path="lastname" class="form-control"
								name="lastname" id="lastname" /> <form:errors path="lastname"
								cssClass="error" /><span id="last"></span></td>
					</tr>
					<tr>
						<td>名<span style="color: red;">*</span> :
						</td>
						<td><form:input path="firstname" class="form-control"
								name="firstname" id="firstname" /> <form:errors
								path="firstname" cssClass="error" /><span id="first"></span></td>
					</tr>

					<tr>
						<td>暱稱<span style="color: red;">*</span> :
						</td>
						<td><form:input path="nickname" class="form-control"
								name="nickname" id="nickname" /> <form:errors path="nickname"
								cssClass="error" /><span id="nick"></span></td>
					</tr>

					<tr>
						<td>生日<span style="color: red;">*</span>:
						</td>
						<td><form:input type="date" path="birthday"
								class="form-control" name="birthday" id="birthday" /> <form:errors
								path="birthday" cssClass="error" /><span id="birth"></span></td>
					</tr>

					<tr>
						<td>性別:</td>
						<td><form:radiobuttons path="gender" items='${genderMap}' /><br>&nbsp;
							<form:errors path="gender" cssClass="error" /><span id="gen"></span></td>
					</tr>

					<tr>
						<td>連絡電話<span style="color: red;">*</span>:
						</td>
						<td><form:input type="tel" class="form-control" path="phone"
								name="phone" pattern="[0-9]{10}" id="phone" /> <form:errors
								path="phone" cssClass="error" /><span id="ph"></span></td>
					</tr>

					<tr>
						<td>地址<span style="color: red;">*</span>:
						</td>
						<td><form:input path="address" class="form-control"
								name="address" id="address" /> <form:errors path="address"
								cssClass="error" /><span id="add"></span></td>
					</tr>
					<tr>
						<td>照片:
						</td>
						<td><form:input path="userimage" class="form-control" type='file'
								name="userimage" id="userimage" /> </td>
					</tr>

				</table>
				<br>
				<input type="button" id="confirm" value="註冊" />
				<input type="submit" id="submit" value="註冊" style='display: none' onclick='waitDialog()'/>
				<input type="button" id="errormem" value="一鍵輸入錯誤資料" />
				<input type="button" id="correctmem" value="一鍵輸入正確資料" />

			</form:form>

			<div class="agile_back_home">
				<a href="<c:url value='/'/>">back to home</a>
			</div>
		</div>
	</div>
	<!-- // -->

</body>
<script>
function waitDialog() {
	$("#dialog_div_wait").html("<div id='div_wait'><img src='../images/ajaxload.gif'>&nbsp&nbsp<span>寄送中...</span></div>");
	$("#dialog_div_wait").dialog("open");
}
$(function() {
    $("#dialog_div_wait").dialog({
     //固定視窗
     maxHeight: 110,
     maxWidth: 110,
     minHeight: 110,
     minWidth: 110,
     //拖移設定
     draggable: true,
     //dialog建立自動開啟設定
        autoOpen: false,
        //視窗外無法操作設定
        modal : true,
        //open事件發生時, 將dialog樣式右上的x顯示
        open:function(event,ui){$(".ui-dialog-titlebar-close").hide();},
    });
});
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>