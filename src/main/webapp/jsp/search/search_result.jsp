<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        
        <div class="row">
            <div class="col-md-12">
                <p class="lead">${ searchQuery } 검색 결과 ${ fn:length(searchResults) }건</p>
            </div>
        </div>
        <div class="row">
            <section class="col-md-10 card-container mdl-grid">
				<c:forEach var="searchResult" items="${ searchResults }" varStatus="loop">
	                <!-- card -->
	                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
	
	                    <!-- card top: contents source -->
	                    <div class="mdl-card__title mdl-color-text--grey-500">
	                        <span class="label label-default">${ searchResult.source }</span>
	                    </div>
						<%--
	                    <!-- card image -->
	                    <figure class="mdl-card__media" style="margin:0px">
	                        <img src="../../img/bg1.jpg" style="width:100%; height:200px">
	                    </figure>
						--%>
	                    <!-- card title -->
	                    <div class="mdl-card__title">
	                        <h5 class="author mdl-card__title-text">${ searchResult.title }</h5>
	                    </div>
	
	                    <!-- card text -->
	                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
	                        <p class="text-justify">${ searchResult.content }</p>
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
	                                    <li>
	                                    	<a href="#" id="share_facebook" title="페이스북에 공유하기">
	                                    		<i class="fa fa-facebook fa-fw" aria-hidden="true"></i> Facebook
	                                    	</a>
	                                    </li>
	                                    <li><a href="#" title="트위터로 공유"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i> Twitter</a></li>
	                                    <li><a href="#" title="에버노트로 공유"><i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> Evernote</a></li>
	                                </ul>
	                            </div>
	                            <div id="report" class="btn-group dropup" title="신고">
	                                <a href="#" role="button" class="btn dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="신고">
	                                    <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
	                                </a>
	                                <ul class="dropdown-menu dropdown-menu-right" role="menu">
	                                    <li><a href="${ pageContext.request.contextPath }/contact/bug.do" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
	                                    <li><a href="${ pageContext.request.contextPath }/contact/spamContents.do" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
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
                        <li>
                            <i class="fa-li fa fa-check-square-o" aria-hidden="true"></i>
                            <a href="#" title="조건 적용">조건</a>
                        </li>
                        <li>
                            <i class="fa-li fa fa-square-o" aria-hidden="true"></i>
                            <a href="#" title="조건 적용">조건</a>
                        </li>
                        <li>
                            <i class="fa-li fa fa-square-o" aria-hidden="true"></i>
                            <a href="#" title="조건 적용">조건</a>
                        </li>
                    </ul>
                </div>
            </aside><!-- /Search result filter -->
            
        </div>
    </div>
    <!-- /container -->

    <!-- footer -->
    <jsp:include page="/jsp/include/footer.jsp" />
    <!-- /footer -->
    
    
    
    <!-- Bootstrap JS SET -->
    <script src="${ pageContext.request.contextPath }/js/jquery.1.11.1.js"></script>
    <script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    
    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
    
    <!-- Facebook share API 
    	 https://developers.facebook.com/docs/sharing/reference/share-dialog
    -->
    <script>
		document.getElementById('share_facebook').onclick = function() {
		  FB.ui({
		    method: 'share',
		    display: 'popup',
		    href: '{ pageContext.request.contextPath }/search/result.do',
		  }, function(response){});
		}
	</script>
</body>
</html>