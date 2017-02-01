<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 관리자 통계 - 유저 검색어 페이지 입니다. --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>유저 검색어| Quration: 답을 열어 줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

<!-- HTM
L5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- google analytics -->
<body class="nav-md">
	<div class="container body">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		
		<div class="main_container marginTop70">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_admin.jsp" />
			<!-- /nav -->

			<div class="right_col" role="main">
				<!-- page content -->

				<div class="container text-center">
					<div class="row marginBottom">
						<h4 class="col-md-6 col-md-offset-3">유저 검색어 Top 50</h4>
					</div>
					<div class="row">
						<c:choose>
							<c:when test="${ (allKeywordList eq null) or (empty allKeywordList) }">
								<div class="row">
									<p class="lead">아직 검색한 키워드가 없습니다 &#58;O</p>
								</div>
							</c:when>
							<c:otherwise>
								<dl>
								<c:forEach var="keyword" items="${ allKeywordList }" varStatus="loop">
									<dt class="col-md-6 col-md-offset-4 text-left"><c:out value="${loop.count}"/>.&nbsp;&nbsp;${ keyword.keyword }</dt>
									<dd class="col-md-1 col-md-pull-3">${ keyword.cnt }번&nbsp;&nbsp;검색됨</dd>
									<hr class="col-md-6 col-md-offset-3 "/>
								</c:forEach>
								</dl>
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

	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	<!-- for searchList js -->
	<!-- <script>
			
		$.ajax({
			url : '${ pageContext.request.contextPath }/admin/statics/AllkeywordList.do',
		    type: 'get',
		    contentType: "application/json", 
		    data : { "AllkeywordList" : '${ staticsVO.columnName}' },
		    success :  function (json) { //json
		   		
		    console.log("json : " , json);
		    console.log("AllkeywordList : " , json.staticsList); 
		    
			 var dataSet =  [];	 
		    
		    for(var i = 0; i < json.staticsList.length; i++) {
		    	dataSet.push(json.staticsList[i].columnName);
		    	}
		    }
		});
		    

</script> -->
</body>
</html>