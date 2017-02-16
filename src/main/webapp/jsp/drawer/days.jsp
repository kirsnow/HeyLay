<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드 서랍 속 날짜순 정렬 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>날짜순 카드 서랍 | Quration: 답을 열어 줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />
<link href="${ pageContext.request.contextPath }/css/simple-sidebar.css" type="text/css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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
<body>
	<div id="container">

	<header>
		<jsp:include page="/jsp/include/nav_search.jsp" />
        <div class="row" style="margin-top: 60px"></div>
	</header>

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <jsp:include page="/jsp/include/nav_personal.jsp" />
        </div>
        <!-- /#sidebar-wrapper -->
        
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <section class="container-fluid-?">
                <c:choose>
					<c:when test="${ (cardsByDays eq null) or (empty cardsByDays) }">
						<div class="row">
							<p class="lead">아직 저장한 카드가 없습니다 &#58;O</p>
						</div>
						<div class="row">
							<div class="col-lg-12"></div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<ul class="">
									<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Juliet"
										title="Juliet 검색">Juliet 검색</a></li>
									<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Romeo"
										title="Romeo 검색">Romeo 검색</a></li>
									<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Tempest"
										title="Tempest 검색">Tempest 검색</a></li>
								</ul>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
						</div>
						<div class="row">
							<c:forEach var="drawer" items="${ cardsByDays }" varStatus="loop">
								<h4 class="col-lg-12 text-muted">
									${ drawer.header } 
									<small>${ fn:length(drawer.cards) }건</small>
								</h4>
								<c:set var="cards" value="${ drawer.cards }" scope="request" />
								<section class="col-lg-12 card-container mdl-grid">
									<jsp:include page="/jsp/component/card.jsp"/>
								</section>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
            </section>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->


	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	
</body>
</html>