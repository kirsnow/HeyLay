<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 회원별 통계 분석 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>통계 상세 보기 | Quration: 답을 열어 줄 그런 사람</title>
<style>
	svg { width: 840px; height: 250px; }
	.bar { fill : #BDBDBD; }
	.barNum {
		font-size: 15pt;
		text-anchor : middle;
	}
	.axis text {
		font-family: sans-serif;
		font-size: 11px;
	}
	.axis path,
	.axis line {
		fill: none;
		stroke: black;
	}
	.axis_x line {
		fill: none;
		stroke: black;
	}
	.barName {
		font-size: 13px;
		text-anchor : middle;
	}
	.row .scene_wrapper {
		height: 700px;
	}
	.scene1 {
		text-align: center;
	    background: url('${ pageContext.request.contextPath }'/img/sample/back1.png) no-repeat bottom center;
	    height: 700px;
	    background-color: #F7F7F7;
	}
	.scene2 {
		text-align: center;
	    background: url('${ pageContext.request.contextPath }'/img/sample/back2.png) no-repeat center;
	    background-size: 1200px;
	    height: 700px;
	    background-color: #ffffff;
	}
	.u_color {
		color: #03A9F4;
	}
	.scene_n3 {
		font-size: 30px;
	    font-weight: 100;
	    letter-spacing: -.05em;
	    line-height: 140%;
	    color: #999999;
	}
	.scene_n4 {
		font-size: 30px;
	    font-weight: 100;
	    letter-spacing: -.05em;
	    line-height: 140%;
	}
	.scene4, .scene6 {
		background-color: #ffffff;
	}
	.tCenter .i {
		margin-bottom: 10px;
		margin-top: 10px;
	}
</style>
		
<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

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
	<div class="container body marginTop60">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		
		<div class="main_container">
			<!-- nav -->
				<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<!-- page content -->
			<div class="right_col" role="main">
				<section>
					<div class="container text-center">
						<div class="row scene1">
							<div class="div col-md-12 scene_wrapper">
								<h3 class="marginTop60">${ userVO.lastName } ${ userVO.firstName } 님은 큐레이션을 통해,<br/>총 <span class="u_color">${ countTotalSaved }</span>개의 카드를 만났습니다.</h3>
							</div>
						</div>
						<div class="row scene2">
							<div class="div col-md-8 col-md-offset-2 scene_wrapper">
								<div class="row">
									<div class="div col-md-4">
										<h3 class="marginTop60">어제보다는 
										<c:choose>
											<c:when test="${ countTodaySaved > countYesSaved }"> <span class="u_color">${ countTodaySaved - countYesSaved }개</span> 더, </c:when>
											<c:when test="${ countTodaySaved eq countYesSaved }"> <span class="u_color">${ countTodaySaved - countYesSaved }개</span> 같게, </c:when>
											<c:otherwise> <span class="u_color">${ countYesSaved - countTodaySaved }개</span> 덜, </c:otherwise>
										</c:choose>
										<br/>
										그저께보다는 
										<c:choose>
											<c:when test="${ countTodaySaved > countBeforeYesSaved }"> <span class="u_color">${ countTodaySaved - countBeforeYesSaved }개</span> 더, </c:when>
											<c:when test="${ countTodaySaved eq countBeforeYesSaved }"> <span class="u_color">${ countTodaySaved - countBeforeYesSaved }개</span> 같게, </c:when>
											<c:otherwise> <span class="u_color">${ countBeforeYesSaved - countTodaySaved }개</span> 덜, </c:otherwise>
										</c:choose>
										<br/>
										카드를 담으셨습니다.
										</h3>
									</div>
								</div>
								<div class="row tCenter">
									<div class="div col-md-2"><h3><span class="scene_n3">그저께</span><br/> ${ countBeforeYesSaved }개</h3></div>
									<div class="div col-md-2">
										<c:choose>
											<c:when test="${ countBeforeYesSaved > countYesSaved }"><i class="fa fa-chevron-right fa-5x" aria-hidden="true"></i></c:when>
											<c:when test="${ countBeforeYesSaved < countYesSaved }"><i class="fa fa-chevron-left fa-5x" aria-hidden="true"></i></c:when>
											<c:otherwise><img src="http://image.aladin.co.kr/img/events/book/2015/2015_award_records_i3.png"></c:otherwise>
										</c:choose>
									</div>
									<div class="div col-md-2"><h3><span class="scene_n3">어제</span><br/> ${ countYesSaved }개</h3></div>
								</div>
							</div>
						</div>
						<div class="row scene3">
							<div class="div col-md-12 scene_wrapper">
								<div class="row">
									<div class="div col-md-12">
										<h3><span class="scene_n4">월 평균 저장 카드 개수</span><br/>${ averageSavedMonth }개</h3>
									</div>
								</div>
								<div class="row">
									<div class="div col-md-12">
										<svg id="myGraph" class="marginTop180"></svg>
									</div>
								</div>
								<div class="row">
									<div class="div col-md-12 mon_text marginTop30">
									</div>
								</div>
							</div>
						</div>
						<div class="row scene4">
							<div class="div col-md-12 scene_wrapper">
								<h3 class="marginTop60">${ userVO.lastName } ${ userVO.firstName } 님이 사랑하는 사이트는 <span class="u_color">${ likeSourceList[0].columnName }</span>입니다.</h3>
								<c:forEach var="likeSource" items="${ likeSourceList }">
									${ likeSource.columnName }
								</c:forEach>
							</div>
						</div>
						<div class="row scene5">
							<div class="div col-md-12 scene_wrapper">
								<h3 class="marginTop60">${ userVO.lastName } ${ userVO.firstName } 회원님이 담은 카드 중<br/>가장 많은 분들의 사랑을 받은 카드입니다.</h3>
<%-- 								<c:forEach var="savedMoreSaved" items="${ savedMoreSavedList }"> --%>
<!-- 									<div> -->
<%-- 										<img alt="" src="${ savedMoreSaved.data }"> --%>
<%-- 										${ savedMoreSaved.columnName } --%>
<!-- 									</div> -->
<%-- 								</c:forEach> --%>
								<c:set var="cards" value="${ savedMoreSavedList }" scope="request" />
								<section class="col-xs-12 card-container mdl-grid">
									<jsp:include page="/jsp/component/card.jsp"/>
								</section>
							</div>
						</div>
						<div class="row scene6">
							<div class="div col-md-12 scene_wrapper">
								<h3 class="marginTop60">담은 카드 중 소수만이 담은,<br/>희소성이 있는 카드입니다.</h3>
<%-- 								<c:forEach var="savedLessSaved" items="${ savedLessSavedList }"> --%>
<!-- 									<div> -->
<%-- 										<img alt="" src="${ savedLessSaved.data }"> --%>
<%-- 										${ savedLessSaved.columnName } --%>
<!-- 									</div> -->
<%-- 								</c:forEach> --%>
								<c:set var="cards" value="${ savedLessSavedList }" scope="request" />
								<section class="col-xs-12 card-container mdl-grid">
									<jsp:include page="/jsp/component/card.jsp"/>
								</section>
							</div>
						</div>
						<div class="row scene7">
							<div class="div col-md-12 scene_wrapper">
								<h3 class="marginTop60">담은 카드 중<br/>다른 회원님들로부터 좋은 평가를 받은 카드입니다.</h3>
<%-- 								<c:forEach var="savedLike" items="${ savedLikeList }"> --%>
<!-- 									<div> -->
<%-- 										<img alt="" src="${ savedLike.data }"> --%>
<%-- 										${ savedLike.columnName } --%>
<!-- 									</div> -->
<%-- 								</c:forEach> --%>
								<c:set var="cards" value="${ savedLikeList }" scope="request" />
								<section class="col-xs-12 card-container mdl-grid">
									<jsp:include page="/jsp/component/card.jsp"/>
								</section>
							</div>
						</div>
						<div class="row scene8">
							<div class="div col-md-12 scene_wrapper">
								<h3 class="marginTop70">THANK YOU, ${ userVO.lastName } ${ userVO.firstName }<br/>오늘 하루도 함께여서 행복했어요!</h3>
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
<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<!-- D3.js -->
<script src="${ pageContext.request.contextPath }/js/d3.v3.min.js" charset="utf-8"></script>

<!-- Custom Theme Scripts -->
<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
<script>
	$.ajax({
		url : '${ pageContext.request.contextPath }/statics/savedMonth.do',
	    type: 'get',
	    contentType: "application/json", 
	    data : { "no" : '${ userVO.no}' },
	    success : function(response){
			var svgHeight = 240;	// SVG 요소의 높이
			var offsetX = 30;	// X 좌표의 오프셋(어긋남의 정도)
			var offsetY = 20;	// Y 좌표의 오프셋(어긋남의 정도)
			var barElements;	// 막대그래프의 막대 요소를 저장할 변수
			var dataSet = [];
			
			for(var i = 0; i < response.staticsList.length; i++) {
				dataSet.push({
					"label" : response.staticsList[i].columnName, 
					"value" : response.staticsList[i].cnt
				});
			}
			
			// 그래프 그리기
			barElements = d3.select("#myGraph")
				.selectAll("rect")	// rect 요소를 지정
				.data(dataSet)	// 데이터를 요소에 연결
			// 데이터 추가
			barElements.enter()	// 데이터 수만큼 반복
				.append("rect")	// 데이터 수만큼 rect 요소가 추가됨
				.attr("class", "bar")	// CSS 클래스 설정
				.attr("height", function(d,i){	// 넓이 설정. 2번째의 파라미터에 함수를 지정
					return d.value * 10;	// 데이터 값을 그대로 높이로 지정
				})
				.attr("width", 50)	// 넓이 지정
				.attr("x", function(d, i){
					return i * 70 + offsetX;		// X 좌표를 표시 순서
				})
				.attr("y", function(d, i){	// Y 좌표를 지정
					return svgHeight - (d.value * 10) - offsetY;	// Y 좌표를 계산
				})
				
			var maxCnt = 0;
			var maxLabel = '3';
			for(var i = 0; i < response.staticsList.length; i++) {
				if(maxCnt < response.staticsList[i].cnt) { 
					maxCnt = response.staticsList[i].cnt;
					maxLabel = response.staticsList[i].columnName;
				}
			}
			$('.mon_text').html('<h3>가장 카드를 많이 저장한 달은 <span class="u_color">' + maxLabel + '월</span>입니다.</h3>');
			
			console.log("maxLabel: ", maxLabel);
			console.log("maxCnt: ", maxCnt);
			console.log("barElements.attr(height): ", barElements.attr("height"));
			
			if(barElements.attr("height") == (maxCnt * 10)) {
				var maxElement = barElements;
				console.log("barElements: ", barElements);
				barElements.style("fill", "#03A9F4");
			}

// 			barElements.style("fill", "#03A9F4");

// 			barElements.on(function() {
// 				barElements.attr("height") == maxCnt
// 			});
			
			barElements.enter()	// text 요소 지정
				.append("text")	// text 요소 추가
				.attr("class", "barNum")	// CSS 클래스 설정
				.attr("x", function(d, i){	// X 좌표를 지정
					return i * 65 + 25 + offsetX;	// 막대그래프의 표시 간격을 맞춤
				})
				.attr("y", function(d, i){
					return svgHeight - (d.value * 10) - offsetY - 5;	// Y 좌표를 지정
				})
				.text(function(d, i){	// 데이터 표시
					return d.value;
				})
			// 가로 방향의 선을 표시●↓
			d3.select("#myGraph")
				.append("rect")
				.attr("class", "axis_x")
				.attr("width", 1000)
				.attr("height", 1)
				.attr("transform", "translate(" + (offsetX - 200) + ", " + (svgHeight-offsetY) + ")")
			// 막대의 레이블을 표시
			barElements.enter()
				.append("text")
				.attr("class", "barName")
				.attr("x", function(d, i){	// X 좌표를 지정
					return i * 65 + 30 + offsetX;	// 막대그래프의 표시 간격을 맞춤
				})
				.attr("y", svgHeight-offsetY+15)
				.text(function(d, i){
					return dataSet[i].label;	// 레이블 이름을 반환
				})
	    },
        error : function() {
        	alert('ERROR');
        }
    });
</script>
</body>
</html>