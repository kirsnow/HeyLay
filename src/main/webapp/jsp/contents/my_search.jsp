<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드분석 - 내 검색어 페이지 입니다. --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 검색어| Quration: 답을 열어 줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">


<!-- MDL Hosted start -->
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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

				<div class="container text-center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h4 class="marginBottom"><b>내 검색어 히스토리</b></h4>
							<p class="marginBottom">
								<small><i class="fa fa-times" aria-hidden="true"></i>버튼을 클릭하여 해당 검색어를 삭제할 수 있습니다.</small>
							</p>
						</div>
					</div>
					<div class="row">
						<c:set var="keyword.regDate" value="<%=new java.util.Date()%>" />
						<c:choose>
							<c:when test="${ (keywordList eq null) or (empty keywordList) }">
								<div class="row">
									<p class=" marginTop80">아직 검색한 키워드가 없습니다 &#58;0</p>
									<jsp:include page="/jsp/component/search_suggestion.jsp" />
								</div>
							</c:when>
							<c:otherwise>
							<c:forEach var="keyword" items="${ keywordList }" varStatus="loop">
							<div class="col-md-offset-4 col-md-7">
								<div class="col-md-1 text-right text-muted lead" >
									<strong><c:out value="${loop.count}"/>.</strong>&nbsp;&nbsp;
								</div>
								<div class="col-md-2 text-muted text-left lead" >
									<strong><a href="#" title="해당 단어 검색 결과로 가는 URL" class="text-muted">${ keyword.keyword }</a></strong>
								</div>
								<div class="col-md-3 text-muted text-right">
									<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${keyword.regDate}" />
								</div>
								<div class="col-md-1 text-left">
									<a href="javascript:update('${keyword.no}')"><i class="fa fa-times" aria-hidden="true"></i></a>
								</div>
							</div>
							</c:forEach>
								<div class="row">
									<div class="col-md-6 col-md-offset-3 marginBottom100">
										
									</div>
								</div>
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
		function update(no) {
 			// alert(no);
			location.href = "${ pageContext.request.contextPath }/contents/update_status.do?no=" + no;
		}
	</script>
	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	<!-- google analytics -->
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		
		ga('create', 'UA-90558257-1', 'auto');
		ga('send', 'pageview');
	</script>
	
	<!-- Bootstrap -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- icon-font -->
	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
</body>
</html>