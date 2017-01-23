<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>유해 게시물 신고 | Quration: 답을 열어 줄 그런 사람</title>
	

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
   	
  	<!-- 유해 게시물 신고 신고 Section -->
	<section id="spam">
	 	<div class="container marginTop60">
	 		<div class="page-header text-center col-md-6 col-md-offset-3 marginBottom">
 		 		<h1>신고합니다 <small>유해 게시물 신고</small></h1>
           	</div>
            <form name="spamForm" action="${ pageContext.request.contextPath }/contact/spamContents.do" method="post" 
			      onsubmit="" autocomplete="off" id="membershipForm">		
		
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginTop">
						<input type="text" name="email" class="form-control" placeholder="계정 (이메일)" alt="계정(이메일)입력 폼"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginTop">
						<input type="text" name="contentsNo" class="form-control" placeholder="유해 게시물 번호" alt="유해 게시물 번호"/>
					</div>
				</div>
				<div class="row">
                  <div class="col-md-6 col-md-offset-3 marginTop">
                     <select name="selected" class="form-control" >
                        <option value="신고 내용 선택" disabled selected> 신고 내용 선택 </option>
                        <option value="개인정보 노출">개인정보 노출 </option>
                        <option value="내 창작물에 대한 저작권 위반">내 창작물에 대한 저작권 위반  </option>
                        <option value="비방/비하, 명예훼손, 사생활침해">비방/비하, 명예훼손, 사생활침해 </option>
                        <option value="부적절한 홍보(불법물, 프리서버 홍보 등)">부적절한 홍보(불법물, 프리서버 홍보 등) </option>
                        <option value="음란/청소년에게 부적합한 내용">음란/청소년에게 부적합한 내용 </option>
                        <option value="악성코드">악성코드 </option>
                     </select>
                  </div> 
               </div>
				
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginBottom">
						<textarea name="userInput" class=" col-md-6 form-control marginTop" rows="10" 
						          placeholder="유해 게시물 신고 내용"></textarea>
					</div>
				</div>	
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center marginTop marginBottom100">
						<button type="submit" class="btn btn-primary marginRight" onclick="">작성완료</button>
						<a href="${pageContext.request.contextPath}" class="btn btn-default" title="홈화면 이동 링크" role="button">홈으로</a>			
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