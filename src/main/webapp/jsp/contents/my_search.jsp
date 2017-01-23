<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드분석 - 내 검색어 페이지 입니다. --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 검색어| Quration: 답을 열어줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

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
<body class="nav-md">
	<div class="container body">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		
		<div class="main_container marginTop70">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<div class="right_col" role="main">
				<!-- page content -->

				<div class="container text-center">
					<div class="row">
						<h6>내가 검색한 검색어가 최근 순으로 100개만 보여집니다. 클릭하면 검색 페이지로 갑니다.</h6>
					</div>
					<div class="row">
						<c:choose>
							<c:when test="${ (keywordList eq null) or (empty keywordList) }">
								<div class="row">
									<p class="lead">아직 검색한 키워드가 없습니다 &#58;O</p>
								</div>
								<div class="row">
									<div class="col-md-4"></div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<ul class="">
											<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Juliet" title="Juliet 검색">Juliet 검색</a></li>
											<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Romeo" title="Romeo 검색">Romeo 검색</a></li>
											<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Tempest" title="Tempest 검색">Tempest 검색</a></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="keyword" items="${ keywordList }" varStatus="loop">
									<div>
										<p>
											<c:out value="${loop.count}" />
											.&nbsp;&nbsp; <a href="#" title="해당 단어 검색 결과로 가는 URL">${ keyword.keyword }</a>
											 &nbsp;&nbsp;${ keyword.regDate }&nbsp;&nbsp;
											<a href="javascript:update('${keyword.no}', '${userVO.no}')"><i class="fa fa-window-close" aria-hidden="true"></i></a>
										</p>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
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
		function update(no, memberNo) {
// 			alert(memberNo);
			location.href = "${ pageContext.request.contextPath }/contents/update_status.do?no=" + no + "&memberNo=" + memberNo;
		}
	</script>
	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
</body>
</html>