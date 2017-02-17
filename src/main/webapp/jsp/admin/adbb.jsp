<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	광고 관리 페이지
	- 광고 조회, 추가, 수정
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
<title>광고 관리 | Quration: 답을 열어 줄 그런 사람</title>
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
						<div class="row marginTop60">
							<form id="contentForm" action="${ pageContext.request.contextPath }/jsp/admin/ad_add.do" 
									class="form-horizontal " method="post" enctype="multipart/form-data">
								<div class="form-group">
									<div class="col-md-6 col-md-offset-3">
										<textarea name="code" class="form-control marginBottom" rows="4" placeholder="광고 코드" title="광고 코드 입력 폼"></textarea>
										<div class="row">
								           <div class="col-md-12">
								               <div class="input-group  ">
									                 <input type="text" name="location" class="form-control" placeholder="광고 위치" alt="광고 코드 들어갈 위치 작성 폼"/>
									                 <span class="input-group-btn">
									                   <button type="submit" class="btn btn-default">추가</button>
									                 </span>
								               </div><!-- /input-group -->
								           </div><!-- /.col-lg-6 -->
								        </div><!-- /.row -->
									</div>
								</div>
							</form>
						</div>
		
						<div class="row  marginTop">
							<div class="col-md-2">
								<input type="checkbox" id="allSelectToggle"  alt="전체 선택" />
								<label for="allCheck" class="marginRight">전체 선택</label>
								<button type="button" id="btnDelete" class="btn btn-default">삭제</button>
							</div>
							<div class="pull-right ">
								<button type="button" id="adPositionBtn" class="btn btn-default">?</button>
							</div>
							<div id="adPositionModal" class="modal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title">광고 위치 보기</h4>
										</div>
										<div class="modal-body">
											<p>검색 결과 캡처 한 사진이 들어갈 예정입니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="table-responsive">
								<table class="table atable">
									<thead>
										<tr>
											<th></th>
											<th>광고 위치</th>
											<th>광고 코드</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="ad" items="${ adList }">
											<tr>
												<td class="vcenter"><input type="checkbox" class="no" value="${ ad.no }" alt="삭제할 광고 선택 체크 박스"/></td>
												<td class="tcenter vcenter">${ ad.location }</td>
												<td class="col-md-8 vcenter">${ ad.code }</td>
												<td class="tcenter">
													<div><button class="btn btn-default btn-xs">수정</button></div>
													<div><button class="btn btn-default btn-xs">삭제</button></div>
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

<script>
	$('#allSelectToggle').click(function() {
		if($(".no:checked").length < $(".no").length) $(".no").prop('checked', true);
		else $(".no").prop('checked', false);
	});
	$('#adPositionBtn').click(function() {
		$('#adPostionModal').show();
	});
</script>
</body>
</html>