<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 공지사항에서 제목 클릭시 뜨는 페이지   -->
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항 상세 페이지 | Quration: 답을 열어 줄 그런 사람</title>
	
	<!-- Bootstrap -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
     
    <!-- icon-font -->
   	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
   	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

   	<header>
		 <jsp:include page="/jsp/include/nav_search.jsp" />
	</header> 
   
   <!-- NoticeDetail Section -->	
	<section id="noticeDetail ">
		<div class="container marginTop60">
			<div class="page-header text-center col-md-8 col-md-offset-2 marginBottom">
                <h1>공지사항 <small>상세페이지</small></h1>
            </div>
			
		 	<div class="row">   
				<div class="col-md-8 col-md-offset-2">
				    <hr class="border2px marginBottom">	
					<span class="pull-left thFont">[
					<c:choose>
						<c:when test="${ detail.noticeType == 'N' }">공지</c:when>
						<c:otherwise>이벤트</c:otherwise>
					</c:choose>
					] ${ detail.title }</span>
					<span class="pull-right thFont">조회수 ${ detail.viewCnt }</span>
				</div>
			</div>
			<div class="row">   
				<div class="col-md-8 col-md-offset-2">
				    <hr class="borderDot marginTop marginBottom">  
					<div class="pull-right marginBottom">${ detail.regDate }</div>
				</div>
            </div>
            <div class="row"> 
				<div class="col-md-8 col-md-offset-2">
					<div class="marginBottom"> <!-- DB  -->
						     ${ detail.contents }
					</div>
					<hr class="border">
				</div>
            </div>
			<div class="row">
				<div class="text-center col-md-8 col-md-offset-2">
					<a class="btn btn-primary" href="${ pageContext.request.contextPath }/notice/list.do" role="button" title="공지사항 목록으로 되돌아가는 이동 링크">목록보기</a>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
</body>
</html>