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
    <title>콘텐츠 소스 | Quration: 답을 열어 줄 그런 사람</title>

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
                    <li><a href="${ pageContext.request.contextPath }">Home</a></li>
                    <li>List</li>
                    <li class="active">콘텐츠 소스</li>
                </ol>
            </div>
        </div>
        <!-- /Breadcrumb -->

        <div class="row">
            <h4 class="col-md-12">콘텐츠 소스 <small>${ fn:length(lists) }건</small></h4>
        </div>
        
        <div class="row">
            <section class="col-md-10 card-container mdl-grid">
                <c:forEach var="list" items="${ lists }" varStatus="loop">
	                <!-- card -->
	                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
	                    <div class="mdl-card__title mdl-color-text--grey-500">
	                        <h5 class="author mdl-card__title-text">${ list.name }</h5>
	                    </div>
	                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
	                        <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tortor nibh, laoreet vitae euismod quis, tempor et nunc.</p>
	                    </div>
	                    
	                    <!-- card action buttons (bottom) -->
	                    <div class="mdl-card__actions mdl-card--border">
	                        <a href="${ list.url }" class="btn btn-link" title="상세 페이지로 이동" target="_blank">
	                            	더 보기
	                        </a>
	                        <!-- buttons (bottom-right) -->
	                        <div class="pull-right">
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
	                </div>
	                <!-- /card -->
                </c:forEach>
            </section>
        
            <!-- Filter -->
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
            </aside><!-- /Filter -->
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
</body>

</html>