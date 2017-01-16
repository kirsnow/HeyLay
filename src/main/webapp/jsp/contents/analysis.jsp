<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 회원별 통계 분석 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>| Quration: 답을 열어줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="nav-md">
	<div class="container body marginTop70">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		
		<div class="main_container">
			<!-- nav -->
				<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<!-- page content -->
			<div class="right_col" role="main">

				<div class="text-center" style="margin: 20px;">
					<h4>선호 자료는 좋아요 및 저장을 바탕으로 추출된 유형 및 분야 입니다.</h4>
				</div>
				<div class="container text-center">
					<div class="row">
						<div class="well div col-md-push-2 col-md-4" id="typeDiv">
							<h4>선호 자료 유형</h4>
							<span class="text-primary">논문&nbsp;Research Paper</span>
						</div>
						<div class="well div col-md-push-2 col-md-4" id="areaDiv">
							<h4>선호 자료 분야</h4>
							<span class="text-primary">① IT</span>&nbsp;<span class="text-primary">② 취미</span>&nbsp;<span class="text-primary">③ 정치</span>
						</div>
					</div>
					<div class="row">
						<div class="well div col-md-8 col-md-offset-2" id="mainSearch">
							<h4>주로 저장한 키워드의 분야</h4>
							<span class="text-primary">인공지능(AI)</span>
						</div>
					</div>
					<div class="row">
						<div class="well div col-md-8 col-md-offset-2" id="yearSearch">
							<h4>2017년 OO님의 주 검색어</h4>
							<span class="text-primary">챗봇</span>
						</div>
					</div>
					<div class="row">
						<div class="well div col-md-8 col-md-offset-2" id="graph">
							<h4>2016년</h4>
							<img alt="한 해 검색 결과 꺽은선 그래프"
								src="${ pageContext.request.contextPath }/img/graph.png">
						</div>
					</div>
				</div>
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
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
</body>
</html>