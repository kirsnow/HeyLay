<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>오류 신고 | Quration: 답을 열어줄 그런 사람</title>
	
	 <!-- Bootstrap -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
     
    <!-- icon-font -->
   	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
   	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   	
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
   	
  	 <!-- 오류 신고 Section -->
	 <section id="report">
	 	<div class="container marginTop60 minHeight">
	 		<div class="page-header text-center col-md-6 col-md-offset-3 marginBottom">
 		 		<h1>신고합니다 <small>오류 신고</small></h1>
           	</div>
           
		<form name="reportForm" action="${ pageContext.request.contextPath }/contact/bug.do" method="post" 
			      onsubmit="" autocomplete="off" id="membershipForm" enctype="multipart/form-data">		
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3 marginTop">
				<input type="text" name="email" class="form-control" placeholder="계정 (이메일)" alt="계정(이메일)입력 폼"/>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3 marginTop">
				<p>정확한 장애(오류) 해결을 위해 고객님의 PC사양 정보가 필요하며,
				수집된 PC사양 정보는 문제 해결 이외의 다른 용도로 사용하지 않습니다.
				PC사양조사 수동설치 시에는 웹페이지를 닫고 다시 실행하신 후에 문의를 입력해 주세요.<p>
	        	<div class="well">
					<dl class="dl-horizontal">
						<dt>Browser</dt>
						<dd>${ userAgent.browser } ${ userAgent.browserVersion }</dd>
						<dt>OS</dt>
						<dd>${ userAgent.operatingSystem }</dd>
					</dl>
					<input type="hidden" name="browser" value="${ userAgent.browser } ${ userAgent.browserVersion }" readonly="readonly"/>
					<input type="hidden" name="os" value="${ userAgent.operatingSystem }" readonly="readonly"/>
					<div class="input-group pull-right">
		                <label for="pcInfoAgree">PC 사양 제공에 동의합니다.</label>
		                <input type="checkbox" name="pcInfoAgree" id="pcInfoAgree" class="" alt="PC사양 제공 동의 체크박스(필수)"/> 
					</div>
					<div class="row"></div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<input type="text" name="url" class="form-control" placeholder="오류 발생  URL 입력" alt="오류  URL 입력 폼"/>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<textarea id="userInput" name="userInput" class="form-control marginTop" rows="4" maxlength="1000"
				          placeholder="오류 화면 캡처, 오류 발생 일시, PC 정보 제공과 함께 오류 현상을 기재해 주세요."></textarea>
				<p><small><span id="text_length">1000</span>자 입력 가능</small></p>
				<script type="text/javascript">
					
					$("#userInput").on('keydown',function(event) {
						  var input = $('#userInput'), display = $('#text_length'), count = 0, limit = 1000;

						  count = input.val().length
						  remaining = limit - count
						  update(remaining);

						  input.keyup(function(e) {
						    count = $(this).val().length;
						    remaining = limit - count;

						    update(remaining);
						  });

						  function update(count) {
						    var txt = count
						    display.html(txt);
						  }

						});
				</script>
			</div>
		</div>	
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-default">
				  	<div class="panel-body">
						<input type="file" name="attachfile" alt="오류 사항에 관한 파일을 첨부하는 버튼" id="attachfile" aria-describedby="attachment"/>
						<small id="attachment" class="help-block">5MB 이하 파일을 첨부하실 수 있습니다.</small>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center marginBottom30">
				<button type="submit" class="btn btn-primary marginRight">작성완료</button>
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