<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Basic Page Needs -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${ searchQuery } 검색 결과 | Quration: 답을 열어 줄 그런 사람</title>
    <!-- 검색 키워드를 title로 동적 지정 -->

    <!-- Bootstrap CSS SET -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

    <!-- MDL Hosted start -->
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />
    
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
    <div class="container">
        <header>
            <jsp:include page="/jsp/include/nav_search.jsp" />
        </header>
        
        <!-- Breadcrumb -->
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb" style="margin-top: 75px">
                    <li><a href="#">Home</a></li>
                    <li class="active">검색 결과</li>
                </ol>
            </div>
        </div>
        <!-- /Breadcrumb -->

		<c:choose>
			<%-- 검색결과가 없을 때 --%>
        	<c:when test="${ (empty searchResult) or (searchResult eq null) }">
				<div class="row">
					<div class="col-md-12">
						<p class="lead">이런, 검색 결과가 없습니다 &#58;&#40;</p>
					</div>
				</div>
				<div class="row marginTop20">
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-4">
								<p class="">다른 단어로 검색해보시겠어요?</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<ul class="">
									<li><a href="${ pageContext.request.contextPath }/search/result.do?q=John" title="John 검색">John</a></li>
									<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Kim" title="Kim 검색">Kim</a></li>
									<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Elasticsearch" title="Elasticsearch 검색">Elasticsearch</a></li>
									<li><a href="${ pageContext.request.contextPath }/search/contents.do?no=143">view sample Contents</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			
			<%-- 검색결과가 존재할 때 --%>
        	<c:otherwise>
        		<div class="row">
					<div class="col-md-12">
						<p class="lead"><c:out value="${ searchResult.query }" /> 검색결과 ${ searchResult.total }건</p>
					</div>
				</div>
				<div class="row">
					<section class="col-md-10 card-container mdl-grid">
						<c:forEach var="card" items="${ searchResult.contents }" varStatus="loop">
							<!-- card -->
			                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
			
			                    <!-- card top: contents source -->
			                    <div id="card-belong" class="mdl-card__title mdl-color-text--grey-500">
			                        <span class="label label-default">
		                            	<c:out value="${ card.category }" />
		                            </span>
		                            <span class="label label-info">
		                            	<c:out value="${ card.dataType }" />
		                            </span>
		                            <a href="${ card.sourceUrl }" class="label label-primary" target="_blank" title="원본 사이트로 이동(새 창)">
		                            	<c:out value="${ card.source }" />
		                            </a>
			                    </div>
			                    <c:if test="${ card.imgUrl ne null }">
				                    <!-- card image -->
				                    <figure class="mdl-card__media" style="margin:0px">
				                        <img src="<c:out value="${ card.imgUrl }" />" style="width:100%; height:200px">
				                    </figure>
								</c:if>
			                    <!-- card title -->
			                    <div class="mdl-card__title">
			                        <h5 class="author mdl-card__title-text">
			                        	<c:out value="${ card.title }" />&nbsp;
			                        </h5>
			                        <div class="pull-right">
				                        <a href="<c:out value="${ card.url }" />" target="_blank" title="원본 페이지로 이동(새 창)">
				                        	<i class="fa fa-external-link" aria-hidden="true"></i>
			                        	</a>
		                        	</div>
			                    </div>
			
			                    <!-- card text -->
			                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800 ">
			                        <p class="text-justify">
			                        	<c:choose>
           									<c:when test="${fn:length(card.summary) > 105}">
			                        			<c:out value="${ fn:substring(card.summary, 0, 105) }" /> ...
           									</c:when>
           									<c:otherwise>
           										<c:out value="${ card.summary }" />
           										<c:forEach var="i" begin="0" end="${(105 - fn:length(card.summary))*1.5}">
           											&nbsp;
           										</c:forEach>
           									</c:otherwise>
         								</c:choose>
		                        	</p>
			                    </div>
			
			                    <!-- card menu (top-right) -->
								<div class="mdl-card__menu">
									<div id="save" class="btn-group dropdown pull-right">
										<c:choose>
											<c:when test="${ (userVO ne null) and (not empty userVO) }">
												<a href="#" role="button" class="saveCardBtn"
												 data-toggle="modal" data-target="#saveCardModal" id="${ card.no }" title="카드 담기">
			                                    	<i class="fa fa-bookmark fa-lg" aria-hidden="true"></i>
			                                	</a>
											</c:when>
											<c:otherwise>
												<a href="${ pageContext.request.contextPath }/login/login.do" class="saveCardBtn" id="${ card.no }" title="카드 담기: 로그인이 필요한 서비스입니다">
			                                    	<i class="fa fa-bookmark fa-lg" aria-hidden="true"></i>
			                                	</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

								<!-- card action buttons (bottom) -->
			                    <div class="mdl-card__actions mdl-card--border">
			                        <a href="${ pageContext.request.contextPath }/search/contents.do?no=${ card.no }&q=${ searchResult.query }" class="btn btn-link" title="상세 페이지로 이동">
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
			                                    <li><a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ card.no }&type=contents" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
			                                    <li><a href="${ pageContext.request.contextPath }/contact/spamContents.do?no=${ card.no }" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
			                                </ul>
			                            </div>
			                        </div> <!-- /buttons (bottom-right) -->
			                    </div> <!-- /card action buttons (bottom) -->
			                </div> <!-- /card -->
						</c:forEach>
					</section>

					<!-- Search result filter -->
					<aside class="col-md-2">
						<div class="well marginTop20">
							<p class="lead">필터</p>
							<ul class="fa-ul">
								<li><i class="fa-li fa fa-check-square-o"
									aria-hidden="true"></i> <a href="#" title="조건 적용">조건</a></li>
								<li><i class="fa-li fa fa-square-o" aria-hidden="true"></i>
									<a href="#" title="조건 적용">조건</a></li>
								<li><i class="fa-li fa fa-square-o" aria-hidden="true"></i>
									<a href="#" title="조건 적용">조건</a></li>
							</ul>
						</div>
					</aside>
					<!-- /Search result filter -->

				</div>
			</c:otherwise>
        </c:choose>
    </div>
    <!-- /container -->

    <!-- footer -->
    <jsp:include page="/jsp/include/footer.jsp" />
    <!-- /footer -->
    
    <!-- Bootstrap JS SET -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    
    <!-- Modal -->
	<jsp:include page="/jsp/modal/card_save.jsp" />
    
    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
    
    <!-- Facebook share API 
    	 https://developers.facebook.com/docs/sharing/reference/share-dialog
    -->
    <!-- 
    <script>
		document.getElementById('share_facebook').onclick = function() {
		  FB.ui({
		    method: 'share',
		    display: 'popup',
		    href: '{ pageContext.request.contextPath }/search/result.do',
		  }, function(response){});
		}
	</script>
	 -->
</body>
</html>