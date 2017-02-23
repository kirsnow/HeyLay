<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 회원별 커스터마이질 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커스터마이징| Quration: 답을 열어 줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css"
	type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
<!-- google analytics -->
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-90558257-1', 'auto');
	ga('send', 'pageview');
</script>

</head>
<style>
#freemium {
	background-color: #EEEEEE;
}

#premium {
	background-color: #BDBDBD;
}

.underline {
	text-decoration: line-through;
}
</style>
</head>
<body class="nav-md">
	<div class="container body">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		<div class="main_container marginTop60">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<div class="right_col" role="main">
				<!-- page content -->

				<div class="container">

					<div class="row">
						<div class="page-header text-center col-md-6 col-md-offset-3 marginBottom">
							<h4><b>회원별 커스터마이징</b></h4>
						</div>
					</div>
					<div class="row marginTop">
						<div class="col-md-4 col-md-offset-2">
							<h4 class="optionTitle text-center"><b>Quration Plus option</b></h4>
							<div class="panel marginTop20">
								<div class="panel-body paddingleft70 " name="freemium">
									<p>1. 카드 검색</p>
									<p>2. 카드 저장</p>
									<p>3. 카테고리 관리</p>
									<p>4. 기본 통계</p>
									<p>5. 카드 추천 서비스</p>
									<p class="underline">6. 메모 공개 비공개 기능</p>
									<p class="underline">7. 이중 잠금(자체 잠금)</p>
									<p class="underline">8. 고급 통계</p>
									<p class="underline">9. 광고 없음</p>
								</div>
							</div>
							<div class="border2px">	
								<h4 class="text-center"><b>무료</b></h4>
							</div>
						</div>
						<div class="col-md-4">
							<h4 class=" text-center text-primary"><b>Quration premium option</b></h4>
							<div class="panel marginTop20">
								<div class="col-md-push-1 panel-body paddingleft70 " name="premium">
									<p>1. 카드 검색</p>
									<p>2. 카드 저장</p>
									<p>3. 카테고리 관리</p>
									<p>4. 기본 통계</p>
									<p>5. 카드 추천 서비스</p>
									<p>6. 메모 공개 비공개 기능</p>
									<p>7. 이중 잠금(자체 잠금)</p>
									<p>8. 고급 통계</p>
									<p>8. 광고 없음</p>
								</div>
							</div>
							<div class="border2px">	
								<h4 class="text-center text-primary">
									<b>
									<span class="marginRight">₩3,300 Month(월) </span>
									<span>₩30,000 Year(년)</span>
									</b>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-2 col-md-8 marginTop40 marginBottom100 text-center">
						<a href="javascript:doAction()" class="btn btn-primary type" id="${ userVO.type }">결제 페이지 이동</a>
					</div>
				</div>

				<!-- /page content -->
			</div>

			<!-- footer -->
			<jsp:include page="/jsp/include/footer.jsp" />
			<!-- /footer -->
		</div>
	</div>

	<script type="text/javascript">
		function doAction() {
			var type = $('.type').attr("id");
			
			if(type == 'F') {
				location.href = "${ pageContext.request.contextPath }/contents/upgrade.do";
			} else if (type == 'P') {
				alert("이미 프리미엄 회원입니다.");
			} else if (type == 'A') {
				alert("관리자 회원은 프리미엄 타입으로 변경 불가능 합니다.");
			} else {
				alert("정상적인 경로로 로그인하시고 다시 실행해 주시기 바랍니다.");
			}
		}
	</script>
	
	<script src="paypal-button.min.js?merchant=YOUR_MERCHANT_ID"
    		data-button="buynow"
    		data-name="My product"
    		data-amount="1.00"
   		 	async
	></script>
</body>
</html>