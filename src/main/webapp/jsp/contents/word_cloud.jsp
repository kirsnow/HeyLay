<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드분석 - 내 검색어 페이지 입니다. --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인통계-워드클라우드 | Quration: 답을 열어 줄 그런 사람</title>
<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css"
	type="text/css" rel="stylesheet">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="nav-md">
	<div class="container body">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>

		<div class="main_container marginTop70">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<div class="right_col" role="main">
				<!-- page content -->

				<div class="container text-center">
					<h1>내가 가장 많이 검색한 검색어를 더 크게 보여드립니다.</h1>
					<c:choose>
						<c:when test="${ (wordCloud eq null) or (empty wordCloud) }">
							<div class="row">
								<p class="lead">아직 검색한 키워드가 없습니다 &#58;O</p>
							</div>
							<div class="row">
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<ul class="">
										<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Juliet" title="Juliet 검색">Juliet 검색</a></li>
										<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Romeo" title="Romeo 검색">Romeo 검색</a></li>
										<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Tempest" title="Tempest 검색">Tempest 검색</a></li>
									</ul>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<img alt="내가 가장 많이 검색한 결과를 더크게 보여주는 워드클라우드를 보여준다."
									src="${ pageContext.request.contextPath }/img/wordCloud.jpg">
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- /page content -->
			</div>

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