<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	탈퇴 사유 목록 페이지
	- 회원들이 탈퇴할 때 입력한 사유 리스트 조회, 삭제
 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>탈퇴 회원 리스트 | Quration: 답을 열어 줄 그런 사람</title>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_admin.jsp" />
			<!-- /nav -->

			<!-- page content -->
			<div class="right_col" role="main">
				<section>
					<div id="container">
						<div class="row">
							<div class="col-md-12">&nbsp;</div>
						</div>
						<div class="row well">
							<div class="col-md-2">
								<input type="checkbox" id="allSelectToggle" alt="전체 선택" />
								<label>전체 선택</label>
							</div>
							<div class="col-md-2">
								<a href="javascript:deleteReason()" class="btn btn-default"
									role="button" title="선택한 탈퇴 사유 삭제">삭제</a>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th style="width: 20px;"></th>
											<th>아이디</th>
											<th class="ber">탈퇴 사유(선택)</th>
											<th class="bar">탈퇴 사유(사용자 입력)</th>
											<th class="bar">탈퇴 일시</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="withdraw" items="${ withdrawList }">
											<tr>
												<td><input type="checkbox" class="no" value="${ withdraw.memberNo }" alt="삭제할 탈퇴 사유 선택 체크박스" /></td>
												<td>${ withdraw.memberNo }</td>
												<td>${ withdraw.reasonSelect }</td>
												<td>${ withdraw.reasonInput }</td>
												<td>${ withdraw.regDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4 col-md-push-5"></div>
							<div class="col-md-5">
								<ul class="pagination">
									<li class="disabled"><a href="#">&laquo;</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
							<div class="col-md-3 col-md-offset-3"></div>
						</div>
					</div>
				</section>

			</div>
			<!-- /page content -->

			<!-- footer -->
			<jsp:include page="/jsp/include/footer.jsp" />
			<!-- /footer -->
		</div>
	</div>


<!-- jQuery -->
<script
	src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
<script>
	$('#allSelectToggle').click(function() {
		if($(".no:checked").length < $(".no").length) $(".no").prop('checked', true);
		else $(".no").prop('checked', false);
	});
	
	function checkedValue() {
		var checkboxValues = [];
		$('.no:checked').each(function() {
			checkboxValues.push($(this).val());
	    });
		
		return checkboxValues;
	}
	
	function deleteReason() {
		var checkboxValues = checkedValue();

		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/delete_reason.do",
	        type:'POST',
	        data: { 
	        	"checkboxValues" : checkboxValues
	        },  
	        success:function(data){
	        	if(data == "완료")
	            alert("완료!");
	        	location.reload();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("오류 \n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
</script>
</body>
</html>