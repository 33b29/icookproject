<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<head>
<!-- 卡車套版 -->
<!-- <script type="text/javascript" -->
<%-- 	src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script> --%>

<!-- <script src="js/jquery.validate.js" type="text/javascript"></script> -->
<script type="application/x-javascript">
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } 





</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/AdminLTE-3.0.2/dist/css/adminlte.css">
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!-- //卡車套版 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/AdminLTE-3.0.2/plugins/fontawesome-free/css/all.min.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"> -->

<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" -->
<!-- 	rel="stylesheet"> -->
<style>
#reddiv {
	width: 70px;
	height: 70px;
	position: fixed;
	right: 10px;
	bottom: 85px;
	border-radius: 50%;
	background-color: white;
	background-image:
		url("${pageContext.request.contextPath}/images/icook-logo.png");
	background-size: 100%;
	background-repeat: no-repeat;
	z-index: 1;
}

#messageBox {
	width: 20%;
	position: fixed;
	right: 0px;
	bottom: -20px;
	z-index: 2;
	padding-right: 0px;
	padding-bottom: 0px;
}

.messagetemp {
	border-radius: 37px 37px 37px 37px;
	-moz-border-radius: 37px 37px 37px 37px;
	-webkit-border-radius: 37px 37px 37px 37px;
	border: 0px solid #e6e6e6;
	background-color: #e6e6e6;
	margin-top: 0.5px;
	width: 50%;
	height: 50%;
	word-wrap: break-word;
	display: inline-block !important;
	display: inline;
}

#messagetemp {
	width: 85%;
	margin-top: 11px;
	margin-bottom: 11px;
	margin-left: 14px;
	font-family: Microsoft JhengHei;
	font-size: 15px;
}

#text {
	width: 71%;
	padding: 6px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

#sendbutton {
	color: black;
	padding: 8px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #e6e6e6;
}

#sendmessage {
	margin-top: 10px;
}
</style>
</head>

