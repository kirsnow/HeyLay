<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>계정 전달 페이지 | Quration: 답을 열어 줄 그런 사람</title>

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
		<jsp:include page="/jsp/include/nav_search.jsp" />
	</header> 
	
	<!-- Login section  -->
	<section id="login">
		 <div class="container marginTop60 minHeight">
			<div class="row">
				<div class="page-header text-center col-md-6 col-md-offset-3">
		             <h1>계정 (E-mail) 찾기</h1>
		             <small>고객님의 정보와 일치하는 계정 정보 입니다.</small>
		        </div>
			</div>
			<form name="lform" 
				  action="${pageContext.request.contextPath }/login/login.do" 
				  method="post" > 
				  
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginBottom">
						<input type="email" name="email" class="form-control" value="고객님의 계정은 '${userAccount.email}' 입니다." alt="계정(이메일)전달 폼" readonly="readonly" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center marginTop">
						<a href="${pageContext.request.contextPath }/login/login.do" 
						   class="btn btn-primary marginRight" title="로그인 페이지 이동 링크" role="button">로그인</a>
						<a href="${pageContext.request.contextPath }/membership/findPw.do" 
						   class="btn btn-default" title="비밀번호찾기 이동 링크" role="button">비밀번호 찾기</a>
					</div>
				</div>
			</form> 
		</div>
	</section>
	
	<!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
	
<script>
	if("${ msg }") {
		if('${ userVO }') 
			location.href = "${ pageContext.request.contextPath}";
		else {
			alert('${ msg }');
			location.href = "${ pageContext.request.contextPath}/membership/findAccount.do";
		}
	}
</script>
</body>
</html>