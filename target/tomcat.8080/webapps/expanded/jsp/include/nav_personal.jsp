<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Custom Theme Style -->
<link href="${ pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet">
<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
function doMember(memberNo) {
	location.href = "${ pageContext.request.contextPath }/contents/my_search.do?memberNo=" + memberNo;
}
</script>
<div class="col-md-3 left_col">
   <div class="left_col scroll-view">
	<div class="clearfix"></div>

		<!-- menu profile quick info -->
		<div class="profile clearfix">
			<div class="row">
				<div class="col-md-offset-3  text-center">
					<div class="profile_info">
						<span>Welcome, ${ userVO.firstName } ${ userVO.lastName }</span>
						<div class=" text-center">	
						<img src="/Quration/img/team/02.jpg" alt="..." class="img-circle profile_img">			
						</div>
					</div>
				</div>	
			</div>
		</div>
		<!-- /menu profile quick info -->


		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<ul class="nav side-menu">
					<li><a href="${ pageContext.request.contextPath }/" title="홈으로 가는 링크"><i class="fa fa-home"></i> 
						Home <span class="fa fa-chevron-right"></span></a>
					</li>
					<li><a title="카드 서랍 카테고리 보기"><i class="fa fa-inbox" aria-hidden="true"></i> 
						카드 서랍 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="${ pageContext.request.contextPath }/contents/drawer_day.do" title="날짜 순으로 정렬된 카드 서랍 링크">날짜순</a></li>
							<li><a href="${ pageContext.request.contextPath }/contents/drawer_category.do" title="분야별로 정렬된 카드 서랍 링크">분야별</a></li>
							<li><a href="${ pageContext.request.contextPath }/contents/drawer_source.do" title="유형별로 정렬된 카드 서랍 링크">유형별</a></li>
							<li><a href="${ pageContext.request.contextPath }/contents/drawer_directory.do" title="개인 폴더 별로 정렬된 카드 서랍 링크">폴더별</a></li>
						</ul>
					</li>
					<li><a href="${ pageContext.request.contextPath }/contents/curation.do" title="카드 추천으로 가는 링크"><i class="fa fa-archive" aria-hidden="true"></i> 
						카드 추천<span class="fa fa-chevron-right"></span></a>
					</li>
					<li><a title="카드 분석 카테고리 보기"><i class="fa fa-bar-chart-o"></i>
							카드 분석 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="${ pageContext.request.contextPath }/contents/word_cloud.do" title="워크 클라우드 링크">워드 클라우드</a></li>
							<li><a href="javascript:doMember('${userVO.no}')" title="내가 검색한 검색어 링크">내 검색어</a></li>
							<li><a href="${ pageContext.request.contextPath }/contents/analysis.do" title="내가 검색하고 저장힌 통계 분석 링크">통계 분석</a></li>
						</ul></li>
					<li><a title="나만의 커스터 마이징 링크" href="${ pageContext.request.contextPath }/contents/customizing.do"><i class="fa fa-puzzle-piece" aria-hidden="true"></i> 
						커스터마이징 <span class="fa fa-chevron-right"></span></a>
					</li>
				</ul>
			</div>
			<!-- /sidebar menu -->
		</div>
	</div>
</div>

<!-- top navigation -->
<div class="top_nav">
	<div class="nav_menu">
		<nav class role="navigation">
			<div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars"></i></a>
			</div>
		</nav>
	</div>
</div>
<!-- top navigation -->