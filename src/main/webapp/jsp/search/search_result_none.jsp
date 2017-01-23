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
    <title>검색 결과 없음 | Quration: 답을 열어 줄 그런 사람</title>
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
        
        <div class="row">
            <div class="col-md-12">
                <p class="lead">${ searchResult.searchQuery } 검색 결과</p>
            </div>
        </div>
        <div class="row marginTop20">
        	<div class="col-md-10">
				<p class="lead">이런, 검색 결과가 없습니다 &#58;&#40;</p>
				<div class="row">
					<div class="col-md-4">
						<p class="">다른 단어로 검색해보시겠어요?</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<ul class="">
							<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Juliet" title="Juliet 검색">Juliet</a></li>
							<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Romeo" title="Romeo 검색">Romeo</a></li>
							<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Tempest" title="Tempest 검색">Tempest</a></li>
						</ul>
					</div>
				</div>
            </div>
            
            <!-- Search result filter -->
            <aside class="col-md-2">
               <div class="well">
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
</body>
</html>