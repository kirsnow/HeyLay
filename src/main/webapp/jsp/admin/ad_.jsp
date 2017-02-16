<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	광고 관리 페이지 (plan b)
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

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>광고 관리 | Quration: 답을 열어 줄 그런 사람</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<style>
.my-5 {
	margin: 25px 0;
}
.portlet {
	margin-bottom: 1em;
	padding: 0.3em;
/* 	cursor: pointer; */
	cursor: move;
}

.portlet-header {
	padding: 0.2em 0.3em;
	margin-bottom: 0.5em;
	position: relative;
}

.portlet-toggle {
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -8px;
}

.portlet-content {
	padding: 0.4em;
}

.portlet-placeholder {
	border: 1px dotted black;
	margin: 0 1em 1em 0;
	height: 50px;
}

.adui div, p, textarea, input[type=text] {
	border-radius: 5px;
	vertical-align: middle;
}

.adui div, p {
	text-align: center;
}

.adui textarea {
	border: none;
	width: 100%;
	box-sizing: border-box;
    resize: none;
}

.adui input[type=text] { 
	width: 100%;
	padding-left: 3%;
}

.top-nav, .bottom-footer { height: 50px; padding-top: 15px; }
.side-bread { height: 30px; padding-top: 5px; }
.content-result { height: 300px; padding-top: 50%; }
.content-filter { height: 150px; padding-top: 60px;}
</style>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<header>
				<jsp:include page="/jsp/include/nav_admin.jsp" />
			</header>

			<!-- page content -->
			<div class="right_col" role="main">
				<section>
					<div class="container">
						<div class="row adui">
							<div class="col-md-8 col-md-offset-2">
							
								<div class="row">
									<div class="col-md-12 my-5">
										<i class="fa fa-arrows fa-lg" aria-hidden="true"></i>
										마우스로 드래그 해서 원하는 위치에 놓으세요.
									</div>
								</div>
							
								<div class="row">
									<div class="col-md-12">
										<div class="nonDraggable">
										  <p class="ui-widget-header top-nav">검색바</p>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<div class="nonDraggable">
										  <p class="ui-widget-header side-bread">경로</p>
										</div>
									</div>
								</div>
								
								<div class="row">
									<c:forEach begin="1" end="3">
										<div class="col-md-3">
											<div class="nonDraggable">
											  <p class="ui-widget-header content-result">검색 결과</p>
											</div>
										</div>
									</c:forEach>
									<div class="col-md-3">
										<div class="nonDraggable">
										  <p class="ui-widget-header content-filter">필터</p>
										</div>
									</div>
								</div>
								
								<div class="row">
									<c:forEach begin="1" end="3" varStatus="loop">
										<div class="col-md-3">
											<div class="portlet">
												<input type="text" class="portlet-header" placeholder="사이트 이름을 입력하세요." id="name${ loop.count }" />
												<textarea data-autoresize placeholder="광고 코드를 입력하세요." id="code${ loop.count }"></textarea>	
											</div>
										</div>
									</c:forEach>
								</div>
								
								<div class="row">
									<c:forEach begin="1" end="3">
										<div class="col-md-3">
											<div class="nonDraggable">
											  <p class="ui-widget-header content-result">검색 결과</p>
											</div>
										</div>
									</c:forEach>
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<div class="nonDraggable">
										  <p class="ui-widget-header bottom-footer">푸터</p>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:updateAd()" class="btn btn-primary" role="button" title="입력한 광고 사이트 이름 및 코드를 적용">적용</a>
									</div>
								</div>
							</div>
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
	<%-- <script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script> --%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>

	<script>
		$(function() {
			var css_test_idx = 10;
// 			var quarter = parseInt($(this).width() / 40);
// 			console.log("quarter : ", quarter);
			
			$(".portlet")
					.draggable({ axis: "x" })
					.each(function(){
					    $(this).draggable({
					        containment: $(this).parent().parent()
					    });
					})
					.mousedown(function(){
				        $(this).css('z-index', css_test_idx);
				        css_test_idx++;
				    })
					.addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
					.find(".portlet-header")
					.addClass("ui-widget-header ui-corner-all")
					.prepend("<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

			$(".portlet-toggle").on("click", function() {
				var icon = $(this);
				icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
				icon.closest(".portlet").find(".portlet-content").toggle();
			});
			$( ".nonDraggable" ).draggable({ cancel: "p.ui-widget-header" });
		});
		
		jQuery.each(jQuery('textarea[data-autoresize]'), function() {
		    var offset = this.offsetHeight - this.clientHeight;
		 
		    var resizeTextarea = function(el) {
		        jQuery(el).css('height', 'auto').css('height', el.scrollHeight + offset);
		    };
		    jQuery(this).on('keyup input', function() { resizeTextarea(this); }).removeAttr('data-autoresize');
		});
		
		function updateAd() {
			var siteNames = [];
			var codes = [];
			var lefts = [];
			for(var i = 1; i <= 3; i++) {
				siteNames.push($('#name' + i).val());
				codes.push($('#code' + i).val());
				lefts.push(Math.floor($('#name' + i).offset().left));
			}
			
			var list = {
					"siteNames" : siteNames, 
					"codes" : codes,
					"lefts" : lefts 
				};
			
			$.ajax({
		        url:"${ pageContext.request.contextPath }/jsp/admin/ad_modify.do",
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