<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드 서랍 속 폴더별 정렬 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>폴더별 카드 서랍 | Quration: 답을 열어 줄 그런 사람</title>

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
				<div class="container">
					<div class="row">
						<div class="pull-right">
							<div class="form-group col-md-5">
								<select class="form-control" id="select">
									<option value="">정렬할 기준 선택</option>
									<option value="최근 수정 순">최근 수정 순</option>
									<option value="폴더 등록 순">폴더 등록 순</option>
									<option value="폴더 제목 순">폴더 제목 순</option>
								</select>
							</div>
							<a href="#" class="btn btn-primary">정렬</a>
							<a title="폴더를 추가할 수 있는 기능" class="btn btn-default">폴더추가</a>
							<a href="javascript:doMember('${userVO.no}')"
								class="btn btn-default" title="편집모드로 전환되는 URL">편집모드</a>
						</div>
					</div>
					<c:choose>
						<c:when test="${ (drawerHeaders eq null) or (empty drawerHeaders) }">
							<div class="row">
								<p class="lead">아직 저장한 카드가 없습니다 &#58;O</p>
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
							<c:forEach var="drawerHeader" items="${ drawerHeaders }" varStatus="loop">
								<div class="row marginTop30">
									<span class="text-primary lead">${ drawerHeader.directory } <small>저장한 카드 ${ drawerHeader.cnt } 건</small></span>
								</div>
								<div class="row card-container mdl-grid">
									<jsp:include page="/jsp/component/card.jsp" />
						        </div>
					        </c:forEach>
				        </c:otherwise>
					</c:choose>
				</div>
				<!-- /page content -->
			</div>
			<!-- footer -->
			<jsp:include page="/jsp/include/footer.jsp" />
			<!-- /footer -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	<script type="text/javascript">
		function doMember(memberNo) {
			location.href = "${ pageContext.request.contextPath }/contents/folder_edit.do?memberNo=" + memberNo;
		}
	</script>
</body>
</html>