<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OOO 콘텐츠 상세 | Quration: 답을 열어 줄 그런 사람</title>
    <!-- 각 콘텐츠 제목을 title로 동적 지정 -->

    <!-- Bootstrap CSS SET -->
    <link href="../../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>

    <!-- MDL Hosted start -->
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />
</head>

<body>
    <div class="container">
    
	    <header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header> 
        

        <!-- Breadcrumb -->
        <div class="row">
            <ol class="breadcrumb" style="margin-top: 75px">
                <li><a href="#">Home</a></li>
                <li><a href="#">Contents</a></li>
                <li class="active">Title</li>
            </ol>
        </div>
        <!-- /Breadcrumb -->

        <div class="row">
            <section class="col-md-9">
                <!-- main information of contents -->
                <article>
                    <header>
                        <p class="pull-right">by <span class="author">John Doe</span></p>
                        <p>
                            <i class="fa fa-circle" aria-hidden="true"></i> Source
                        </p>
                        <h2>Title</h2>
                    </header>
                    <div class="panel">
                        <i class="fa fa-quote-left fa-pull-left" aria-hidden="true"></i>
                        <i class="fa fa-quote-right fa-pull-right" aria-hidden="true"></i>
                        <div id="summary" class="text-center">Summary shows here, maximum 3 lines</div>
                    </div>
                    <p class="text-justify">Contents <mark>Lorem ipsum</mark> dolor sit amet, consectetur adipiscing elit. Etiam venenatis condimentum nisl sed vestibulum. Integer pellentesque eget orci at aliquet. Pellentesque vitae tellus a elit ultricies dapibus ac eu elit. In hac habitasse platea dictumst. In posuere nec nibh sit amet eleifend. Sed rutrum malesuada libero condimentum porta. Nulla fringilla magna ipsum, at iaculis libero congue sit amet. Proin metus dolor, pretium ut lorem vitae, dignissim congue neque.</p>
                    <p class="text-justify">Sed sagittis placerat ullamcorper. Aenean auctor vehicula orci, sit amet vulputate neque auctor eget. Aenean molestie dui auctor, lobortis purus id, commodo ipsum. Etiam hendrerit elementum orci a commodo. Quisque suscipit tempus dui eget sollicitudin. Proin magna enim, congue at tincidunt in, fermentum non neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent pharetra imperdiet justo, quis congue risus.</p>
                    <p class="text-justify">Nam semper condimentum blandit. Etiam quis sollicitudin quam. Aliquam ullamcorper dolor ac enim volutpat dignissim. Duis quis consectetur nulla. Donec sapien nunc, interdum ut ante eget, tempor dictum odio. In quis convallis ante. Nulla tincidunt consequat accumsan. Sed posuere massa nec risus lobortis, at condimentum diam condimentum. Proin vitae posuere justo. Donec nec nisi in felis pretium egestas sed a turpis. Mauris at arcu sem. Maecenas congue nibh turpis, id porta sem porta efficitur. Donec pharetra quis nisi at molestie.</p>
                    <footer class="text-right">
                        <time>2016. 12. 31</time>

                    </footer>
                </article>

                <hr/>
                <div role="toolbar">
                    <button type="button" class="btn btn-xs btn-default" title="카드를 보관함에 담기">
                        <i class="fa fa-star-o" aria-hidden="true"></i> 3,210
                    </button>
                    <button type="button" class="btn btn-xs btn-default disabled">
                        <i class="fa fa-check" aria-hidden="true"></i> 3,210
                    </button>
                    <div id="share" class="btn-group">
                        <a href="#" role="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                            <i class="fa fa-share-alt" aria-hidden="true"></i> Share
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#" title="카카오톡으로 공유"><i class="fa fa-commenting fa-fw" aria-hidden="true"></i> KakaoTalk</a></li>
                            <li><a href="#" title="페이스북으로 공유"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i> Facebook</a></li>
                            <li><a href="#" title="트위터로 공유"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i> Twitter</a></li>
                            <li><a href="#" title="에버노트로 공유"><i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> Evernote</a></li>
                        </ul>
                    </div>
                    <div id="report" class="btn-group" title="신고">
                        <a href="#" role="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Report
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
                            <li><a href="#" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- /main information of contents -->

            <!-- additional information of contents -->
            <aside class="col-md-3 well">
                <div id="img">
                    <p class="lead"><i class="fa fa-image" aria-hidden="true"></i> images</p>
                    <figure>
                        <img src="../../img/defaultImage.png" alt="Default Image" width="250px" />
                        <figcaption>Fig1. - The Pulpit Rock, Norway.</figcaption>
                    </figure>
                </div>
                <hr/>
                <div>
                    <p class="lead"><i class="fa fa-pie-chart" aria-hidden="true"></i> stats</p>
                    <div>
                        <img src="../../img/defaultImage.png" alt="통계" width="250px" />
                    </div>
                </div>
            </aside>
            <!-- /additional information of contents -->
        </div>

        <!-- memo -->
        <section id="memo" class="row">
            <hr/>
            <h4>Memo</h4>
            <div class="card-container mdl-grid">

                <!-- card -->
                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
                    <div class="mdl-card__title mdl-color-text--grey-500">
                        <h5 class="author mdl-card__title-text"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;Alice</h5>
                    </div>
                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
                        <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tortor nibh, laoreet vitae euismod quis, tempor et nunc. Nulla sollicitudin dolor nec tellus condimentum, vel aliquam nulla cursus.</p>
                    </div>
                    <div class="mdl-card__menu">
                        <div id="report" class="btn-group dropdown pull-right" title="신고">
                            <a href="#" role="button" class="dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                                <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
                                <li><a href="#" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /card -->

                <!-- card -->
                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
                    <div class="mdl-card__title mdl-color-text--grey-500">
                        <h5 class="author mdl-card__title-text"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;Bob</h5>
                    </div>
                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
                        <p class="text-justify">Vestibulum rutrum lorem leo, sed tristique justo ultricies vitae. Praesent blandit felis id odio lobortis, in dapibus dui suscipit. Mauris eget arcu sem.</p>
                    </div>
                    <div class="mdl-card__menu">
                        <div id="report" class="btn-group dropdown pull-right" title="신고">
                            <a href="#" role="button" class="dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                                <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
                                <li><a href="#" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /card -->

                <!-- card -->
                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
                    <div class="mdl-card__title mdl-color-text--grey-500">
                        <h5 class="author mdl-card__title-text"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;Carol</h5>
                    </div>
                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
                        <p class="text-justify">Quisque elementum eros risus, id tempor turpis vulputate at. Ut suscipit diam id semper ultricies. Pellentesque vulputate lacus et ante vehicula, a porttitor eros mollis.</p>
                    </div>
                    <div class="mdl-card__menu">
                        <div id="report" class="btn-group dropdown pull-right" title="신고">
                            <a href="#" role="button" class="dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                                <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
                                <li><a href="#" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /card -->

                <!-- card -->
                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
                       <div class="mdl-card__title mdl-color-text--grey-500">
                        <h5 class="author mdl-card__title-text"><i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;David</h5>
                    </div>
                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
                        <p class="text-justify">Phasellus enim augue, fermentum at dignissim ut, cursus vel dolor. Nullam pretium a lacus dictum imperdiet. Vestibulum bibendum rhoncus massa, eget vestibulum lacus maximus ut. Cras a vulputate ligula. Curabitur eu convallis lacus.</p>
                    </div>
                    <div class="mdl-card__menu">
                        <div id="report" class="btn-group dropdown pull-right" title="신고">
                            <a href="#" role="button" class="dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                                <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고</a></li>
                                <li><a href="#" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고</a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
                <!-- /card -->

            </div>
        </section>
        <!-- /memo -->
    </div>
    <!-- /container -->

    <!-- footer -->
    <footer class="mdl-mega-footer">
        <div class="mdl-mega-footer--top-section">
            <div class="mdl-mega-footer--left-section">
                <a href="#" title="페이스북 페이지로 이동" class=""><i class="fa fa-facebook fa-2x" aria-hidden="true"></i></a> &nbsp;
                <a href="#" title="트위터 공식 계정으로 이동"><i class="fa fa-twitter fa-2x fa-fw" aria-hidden="true"></i></a>
                <a href="#" title="인스타그램 공식 계정으로 이동"><i class="fa fa-instagram fa-2x fa-fw" aria-hidden="true"></i></a>
            </div>
            <div class="mdl-mega-footer--right-section">
                <a class="mdl-typography--font-light" href="#top">
                Back to Top
                <i class="fa fa-angle-up fa-lg fa-fw" aria-hidden="true"></i>
              </a>
            </div>
        </div>
        <div class="mdl-mega-footer--middle-section">
            About | Help | Get Primium service
        </div>
        <div class="mdl-mega-footer--bottom-section">
            <div class="mdl-logo">
                <span class="mdl-typography--font-light">Quration © 2016 PlanB.io</span>
            </div>
            <ul class="mdl-mega-footer--link-list">
                <li><a href="#">Privacy and Terms</a></li>
            </ul>
        </div>
    </footer>
    <!-- /footer -->
</body>

</html>