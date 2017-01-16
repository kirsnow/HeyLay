<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Bootstrap SET -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery.1.11.1.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- top navigation -->
<nav class="navbar navbar-fixed-top navbar-default">
    <!---->
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header" style="width: 230px">
            <a class="navbar-brand" href="#">Quration</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#" class="navbar-link" title="내 카드 보관함으로 이동">내 카드</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" title="회원 정보 메뉴 열기">
                        <i class="fa fa-user-circle-o fa-2x fa-lg" aria-hidden="true"></i>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="#">
                                <i class="fa fa-vcard-o fa-fw" aria-hidden="true"></i> 회원 정보 수정
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-lock fa-fw" aria-hidden="true"></i> 비밀번호 변경
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <i class="fa fa-sign-out fa-fw" aria-hidden="true"></i> 로그아웃
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<!-- /top navigation -->