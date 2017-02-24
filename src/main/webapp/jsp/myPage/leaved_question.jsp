<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 탈퇴 페이지 | Quration: 답을 열어 줄 그런 사람</title>
	
	<!-- 공통css  -->
 	<jsp:include page="/jsp/include/css.jsp" />
    	
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

	<!-- 탈퇴 재문의  Section -->
	<section id="withdrawQuestion" class="body">
	 	<div class="container marginTop60 sectionContent">
	 	
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
					    <sub><i class="fa fa-info fa-2x fa-fw" aria-hidden="true"></i></sub>
							회원님은 현재  <span id="savedContent"></span> 개의 콘텐츠를 보유하고 계십니다. 
						</div>
						<div class="text-center marginBottom">탈퇴하시겠습니까?</div>
				  	</div>
				</div>
			</div>
			<div class="row">
				<div class="text-center marginTop">
					<div>
						<a href="${pageContext.request.contextPath}/myPage/moveWithdrawReason.do" class="btn btn-primary marginRight" title="탈퇴 사유 입력 페이지 이동 링크" role="button">탈퇴</a>        
						<a href="${pageContext.request.contextPath}/" class="btn btn-default" title="홈화면 이동 링크" role="button">홈으로</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Footer -->
    <Footer class="footer">
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
	
	<!-- 공통 js -->
	<jsp:include page="/jsp/include/commonJs.jsp" />
	
	
	<script>
	   /*오늘 저장된 컨텐츠  */
	   $.ajax({
	         url: "${ pageContext.request.contextPath }/myPage/withdrawQuestionCnt.do",
	         type : 'get',
	         contentType : "application/json",
	         success: function(result){
	              $("#savedContent").text(result)
	              					.css("font-size", "20px")
	              					.css("color", "#03A9F4")
	              					.css("font-weight", "bold");
	   }});
	</script>
</body>
</html>