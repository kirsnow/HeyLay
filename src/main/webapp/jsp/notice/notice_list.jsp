<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항 목록 페이지 | Quration: 답을 열어 줄 그런 사람</title>
	
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
			<!-- NoticeSection -->	
			<section id="notice" class="sectionContent">
				<div class="container marginTop60">
					<div class="page-header text-center col-md-8 col-md-offset-2">
		               <h1>공지사항</h1>
		            </div>
		        	<div class="row">
			        	<div class="panel panel-default col-md-6 col-md-offset-3 marginBottom">
						  <div class="panel-body">
			                <!-- 최신 contents start -->
						  	<c:forEach var="list" items="${ lists }" begin="0" end="0">
							  	<span class="pull-left thFont"><a href="${ pageContext.request.contextPath }/notice/detail.do?prepage=list&no=${ list.no }">
									&#91;
									<c:choose>
										<c:when test="${ list.noticeType eq 'N' }">공지</c:when>
										<c:otherwise>이벤트</c:otherwise>
									</c:choose>
									&#93; ${ list.title }
									</a>
								</span> 
				                <span class="thFont paddingleft30">${ list.regDate }</span> 
				                <a class="btn btn-default btn-xs pull-right" href="${ pageContext.request.contextPath }/notice/detail.do?prepage=list&no=${ list.no }" role="button" title="공지사항 상세 내용 페이지로 이동하는 링크">자세히 보기</a>
			                </c:forEach>
			                <!-- 최신 contents end -->
						  </div>
						</div>
					</div>
		        	<div class="row">
		                <div class="col-md-8 col-md-offset-2">
						    <hr class="border2px marginBottom marginTop">	
		                    <div class="row text-center border-top">
		                        <div class="col-md-6 thFont">제목 </div>
		                        <div class="col-md-3 thFont">등록일</div>                     
		                        <div class="col-md-3 thFont">조회수</div>
		                    </div>
							<hr class="borderDot marginTop marginBottom"> 
						</div>  
		        	</div>
		        	<c:forEach var="list" items="${ lists }" varStatus="loop">
			        	<div class="row">
			                <div class="col-md-8 col-md-offset-2">	
								<div class="col-md-6 paddingleft30"> >> 
									<a href="${ pageContext.request.contextPath }/notice/detail.do?prepage=list&no=${ list.no }">
									&#91;
									<c:choose>
										<c:when test="${ list.noticeType eq 'N' }">공지</c:when>
										<c:otherwise>이벤트</c:otherwise>
									</c:choose>
									&#93; ${ list.title }
									</a>
								</div>
								<div class="col-md-3 text-center">${ list.regDate }</div>
								<div class="col-md-3 text-center paddingleft30 marginBottom">${ list.viewCnt }</div>
								<hr class="border marginBottom marginTop"> 
							</div>  
			        	</div>
		        	</c:forEach>
		            <div class="row">
		                <div class="col-md-8 col-md-offset-2">
		                <!-- c:if나 choose 태그로 관리자만 보이게 한다. -->
		                <c:if test="${ userVO.type eq 'A' }">
		                <a href="${ pageContext.request.contextPath }/jsp/admin/notice_write.do" class="btn btn-default"
									role="button" title="공지 사항 작성">글 쓰기</a>
		                </c:if>
		            </div>
		            <div class="text-center">
					  <ul class="pagination">
					    <li class="disabled">
					      <a href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li  class="active"><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li>
					      <a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
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