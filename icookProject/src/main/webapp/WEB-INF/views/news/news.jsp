<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>愛料理首頁</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
			function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //for-mobile-apps ${pageContext.request.contextPath}-->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
	rel="stylesheet" />
<!-- js -->

<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<!-- //js -->

<style>
.banner {
	background: url(../image/news3.jpg) no-repeat 0px 0px !important;
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	min-height: 400px !important;
}

.modal {
	text-align: center;
	padding: 0 !important;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/fragment/TopNav.jsp" />

	<!-- banner -->
	<div class="banner">
		<div class="container"></div>
	</div>

	<div class="special-services">
		<div class="container">
			<h3>公告</h3>
			<p class="quia">Announcement</p>
			<br>
			<table id="announcement" class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col" style="width: 60%">標題</th>
						<th scope="col">發佈時間</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${NewsList}" var="News" varStatus="i">
						<tr>
							<th scope="row">${i.index+1}</th>
							<td><a href="#foo${i.index}" data-toggle="modal">${News.title}</a></td>
							<td><fmt:formatDate value="${News.updateTime}"
									pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>

						<div class="modal fade" id="foo${i.index}" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">${News.title}</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">${News.newsContent}</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</tbody>

			</table>


		</div>
	</div>


	<script type="text/javascript">
		// $(function () {

		// 	var Table = $("#announcement").DataTable({
		// 		searching: false,
		//     	columns: [
		//                 { "data": "newsId"  },
		//                 { "data": "title" },
		//                 { "data": "updateTime" }
		//     	],
		//     	serverSide: true,
		//     	filter: false,
		//     	info: false,
		//     	ordering: false,
		//     	retrieve: true,
		//     	ajax: {
		//     		method: "get",
		//     		url: "getAllNews",
		//     		dataType: "json"
		//     	}

		// 	});

		// });

		// $(document).ready(function() {
		//     $('#announcement').DataTable( {
		//         "ajax": {
		//             "url": "getAllNews",
		//             "type": "GET",
		//             "success": function(results) { 
		//                 console.log(results);
		//             },
		//     		"dataType": "json"
		//         },
		//         "columns": [
		//             { "data": "newsId" },
		//             { "data": "title" },
		//             { "data": "updateTime" }
		//         ]
		//     } );
		// } );

		$(document).ready(function() {
			$('#announcement').DataTable();
		});

		
	</script>


</body>
</html>