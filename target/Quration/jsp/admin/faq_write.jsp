
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	자주 묻는 질문 등록 페이지
 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>자주 묻는 질문 등록 폼 | Quration: 답을 열어 줄 그런 사람</title>
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
					<div class="page-header text-center col-md-8 col-md-offset-2 marginBottom30">
	 		 			<h1>자주 묻는 질문 등록</h1>
	           		</div>
					<div id="container">
						<form id="writeForm" action="${ pageContext.request.contextPath }/jsp/admin/faq_write.do" method="post" class="form-horizontal">
							<div class="row">
								<div class="col-md-8 col-md-offset-2 marginBottom">
									<input type="text" name="title" id="title" placeholder="제목을 입력하세요" class="form-control" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-2 marginBottom">
									<textarea rows="15" cols="200" id="content" class="form-control"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-2 text-center marginTop">
									<button type="submit" class="btn btn-primary marginRight">등록</button>
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
<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<!-- Custom Theme Scripts -->
<script	src="${ pageContext.request.contextPath }/js/custom.min.js"></script>

<script type="text/javascript">
jQuery( function($) { // HTML 문서를 모두 읽으면 포함한 코드를 실행
	$('#writeForm').submit( function() {
		if ($('#title').val() == "") {
			alert('제목을 입력하세요.');
			$('#title').focus();
			return false;
		} else if ($('textarea#content').val() == '') {
			alert('내용을 입력하세요.');
			$('textarea#content').focus();
			return false;
		}
	});
});
</script>
</body>
</html>