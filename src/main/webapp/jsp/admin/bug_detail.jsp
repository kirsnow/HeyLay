<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	버그 신고 디테일 페이지
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
<title>오류 상세 | Quration: 답을 열어 줄 그런 사람</title>
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
					<div class="container">
						<div class="row">
							<div class="col-md-4">
								<button type="button" id="btnReply" onclick=""
									class="btn btn-primary">답변</button>
								<button type="button" id="btnDelete" onclick=""
									class="btn btn-default">삭제</button>
							</div>
							<div class="pull-right">
								<a class="btn btn-default"
									href="${ pageContext.request.contextPath }/jsp/admin/bug_list.do"
									role="button" title="공지사항 목록으로 되돌아가는 이동 링크">목록보기</a>
							</div>
						</div>
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-2">${ bug.email }</div>
										<span class="col-md-2">${ bug.regDate }</span>
										<div class="pull-right">
											<a href="#" target="_blank" title="해당 페이지로 가는 링크">${ bug.url }</a>
										</div>
									</div>
								</div>
								<div class="panel-body">
									<div >사용자가 PC 환경 정보 제공을 동의했습니다.</div>
									<!--DB에서 자료 불러오기 최신 contents -->
									<div>
										제공된 사양:
										<!--DB에서 자료 불러오기 등록일 contents -->

										<%
												String os = "";
												String userAgent = request.getHeader("user-agent");
										    	
												userAgent = userAgent.toLowerCase();
												
												if (userAgent.indexOf("windows nt 10.0") > -1) {
													os = "Windows10";
												} else if (userAgent.indexOf("windows nt 6.1") > -1) {
													os = "Windows7";
												}
												else if (userAgent.indexOf("windows nt 6.2") > -1 || userAgent.indexOf("windows nt 6.3") > -1 ) {
													os = "Windows8";
												}
												else if (userAgent.indexOf("windows nt 6.0") > -1) {
													os = "WindowsVista";
												}
												else if (userAgent.indexOf("windows nt 5.1") > -1) {
													os = "WindowsXP";
												}
												else if (userAgent.indexOf("windows nt 5.0") > -1) {
													os = "Windows2000";
												}
												else if (userAgent.indexOf("windows nt 4.0") > -1) {
													os = "WindowsNT";
												}
												else if (userAgent.indexOf("windows 98") > -1) {
													os = "Windows98";
												}
												else if (userAgent.indexOf("windows 95") > -1) {
													os = "Windows95";
												}
												//window 외
												else if (userAgent.indexOf("iphone") > -1) {
													os = "iPhone";
												}
												else if (userAgent.indexOf("ipad") > -1) {
													os = "iPad";
												}
												else if (userAgent.indexOf("android") > -1) {
													os = "android";
												}
										        else if (userAgent.indexOf("mac") > -1) {
													os = "mac";
												}
												else if (userAgent.indexOf("linux") > -1) {
													os = "Linux";
												}
												else {
													os = userAgent;
												}
										
												%>
										OS:
										<%=os%>
										<hr>
										<div class="marginLeft">
											<div>${ bug.userInput }</div>
<!-- 											<div> -->
<%-- 												<img alt="오류 이미지" src="${ pageContext.request.contextPath }/img/portfolio/04.jpg" width="500px"> --%>
<!-- 											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
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
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script	src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
</body>
</html>