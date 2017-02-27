<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	콘텐츠 소스 관리 페이지
	- 사이트 조회, 추가, 수정, 차단, 삭제
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
<title>콘텐츠 소스 관리 | Quration: 답을 열어 줄 그런 사람</title>
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
							<form id="contentForm" action="${ pageContext.request.contextPath }/jsp/admin/source_add.do" 
									class="form-horizontal" method="post" enctype="multipart/form-data">
								<div class="form-group col-md-2">
									<select class="form-control" name="dataType" id="dataType">
										<c:forEach var="dt" items="${ dataTypeList }">
											<option value="${ dt.no }">${ dt.dataType }</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group col-md-12">
									<div class="row">
										<div class="col-md-2">
											<span><input type="text" name="name" id="name" class="form-control" placeholder="콘텐츠 이름" alt="콘텐츠 이름 작성" /></span>
										</div>
										<div class="col-md-2">
											<span><input type="text" name="url" id="url" class="form-control" placeholder="콘텐츠  URL" alt="콘텐츠 URL 작성" /></span>
										</div>
									</div>
								</div>
								<div class="form-group col-md-12">
									<div class="row">
										<div class="col-md-3">
											<span><input type="text" name="logoImg" id="logoImg" class="form-control" placeholder="콘텐츠 이미지 주소" alt="콘텐츠 이미지 주소 작성" /></span>
										</div>
										<div class="col-md-1">
											<span><button type="submit" class="btn btn-default">추가</button></span>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="row">
							<div class="col-md-2">총 콘텐츠 소스 ${ sourceCnt } 개</div>
							<div class="col-md-2 col-md-push-8">
								<select class="form-control" id="viewTypeList">
									<option value="0" selected="selected">전체 콘텐츠</option>
									<c:forEach var="dataType" items="${ dataTypeList }">
											<option value="${ dataType.no }">${ dataType.dataType }</option>
										</c:forEach>
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
								<a href="javascript:blockSource()" class="btn btn-default"
									role="button" title="선택한 콘텐츠 소스 차단">차단</a>
								<a href="javascript:deleteSource()" class="btn btn-default"
									role="button" title="선택한 콘텐츠 소스 삭제">삭제</a>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th></th>
											<th>로고</th>
											<th>타입</th>
											<th>이름</th>
											<th>URL</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="source" items="${ sourceList }">
											<tr>
												<td><input type="checkbox" class="no" value="${ source.no }" alt="삭제 및 차단할 콘텐츠 소스 선택 체크 박스"/></td>
												<td><img alt="로고 이미지" src="${ source.logoImg }" width="100px"></td>
												<td>${ source.dataTypeName }</td>
												<td>${ source.name }</td>
												<td>
													<a href="${ source.url }" target="_blank" title="해당 사이트로 가는 링크">${ source.url }</a>
												</td>
												<td>	
													<div><a href="${ pageContext.request.contextPath }/jsp/admin/source_block.do?no=${ source.no }" class="btn btn-default btn-xs"
															role="button" title="선택한 콘텐츠 소스 차단">차단</a></div>
													<div><a href="${ pageContext.request.contextPath }/jsp/admin/source_delete.do?no=${ source.no }" class="btn btn-default btn-xs"
															role="button" title="선택한 콘텐츠 소스 삭제">삭제</a></div>
												</td>
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
<!-- Bootstrap -->
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<!-- Custom Theme Scripts -->
<script	src="${ pageContext.request.contextPath }/js/custom.min.js"></script>

<script type="text/javascript">
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
	
	function deleteSource() {
		var checkboxValues = checkedValue();

		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/source_delete.do",
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
	
	function blockSource() {
		var checkboxValues = checkedValue();

		$.ajax({
	        url:"${ pageContext.request.contextPath }/jsp/admin/source_block.do",
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
	
	$('#viewTypeList').change(function() {
		var option = $('#viewTypeList option:selected').val();
		location.href = "${ pageContext.request.contextPath }/jsp/admin/source_list.do?option=" + option;
	});
	
	$(document).ready(function() {
		$('#viewTypeList').val('${ option }').attr("selected", "selected");
	});
</script>
</body>
</html>