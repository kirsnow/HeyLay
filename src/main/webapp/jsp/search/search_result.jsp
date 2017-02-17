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

    <!-- MDL Hosted start -->
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

    <!-- Bootstrap CSS SET -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
</head>
<body>
    <div class="container">
        <header>
            <jsp:include page="/jsp/include/nav_search.jsp" />
        </header>
        
        <!-- Breadcrumb -->
        <div class="row">
        	<div class="col-xs-12">
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
					<div class="col-xs-12">
						<p class="lead">이런, 검색 결과가 없습니다 &#58;&#40;</p>
					</div>
				</div>
				<jsp:include page="/jsp/component/search_suggestion.jsp" />
			</c:when>
			
			<%-- 검색결과가 존재할 때 --%>
        	<c:otherwise>
        		<div class="row">
					<div class="col-xs-12 lead">
						<c:out value="${ searchResult.query }" /> 검색결과 ${ searchResult.total }건 :P
					</div>
				</div>
				<div class="row">
					<section class="col-xs-12 col-md-9 card-container mdl-grid">
						<jsp:include page="/jsp/component/card.jsp" />
					</section>

					<!-- Search result filter -->
					<aside class="col-xs-12 col-md-3">
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
    <script>
	    $('[data-toggle="tooltip"]').tooltip(); 
	</script>
    
    <!-- Modal -->
	<jsp:include page="/jsp/modal/card_save.jsp" />
    
    <script>
    <!-- google analytics -->
    	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		
		ga('create', 'UA-90558257-1', 'auto');
		ga('send', 'pageview');
		
//     /* Facebook share API 
//     	 https://developers.facebook.com/docs/sharing/reference/share-dialog */
    

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