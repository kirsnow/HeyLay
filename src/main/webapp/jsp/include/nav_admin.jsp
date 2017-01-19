<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Custom Theme Style -->
<link href="${ pageContext.request.contextPath }/css/custom.min.css?ver=18" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet"> 	

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<div class="col-md-3 left_col">
	<div class="left_col scroll-view">

		<div class="clearfix"></div>
		
		<!-- menu profile quick info -->
		<div class="profile clearfix">
			<div class="row">
				<div class="col-md-offset-3  text-center">
					<div class="profile_info">
						<span>Welcome, ${ userVO.firstName }</span>
						<div class=" text-center">	
						<img src="/img/team/02.jpg" alt="..." class="img-circle profile_img">			
						</div>
					</div>
				</div>	
			</div>
		</div>
		<!-- /menu profile quick info -->
		
		
		<!-- /menu profile quick info -->


		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<!-- <h3>General</h3> -->
				<ul class="nav side-menu">
					<li><a href="${ pageContext.request.contextPath }/" title="사용자 페이지 홈으로 이동"><i class="fa fa-home"></i> Quration </a></li>
					<li><a title="회원 관리 메뉴 보기"><i class="fa fa-edit"></i> 회원 관리 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/member_list.do" title="회원 관리 페이지로 이동">회원</a></li>
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/qna_list.do" title="Q&A 조회 페이지로 이동">Q&A</a></li>
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/withdraw.do" title="탈퇴 사유 조회 페이지로 이동">탈퇴 사유</a></li>
						</ul></li>
					<li><a title="사이트 및 카드 관리 메뉴 보기"><i class="fa fa-desktop"></i> 사이트 및 카드 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/source_list.do" title="콘텐츠 소스 관리 페이지로 이동">콘텐츠 소스</a></li>
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/spam_list.do" title="유해 콘텐츠 신고 관리 페이지로 이동">유해 콘텐츠 신고</a></li>
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/spam_content_list.do" title="유해 콘텐츠 관리 페이지로 이동">유해 콘텐츠</a></li>
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/bug_list.do" title="오류 신고 관리 페이지로 이동">오류 신고</a></li>
						</ul></li>
					<li><a title="통계 메뉴 보기"><i class="fa fa-bar-chart-o"></i> 통계 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/statistic.jsp" title="통계 페이지로 이동">Chart JS</a></li>
						</ul></li>
					<li><a title="광고 관리 메뉴 보기"><i class="fa fa-clone"></i> 광고 관리 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="${ pageContext.request.contextPath }/jsp/admin/ad_list.do" title="광고 관리 페이지로 이동">광고</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /sidebar menu -->
	</div>
</div>

<!-- top navigation -->
<div class="top_nav">
	<div class="nav_menu">
		<nav role="navigation">
			<div class="nav toggle">
				<a id="menu_toggle" title="사이드 메뉴를 크게 보고 작게 보고 할 수 있는 토글 버튼"><i class="fa fa-bars"></i></a>
			</div>
		</nav>
	</div>
</div>
<!-- top navigation -->