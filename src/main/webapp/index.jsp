<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
  <head>
     <!-- Basic Page Needs -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quration: 답을 열어 줄 그런 사람</title>
   
    <!-- google analytics -->
    <script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-90558257-1', 'auto');
	  ga('send', 'pageview');
	</script>
    
    <script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
	 	
    <!-- Bootstrap CSS SET -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    
    <!-- CSS for index (<HEAD>와 </HEAD> 사이) -->
    <link href="${ pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
   
  <style>

    #main{
   background-image: url('img/galaxy4.jpg');
   background-size: cover;
   background-position: center;
   background-repeat: no-repeat;
   background-attachment: fixed;
   height: 710px;
   max-height: 710px;
   color: #ffffff;
}
   .btn-border-main {
    border: 1px solid #FFFFFF;
} 


  </style>
  </head>
  <body>
    <!-- Home Section -->
    <div id="main">
    	 <div class="row text-right">
	        	<div class="col-md-12">
					<c:choose>
						<c:when test="${ not empty userVO }"> 
							<div class="dropdown marginTop20 marginRight30">
								<c:choose>
									<c:when test="${ userVO.type eq 'A'}">
										<span class="marginRight">
											<a href="${ pageContext.request.contextPath }/jsp/admin/member_list.do"> 
											<i class="fa fa-user-secret fa-fw" aria-hidden="true"></i> 관리자 페이지</a>
										</span>
									</c:when>
									<c:otherwise>
										<span class="marginRight">
											<a href="${ pageContext.request.contextPath }/drawer.do" class="" title="내카드">
											<i class="fa fa-hdd-o" aria-hidden="true"></i> 내 카드</a></a>
										</span>
									</c:otherwise>
								</c:choose>
								
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" title="회원 정보 메뉴 열기">
									<img id="blah" src="${ pageContext.request.contextPath }/img/purin.png" 
										alt="your image" class="img-circle profile_img" style="width: 30px; height: 30px;"/>
									<span class="caret"></span>
								</a>	
							
								<ul class="dropdown-menu list-unstyled pull-right" role="menu">
									<li><a href="${ pageContext.request.contextPath }/myPage/mypage.do"> <i class="fa fa-vcard-o fa-fw"
											aria-hidden="true"></i> 회원 정보 수정
									</a></li>
									<li><a href="${ pageContext.request.contextPath }/myPage/original_password.do"> <i class="fa fa-lock fa-fw"
											aria-hidden="true"></i> 비밀번호 변경
									</a></li>
									<li class="divider"></li>
									<li><a href="<c:url value="/j_spring_security_logout" />"> 
									   <i class="fa fa-sign-out fa-fw" aria-hidden="true"></i> 로그아웃</a>
									</li>
								</ul>
							</div>
						</c:when>
						<c:otherwise> 
						<div class="row marginRight30">
							<div class="marginTop20">
							    <div class="pull-right ">
									<span><a href="${ pageContext.request.contextPath }/membership/agreement.do" class="marginRight"> 회원가입</a>  </span>
									<span><a href="<c:url value="/login/login.do" />" class=""> 로그인</a>  </span>
							    </div>
						    </div>
						</div>
						</c:otherwise>
					</c:choose> 
				</div>
			</div>
        <div id="quration" class="container text-center">
            <!-- Navigation -->
            <h1 class="text-muted">Quration</h1>
            
            <div class="content row">
	            <form class="form-inline" action="${pageContext.request.contextPath }/search/result.do" method="get" role="search">
					<div class="form-group row">
						<div class="input-group col-md-12">
							<div>
								<input type="search"  style="background-color:transparent" size="60" name="q" class="form-control input-lg" alt="검색어 입력" value="${ searchQuery }" placeholder="검색어 입력"/> 
								<span>
									<button type="submit" class="btn btn-primary input-lg btn-border-main" title="검색 실행">
										<i class="fa fa-search fa-2x fa-fw" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
						<!-- /input-group -->
					</div>
				</form>
                <div id="recommandKeyword" class="col-md-6 col-md-offset-3 marginTop20 font20 grayfont">
                	추천 검색어<span class="marginLeft marginRight">:</span> 
                	       <span class="spanPadding"><a href="search/result.do?q=인공지능">인공지능</a></span>  
                	       <span class="spanPadding" ><a href="search/result.do?q=java">Java</a></span>  
                	       <span ><a href="search/result.do?q=python">Python</a></span>
                </div>
                
            </div>
            <div class="content">
	            <a href="#services" class="down-btn page-scroll ">
	                <span class="fa fa-angle-down"></span>
	            </a>
	       </div>
        </div>
    </div>

 
    <!-- Services Section -->
    <div id="services">
        <div class="container text-center">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="section-title">
                        <h2>Services</h2>
                        <hr>
                    </div>
                    <p class="grayfont"> 저희 Qurtion은 검색 콘텐츠 큐레이션 및  웹 레퍼런스 관리 서비스입니다.</p>
                </div>
            </div>

            <div class="space"></div>

            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="service">
                        <span class="fa fa-search fa-3x"></span>
                        <h4>Search</h4>
                        <p class="text-justify">
                       <span class="text-primary"><b>검색 </b></span>기능을  통해  원하는  내용을  다양한 플랫폼을 통해  정보를 찾을  수  있게  자료를  제공합니다.
                                                    뿐만아니라, 저희 서비스 속 큐레이션 기능이 더해져 검색  정확도와  검색  속도가  상승하여  사용자가  느끼는  검색  품질이  향상됩니다.                   
                        
                        </p>
                    </div>
                </div>

                <div class="col-md-4 col-sm-4">
                    <div class="service">
                        <span class="fa fa-file-text-o fa-3x"></span>
                        <h4>Curation</h4>
                        <p class="text-justify">
                        <span class="text-primary"><b>큐레이션</b></span>은  무수하게  쏟아져  나오는  자료 중에서  의미  있는  자료를  선별해  주는  것을  말합니다.
                                                        저희  서비스에서는  사용자가  선택한  관심  키워드와  콘텐츠  검색, 저장, 좋아요  수를  조합하여  추천  서비스를  제공합니다.
                        </p>
                    </div>
                </div>

                <div class="col-md-4 col-sm-4">
                    <div class="service">
                        <span class="fa fa-bookmark fa-3x"></span>
                        <h4>Web reference</h4>
                        <p class="text-justify">
                        <span class="text-primary"><b>웹 레퍼런스</b></span>기능 은 사용자가 찾은 컨텐 츠 중 마음에 드는 콘텐츠를 즐겨찾기처럼 저장하고 메모를 남길 수 있는기능입니다.
                                                       콘텐츠를 가상의 서랍에 넣어두는 ‘내 서랍’ 기능을 사용하면, 언제 어디서나 콘텐츠를 다시 볼 수 있습니다.
                        </p>
                    </div>
                </div>
            </div>
            <div>
            <a href="#about-us" class="down-btn page-scroll">
                <span class="fa fa-angle-down"></span>
            </a>
            <a href="#main" class="up-btn page-scroll">
                <span class="fa fa-angle-up"></span>
            </a>
            </div>
        </div>
    </div>

    <!-- Call-to-Action Section -->
    <div id="cta">
        <div class="container text-center">
           <a href="${ pageContext.request.contextPath }/contact/qna.do"  class="btn go-to-btn">Contact Us</a> 
        </div>
    </div>



    <!-- About Us Section -->
    <div id="about-us">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-14">
                    <div class="section-title">
                        <h2>About Us</h2>
                        <hr>
                    </div>
                    <p class="grayfont"> Question&nbsp;&nbsp;+&nbsp;&nbsp;Curation = Qurtion&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="space"></div>
            <div class="row text-center">
                <div class="col-md-12 col-sm-10">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="team">
                                <img src="${ pageContext.request.contextPath }/img/evee.png"" class="img-responsive img-circle" alt="...">
                                <br>
                                <h4>Kim Jeongkyung</h4>
                                <p class="small">Team Leader / Developer</p>
                                <hr>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3">
                            <div class="team">
                                <img src="${ pageContext.request.contextPath }/img/purin.png" class="img-responsive img-circle" alt="...">
                                <br>
                                <h4>Shin Hanui</h4>
                                <p class="small">Developer</p>
                                <hr>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-3">
                            <div class="team">
                                <img src="${ pageContext.request.contextPath }/img/paeri23.png" class="img-responsive img-circle" alt="...">
                                <br>
                             
                                <h4>Sung Shinhye</h4>
                                <p class="small">Developer</p>
                                <hr>
                            </div>
                        </div>
                        
                         <div class="col-md-3 col-sm-3">
                            <div class="team">
                                <img src="${ pageContext.request.contextPath }/img/mue.png" class="img-responsive img-circle" alt="...">
                                <br>
                             
                                <h4>Jo Eunryang</h4>
                                <p class="small">Developer</p>
                                <hr>
	
                            </div>
                        </div>
                    </div>
                    <a href="#services" class="up-btn page-scroll">
		                <span class="fa fa-angle-up"></span>
		            </a>
                </div>
                
            </div>
        </div>
    </div>

   
    <!-- footer -->
	<jsp:include page="/jsp/include/footer.jsp" />
	<!-- /footer -->
	
	<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
    <script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	 	
    <!-- Javascripts (necessary for Bootstrap's JavaScript plugins)
    ================================================== -->
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/jasny-bootstrap.min.js"></script>
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/SmoothScroll.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/typed.js"></script>
    
    
    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
    
    <script>
      $(function(){
          $("#head-title").typed({
            strings: ["Java^1000", "Python^1000" ,"JavaScript^1000" ,"PHP^1000" ,"Objective-C^1000"],
            typeSpeed: 100,
            loop: true,
            startDelay: 100
          });
      });
      
      //가입 or 로그인 후 검색 이전 키워드 추천용 ajax
     /*  $(document).ready(function() { 
      $.ajax({
          url: "${ pageContext.request.contextPath }/index/recommandKeywordList.do",
          type : 'get',
          contentType : "application/json",
          success: function(result){
               $("#recommandKeyword").text(result);
               console.log(result);
               
    	}});
     }); */
    </script>
    
  </body>
</html>