<body>
	<header>
		<div id="dialog_div_reddiv" title="客戶問題"></div>
		<div class="col-md-3" id="messageBox">
			<!-- DIRECT CHAT PRIMARY -->
			<div
				class="card card-prirary cardutline direct-chat direct-chat-primary">
				<div class="card-header">
					<h3 class="card-title">客服人員</h3>

					<div class="card-tools">
						<!-- 							<span data-toggle="tooltip" title="3 New Messages" -->
						<!-- 								class="badge bg-primary">3</span> -->
						<!-- 							<button type="button" class="btn btn-tool" -->
						<!-- 								data-card-widget="collapse"> -->
						<!-- 								<i class="fas fa-minus"></i> -->
						<!-- 							</button> -->
						<!-- 							<button type="button" class="btn btn-tool" data-toggle="tooltip" -->
						<!-- 								title="Contacts" data-widget="chat-pane-toggle"> -->
						<!-- 								<i class="fas fa-comments"></i> -->
						<!-- 							</button> -->
						<button type="button" class="btn2 btn2-tool"
							data-card-widget="remove" onclick='closeMessageBox()'>
							<i class="fas fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<!-- Conversations are loaded here -->
					<div class="direct-chat-messages" id='messageContent'
						style="padding: 11px;">
						<!-- Message. Default to the left -->
						<!-- 							<div class="direct-chat-msg"> -->
						<!-- 								<div class="direct-chat-infos clearfix"> -->
						<!-- 									<span class="direct-chat-name float-left">Alexander -->
						<!-- 										Pierce</span> <span class="direct-chat-timestamp float-right">23 -->
						<!-- 										Jan 2:00 pm</span> -->
						<!-- 								</div> -->
						<!-- /.direct-chat-infos -->
						<!-- 								<img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" -->
						<!-- 									alt="Message User Image"> -->
						<!-- /.direct-chat-img -->
						<!-- 								<div class="direct-chat-text" style='margin: 5px 50px 0 0;'>Is this template really for -->
						<!-- 									free? That's unbelievable!</div> -->
						<!-- /.direct-chat-text -->
						<!-- 							</div> -->

						<!-- /.direct-chat-msg -->

						<!-- Message to the right -->
						<!-- 							<div class="direct-chat-msg right"> -->
						<!-- 								<div class="direct-chat-infos clearfix"> -->
						<!-- 									<span class="direct-chat-name float-right">Sarah Bullock</span> -->
						<!-- 									<span class="direct-chat-timestamp float-left">23 Jan -->
						<!-- 										2:05 pm</span> -->
						<!-- 								</div> -->
						<!-- 								<img class="direct-chat-img" src="../dist/img/user3-128x128.jpg" -->
						<!-- 									alt="Message User Image"> -->
						<!-- 								<div class="direct-chat-text" style="float:right;margin-right:0px;">You better believe it!</div> -->
						<!-- 							</div> -->
						<!-- /.direct-chat-msg -->
					</div>
					<!--/.direct-chat-messages-->

					<!-- Contacts are loaded here -->
					<div class="direct-chat-contacts">
						<ul class="contacts-list">
							<li><a href="#"> <img class="contacts-list-img"
									src="../dist/img/user1-128x128.jpg">

									<div class="contacts-list-info">
										<span class="contacts-list-name"> Count Dracula <small
											class="contacts-list-date float-right">2/28/2015</small>
										</span> <span class="contacts-list-msg">How have you been? I
											was...</span>
									</div> <!-- /.contacts-list-info -->
							</a></li>
							<!-- End Contact Item -->
						</ul>
						<!-- /.contatcts-list -->
					</div>
					<!-- /.direct-chat-pane -->
				</div>
				<!-- /.card-body -->
				<div class="card-footer">
					<div class="input-group" style="margin-bottom: 5px;">
						<input type="text" id="text" name="message" style="width: 81%; margin-top: 2.5px;"
							class="form-control"> <span class="input-group-append">
							<button type="button" class="btn2 btn2-primary"
								onclick="saveMessage(${LoginOK.userId},'${LoginOK.nickname}')">送出</button>
						</span>
					</div>
				</div>
				<!-- /.card-footer-->
			</div>
			<!--/.direct-chat -->
		</div>

		<div class="header">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- 確定一下網頁名稱 -->
					<div class="logo">
						<a class="navbar-brand" href=<c:url value='/' />> <img
							alt="首頁"
							src="${pageContext.request.contextPath}/css/images/Logo.jpg"
							height=50px;>
						</a>
						<!-- 							<h1><a class="navbar-brand" href=<c:url value='/' />>iCook</a></h1> -->
					</div>
				</div>
				<div class="w3l_header_right">
					<c:choose>
						<c:when test="${empty LoginOK}">
							<ul>
								<li><a href=<c:url value='/login/loginView'/>
									style="margin: 10px" onclick="closeWebSocket()"><span
										class="glyphicon glyphicon-user" aria-hidden="true"></span>登入</a></li>
								<li><a href=<c:url value='/SignUp/memberSignUp' />
									style="margin: 10px"><span class="glyphicon glyphicon-user"
										aria-hidden="true"></span>註冊</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<div id='reddiv'
								onclick="sendMessage('${LoginOK.nickname}',${LoginOK.userId})"></div>
							<ul>
								<li style="width:50px; height:50px;margin-top: -10px;margin-bottom: -20px;"><img style="border-radius: 50%;width: 100% !important;height: 100% !important;border-style:none;" src="<c:url value='/getPicMem/${LoginOK.userId}' />" alt=" " class="img-responsive"/></li>
								<li><h4>Hello, ${LoginOK.nickname} !!</h4>
								<li><a href=<c:url value='/login/logout'/>
									style="margin: 10px"><span class="glyphicon glyphicon-user"
										aria-hidden="true"></span>登出</a></li>
								<li><a href=<c:url value='/SignUp/memUpdate'/>
									style="margin: 10px"><span class="glyphicon glyphicon-user"
										aria-hidden="true"></span>會員資料</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<c:choose>
			<c:when test="${!empty LoginOK}">
				<div class="logo_nav">
					<div class="container">
						<nav class="navbar navbar-default">
							<!-- Brand and toggle get grouped for better mobile display -->
							<!-- 					<div class="navbar-header"> -->
							<!-- 					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->
							<!-- 						<span class="sr-only">Toggle navigation</span> -->
							<!-- 						<span class="icon-bar"></span> -->
							<!-- 						<span class="icon-bar"></span> -->
							<!-- 						<span class="icon-bar"></span> -->
							<!-- 					  </button> -->
							<!-- 					  確定一下網頁名稱 -->
							<!-- 						<div class="logo"> -->
							<!-- 							<h1><a class="navbar-brand">i<span>c</span>ook</a></h1> -->
							<!-- 						</div> -->
							<!-- 					</div> -->
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse nav-wil"
								id="bs-example-navbar-collapse-1">
								<nav class="link-effect-2 fixed-top" id="link-effect-2">
									<ul class="nav navbar-nav">
										<li class="active"><a href=<c:url value='/' />><span
												data-hover="Home">首頁</span></a></li>
										<li><a
											href=<c:url value='/recipes/list?userId=${LoginOK.userId}' />><span
												data-hover="Recipe">會員食譜列表</span></a></li>
										<li><a href=<c:url value='/shoppingCart/productList' />><span
												data-hover="Market">市集</span></a></li>
										<li><a href=<c:url value='/MyOrders/Orders?page=1'/>><span
												data-hover="Order">訂單</span></a></li>
										<li><a href=<c:url value='/shoppingCart/shopCart' />><span
												data-hover="Car">購物車<span class="badge" id="cartNo"></span></span></a></li>
										<li><a href=<c:url value='/course/courseHomePage' />><span
												data-hover="Course">課程</span></a></li>
										<li><a href=<c:url value='/helpQuestion' />><span
												data-hover="Help">聯絡我們</span></a></li>
									</ul>
								</nav>
							</div>
							<!-- /.navbar-collapse -->
						</nav>
					</div>
				</div>
			</c:when>
		</c:choose>
		<!-- 	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
		<%-- 	<script type="text/javascript" src="<c:url value='/WEB-INF/views/js/jquery-2.1.4.min.js' />"></script> --%>
	</header>
	<!-- //header -->
