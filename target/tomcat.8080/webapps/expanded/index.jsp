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
    
    <!-- Bootstrap CSS SET -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet"  href="https://fonts.googleapis.com/icon?family=Material+Icons">  
	 
    <script src="${ pageContext.request.contextPath }/js/jquery.1.11.1.js"></script>
    <script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
    
    <!-- CSS for index -->
    <link href="${ pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

	
	
    <!-- Home Section -->
    <div id="home">

        <div class="container text-center">
			<c:choose>
				<c:when test="${ empty userVO }"> 
					<span><a href="${ pageContext.request.contextPath }/membership/membership.do" class="btn btn-info">join</a>  </span>
					<span><a href="${ pageContext.request.contextPath }/login/login.do" class="btn btn-primary">login</a>  </span>
				</c:when>
				<c:otherwise> 
					<span><a href="${ pageContext.request.contextPath }/login/logout.do" class="btn btn-primary btn-sm" title="로그아웃">로그아웃</a></span>
					<span><a href="${ pageContext.request.contextPath }/myPage/mypage.do" class="btn btn-default btn-sm" title="회원정보수정">회원 정보 수정</a></span>
					<span><a href="${ pageContext.request.contextPath }/contents/drawer_day.do" class="btn btn-default btn-sm" title="내카드">내카드</a></span>
				</c:otherwise>
			</c:choose> 
            <!-- Navigation -->
            <h1 class="text-muted">Quration</h1>
            
            <div class="content">
                <h4>
                	<a href="${ pageContext.request.contextPath }/search/result.do">
                		We've got the special power
                	</a>
                </h4>
                <hr>
                <div class="header-text btn">
                    <h1><span id="head-title"></span></h1>
                </div>
            </div>

            <a href="#meet-us" class="down-btn page-scroll">
                <span class="fa fa-angle-down"></span>
            </a>
        </div>
    </div>

    <!-- Meet Us Section -->
    <div id="meet-us">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="section-title">
                        <h2>Meet Us</h2>
                        <hr>
                    </div>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                    <a href="#services" class="down-btn page-scroll">
                        <span class="fa fa-angle-down"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Overview Video Section -->
    <div id="overview-video">
        <div class="overlay">
            <div class="container">
                <a href="#">
                    <span class="fa fa-play"></span>
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
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                </div>
            </div>

            <div class="space"></div>

            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="service">
                        <span class="fa fa-book fa-3x"></span>
                        <h4>Branding</h4>
                        <p class="text-justify">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis. abcdefghijklmn.</p>
                    </div>
                </div>

                <div class="col-md-4 col-sm-4">
                    <div class="service">
                        <span class="fa fa-bicycle fa-3x"></span>
                        <h4>Web Devepment</h4>
                        <p class="text-justify">Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Accusamus et. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis </p>
                    </div>
                </div>

                <div class="col-md-4 col-sm-4">
                    <div class="service">
                        <span class="fa fa-plug fa-3x"></span>
                        <h4>App Design</h4>
                        <p class="text-justify">Nulla vitae elit libero, a pharetra augue. At vero eos et accusamus et iusto odio dignissimos ducimus. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. </p>
                    </div>
                </div>
            </div>
            <a href="#works" class="down-btn page-scroll">
                <span class="fa fa-angle-down"></span>
            </a>
        </div>
    </div>

    <!-- Call-to-Action Section -->
    <div id="cta">
        <div class="container text-center">
            <a href="#" class="btn go-to-btn">Check our shop</a>
        </div>
    </div>

    <!-- Portfolio Section -->
    <div id="works">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="section-title">
                        <h2>Our Latest Projects</h2>
                        <hr>
                    </div>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                </div>
            </div>
            <div class="space"></div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 col-sm-6 nopadding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h5>Logo Design</h5>
                                    <p class="lead">Client Seal</p>
                                    <div class="hline"></div>
                                </div>
                                <img src="${ pageContext.request.contextPath }/img/portfolio/01.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 nopadding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h5>Stationery</h5>
                                    <p class="lead">Design Project</p>
                                    <div class="hline"></div>
                                </div>
                                <img src="${ pageContext.request.contextPath }/img/portfolio/02.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 nopadding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h5>Branding</h5>
                                    <p class="lead">Metalbrand</p>
                                    <div class="hline"></div>
                                </div>
                            </a>
                            <img src="${ pageContext.request.contextPath }/img/portfolio/03.jpg" class="img-responsive" alt="...">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 nopadding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h5>Business Card</h5>
                                    <p class="lead">Clothing Line</p>
                                    <div class="hline"></div>
                                </div>
                            </a>
                            <img src="${ pageContext.request.contextPath }/img/portfolio/04.jpg" class="img-responsive" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="space"></div>
        <div class="text-center">
            <a href="#" class="btn read-more-btn">Check on Dribbble</a>
            <br>
            <a href="#about-us" class="down-btn page-scroll"><span class="fa fa-angle-down"></span></a>
        </div>
    </div>

    <!-- Clients Section -->
    <div id="clients">
        <div class="overlay">
            <div class="container text-center">
                <div class="section-title">
                    <h2>Our Partners</h2>
                    <hr>
                </div>

                <ul class="clients">
                    <li><a href="#"><img src="${ pageContext.request.contextPath }/img/clients/01.png" class="img-responsive" alt="..."></a></li>
                    <li><a href="#"><img src="${ pageContext.request.contextPath }/img/clients/02.png" class="img-responsive" alt="..."></a></li>
                    <li><a href="#"><img src="${ pageContext.request.contextPath }/img/clients/03.png" class="img-responsive" alt="..."></a></li>
                    <li><a href="#"><img src="${ pageContext.request.contextPath }/img/clients/04.png" class="img-responsive" alt="..."></a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- About Us Section -->
    <div id="about-us">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="section-title">
                        <h2>About Us</h2>
                        <hr>
                    </div>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
                </div>
            </div>
            <div class="space"></div>
            <div class="row">
                <div class="col-md-10 col-sm-10">
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <div class="team">
                                <img src="${ pageContext.request.contextPath }/img/team/02.jpg" class="img-responsive img-circle" alt="...">
                                <br>
                                <h4>Lian Gwapa</h4>
                                <p class="small">CEO/Founder</p>
                                <hr>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="team">
                                <img src="${ pageContext.request.contextPath }/img/team/04.jpg" class="img-responsive img-circle" alt="...">
                                <br>
                                <h4>Jenn Pereira</h4>
                                <p class="small">Web Coder</p>
                                <hr>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="team">
                                <img src="${ pageContext.request.contextPath }/img/team/03.jpg" class="img-responsive img-circle" alt="...">
                                <br>
                                <h4>Alan Podemski</h4>
                                <p class="small">Web Designer</p>
                                <hr>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-2 col-sm-2">
                    <div class="team hire">
                        <h4>We Are Hiring!</h4>
                        <hr>
                        <div class="space"></div>
                        <a href="#">
                            <span class="fa fa-paper-plane-o fa-2x"></span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <a href="#contact" class="page-scroll down-btn">
                    <span class="fa fa-angle-down"></span>
                </a>
            </div>

        </div>
    </div>

    <!-- Testimonial Section -->
    <div id="testimonials">
        <div class="overlay">
            <div class="container">
                <div class="section-title">
                    <h2>What my Clients Say...</h2>
                    <hr>
                </div>

                <div id="testimonial" class="owl-carousel owl-theme">
                  <div class="item">
                    <h3>Et iusto odio dignissimos ducimus qui blanditiis <br>praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint <br>occaecati cupiditate non provident. </h3>
                    <br>
                    <h6>LJ, Abc Company</h6>
                  </div>

                  <div class="item">
                    <h3>Fusce dapibus, tellus ac cursus commodo, tortor<br> mauris condimentum. Duis mollis, est non commodo luctus, nisi erat </h3>
                    <br>
                    <h6>Kai, Web Geekster</h6>
                  </div>

                  <div class="item">
                    <h3>Cras justo odio, dapibus ac facilisis in, egestas <br>eget quam. Donec id elit non mi porta gravida at eget metus.</h3>
                    <br>
                    <h6>Jenn, Coders' Playground</h6>
                  </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- footer -->
	<jsp:include page="/jsp/include/footer.jsp" />
	<!-- /footer -->

    <!-- Javascripts (necessary for Bootstrap's JavaScript plugins)
    ================================================== -->
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/jasny-bootstrap.min.js"></script>
    
    <!-- Include all compiled plugins (below), or include individual files as needed
    -->
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/SmoothScroll.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/typed.js"></script>
    <script>
      $(function(){
          $("#head-title").typed({
            strings: ["Java^1000", "Python^1000" ,"JavaScript^1000" ,"PHP^1000" ,"Objective-C^1000"],
            typeSpeed: 100,
            loop: true,
            startDelay: 100
          });
      });
    </script>
    
  </body>
</html>