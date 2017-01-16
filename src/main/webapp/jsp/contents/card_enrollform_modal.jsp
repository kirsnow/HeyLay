<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%-- 카드 등록 폼 모달 페이지 입니다 --%>
<!-- Bootstrap CSS SET -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>
</head>
<style type="text/css">
	#cardImg {
		width: 150px;
		margin-right: 20px;
	}
</style>
<body>
<section id="cardEnrollForm">
	<div class="container">
		<div class="page-header text-center col-md-6 col-md-offset-3">
		      <h2>카드 등록 </h2>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="col-md-2 " id="cardImg">
					<img alt="카드이미지"
						src="${ pageContext.request.contextPath }/img/wikipedia_logo.png"
						id="cardImg">
				</div>
				<div class="col-md-6 paddingleft30 marginTop20">
					<div class="row">
						<div class="col-md-5">media</div>
						<div class="col-md-7">Wikipidea</div>
					</div>
					<div class="row">
						<div class="col-md-5">title</div> 
						<div class="col-md-7">자바란?</div>
					</div>
					<div class="row">
						<div class="col-md-5">type</div>
						<div class="col-md-7">정의</div>
					</div>
					<div class="row">
						<div class="col-md-5">area</div>
						<div class="col-md-7">IT</div>
					</div>
					<div class="row">
						<div class="col-md-5">contents</div>
						<div class="col-md-7">자바 (Java) - 객체 지향 프로그래밍 언어</div>
					</div>
				</div>
			</div>
		</div>
		<form action="">
			<!-- <div class="row">
				<div class="col-md-6 col-md-offset-3 marginTop30">
					<p>메모쓰기</p>
					<textarea name="memo" id="memo" rows="4" style="width: 600px;"></textarea>
				</div>
			</div> -->
			<div class="row">
				<div class="col-md-6 col-md-offset-3 marginTop30 ">
					<textarea name="memo" id="memo" class="form-control" rows="4" placeholder="메모쓰기"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="marginTop">
					<div id="report" class="btn-group dropdown col-md-2 col-md-offset-3" title="신고">
                         <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                             <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
                             Report
                         </a>
                         <ul class="dropdown-menu" role="menu">
	                         <li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw" aria-hidden="true"></i>오류 신고</a></li>
			                 <li><a href="#" title="유해물 신고"><i class="fa fa-ban fa-fw" aria-hidden="true"></i>유해물 신고</a></li>
                         </ul>
                     </div>
					
					<div class="col-md-push-1 col-md-3">
						<div class="btn-group">
							<select class="form-control" onchange="if (this.value) window.location.href = this.value;">
							<!-- 색 변경 이유  -->
								<option value="#">옮길 폴더 선택</option>
								<option value="#">my favorite</option>
								<option value="#">PlanB☆</option>
								<option value="#">나의 첫 폴더♡</option>
								<option value="#">+ 새 폴더 추가</option>
							</select>
						</div>
					</div>
					<div class="col-md-1">
						<a href="#" class="btn btn-primary pull-right">저장</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	
</section>
</body>
</html>