</body>
<script>
	$(document).ready(function() {
		$("#cartNo").text("${ShoppingCart.itemNumber}");
		$("#messageBox").hide();
	})
	function getRealPath() {
		var curWwwPath = window.document.location.href;
		var pathName = window.document.location.pathname;
		var projectName = pathName.substring(1, pathName.substr(1).indexOf('/') + 1);
		return projectName;
	}
	
	function closeMessageBox(){
		$("#messageBox").slideUp(500);
	}
	
	var websocket = null;
	function sendMessage(nickname,userId) {
		$("#messageBox").slideDown(500);
		//判断当前浏览器是否支持WebSocket
		if ('WebSocket' in window) {
			var packageName = getRealPath();
			$.ajax({
				type : "GET",
				url : "/" + packageName + "/searchChatMember",
				data:{ userId: userId , nickname : nickname },
				dataType : "text",
				success : function(data) {
					startConnect(userId);
				},
				error : function(error) {
				},
			});
			
		} else {
			alert('目前瀏覽器 不支持 websocket')
		}
		
		function startConnect(userId){
			websocket = new WebSocket("ws://localhost:8080/icookBackstage02035/websocket/"+userId);
			//连接发生错误的回调方法
			websocket.onerror = function() {
				setMessageInnerHTML("WebSocket连接发生错误");
			};

			//连接成功建立的回调方法
			websocket.onopen = function() {
			}

			//接收到消息的回调方法
			websocket.onmessage = function(event) {
			var message = JSON.parse(event.data);
				if(message.type === "客戶") {
					setMessageInnerHTML(message.text, message.name,message.type,message.Date);
				}
				else {
					setMessageInnerHTML(message.text, message.name,message.type,message.Date);
				}
			}

			//连接关闭的回调方法
			websocket.onclose = function() {
			//alert("close");
			}

			//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
			window.onbeforeunload = function() {
				closeWebSocket();
			}
		
		}
	}
	//关闭WebSocket连接
	function closeWebSocket() {
		websocket.close();
	}

	//发送消息
	function send(userId,nickname,message,date) {
		var msg = {
			    text: message,
			    id: userId,
			    name: nickname,
			    type: "客戶",
			    Date: date
			  };
		websocket.send(JSON.stringify(msg));
		$("#text").val("");
	}
	function saveMessage(userId,nickname) {
		var message = document.getElementById('text').value;
		var packageName = getRealPath();
		$.ajax({
			type : "GET",
			url : "/" + packageName + "/WebSocket",
			data:{ Message: message , Id : userId },
			dataType : "text",
			success : function(data) {
				//傳回來儲存日期的資料
				send(userId,nickname,message,data);
			},
			error : function(error) {
			},
		});
	}
	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML, nickname, type, date) {
		// 	        document.getElementById('message').innerHTML += nickname + "<br><div class='messagetemp'><div id='messagetemp'>" + innerHTML + "</div></div><br/><br>";
		if(type === "客服人員") {
			$("#messageContent").append("<div class='direct-chat-msg'><div class='direct-chat-infos clearfix'>" + 
					"<span class='direct-chat-name float-left'>"+ nickname +"</span>" +  
					"<span class='direct-chat-timestamp float-right'>"+ date +"</span></div>" + 
					"<div class='direct-chat-text' style='margin: 5px 50px 0 0; float: left; width: 60%;'>"+ innerHTML +"</div></div>");
			//讓訊息框保持至底
			$('#messageContent').scrollTop( $('#messageContent')[0].scrollHeight );
		}
		else {
			$("#messageContent").append("<div class='direct-chat-msg right'><div class='direct-chat-infos clearfix'>" + 
			"<span class='direct-chat-name float-right'>"+ nickname +"</span>" + 
			"<span class='direct-chat-timestamp float-left'>"+ date +"</span></div>" +
		    "<div class='direct-chat-text' style='float:right; margin-right:0px; width: 60%;'><div style='float:right;'>"+ innerHTML +"</div></div></div>");
			$('#messageContent').scrollTop( $('#messageContent')[0].scrollHeight );
		}
	}
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>