<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 회원별 커스터마이질 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커스터마이징| Quration: 답을 열어줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css"
	type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
#freemium {
	background-color: #EEEEEE;
}

#premium {
	background-color: #BDBDBD;
}
.underline {
	text-decoration: line-through;
}
</style>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<div class="right_col" role="main">
				<!-- page content -->

				<div class="container">

					<div class="row"> 
						<div class="page-header text-center col-md-6 col-md-offset-3 marginBottom">
							<h1>회원별 커스터마이징</h1>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-2">
							<h4 class="optionTitle page-header text-center">Quration Plus option</h4>
							<div class="well well-lg paddingleft70" id="freemium">
								<p>1. 카드 검색</p>
								<p>2. 카드 저장</p>
								<p>3. 카테고리 관리</p>
								<p>4. 기본 통계</p>
								<p>5. 카드 추천 서비스</p>
								<p class="underline">6. 메모 공개 비공개 기능</p>
								<p class="underline">7. 이중 잠금(자체 잠금)</p>
								<p class="underline">8. 고급 통계</p>
								<p class="underline">9. 광고 없음</p>
								<hr/>
									<h4>무료</h4>
								<hr/>
							</div>
						</div>
						<div class="col-md-4">
							<h4 class="optionTitle page-header text-center">Quration premium option</h4>
							<div class="col-md-push-1 well well-lg paddingleft70" id="premium">
								<p>1. 카드 검색</p>
								<p>2. 카드 저장</p>
								<p>3. 카테고리 관리</p>
								<p>4. 기본 통계</p>
								<p>5. 카드 추천 서비스</p>
								<p>6. 메모 공개 비공개 기능</p>
								<p>7. 이중 잠금(자체 잠금)</p>
								<p>8. 고급 통계</p>
								<p>8. 광고 없음</p>
								<hr/>
									<h4>₩30,000 /년</h4>
								<hr/>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-2 col-md-8 well well-lg">
						<div class="row text-center">
							<h4>나만의 커스터 마이징을 시작해보세요~</h4>
						</div>
						<div class="row text-center">
							<a href="${ pageContext.request.contextPath }/contents/upgrade.do" class="btn btn-primary">커스터 마이징 시작하기</a>
						</div>
					</div>
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