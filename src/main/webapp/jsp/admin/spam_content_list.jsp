<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	스팸 콘텐츠 목록 페이지
	- 스팸 신고된 콘텐츠 리스트 조회, 차단, 삭제
 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>스팸 콘텐츠 리스트 | Quration: 답을 열어 줄 그런 사람</title>
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
							<div class="col-md-2">총 유해 게시물 개수 ${ spamCnt } 개</div>
							<div class="col-md-8 col-md-push-2"></div>
							<div class="col-md-2">
								<select class="form-control" id="viewTypeList">
									<option value="C" selected="selected">콘텐츠</option>
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
								<button type="button" id="btnDelete" class="btn btn-default">삭제</button>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th style="width: 20px;"></th>
											<th>콘텐츠 URL</th>
											<th>작성자 계정</th>
											<th>신고 횟수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="spam" items="${ spamList }">
											<tr>
												<td><input type="checkbox" class="no" value="${ spam.no }" alt="차단 및 삭제할 콘텐츠 선택 체크박스" /></td>
												<td>
													<a href="${ pageContext.request.contextPath }/contents.do?no=${ spam.contentsNo }&q=${ searchResult.query }" target="_blank" title="해당 페이지로 가는 링크">
														https://www.quration.herokuapp.com/contents.do?no=${ spam.contentsNo }
											</a>
												</td>
												<td>${ spam.email }</td>
												<td>${ spam.reportCnt }</td>
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
		$('#viewTypeList').val('${ option }').attr("selected", "selected");
	});
	
	$('#viewTypeList').change(function() {
		var option = $('#viewTypeList option:selected').val();
		location.href = "${ pageContext.request.contextPath }/jsp/admin/spam_content_list.do?type=" + option;
	});
</script>
</body>
</html>