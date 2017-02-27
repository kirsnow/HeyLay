<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${ pageContext.request.contextPath }/css/custom.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
function doMember(memberNo) {
    location.href = "${ pageContext.request.contextPath }/contents/my_search.do?memberNo=" + memberNo;
}
</script>

<div class="nav_left col-md-3 left_col">
   <div class="left_col scroll-view">
	<div class="clearfix"></div>

		<!-- menu profile quick info -->
		<div class="profile clearfix">
			<div class="row">
				<div class="col-md-offset-3  text-center">
					<div class="profile_info">
						<span>Welcome<br/>${ userVO.firstName }</span>
						<div class=" text-center">	
							<img id="blah" src="${ pageContext.request.contextPath }/img/purin.png" 
								alt="your image" class="img-circle profile_img" style="width: 80px; height: 80px;"/>			
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
					<li>
						<a href="${ pageContext.request.contextPath }/" title="홈으로 가는 링크">
							<i class="fa fa-home"></i> 
							Home <span class="fa fa-chevron-right"></span>
						</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/drawer.do" title="카드 서랍 보기">
							<i class="fa fa-inbox" aria-hidden="true"></i> 
							카드 서랍 <span class="fa fa-chevron-right"></span>
						</a>
					</li>
					<li><a href="${ pageContext.request.contextPath }/contents/curation.do" title="카드 추천으로 가는 링크"><i class="fa fa-archive" aria-hidden="true"></i> 
						카드 추천<span class="fa fa-chevron-right"></span></a>
					</li>
					<li><a title="카드 분석 카테고리 보기"><i class="fa fa-bar-chart-o"></i>
							카드 분석 <span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="${ pageContext.request.contextPath }/wordCloud.do" title="한 눈에 보는 내 검색어 링크">한 눈에 보는 내 검색어 </a></li>
						    <li><a href="javascript:doMember('${userVO.no}')" title="내가 검색한 검색어 링크">내 검색어 히스토리</a></li>
							<li><a href="${ pageContext.request.contextPath }/AllUserWordCloud.do" title="전체 유저 검색어를 기반으로한 워크 클라우드 링크">인기 검색어</a></li>
<%-- 							<li><a href="${ pageContext.request.contextPath }/contents/analysis.do" title="내가 검색하고 저장한 통계 분석 링크">통계 분석</a></li> --%>
							<li><a href="${ pageContext.request.contextPath }/contents/stats.do" title="내가 검색하고 저장한 통계 분석 페이지 링크">이용 통계</a></li>
						</ul></li>
					<li><a title="나만의 커스터 마이징 링크" href="${ pageContext.request.contextPath }/contents/customizing.do"><i class="fa fa-puzzle-piece" aria-hidden="true"></i> 
						업그레이드 옵션<span class="fa fa-chevron-right"></span></a>
					</li>
				</ul>
			</div>
			<!-- /sidebar menu -->
		</div>
	</div>
</div>

<!-- top navigation -->
<div class="visible-xs top_nav">
	<div class="nav_menu">
		<nav role="navigation">
			<div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars"></i></a>
			</div>
		</nav>
	</div>
</div>
<!-- top navigation -->