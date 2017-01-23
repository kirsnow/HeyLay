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
	<title>Q&amp;A 질문게시판 | Quration: 답을 열어줄 그런 사람</title>
	
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

	<!-- Q&A section -->
	<section id="qna">
	 	<div class="container marginTop60 minHeight">		
	 		<!-- include conctactUs -->
	 		<jsp:include page="/jsp/include/contact_us.jsp" />
			
			<form name="qnaForm" action="${ pageContext.request.contextPath }/contact/qna.do" 
				  method="post" onsubmit="" autocomplete="off">
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<input type="text" name="email" placeholder="계정(이메일)" 
						       class="form-control"  alt="계정(이메일)입력 폼">
						<hr>
					</div>				
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginBottom">
						
						<input type="text" name="title" placeholder="제목" class="form-control"  alt="제목 입력 폼"> 
						<textarea name="userInput" class="form-control marginTop" rows="6" 
						          placeholder="문의하기" title="질문 입력 폼"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center marginTop">
						<button type="submit" class="btn btn-primary marginRight">질문 등록</button>
						<a href="${ pageContext.request.contextPath }/" class="btn btn-default" title="홈화면 이동 링크" role="button">홈으로</a>
					</div>	
				</div>
			</form>
		</div>
	</section>
	
	<!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer>
	
	<!-- JS -->
	<c:if test="${ msg ne null }">
		<script>
			$(document).ready(function() { alert("${ msg }"); });
		</script>
	</c:if>
</body>
</html>