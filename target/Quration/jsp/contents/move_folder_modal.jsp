<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드 서랍 속 유형별 정렬 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>폴더 수정 모드 | Quration: 답을 열어줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css"
	type="text/css" rel="stylesheet">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<section>
		<div class="container text-center">
			<div class="row">
				<h4>이동할 폴더를 선택하세요</h4>
			</div>
			<div class="row">
				<div class="center-block">
				<form action="">
					<div class="form-group text-center col-md-4 col-md-offset-4">
						<select class="form-control" id="select">
							<option value="">폴더 선택</option>
							<option value="최근 수정 순">최근 수정 순</option>
							<option value="폴더 등록 순">폴더 등록 순</option>
							<option value="폴더 제목 순">폴더 제목 순</option>
						</select>
					</div>
					<div>
						<button type="submit" onsubmit="#" class="btn btn-pill-right btn-primary col-md-1">이동</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>