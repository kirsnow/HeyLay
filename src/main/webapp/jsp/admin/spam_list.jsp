<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	스팸 신고 목록 페이지
	- 스팸 신고 내역 리스트 조회, 삭제
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
<title>스팸 신고 리스트 | Quration: 답을 열어 줄 그런 사람</title>
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
						<div class="row marginTop40">
							<div class="col-md-2">총 신고 건수 ${ spamCnt } 개</div>
							<div class="col-md-8 col-md-push-2"></div>
							<div class="col-md-2">
								<select class="form-control" id="viewTypeList">
									<option value="C">콘텐츠</option>
									<option value="M">메모</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">&nbsp;</div>
						</div>
						<div class="row well">
							<div class="col-md-2">
								<input type="checkbox" id="allSelectToggle" alt="전체 선택" />
								<label>전체 선택</label>
							</div>
							<div class="col-md-2">
								<a href="javascript:updateBan()" class="btn btn-default"
										role="button" title="선택한 신고 게시물 차단">차단</a>
								<a href="javascript:deleteReport()" class="btn btn-default"
									role="button" title="선택한 신고 게시물 삭제">삭제</a>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th></th>
											<th>콘텐츠 URL</th>
											<th>신고자 계정</th>
											<th>피신고자 계정</th>
											<th>신고 분류</th>
											<th>신고일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="spam" items="${ spamList }">
											<tr>
												<td><input type="checkbox" id="no" class="no" value="${ spam.no }" alt="스팸 목록 선택 체크박스" /></td>
												<td><a href="javascript:linkSpamReport(${ spam.no })" title="해당 페이지로 가는 링크">
														https://www.quration.herokuapp.com/spam_detail.do?no=${ spam.no }</a></td>
												<td>${ spam.email }</td>
												<td>${ spam.reported }</td>
												<td>${ spam.selected }</td>
												<td>${ spam.regDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-4 col-md-push-5"></div> -->
<!-- 							<div class="col-md-5"> -->
<!-- 								<ul class="pagination"> -->
<!-- 									<li class="disabled"><a href="#">&laquo;</a></li> -->
<!-- 									<li class="active"><a href="#">1</a></li> -->
<!-- 									<li><a href="#">2</a></li> -->
<!-- 									<li><a href="#">3</a></li> -->
<!-- 									<li><a href="#">4</a></li> -->
<!-- 									<li><a href="#">5</a></li> -->
<!-- 									<li><a href="#">&raquo;</a></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-3 col-md-offset-3"></div> -->
<!-- 						</div> -->
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

	$(document).ready(function() {
		$('#viewTypeList').val('${ type }').attr("selected", "selected");
	});
	
	function linkSpamReport(no) {
		var option = $('#viewTypeList option:selected').val();
		location.href = "${ pageContext.request.contextPath }/jsp/admin/spam_detail.do?no=" + no + "&type=" + option;
	}
	
	$('#viewTypeList').change(function() {
		var option = $('#viewTypeList option:selected').val();
		location.href = "${ pageContext.request.contextPath }/jsp/admin/spam_list.do?type=" + option;
	});
	
	function checkedValue() {
		var checkboxValues = [];
		$('.no:checked').each(function() {
			checkboxValues.push($(this).val());
	    });
		
		return checkboxValues;
	}
	
	function updateBan() {
		var checkboxValues = checkedValue();
		
		var selectedValue = $('#viewTypeList option:selected').val();
		
		var list = {
			"checkboxValues" : checkboxValues, 
			"selectedValue" : selectedValue 
		};

		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/spam_modify_ban.do",
	        type:'POST',
	        data: list, 
	        success:function(data){
	        	if(data == "완료")
	            alert("완료!");
	        	location.reload();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생 ㅅㅂ \n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
	
	function deleteReport() {
		var checkboxValues = checkedValue();
		
		var selectedValue = $('#viewTypeList option:selected').val();
		
		var list = {
			"checkboxValues" : checkboxValues, 
			"selectedValue" : selectedValue 
		};

		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/spam_delete.do",
	        type:'POST',
	        data: list, 
	        success:function(data){
	        	if(data == "완료")
	            alert("완료!");
	        	location.reload();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생 ㅅㅂ \n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
	
</script>
</body>
</html>