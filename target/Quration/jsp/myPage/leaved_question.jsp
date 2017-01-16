<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>탈퇴 재문의 | Quration: 답을 열어줄 그런 사람</title>
	
	<!-- Bootstrap -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
     
    <!-- icon-font -->
   	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
   	
   	<!-- style for icon -->
   	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
   	
	<!-- HTML5 shim and Respond.js for IE8
	 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	
	<header>
		<jsp:include page="/jsp/include/nav_simple.jsp" />
	</header>

	<!-- 탈퇴 재문의  Section -->
	<section id="withdrawQuestion">
	 	<div class="container marginTop60 minHeight">
	 	
	 		<!-- include myPage -->
	 		<jsp:include page="/jsp/include/my_page.jsp" />
	 		<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center marginBottom">
					 <h4>회원 탈퇴 문의</h4>
				</div>
			</div>
			<div class="row">
				<div class="panel panel-default col-md-6 col-md-offset-3  marginBottom">
				  	<div class="panel-body text-center">
					    <div><sub><i class="material-icons">info_outline</i></sub>
							회원님은 현재  1234 개의 콘텐츠를 보유하고 계십니다. 
						</div>
						<div>탈퇴하시겠습니까?</div>
				  	</div>
				</div>
			</div>
			<div class="row">
				<div class="text-center marginTop">
					<div>
						<a href="${pageContext.request.contextPath}/myPage/moveWithdrawReason.do" class="btn btn-primary marginRight" title="탈퇴 사유 입력 페이지 이동 링크" role="button">탈퇴</a>        
						<a href="${pageContext.request.contextPath}" class="btn btn-default" title="홈화면 이동 링크" role="button">홈으로</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer>
</body>
</html>