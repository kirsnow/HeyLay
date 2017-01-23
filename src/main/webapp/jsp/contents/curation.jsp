<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드 추천 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카드 추천 | Quration: 답을 열어줄 그런 사람</title>

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
					<div class="row">
						<div class="page-header col-md-8 col-md-offset-2 text-center">
							<h1>OO님을 위한 분야별 추천 카드</h1>
						</div>
					</div>
					<div class="text-center">
						<span class="label label-primary">IT</span>
					</div>
					<!-- span으로 되어 있었 -->

					<div class="row card-container mdl-grid ">
						<c:forEach begin="1" end="3">
							<!-- card -->
							<div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">

								<!-- card top: contents source -->
								<div class="mdl-card__title mdl-color-text--grey-500">
									<span class="label label-default">IT</span> &nbsp; <span
										class="label label-default">Bloter</span>
								</div>

								<!-- card image -->
								<figure class="mdl-card__media" style="margin: 0px">
									<img src="../../img/bg1.jpg" style="width: 100%; height: 200px">
								</figure>

								<!-- card title -->
								<div class="mdl-card__title">
									<h5 class="author mdl-card__title-text">Title</h5>
								</div>

								<!-- card text -->
								<div
									class="content mdl-card__supporting-text mdl-color-text--grey-800">
									<p class="text-justify">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Cras tortor nibh, laoreet vitae
										euismod quis, tempor et nunc. Nulla sollicitudin dolor nec
										tellus condimentum, vel aliquam nulla cursus.</p>
								</div>

								<!-- card menu (top-right) -->
								<div class="mdl-card__menu">
									<div id="report" class="btn-group dropdown pull-right"
										title="신고">
										<a href="#" role="button" class="" title="카드를 보관함에 담기"> <i
											class="fa fa-star fa-lg" aria-hidden="true"></i>
										</a>
									</div>
								</div>

								<!-- card action buttons (bottom) -->
								<div class="mdl-card__actions mdl-card--border">
									<a class="btn btn-link" title="상세 페이지로 이동"> 더 보기 </a>
									<!-- buttons (bottom-right) -->
									<div class="pull-right">
										<div id="share" class="btn-group dropup">
											<a href="#" role="button" class="btn dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false"
												title="외부 서비스로 공유"> <i
												class="fa fa-share-alt fa-lg mdl-color-text--grey-500"
												aria-hidden="true"></i>
											</a>
											<ul class="dropdown-menu dropdown-menu-right" role="menu">
												<li><a href="#" title="카카오톡으로 공유"><i
														class="fa fa-commenting fa-fw" aria-hidden="true"></i>
														KakaoTalk</a></li>
												<li><a href="#" title="페이스북으로 공유"><i
														class="fa fa-facebook fa-fw" aria-hidden="true"></i>
														Facebook</a></li>
												<li><a href="#" title="트위터로 공유"><i
														class="fa fa-twitter fa-fw" aria-hidden="true"></i>
														Twitter</a></li>
												<li><a href="#" title="에버노트로 공유"><i
														class="fa fa-sticky-note fa-fw" aria-hidden="true"></i>
														Evernote</a></li>
											</ul>
										</div>
										<div id="report" class="btn-group dropup" title="신고">
											<a href="#" role="button"
												class="btn dropdown-toggle mdl-color-text--grey-500"
												data-toggle="dropdown" aria-expanded="false" title="신고">
												<i class="fa fa-exclamation-triangle fa-lg"
												aria-hidden="true"></i>
											</a>
											<ul class="dropdown-menu dropdown-menu-right" role="menu">
												<li><a href="#" title="오류 신고"><i
														class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
												<li><a href="#" title="유해물 신고"><i
														class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
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
						<span class="label label-primary">hobby</span>
					</div>
					<div class="row card-container mdl-grid">
						<c:forEach begin="1" end="3">
							<!-- card -->
                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">

                    <!-- card top: contents source -->
                    <div class="mdl-card__title mdl-color-text--grey-500">
                        <span class="label label-default">IT</span> &nbsp;
                        <span class="label label-default">Bloter</span>
                    </div>

                    <!-- card image -->
                    <figure class="mdl-card__media" style="margin:0px">
                        <img src="../../img/bg2.jpg" style="width:100%; height:200px">
                    </figure>

                    <!-- card title -->
                    <div class="mdl-card__title">
                        <h5 class="author mdl-card__title-text">Title</h5>
                    </div>

                    <!-- card text -->
                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
                        <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tortor nibh, laoreet vitae euismod quis, tempor et nunc. Nulla sollicitudin dolor nec tellus condimentum, vel aliquam nulla cursus.</p>
                    </div>

                    <!-- card menu (top-right) -->
                    <div class="mdl-card__menu">
                        <div id="report" class="btn-group dropdown pull-right"
                            title="신고">
                            <a href="#" role="button" class="" title="카드를 보관함에 담기"> 
                               <i class="fa fa-star fa-lg" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>

                    <!-- card action buttons (bottom) -->
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="btn btn-link" title="상세 페이지로 이동">
                            	더 보기
                        </a>
                        <!-- buttons (bottom-right) -->
                        <div class="pull-right">
                            <div id="share" class="btn-group dropup">
                                <a href="#" role="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                                    <i class="fa fa-share-alt fa-lg mdl-color-text--grey-500" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                    <li><a href="#" title="카카오톡으로 공유"><i class="fa fa-commenting fa-fw" aria-hidden="true"></i> KakaoTalk</a></li>
                                    <li><a href="#" title="페이스북으로 공유"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i> Facebook</a></li>
                                    <li><a href="#" title="트위터로 공유"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i> Twitter</a></li>
                                    <li><a href="#" title="에버노트로 공유"><i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> Evernote</a></li>
                                </ul>
                            </div>
                            <div id="report" class="btn-group dropup" title="신고">
                                <a href="#" role="button" class="btn dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="신고">
                                    <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                    <li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
                                    <li><a href="#" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
                                </ul>
                            </div>
                        </div> <!-- /buttons (bottom-right) -->
                    </div> <!-- /card action buttons (bottom) -->
                </div> <!-- /card -->
						</c:forEach>
					</div>

					<div class="text-center">
						<span class="label label-primary">politics</span>
					</div>
					<div class="row card-container mdl-grid">
						<c:forEach begin="1" end="3">
							<!-- card -->
                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">

                    <!-- card top: contents source -->
                    <div class="mdl-card__title mdl-color-text--grey-500">
                        <span class="label label-default">IT</span> &nbsp;
                        <span class="label label-default">Bloter</span>
                    </div>

                    <!-- card image -->
                    <figure class="mdl-card__media" style="margin:0px">
                        <img src="../../img/bg3.jpg" style="width:100%; height:200px">
                    </figure>

                    <!-- card title -->
                    <div class="mdl-card__title">
                        <h5 class="author mdl-card__title-text">Title</h5>
                    </div>

                    <!-- card text -->
                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
                        <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tortor nibh, laoreet vitae euismod quis, tempor et nunc. Nulla sollicitudin dolor nec tellus condimentum, vel aliquam nulla cursus.</p>
                    </div>

                    <!-- card menu (top-right) -->
                    <div class="mdl-card__menu">
                        <div id="report" class="btn-group dropdown pull-right"
                            title="신고">
                            <a href="#" role="button" class="" title="카드를 보관함에 담기"> 
                               <i class="fa fa-star fa-lg" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>

                    <!-- card action buttons (bottom) -->
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="btn btn-link" title="상세 페이지로 이동">
                            	더 보기
                        </a>
                        <!-- buttons (bottom-right) -->
                        <div class="pull-right">
                            <div id="share" class="btn-group dropup">
                                <a href="#" role="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                                    <i class="fa fa-share-alt fa-lg mdl-color-text--grey-500" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                    <li><a href="#" title="카카오톡으로 공유"><i class="fa fa-commenting fa-fw" aria-hidden="true"></i> KakaoTalk</a></li>
                                    <li><a href="#" title="페이스북으로 공유"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i> Facebook</a></li>
                                    <li><a href="#" title="트위터로 공유"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i> Twitter</a></li>
                                    <li><a href="#" title="에버노트로 공유"><i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> Evernote</a></li>
                                </ul>
                            </div>
                            <div id="report" class="btn-group dropup" title="신고">
                                <a href="#" role="button" class="btn dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="신고">
                                    <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                    <li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
                                    <li><a href="#" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
                                </ul>
                            </div>
                        </div> <!-- /buttons (bottom-right) -->
                    </div> <!-- /card action buttons (bottom) -->
                </div> <!-- /card -->
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