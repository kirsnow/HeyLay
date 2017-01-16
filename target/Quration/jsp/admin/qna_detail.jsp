<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
  	질문 디테일 페이지
	- 회원이 보낸 질문 상세 페이지
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
								<button type="button" id="btnReply" onclick="" class="btn btn-primary">답변</button>
								<a href="${ pageContext.request.contextPath }/jsp/admin/qna_delete.do?no=${ question.no }" class="btn btn-default"
									role="button" title="선택한 질문 삭제">삭제</a>
							</div>
							<div class="pull-right">
								<a class="btn btn-default"
									href="${ pageContext.request.contextPath }/jsp/admin/qna_list.do"
									role="button" title="목록으로 되돌아가는 이동 링크">목록</a>
							</div>
						</div>
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-12">${ question.title }</div>
									</div>
									<div class="row">
										<hr>
										<div class="col-md-3">${ question.email }</div>
										<div class="pull-right">${ question.regDate }</div>
									</div>
								</div>
								<div class="panel-body">${ question.userInput }</div>
							</div>
						</div>
						<c:if test="${ not empty answer }">
							<div class="row">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="row">
											<div class="pull-right">${ answer.regDate }</div>
										</div>
										<div class="row">
											<div class="col-md-12">${ answer.answer }</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
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
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
</body>
</html>