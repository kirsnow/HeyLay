<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	오류 신고 관리 페이지
	- 신고 내역 리스트 조회, 삭제
 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>오류 목록 | Quration: 답을 열어줄 그런 사람</title>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_admin.jsp" />
			<!-- /nav -->

			<!-- page content -->
			<div class="right_col" role="main">
				<section>
					<div id="container">
						<div class="row">
							<div class="col-md-12">&nbsp;</div>
						</div>
						<div class="row well">
							<div class="col-md-2">
								<input type="checkbox" id="allSelectToggle" alt="전체 선택" />
								<label>전체 선택</label>
							</div>
							<div class="col-md-2">
								<button type="button" id="btnDelete" class="btn btn-default">삭제</button>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th></th>
<!-- 											<th>오류 이미지</th> -->
											<th class="ber">계정</th>
											<th class="bar">작성일</th>
											<th class="bar">PC 사양</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="bug" items="${ bugList }">
											<tr>
												<td><input type="checkbox" class="no" value="${ bug.no }" alt="체크박스 폼" /></td>
<!-- 												<td><img alt="오류 이미지" -->
<%-- 													src="${ pageContext.request.contextPath }/img/portfolio/04.jpg" --%>
<!-- 													width="100px"></td> -->
												<td>${ bug.email }</td>
												<td>${ bug.regDate }</td>
												<td><a href="${ pageContext.request.contextPath }/jsp/admin/bug_detail.do?no=${ bug.no }"
													title="자세한 내용 더보기"> <%
											 		String os = "";
											 		String userAgent = request.getHeader("user-agent");
											
											 		userAgent = userAgent.toLowerCase();
											
											 		if (userAgent.indexOf("windows nt 10.0") > -1) {
											 			os = "Windows10";
											 		} else if (userAgent.indexOf("windows nt 6.1") > -1) {
											 			os = "Windows7";
											 		} else if (userAgent.indexOf("windows nt 6.2") > -1 || userAgent.indexOf("windows nt 6.3") > -1) {
											 			os = "Windows8";
											 		} else if (userAgent.indexOf("windows nt 6.0") > -1) {
											 			os = "WindowsVista";
											 		} else if (userAgent.indexOf("windows nt 5.1") > -1) {
											 			os = "WindowsXP";
											 		} else if (userAgent.indexOf("windows nt 5.0") > -1) {
											 			os = "Windows2000";
											 		} else if (userAgent.indexOf("windows nt 4.0") > -1) {
											 			os = "WindowsNT";
											 		} else if (userAgent.indexOf("windows 98") > -1) {
											 			os = "Windows98";
											 		} else if (userAgent.indexOf("windows 95") > -1) {
											 			os = "Windows95";
											 		}
											 		//window 외
											 		else if (userAgent.indexOf("iphone") > -1) {
											 			os = "iPhone";
											 		} else if (userAgent.indexOf("ipad") > -1) {
											 			os = "iPad";
											 		} else if (userAgent.indexOf("android") > -1) {
											 			os = "android";
											 		} else if (userAgent.indexOf("mac") > -1) {
											 			os = "mac";
											 		} else if (userAgent.indexOf("linux") > -1) {
											 			os = "Linux";
											 		} else {
											 			os = userAgent;
											 		}
											
											 %> OS: <%= os %>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-4 col-md-push-5"></div> -->
<!-- 							<div class="col-md-5"> -->
<!-- 								<ul class="pagination"> -->
<!-- 									<li class="disabled"><a href="#">&laquo;</a></li> -->
<!-- 									<li class="active"><a href="#">1</a></li> -->
<!-- 									<li><a href="#">2</a></li> -->
<!-- 									<li><a href="#">3</a></li> -->
<!-- 									<li><a href="#">4</a></li> -->
<!-- 									<li><a href="#">5</a></li> -->
<!-- 									<li><a href="#">&raquo;</a></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-3 col-md-offset-3"></div> -->
<!-- 						</div> -->
					</div>
				</section>

			</div>
			<!-- /page content -->

			<!-- footer -->
			<jsp:include page="/jsp/include/footer.jsp" />
			<!-- /footer -->
		</div>
	</div>

<!-- jQuery -->
<script
	src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
<script>
	$('#allSelectToggle').click(function() {
		if($(".no:checked").length < $(".no").length) $(".no").prop('checked', true);
		else $(".no").prop('checked', false);
	});
</script>
</body>
</html>