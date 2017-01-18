<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Bootstrap SET -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/jquery.1.11.1.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- top navigation -->
<nav class="navbar navbar-fixed-top navbar-default">
	<!---->
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header" style="width: 218px">
			<a class="navbar-brand" href="${ pageContext.request.contextPath }/">Quration</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			 id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${ not empty userVO }">		
						<li>
							<a href="${ pageContext.request.contextPath }/contents/drawer_day.do" class="navbar-link" title="내 카드 보관함으로 이동">내 카드</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" title="회원 정보 메뉴 열기">
								<i class="fa fa-user-circle-o fa-2x fa-lg" aria-hidden="true"></i><span class="caret"></span>
							</a>	
						
							<ul class="dropdown-menu" role="menu">
								<li><a href="${ pageContext.request.contextPath }/myPage/mypage.do"> <i class="fa fa-vcard-o fa-fw"
										aria-hidden="true"></i> 회원 정보 수정
								</a></li>
								<li><a href="${ pageContext.request.contextPath }/myPage/original_password.do"> <i class="fa fa-lock fa-fw"
										aria-hidden="true"></i> 비밀번호 변경
								</a></li>
								<c:if test="${ userVO.type == 'A'}">
									<li><a href="${ pageContext.request.contextPath }/jsp/admin/member_list.do"> 
										<i class="fa fa-user-secret fa-fw" aria-hidden="true"></i> 관리자 페이지
									</a></li>
								</c:if>
								<li class="divider"></li>
								<li><a href="${ pageContext.request.contextPath }/login/logout.do"> <i class="fa fa-sign-out fa-fw"
										aria-hidden="true"></i> 로그아웃
								</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="https://quration.herokuapp.com/login/login.do" role="button" aria-expanded="false" title="로그인">
								<i class="fa fa-sign-in" aria-hidden="true"></i> 로그인
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
			<form class="navbar-form" role="search">
				<div class="form-group" style="display: inline;">
					<div class="input-group" style="display: table;">
						<input type="search" class="form-control input-lg" alt="검색어 입력" value="${ searchQuery }"
							   placeholder="search" style="margin-left: -3px;" /> 
						
						<span class="input-group-btn" style="width: 1%; padding: 0px 0px;">
						
						<button type="button" class="btn btn-primary" title="검색 실행">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
						</span>
					</div>
					<!-- /input-group -->
				</div>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<!-- /top navigation -->