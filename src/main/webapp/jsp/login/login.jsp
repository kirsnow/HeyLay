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
	<title>로그인 | Quration: 답을 열어 줄 그런 사람</title>

 	<jsp:include page="/jsp/include/css.jsp" />
    	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/nav_search.jsp" />
	</header> 
	
	<!-- Login section  -->
	<section class="body">
		 <div class="container marginTop60 sectionContent">
			<div class="row">
				<div class="page-header text-center col-md-6 col-md-offset-3">
		             <h1>로그인</h1>
		        </div>
			</div>
			<form name="lform" action="${pageContext.request.contextPath }/login/login.do" method="post" > 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				  
				<div class="row">
				  	<div class="col-md-6 col-md-offset-3 marginBottom marginTop">
					  	<input type="text" name="email" class="form-control" placeholder="계정 E-mail" alt="계정 입력 폼" autofocus="autofocus">
					</div>
				</div>
				<div class="row">
				  	<div class="col-md-6 col-md-offset-3 marginBottom marginTop">
						<input type="password" name="password" class="form-control" placeholder="비밀번호" alt="비밀번호 입력 폼">		
					</div>
				</div>
				<div class="row">	
					<div class="col-md-6 col-md-offset-3 text-center marginTop">
						<button type="submit" class="btn btn-primary marginRight">로그인</button> 
						<a href="${ pageContext.request.contextPath }/" class="btn btn-default" title="홈화면 이동 링크" role="button">홈으로</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center marginTop">
						<a href="${pageContext.request.contextPath }/membership/findAccount.do" class="marginLeft">아이디 찾기</a>/
						<a href="${pageContext.request.contextPath }/membership/findPw.do">비밀번호 찾기</a>
					</div>
				</div>
			</form> 
		</div>
	</section>
	
	<!-- Footer -->
    <Footer class="footer">
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
	
	<jsp:include page="/jsp/include/commonJs.jsp" />
	
 	<!-- google analytics -->
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		
		ga('create', 'UA-90558257-1', 'auto');
		ga('send', 'pageview');
	</script>
	
	<script>
		if("${ msg }") {
			if('${ userVO }') 
				location.href = "${ pageContext.request.contextPath}";
			else {
				alert('${ msg }');
				location.href = "${ pageContext.request.contextPath}/login/login.do";
			}
		}
	</script>
</body>
</html>