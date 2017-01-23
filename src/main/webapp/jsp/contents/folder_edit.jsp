<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<!-- google analytics -->
<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	
	ga('create', 'UA-90558257-1', 'auto');
	ga('send', 'pageview');
</script>
</head>
<body class="nav-md">
	<div class="container body">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		<div class="main_container marginTop70">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<div class="right_col" role="main">
				<!-- page content -->

				<div class="container">
					<form>
						<div class="row">
							<button type="submit" class="btn btn-success col-md-offset-8" onsubmit="updateName()" title="전체 확인 버튼">확인</button>
							<button type="button" class="btn btn-default" onclick="" id="allSelectToggle" title="전체 선택 버튼">전체 선택</button>
							<button type="button" class="btn btn-default" onclick="deleteFolder()" title="삭제 버튼">삭제</button>
							<button type="button" class="btn btn-default" onclick="" title="취소 버튼">취소</button>
							<button type="button" class="btn btn-primary" onclick="location.href='${ pageContext.request.contextPath }/contents/drawer_folder.do'" title="편집 종료 버튼">편집 종료</button>
						</div>
						
						<c:forEach var="directory" items="${ folderList }">
							<div class="row">
								<hr/>
								<input type="checkbox" alt="변경할  폴더 선택 체크 박스" class="no" value=${ directory.no } />
								<span class="text-primary"><input type="text" name="name" id="name" value="${ directory.name }" placeholder="폴더이름을 입력하세요" alt="폴더 이름 입력 폼"/></span>&nbsp;&nbsp;
								<span class="text-muted">폴더 생성 날짜 : ${ directory.regDate }</span>
								<hr/>
							</div>
						</c:forEach>
						
					</form>
				</div>
				<!-- /page content -->
			</div>
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
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	<script>
		$('#allSelectToggle').click(function() {
			if($(".no:checked").length < $(".no").length) $(".no").prop('checked', true);
			else $(".no").prop('checked', false);
		});
		
		function checkedValue() {

		      var checkboxValues = [];
		      $(".no:checked").each(function() {
		          checkboxValues.push($(this).val());
		      });
		      
		      var name = $("#name").val();
		       
		      var allData = { "no": checkboxValues, "name": name };
		      
		      return allData;
		   }
		
		function updateName() {
		      var dataAll = checkedValue();

		      $.ajax({
		           url:"${ pageContext.request.contextPath }/contents/updateName.do",
		           type:'POST',
		           data: dataAll,  
		           success:function(data){
		              if(data == "완료")
		              	alert("완료!");
		              window.location.reload(true);
		           },
		           error:function(jqXHR, textStatus, errorThrown){
		               alert("냥냥펀치 \n" + textStatus + " : " + errorThrown);
		           }
		       });
		   }

	</script>
</body>
</html>