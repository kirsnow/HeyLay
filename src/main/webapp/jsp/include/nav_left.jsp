<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${ pageContext.request.contextPath }/css/simple-sidebar.css" type="text/css" rel="stylesheet">
<div class="text-center">
		<p>Welcome, ${ userVO.firstName }</p>
		<img src="${ pageContext.request.contextPath }/img/team/02.jpg" alt="profile_img" class="img-circle profile_img" style="width: 70px;">
</div>
<ul class="sidebar-nav">
    <li class="sidebar-brand">
		<a href="${ pageContext.request.contextPath }/" title="사용자 페이지 홈으로 이동">
			<i class="fa fa-home"></i> Quration 
		</a>
	</li>
	
	<li>
		<a title="회원 관리 메뉴 보기">
			<i class="fa fa-edit"></i>
			회원 관리 
			<i class="fa fa-chevron-down"></i>
		</a>
		<ul class="nav child_menu">
			<li>
				<a href="${ pageContext.request.contextPath }/jsp/admin/member_list.do" title="회원 관리 페이지로 이동">
				회원
				</a>
			</li>
			<li><a href="${ pageContext.request.contextPath }/jsp/admin/qna_list.do" title="Q&A 조회 페이지로 이동">Q&amp;A</a></li>
			<li><a href="${ pageContext.request.contextPath }/jsp/admin/withdraw.do" title="탈퇴 사유 조회 페이지로 이동">탈퇴 사유</a></li>
		</ul>
	</li>
	
	<li>
		<a title="사이트 및 카드 관리 메뉴 보기">
			<i class="fa fa-desktop"></i> 
			사이트 관리 
			<i class="fa fa-chevron-down"></i>
		</a>
		<ul class="nav child_menu">
			<li><a href="${ pageContext.request.contextPath }/jsp/admin/source_list.do" title="콘텐츠 소스 관리 페이지로 이동">콘텐츠 소스</a></li>
			<li><a href="${ pageContext.request.contextPath }/jsp/admin/spam_list.do" title="유해 콘텐츠 신고 관리 페이지로 이동">유해 콘텐츠 신고</a></li>
			<li><a href="${ pageContext.request.contextPath }/jsp/admin/spam_content_list.do" title="유해 콘텐츠 관리 페이지로 이동">유해 콘텐츠</a></li>
			<li><a href="${ pageContext.request.contextPath }/jsp/admin/bug_list.do" title="오류 신고 관리 페이지로 이동">오류 신고</a></li>
		</ul>
	</li>
	
	<li>
		<a title="통계 메뉴 보기">
			<i class="fa fa-bar-chart-o"></i> 
			통계 
			<i class="fa fa-chevron-down"></i>
		</a>
		<ul class="nav child_menu">
			<li><a href="${ pageContext.request.contextPath }/admin/statics/allKeywordList.do"  title="유저 검색어 랭킹 확인 링크">유저 검색어 랭킹</a></li>
			<li><a href="${ pageContext.request.contextPath }/jsp/admin/statistic.jsp" title="통계 페이지로 이동">유저 통계</a></li>
		</ul>
	</li>
	<li><a title="광고 관리 메뉴 보기"><i class="fa fa-clone"></i> 광고 관리 <span class="fa fa-chevron-down"></span></a>
		<ul class="nav child_menu">
			<li><a href="${ pageContext.request.contextPath }/jsp/admin/ad_list.do" title="광고 관리 페이지로 이동">광고</a></li>
		</ul></li>
</ul>
