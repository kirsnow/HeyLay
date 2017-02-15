<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드 추천 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카드 추천 | Quration: 답을 열어 줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css"
	type="text/css" rel="stylesheet">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

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

				<div class="container" style="padding-left: 10%; padding-right: 10%;">
					<div class="text-center">
						<span class="label label-primary">키워드 맞춤 추천</span>
					</div>
					<!-- span으로 되어 있었 -->

					<div class="row card-container mdl-grid ">
						<c:if test="${ empty customKeywordList }">
							<div class="col-md-6 col-md-offset-3 text-center">카드를 담거나, 검색하지 않았습니다. Quration을 이용해 볼까요!</div>
						</c:if>
						<c:forEach var="card" items="${ customKeywordList }" varStatus="loop">
							<!-- card -->
							<div class="card-ancestor mdl-card mdl-cell mdl-cell--4-col mdl-cell--12-col-phone mdl-shadow--3dp">
							
								<!-- card top: contents source -->
								<div class="card-labels mdl-card__title mdl-color-text--grey-500">
									<span class="label label-default">
										<c:out value="${ card.categoryName }" />
									</span>
									<span class="label label-info"> 
										<c:out value="${ card.dataType }" />
									</span>
									<a href="${ card.sourceUrl }" class="label label-primary" target="_blank" title="원본 사이트로 이동(새 창)"> 
										<c:out value="${ card.sourceName }" />
									</a>
									&nbsp;
									<a href="${ card.url }" target="_blank" title="원본 페이지로 이동(새 창)"> 
										<i class="fa fa-external-link" aria-hidden="true"></i>
									</a>
								</div>
								
								<!-- card image -->
								<c:if test="${ card.imgUrl ne null }">
									<figure class="mdl-card__media" style="margin: 0px">
										<img src="<c:out value="${ card.imgUrl }" />"
											style="width: 100%; height: 200px">
									</figure>
								</c:if>
								
								<!-- card title -->
								<div class="mdl-card__title">
									<h5 class="card-title mdl-card__title-text drop-text-2" 
									title="${ card.title }" data-toggle="tooltip" data-placement="bottom">
									<a href="${ pageContext.request.contextPath }/search/contents.do?no=${ card.contentsNo }&q=${ searchResult.query }" 
										title="상세 페이지 더 보기">${ card.title }</a></h5>
								</div>
							
								<!-- card text -->
								<div class="content mdl-card__supporting-text mdl-color-text--grey-800" style="width: 100%">
									<p class="card-content drop-text-5">
										${ card.summary }
									</p>
								</div>
							
								<!-- card menu (top-right) -->
								<div class="mdl-card__menu">
									<div id="save" class="btn-group dropdown pull-right">
										<c:choose>
											<c:when test="${ (userVO ne null) and (not empty userVO) }">
												<a href="#" role="button" id="${ card.contentsNo }" class="saveCardBtn nofocus"
													data-toggle="modal" data-target="#saveCardModal"
													title="카드 담기"> 
													<i class="fa fa-bookmark-o fa-2x text-muted" aria-hidden="true"></i>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${ pageContext.request.contextPath }/login/login.do"
													id="${ card.contentsNo }" class="saveCardBtn"
													title="카드 담기: 로그인이 필요한 서비스입니다">
													<i class="fa fa-bookmark-o fa-2x text-muted" aria-hidden="true"></i>
												</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							
								<!-- card action buttons (bottom) -->
								<div class="mdl-card__actions mdl-card--border">
									<a href="${ card.url }" target="_blank" title="원본 페이지로 이동(새 창)" class="btn btn-link">
										원본 페이지&nbsp;<i class="fa fa-external-link" aria-hidden="true"></i>
									</a>
									
									<!-- buttons (bottom-right) -->
									<div class="pull-right">
										<div id="share" class="btn-group dropup">
											<a href="#" role="button" class="btn dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
												<i class="fa fa-share-alt fa-lg mdl-color-text--grey-500" aria-hidden="true"></i>
											</a>
											<ul class="dropdown-menu dropdown-menu-right" role="menu">
												<li>
													<a href="#" title="카카오톡으로 공유">
														<i class="fa fa-commenting fa-fw" aria-hidden="true"></i> 
														KakaoTalk
													</a>
												</li>
												<li>
													<a href="#" title="페이스북으로 공유">
														<i class="fa fa-facebook fa-fw" aria-hidden="true"></i> 
														Facebook
													</a>
												</li>
												<li>
													<a href="#" title="트위터로 공유">
														<i class="fa fa-twitter fa-fw" aria-hidden="true"></i> 
														Twitter
													</a>
												</li>
												<li>
													<a href="#" title="에버노트로 공유">
														<i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> 
														Evernote
													</a>
												</li>
											</ul>
										</div>
										<div id="report" class="btn-group dropup" title="신고">
											<a href="#" role="button"
												class="btn dropdown-toggle mdl-color-text--grey-500"
												data-toggle="dropdown" aria-expanded="false" title="신고">
												<i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
											</a>
											<ul class="dropdown-menu dropdown-menu-right" role="menu">
												<li>
													<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ card.contentsNo }&type=contents"
														title="오류 신고">
														<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
														오류 신고
													</a>
												</li>
												<li>
													<a href="${ pageContext.request.contextPath }/contact/spamContents.do?no=${ card.contentsNo }"
														title="유해물 신고">
														<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
														유해물 신고
													</a>
												</li>
											</ul>
										</div>
									</div>
									<!-- /buttons (bottom-right) -->
									
								</div>
								<!-- /card action buttons (bottom) -->
							</div>
							<!-- /card -->
						</c:forEach>
					</div>

					<div class="text-center">
						<span class="label label-primary" title="내가 가장 많이 담은 사이트의 인기 콘텐츠 추천">사이트 맞춤 추천</span>
					</div>
					<div class="row card-container mdl-grid ">
						<c:if test="${ empty customSourceList }">
							<div class="col-md-6 col-md-offset-3 text-center">카드를 담지 않았습니다. 카드를 담아 볼까요!</div>
						</c:if>
						<c:forEach var="card" items="${ customSourceList }" varStatus="loop">
							<!-- card -->
							<div class="card-ancestor mdl-card mdl-cell mdl-cell--4-col mdl-cell--12-col-phone mdl-shadow--3dp">
							
								<!-- card top: contents source -->
								<div class="card-labels mdl-card__title mdl-color-text--grey-500">
									<span class="label label-default">
										<c:out value="${ card.categoryName }" />
									</span>
									<span class="label label-info"> 
										<c:out value="${ card.dataType }" />
									</span>
									<a href="${ card.sourceUrl }" class="label label-primary" target="_blank" title="원본 사이트로 이동(새 창)"> 
										<c:out value="${ card.sourceName }" />
									</a>
									&nbsp;
									<a href="${ card.url }" target="_blank" title="원본 페이지로 이동(새 창)"> 
										<i class="fa fa-external-link" aria-hidden="true"></i>
									</a>
								</div>
								
								<!-- card image -->
								<c:if test="${ card.imgUrl ne null }">
									<figure class="mdl-card__media" style="margin: 0px">
										<img src="<c:out value="${ card.imgUrl }" />"
											style="width: 100%; height: 200px">
									</figure>
								</c:if>
								
								<!-- card title -->
								<div class="mdl-card__title">
									<h5 class="card-title mdl-card__title-text drop-text-2" 
									title="${ card.title }" data-toggle="tooltip" data-placement="bottom">
									<a href="${ pageContext.request.contextPath }/search/contents.do?no=${ card.contentsNo }&q=${ searchResult.query }" 
										title="상세 페이지 더 보기">${ card.title }</a></h5>
								</div>
							
								<!-- card text -->
								<div class="content mdl-card__supporting-text mdl-color-text--grey-800" style="width: 100%">
									<p class="card-content drop-text-5">
										${ card.summary }
									</p>
								</div>
							
								<!-- card menu (top-right) -->
								<div class="mdl-card__menu">
									<div id="save" class="btn-group dropdown pull-right">
										<c:choose>
											<c:when test="${ (userVO ne null) and (not empty userVO) }">
												<a href="#" role="button" id="${ card.contentsNo }" class="saveCardBtn nofocus"
													data-toggle="modal" data-target="#saveCardModal"
													title="카드 담기"> 
													<i class="fa fa-bookmark-o fa-2x text-muted" aria-hidden="true"></i>
												</a>
											</c:when>
											<c:otherwise>
												<a href="${ pageContext.request.contextPath }/login/login.do"
													id="${ card.contentsNo }" class="saveCardBtn"
													title="카드 담기: 로그인이 필요한 서비스입니다">
													<i class="fa fa-bookmark-o fa-2x text-muted" aria-hidden="true"></i>
												</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							
								<!-- card action buttons (bottom) -->
								<div class="mdl-card__actions mdl-card--border">
									<a href="${ card.url }" target="_blank" title="원본 페이지로 이동(새 창)" class="btn btn-link">
										원본 페이지&nbsp;<i class="fa fa-external-link" aria-hidden="true"></i>
									</a>
									
									<!-- buttons (bottom-right) -->
									<div class="pull-right">
										<div id="share" class="btn-group dropup">
											<a href="#" role="button" class="btn dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
												<i class="fa fa-share-alt fa-lg mdl-color-text--grey-500" aria-hidden="true"></i>
											</a>
											<ul class="dropdown-menu dropdown-menu-right" role="menu">
												<li>
													<a href="#" title="카카오톡으로 공유">
														<i class="fa fa-commenting fa-fw" aria-hidden="true"></i> 
														KakaoTalk
													</a>
												</li>
												<li>
													<a href="#" title="페이스북으로 공유">
														<i class="fa fa-facebook fa-fw" aria-hidden="true"></i> 
														Facebook
													</a>
												</li>
												<li>
													<a href="#" title="트위터로 공유">
														<i class="fa fa-twitter fa-fw" aria-hidden="true"></i> 
														Twitter
													</a>
												</li>
												<li>
													<a href="#" title="에버노트로 공유">
														<i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> 
														Evernote
													</a>
												</li>
											</ul>
										</div>
										<div id="report" class="btn-group dropup" title="신고">
											<a href="#" role="button"
												class="btn dropdown-toggle mdl-color-text--grey-500"
												data-toggle="dropdown" aria-expanded="false" title="신고">
												<i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
											</a>
											<ul class="dropdown-menu dropdown-menu-right" role="menu">
												<li>
													<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ card.contentsNo }&type=contents"
														title="오류 신고">
														<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
														오류 신고
													</a>
												</li>
												<li>
													<a href="${ pageContext.request.contextPath }/contact/spamContents.do?no=${ card.contentsNo }"
														title="유해물 신고">
														<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
														유해물 신고
													</a>
												</li>
											</ul>
										</div>
									</div>
									<!-- /buttons (bottom-right) -->
									
								</div>
								<!-- /card action buttons (bottom) -->
							</div>
							<!-- /card -->
						</c:forEach>
					</div>

					<div class="text-center">
						<span class="label label-primary">인기 콘텐츠 추천</span>
					</div>
					<div class="row card-container mdl-grid ">
						<c:forEach var="card" items="${ popularList }" varStatus="loop">
						<!-- card -->
						<div class="card-ancestor mdl-card mdl-cell mdl-cell--4-col mdl-cell--12-col-phone mdl-shadow--3dp">
						
							<!-- card top: contents source -->
							<div class="card-labels mdl-card__title mdl-color-text--grey-500">
								<span class="label label-default">
									<c:out value="${ card.categoryName }" />
								</span>
								<span class="label label-info"> 
									<c:out value="${ card.dataType }" />
								</span>
								<a href="${ card.sourceUrl }" class="label label-primary" target="_blank" title="원본 사이트로 이동(새 창)"> 
									<c:out value="${ card.sourceName }" />
								</a>
								&nbsp;
								<a href="${ card.url }" target="_blank" title="원본 페이지로 이동(새 창)"> 
									<i class="fa fa-external-link" aria-hidden="true"></i>
								</a>
							</div>
							
							<!-- card image -->
							<c:if test="${ card.imgUrl ne null }">
								<figure class="mdl-card__media" style="margin: 0px">
									<img src="<c:out value="${ card.imgUrl }" />"
										style="width: 100%; height: 200px">
								</figure>
							</c:if>
							
							<!-- card title -->
							<div class="mdl-card__title">
								<h5 class="card-title mdl-card__title-text drop-text-2" 
								title="${ card.title }" data-toggle="tooltip" data-placement="bottom">
								<a href="${ pageContext.request.contextPath }/search/contents.do?no=${ card.contentsNo }&q=${ searchResult.query }" 
									title="상세 페이지 더 보기">${ card.title }</a></h5>
							</div>
						
							<!-- card text -->
							<div class="content mdl-card__supporting-text mdl-color-text--grey-800" style="width: 100%">
								<p class="card-content drop-text-5">
									${ card.summary }
								</p>
							</div>
						
							<!-- card menu (top-right) -->
							<div class="mdl-card__menu">
								<div id="save" class="btn-group dropdown pull-right">
									<c:choose>
										<c:when test="${ (userVO ne null) and (not empty userVO) }">
											<a href="#" role="button" id="${ card.contentsNo }" class="saveCardBtn nofocus"
												data-toggle="modal" data-target="#saveCardModal"
												title="카드 담기"> 
												<i class="fa fa-bookmark-o fa-2x text-muted" aria-hidden="true"></i>
											</a>
										</c:when>
										<c:otherwise>
											<a href="${ pageContext.request.contextPath }/login/login.do"
												id="${ card.contentsNo }" class="saveCardBtn"
												title="카드 담기: 로그인이 필요한 서비스입니다">
												<i class="fa fa-bookmark-o fa-2x text-muted" aria-hidden="true"></i>
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						
							<!-- card action buttons (bottom) -->
							<div class="mdl-card__actions mdl-card--border">
								<a href="${ card.url }" target="_blank" title="원본 페이지로 이동(새 창)" class="btn btn-link">
									원본 페이지&nbsp;<i class="fa fa-external-link" aria-hidden="true"></i>
								</a>
								
								<!-- buttons (bottom-right) -->
								<div class="pull-right">
									<div id="share" class="btn-group dropup">
										<a href="#" role="button" class="btn dropdown-toggle"
											data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
											<i class="fa fa-share-alt fa-lg mdl-color-text--grey-500" aria-hidden="true"></i>
										</a>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">
											<li>
												<a href="#" title="카카오톡으로 공유">
													<i class="fa fa-commenting fa-fw" aria-hidden="true"></i> 
													KakaoTalk
												</a>
											</li>
											<li>
												<a href="#" title="페이스북으로 공유">
													<i class="fa fa-facebook fa-fw" aria-hidden="true"></i> 
													Facebook
												</a>
											</li>
											<li>
												<a href="#" title="트위터로 공유">
													<i class="fa fa-twitter fa-fw" aria-hidden="true"></i> 
													Twitter
												</a>
											</li>
											<li>
												<a href="#" title="에버노트로 공유">
													<i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> 
													Evernote
												</a>
											</li>
										</ul>
									</div>
									<div id="report" class="btn-group dropup" title="신고">
										<a href="#" role="button"
											class="btn dropdown-toggle mdl-color-text--grey-500"
											data-toggle="dropdown" aria-expanded="false" title="신고">
											<i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
										</a>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">
											<li>
												<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ card.contentsNo }&type=contents"
													title="오류 신고">
													<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
													오류 신고
												</a>
											</li>
											<li>
												<a href="${ pageContext.request.contextPath }/contact/spamContents.do?no=${ card.contentsNo }"
													title="유해물 신고">
													<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
													유해물 신고
												</a>
											</li>
										</ul>
									</div>
								</div>
								<!-- /buttons (bottom-right) -->
								
							</div>
							<!-- /card action buttons (bottom) -->
						</div>
						<!-- /card -->
					</c:forEach>
					</div>
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
</body>
</html>