<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	회원 관리 페이지
	- 전체 및 등급별 조회, 정보 및 등급 수정, 휴면/활동 중지/강제 탈퇴
 --%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- 공통css  -->
 	<jsp:include page="/jsp/include/css.jsp" />
 	
<title>회원 관리 | Quration: 답을 열어 줄 그런 사람</title>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_admin.jsp" />
			<!-- /nav -->

			<!-- page content -->
			<div class="right_col" role="main">
				<section class="minHeight">
					<div id="container">
						<div class="row marginTop40">
							<div class="col-md-2">총 회원 ${ memberCnt } 명</div>
							<div class="col-md-8 col-md-push-2"></div>
							<div class="col-md-2">
								<select class="form-control" id="viewTypeList">
									<option value="all" selected="selected">전체 회원</option>
									<option value="F">프리</option>
									<option value="P">프리미엄</option>
									<option value="rest">휴면 계정</option>
									<option value="ban">활동 중지</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">&nbsp;</div>
						</div>
						<div class="row well">
							<div class="col-md-2">
								<input type="checkbox" id="allSelectToggle" alt="전체 선택, 선택 해제" />
								<label>전체 선택</label>
							</div>
							<div class="col-md-2">
								<select class="form-control" id="changeType">
									<option value="F">프리</option>
									<option value="P">프리미엄</option>
								</select>
							</div>
							<div class="col-md-2">
								<a href="javascript:updateType()" class="btn btn-default"
									role="button" title="선택한 등급으로 등급 변경">등급 변경</a>
							</div>
							<div class="col-md-5">
								<a href="javascript:updateRest()" class="btn btn-default"
									role="button" title="휴면 계정으로 설정">휴면 계정</a>
								<a href="javascript:updateBan()" class="btn btn-default"
									role="button" title="활동 중지로 설정">활동 중지</a>
								<a href="javascript:withdraw()" class="btn btn-default"
									role="button" title="휴면 계정으로 설정">강제 탈퇴</a>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table class="table atable">
									<thead>
										<tr>
											<th></th>
											<th>계정</th>
											<th>회원 등급</th>
											<th>휴면 계정 여부</th>
											<th>활동 중지 여부</th>
											<th>가입일</th>
											<th>최종 방문일</th>
											<th>신고</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${ memberList }">
											<tr>
												<td><input type="checkbox" alt="변경할 회원 선택 체크 박스" class="no" value=${ member.no } /></td>
												<td class="tleft">${ member.email }</td>
												<td>
													<c:choose>
														<c:when test="${ member.type == 'A' }">관리자</c:when>
														<c:when test="${ member.type == 'F' }">프리</c:when>
														<c:when test="${ member.type == 'P' }">프리미엄</c:when>
													</c:choose>
												</td>
												<td>${ member.rest }</td>
												<td>${ member.ban }</td>
												<td>${ member.regDate }</td>
												<td>${ member.lastDate }</td>
												<td>${ member.reportCnt }</td>
												<td><a href="javascript:updateUser(${ member.no })" class="btn btn-default btn-xs" role="button" title="선택한 회원 정보 수정 페이지로 이동">수정</a></td>
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
<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>

<!-- 공통 js -->
<jsp:include page="/jsp/include/commonJs.jsp" />

<!-- Custom Theme Scripts -->
<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
<script>
	$('#allSelectToggle').click(function() {
		if($(".no:checked").length < $(".no").length) $(".no").prop('checked', true);
		else $(".no").prop('checked', false);
	});
	
	$('#btnDeactivate').click(function() {
		$('.no:checked').each(function() {
	        alert($(this).val());
	   });
	});
	
	function checkedValue() {
		var checkboxValues = [];
		$('.no:checked').each(function() {
			checkboxValues.push($(this).val());
	    });
		
		return checkboxValues;
	}
	
	function updateRest() {
		var checkboxValues = checkedValue();
// 		console.log(checkboxValues);

		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/member_modify_rest.do",
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
	            alert("오류\n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
	
	function updateBan() {
		var checkboxValues = checkedValue();

		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/member_modify_ban.do",
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
	            alert("오류\n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
	
	function withdraw() {
		var checkboxValues = checkedValue();

		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/member_delete.do",
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
	            alert("오류\n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
	
	function updateType() {
		var checkboxValues = checkedValue();
// 		console.log(checkboxValues);
		
		var selectedValue = $('#changeType option:selected').val();
// 		console.log(selectedValue);
		
		var list = {
			"checkboxValues" : checkboxValues, 
			"selectedValue" : selectedValue 
		};
// 		console.log(list);
		
		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/member_modify_type.do",
	        type:'POST',
	        data: list, 
	        success:function(data){
	        	if(data == "완료")
	            alert("완료!");
	        	location.reload();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("오류\n" + textStatus + " : " + errorThrown);
	        }
	    });
	}

	$('#viewTypeList').change(function() {
		var option = $('#viewTypeList option:selected').val();
		location.href = "${ pageContext.request.contextPath }/jsp/admin/member_list.do?option=" + option;
	});
	
	$(document).ready(function() {
		$('#viewTypeList').val('${ option }').attr("selected", "selected");
	});
	
	function updateUser(no) {
		location.href="${ pageContext.request.contextPath }/jsp/admin/user_modify.do?no=" + no;
	}
</script>
</body>
</html>