<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	스팸 신고 내역 디테일 페이지
	- 스팸 신고 내역 자세히 보기, 답변, 삭제, 목록으로 가기
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
<title>스팸 상세 | Quration: 답을 열어 줄 그런 사람</title>
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
								<button type="button" id="btnReply" onclick="" class="btn btn-md-default">답변</button>
								<button type="button" id="btnDelete" onclick="" class="btn btn-md-default">삭제</button>
							</div>
							<div class="pull-right">
								<a href="${ pageContext.request.contextPath }/jsp/admin/spam_list.jsp" title="목록으로 돌아가는 링크">목록</a>
							</div>
						</div>
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-3">${ spam.email }</div>
										<div class="col-md-2">${ spam.regDate }</div>
										<div class="pull-right">
											<a href="#" target="_blank" title="해당 페이지로 가는 링크">http://www.quration.com/jsp/content/lala.jsp</a>
										</div>
									</div>
									<div class="row">
										<hr>
										<div class="col-md-3">${ spam.reported }</div>
										<div class="col-md-3">${ spam.selected }</div>
									</div>
								</div>
								<div class="panel-body">
									${ spam.userInput }
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