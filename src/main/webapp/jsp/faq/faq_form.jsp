<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>자주 묻는 질문 및 답변 | Quration: 답을 열어 줄 그런 사람</title>
	
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
	
	<!-- 자주 묻는 질문 및 답변 Section-->
	<section id="faqForm">
        <div class="container marginTop60 minHeight">
	        <div class="row">
	            <div class="page-header text-center col-md-8 col-md-offset-2">
					<h1>자주 묻는 질문 및 답변</h1>
				</div>
			</div>	
			<c:forEach var="faqList" items="${ faqLists }" varStatus="loop">
			<div class="row">
				 <div class="col-md-8 col-md-offset-2">
					<ul>
						<li>
							<p>
							   <a href="${ pageContext.request.contextPath }/faq/faqDetail.do?prepage=list&no=${ faqList.no }">
							       	유해 게시물 신고하려 어떻게 해야 하나요?
							   </a>
							   <span class="pull-right spanPadding">${ faqList.regDate }</span>
							</p>
						</li>
						
						<!-- <li><p><a href="#">삭제된 카드를 복귀하고 싶어요.</a></p></li>
						<li><p><a href="#">사이트 접속이 원할하지 않아요.</a></p></li>
						<li><p><a href="#">카드 작성 및 등록이 정상적으로 이루어지지 않아요.</a></p></li>
					    <li><p><a href="#">내가 작성하지 않은 게시물이 있어요.</a></p></li> -->
					</ul>
				</div>
			</div>
			</c:forEach>
	        <div class="row">
	           <div class="col-md-6 col-md-offset-3 marginBottom marginTop">
	           	   <hr class="border2px">
	               <div class="input-group">
	                 <input type="text" name="account" class="form-control" placeholder="궁금한 점, 관리자에게 직접 물어보고 싶다면?" alt="관리자에게 질문하는 방법 소개 폼"/>
	                 <span class="input-group-btn">
	                   <a href="${ pageContext.request.contextPath }/contactUs/qna.do" class="btn btn-default" 
	                   	  title="질문페이지 이동 링크" role="button">질문하기</a>
	                 </span>
	               </div><!-- /input-group -->
	           </div><!-- /.col-lg-6 -->
	       </div><!-- /.row -->
       </div>		
	</section>
	
	<!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
</body>
</html>