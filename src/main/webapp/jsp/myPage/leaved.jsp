<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 탈퇴 | Quration: 답을 열어 줄 그런 사람</title>
	
	<!-- Bootstrap -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
  
    <!-- icon-font -->
   	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
   	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- google analytics -->
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		
		ga('create', 'UA-90558257-1', 'auto');
		ga('send', 'pageview');
	</script>
</head>
<body>	
	<header>
		<jsp:include page="/jsp/include/nav_simple.jsp" />
	</header>

	<!-- 탈퇴 사유 입력  Section -->
	<section id="newPassword">
	 	<div class="container marginTop60 minHeight">
	 		<!-- include myPage -->
	 		<jsp:include page="/jsp/include/my_page.jsp" />
	 		<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center marginBottom">
					 <h4>회원 탈퇴 사유 입력</h4>
				</div>
			</div>
			<form name="withdrawForm" action="${pageContext.request.contextPath }/myPage/withdraw.do" 
			      method="post" onsubmit="" autocomplete="off">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 ">
						<input type="text" name="memberNo" class="form-control" value="${ userVO.no }" />
						<select name="reasonSelect" class="form-control marginBottom" >
							<option value="탈퇴 사유를 선택해주세요" disabled selected>탈퇴 사유를 선택해주세요</option>
							<option value="더이상 사용하지 않을 것 같습니다">더이상 사용하지 않을 것 같다</option>
							<option value="일부 유료서비스 부분이 싫다">일부 유료서비스 부분이 싫다   </option>
							<option value="사용하다가 불편함을 느꼈다">사용하다가 불편함을 느꼈다 </option>
							<option value="생각만큼 편리하지 않다">생각만큼 편리하지 않다 </option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginBottom marginTop">
						<textarea name="reasonInput" class="form-control" rows="4" 
						          placeholder="탈퇴 사유 직접 입력" title="탈퇴 사유 입력 폼"></textarea>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginBottom marginTop">
						<div class="text-center">
							<button type="submit" class="btn btn-primary marginRight">탈퇴</button>
							<a href="${pageContext.request.contextPath}" class="btn btn-default" title="홈화면 이동 링크" role="button">홈으로</a>
						</div>
					</div>	
				</div>
			</form>
		</div>
	</section>
	
	<!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer>
</body>
</html>