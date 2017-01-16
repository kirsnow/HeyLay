<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	광고 관리 페이지 (plan b)
	- 광고 조회, 추가, 수정
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
<title>광고 관리 | Quration: 답을 열어 줄 그런 사람</title>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<header>
				<jsp:include page="/jsp/include/nav_admin.jsp" />
			</header> 

			<!-- page content -->
			<div class="right_col" role="main">
				<section>
					<div class="container">
						<div class="row">
							<div class="col-md-1"></div>
							<c:forEach begin="1" end="3">
								<div class="col-md-3 border">
									<div class="jumbotron"></div>
								</div>
							</c:forEach>
							<div class="col-md-1">
								<div class="jumbotron"></div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-1 col-offset-1"></div>
							<c:forEach begin="1" end="3">
								<div class="col-md-3">
										<textarea rows="13" cols="100" placeholder="광고 태그를 입력하세요"></textarea>
										<button class="pull-right">x</button>
<!-- 										<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
								</div>
							</c:forEach>
						</div>
						<div class="row"> <!-- 얘는 왜쓴거? -->
							<div class="col-md-12">&nbsp;</div>
						</div>
						<div class="row">
							<div class="col-md-2 col-md-offset-5"><button type="submit" class="btn btn-default">적용</button></div>
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