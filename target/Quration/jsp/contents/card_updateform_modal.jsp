<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 카드 메모 수정 폼 모달 페이지 입니다. --%>
<!-- Bootstrap CSS SET -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>
<style type="text/css">
#cardImg {
	width: 150px;
}
</style>
<div id="cardUpdate">
	<div class="container text">
			<div class="page-header text-center">
			      <h2>카드 수정</h2>
			</div>
		<div class="row">
			<div class="col-md-2 col-md-offset-3" id="imgDiv">
				<img alt="카드이미지"
					src="${ pageContext.request.contextPath }/img/wikipedia_logo.png"
					id="cardImg">
			</div>
			<div class="col-md-6 col-md-offset-1 marginTop30">
				<div class="row">
					<div class="col-md-3">media</div>
					<div class="col-md-7">Wikipidea</div>
				</div>
				<div class="row">
					<div class="col-md-3">title</div> 
					<div class="col-md-7">자바란?</div>
				</div>
				<div class="row">
					<div class="col-md-3">contents</div>
					<div class="col-md-7">자바 (Java) - 객체 지향 프로그래밍 언어</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-md-offset-3 marginTop20">
				<p>남겨둔 메모</p>
				<textarea name="memo" id="memo" rows="10" style="width: 300px;">java의 정의, 메모해둠</textarea>
				<br />
			</div>
			<div class="col-md-5 col-md-offset-1 marginTop60">
				<div class="row">
					<div class="col-md-2">type</div>
					<div class="col-md-7">정의</div>
				</div>
				<div class="row">
					<div class="col-md-2">area</div>
					<div class="col-md-7"><input type="text" value="IT"  class="form-control" alt="분야 수정 폼 " /></div>
				</div>
				<div class="row">
					<div class="col-md-2">폴더</div>
					<div class="col-md-7">
						<select onchange="if (this.value) window.location.href = this.value;" class="form-control">
							<option value="#">my favorite</option>
							<option value="#">PlanB☆</option>
							<option value="#">나의 첫 폴더♡</option>
						</select>					
						<a href="#" class="btn btn-primary btn-sm">이동</a>
					</div>
				</div>
				<div class="row marginTop20">
					<div class="marginLeft10 col-md-3">
						<button class="btn btn-default btn-sm" onclick="">메모 삭제</button>
					</div>
					<div class="col-md-2">
						<button class="btn btn-default btn-sm" onclick="">수정</button>
					</div>
					<div class="col-md-5">
						<button class="btn btn-default btn-sm">취소(이전페이지)</button>			
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 col-md-offset-3 paddingTop">
				카드 저장 날짜 : 16/05/28&nbsp;&nbsp;/&nbsp;&nbsp;메모 수정 날짜 :
				16/05/28&nbsp;&nbsp;
				<button class="btn btn-default btn-xs" onclick="">카드 빼기</button>
			</div>
		</div>
	</div>
</div>