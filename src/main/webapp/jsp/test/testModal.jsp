<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 회원별 통계 분석 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>| Quration: 답을 열어줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
		<h3 class="smaller lighter blue no-margin modal-title">검수정보 등록</h3>
	</div>

	<div class="modal-body">테스트입니다.</div>

	<div class="modal-footer">
		<span class="btn btn-sm btn-warning" id="testDel"> 
			전체삭제<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
		</span> 
		<span class="btn btn-sm btn-success" id="testSave"> 
			저장<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
		</span>
		<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
			<i class="ace-icon fa fa-times"></i>닫기
		</button>
	</div>

</body>
</html>