<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	자주 묻는 질문 수정 페이지
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
<title>자주 묻는 질문 수정 폼 | Quration: 답을 열어 줄 그런 사람</title>
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
						<form id="writeForm" action="#" method="post"
							class="form-horizontal">
							<div class="row">
								<div class="col-md-2 col-md-offset-2">
									<select class="form-control">
										<option value="N">공지 사항</option>
										<option value="E">이벤트</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
									<input type="text" name="title" placeholder="제목을 입력하세요"
										class="form-control" value="검색어가 무엇인가요?" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
									<textarea rows="15" cols="200" class="form-control">
검색어는 검색의 활용도를 높여 주고,
어쩌고 저쩌고,
쏼랄라
&gt;.&lt;
										</textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-5">
									<button type="submit" class="btn btn-default">수정</button>
								</div>
							</div>
						</form>
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
	<script
		src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
</body>
</html>