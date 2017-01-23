<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자주 묻는 질문 및 답변(상세페이지) | Quration: 답을 열어 줄 그런 사람</title>
    
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
	
    <section id="faqDetail">
        <div class="container marginTop60 ">
            <div class="page-header text-center col-md-8 col-md-offset-2">
		          <h1>자주 묻는 질문 및 답변 <small>상세페이지</small></h1>
		    </div>
	        <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h4>${ detail.title }	
                          		<span class="pull-right">${ detail.regDate }</span>
                            </h4>
                        </div>
                    </div>
                </div>    
            </div>
            <div class="row">
                <div class="col-md-8 col-md-push-2">
                  	 ${ detail.content}
         
                    <div>
                  	    <p> ▶ 신고센터 '메모관련 유해게시물' 신고 <a href="#" class="spanPadding">바로 가기</a></p>
                  	  	<p>  ▶ 신고센터 '콘텐츠 유해게시물' 신고 <a href="#" class="spanPadding">바로 가기</a></p>
                    </div>
                    <hr>
				</div>
                <div class="row">
		           <div class="col-md-6 col-md-offset-3 marginBottom">
		               <div class="input-group">
			                 <input type="text" name="account" class="form-control" placeholder="아직 궁금한점이 해결되지 않았나요?" alt="질문하는 방법 소개 폼"/>
			                 <span class="input-group-btn">
			                   <button type="button" class="btn btn-default">질문하기</button> <!--qna랑 연결  -->
			                 </span>
		               </div><!-- /input-group -->
		           </div><!-- /.col-lg-6 -->
		        </div><!-- /.row -->
                <div class="row">
                    <div class="text-center col-md-8 col-md-offset-2 marginTop marginBottom">
                        <a class="btn btn-primary" href="${ pageContext.request.contextPath }/faq/faq.do" role="button" title="자주묻는 질문 목록으로 되돌아가는 이동 링크">목록보기</a>
                    </div>
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