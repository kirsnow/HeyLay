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
	
	<!-- 공통css  -->
 	<jsp:include page="/jsp/include/css.jsp" />
    	
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
<body>

   	<header>
		 <jsp:include page="/jsp/include/nav_search.jsp" />
	</header> 
   
   <div class="body">
	   <!-- NoticeDetail Section -->	
		<section id="noticeDetail sectionContent">
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
						<c:if test="${ userVO.type eq 'A' }">
		                	<a href="${ pageContext.request.contextPath }/jsp/admin/notice_modify.do?no=${ detail.no }" class="btn btn-primary"
									role="button" title="공지 사항 수정">글 수정</a>
							<a href="${ pageContext.request.contextPath }/jsp/admin/notice_delete.do?no=${ detail.no }" class="btn btn-default"
									role="button" title="공지 사항 삭제">글 삭제</a>
		                </c:if>
						<a class="btn btn-default" href="${ pageContext.request.contextPath }/notice/list.do" role="button" title="공지사항 목록으로 되돌아가는 이동 링크">목록보기</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- Footer -->
    <Footer class="footer">
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
	
	<!-- 공통 js -->
	<jsp:include page="/jsp/include/commonJs.jsp" />
	
</body>
</html>