<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>마이페이지 | Quration: 답을 열어줄 그런 사람</title>
	
	<jsp:include page="/jsp/include/css.jsp" />
   	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!-- 마이페이지 TOP -->
		<div class="row">
	 		<div class="page-header text-center col-md-6 col-md-offset-3">
				<h1>마이페이지</h1>
				<h4> 
					<a href="${ pageContext.request.contextPath }/myPage/mypage.do" title="회원 정보 수정 게시판 이동 링크">회원 정보 수정</a> | 
					<a href="${ pageContext.request.contextPath }/myPage/passwordChange.do" title="비밀번호 변경 게시판 이동 링크">비밀번호 변경</a> |  
					<a href="${ pageContext.request.contextPath }/myPage/withdrawQuestion.do" title="회원 탈퇴 게시판 이동 링크">회원 탈퇴</a> 
				</h4>
			</div>
		</div>
	
</body>
</html>