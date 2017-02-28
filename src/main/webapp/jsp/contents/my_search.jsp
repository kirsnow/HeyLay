<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드분석 - 내 검색어 페이지 입니다. --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 검색어| Quration: 답을 열어 줄 그런 사람</title>

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
<body class="nav-md">

   <div class="container body">
      <header>
         <jsp:include page="/jsp/include/nav_search.jsp" />
      </header>
      
      <div class="main_container marginTop60">
         <!-- nav -->
            <jsp:include page="/jsp/include/nav_personal.jsp" /> 
         <!-- /nav -->

         <div class="right_col body" role="main">
            <!-- page content -->

            <div class="container text-center">
               <div class="row">
                  <div class="col-md-11">
                     <h3 class="marginBottom30 marginTop30"><b>내 검색어 히스토리</b></h3>
					 	<c:if test="${ (keywordList ne null) or (not empty keywordList) }">
						 	 <p>
	                       		<small><i class="fa fa-times" aria-hidden="true"></i>버튼을 클릭하여 해당 검색어를 삭제할 수 있습니다.</small>
	                       	 </p>
                       	</c:if>  
                  </div>
               </div>
               <div class="row">
                  <c:set var="keyword.regDate" value="<%=new java.util.Date()%>" />
                  <c:choose>
                     <c:when test="${ (keywordList eq null) or (empty keywordList) }">
                        <div class="row">
	                        <div class="minHeight500">
		                        <p class=" marginTop180 font20 grayfont">아직 검색한 키워드가 없습니다 &#58;0</p>
		                        <p>
		                        	   <jsp:include page="/jsp/component/search_suggestion.jsp" />
		                        </p>
							</div>
                        </div>
                     </c:when>
                     <c:otherwise>
	                     <c:forEach var="keyword" items="${ keywordList }" varStatus="loop">
		                     <div class="col-md-offset-1 col-md-10">
			                     <dl class="dl-horizontal">
			                        <dt style="text-align:right"><c:out value="${loop.count}"/>.</dt>
			                        <dd class="text-left">
			                           <a href="javascript:search('${ keyword.keyword }')" title="'${ keyword.keyword }' 검색">
			                           ${ keyword.keyword }</a>
			                           <small class="text-muted marginLeft" title="<fmt:formatDate pattern="yyyy. MM. dd." value="${ keyword.regDate }"/>"
								 			data-toggle="tooltip" data-placement="bottom">${ keyword.daysAgo }</small>
			                           <a href="javascript:update('${keyword.no}')" class="text-danger marginLeft30" title="검색어 삭제">
			                           		<i class="fa fa-times" aria-hidden="true"></i>
			                           </a>
			                        </dd>
			                     </dl>
		                     </div>
	                     </c:forEach>
                     </c:otherwise>
                  </c:choose>
               </div>
            </div>

            <!-- /page content -->
         </div>

         <!-- Footer -->
          <Footer class="footer">
            <jsp:include page="/jsp/include/footer.jsp" />
         </Footer> 
   
      </div>
   </div>
 	<script type="text/javascript">
		function update(no) {
 			// alert(no);
			location.href = "${ pageContext.request.contextPath }/contents/update_status.do?no=" + no;
		}
		
		function search(keyword) {
 			// alert(no);
			location.href = "${ pageContext.request.contextPath }/search/result.do?q="+keyword;
		}
	</script>
	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Bootstrap -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	<!-- icon-font -->
	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
	
</body>
</html>