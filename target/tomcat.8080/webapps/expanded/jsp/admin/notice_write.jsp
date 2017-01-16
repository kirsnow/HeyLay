<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	공지 사항 작성 페이지
	- 파일 첨부 가능
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
<title>공지 사항 등록 폼 | Quration: 답을 열어 줄 그런 사람</title>
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
	 		 			<h1>공지 사항 등록</h1>
	           		</div>
					<div id="container">
						<form id="writeForm" action="${ pageContext.request.contextPath }/jsp/admin/notice_write.do" method="post" 
								class="form-horizontal" enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
									<select class="form-control" name="noticeType">
										<option value="N">공지 사항</option>
										<option value="E">이벤트</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-2 marginBottom marginTop">
									<input type="text" name="title" placeholder="제목을 입력하세요" alt="공지 사항 제목 작성 폼" class="form-control" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
									<textarea rows="15" name="contents" class="form-control" title="공지사항 내용 입력 폼"> </textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-2 marginBottom marginTop">
									<input type="file" name="attachfile" alt="공지 사항 파일 첨부" class="form-control"/>
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
	// 선택한 form에 서밋 이벤트가 발생하면 실행한다
	// if (사용자 입력 값이 정규식 검사에 의해 참이 아니면) {포함한 코드를 실행}
	// if 조건절 안의 '정규식.test(검사할값)' 형식은 true 또는 false를 반환한다
	// if 조건절 안의 검사 결과가 '!= true' 참이 아니면 {...} 실행
	// 사용자 입력 값이 참이 아니면 alert을 띄운다
	// 사용자 입력 값이 참이 아니면 오류가 발생한 input으로 포커스를 보낸다
	// 사용자 입력 값이 참이 아니면 form 서밋을 중단한다
	$('#writeForm').submit( function() {
		if ($('#title').val() == "") {
			alert('제목을 입력하세요.');
			$('#title').focus();
			return false;
		} else if ($('textarea#contents').val() == '') {
			alert('내용을 입력하세요.');
			$('textarea#contents').focus();
			return false;
		}
	});
});
</script>
</body>
</html>