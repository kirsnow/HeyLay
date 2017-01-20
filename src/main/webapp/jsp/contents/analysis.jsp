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
<style>
	svg { width: 320px; height: 240px; border: 1px solid black; }
	.pie { fill: orange; stroke: white; }
</style>
		
<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- D3.js -->
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="nav-md">
	<div class="container body marginTop70">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		
		<div class="main_container">
			<!-- nav -->
				<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<!-- page content -->
			<div class="right_col" role="main">

				<div class="text-center" style="margin: 20px;">
					<h4>선호 자료는 좋아요 및 저장을 바탕으로 추출된 유형 및 분야 입니다.</h4>
				</div>
				<div class="container text-center">
					<div class="row">
						<div class="well div col-md-push-2 col-md-4" id="typeDiv">
							<h4>선호 자료 유형</h4>
							<span class="text-primary">논문&nbsp;Research Paper</span>
						</div>
						<div class="well div col-md-push-2 col-md-4" id="areaDiv">
							<h4>선호 자료 분야</h4>
							<span class="text-primary">① IT</span>&nbsp;<span class="text-primary">② 취미</span>&nbsp;<span class="text-primary">③ 정치</span>
						</div>
					</div>
					<div class="row">
						<div class="well div col-md-8 col-md-offset-2" id="mainSearch">
							<h4>주로 저장한 키워드의 분야</h4>
							<span class="text-primary">인공지능(AI)</span>
						</div>
					</div>
					<div class="row">
						<div class="well div col-md-8 col-md-offset-2" id="yearSearch">
							<h4>2017년  ${ userVO.firstName } 님의 주 검색어</h4>
							<span class="text-primary">챗봇</span>
						</div>
					</div>
					<div class="row">
						<div class="well div col-md-8 col-md-offset-2" id="graph">
							<h4>2016년</h4>
							<img alt="한 해 검색 결과 꺽은선 그래프"
								src="${ pageContext.request.contextPath }/img/graph.png">
						</div>
						<button id="joinOk">joinOk</button>
						<p id="demo"></p>
					</div>
					<div class="row">
						<svg class="well div col-md-8 col-md-offset-2" id="myGraph"></svg>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer -->
			<jsp:include page="/jsp/include/footer.jsp" />
			<!-- /footer -->
		</div>
	</div>
<<<<<<< HEAD
=======

>>>>>>> ffc660aa18394ddca5cf983dd18c3f11dfea3bf4
	
	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
<script>

	$.ajax({
		url : '${ pageContext.request.contextPath }/statics/savedSource.do',
        type: 'get',
        contentType: "application/json", 
        data : { "no" : '${ userVO.no}' },
        success : function(response){
        	var svgWidth = 320;	// SVG 요소의 넓이
        	var svgHeight = 240;	// SVG 요소의 높이
			var dataSet = [];
			for(var i = 0; i < response.staticsList.length; i++) {
				dataSet.push(response.staticsList[i].cnt);
			}
			// 원 그래프의 좌표값을 계산하는 메서드
			var pie = d3.layout.pie()	// 원 그래프 레이아웃
			// 원 그래프의 안쪽 반지름, 바깥쪽 반지름 설정
			var arc = d3.svg.arc().innerRadius(0).outerRadius(100)
			// 원 그래프 그리기
			var pieElements = d3.select("#myGraph")
			  .selectAll("path")	// path 요소 지정
			  .data(pie(dataSet))	// 데이터를 요소에 연결
			// 데이터 추가
			pieElements.enter()	// 데이터 수만큼 반복
			  .append("path")	// 데이터의 수만큼 path 요소가 추가됨
			  .attr("class", "pie")	// CSS 클래스 설정
			  .attr("transform", "translate(" + svgWidth/2 + ", " + svgHeight/2 + ")")    // 원 그래프의 중심으로 함
			  .style("fill", function(d, i){
					return ["#FCE4EC", "#F8BBD0", "#F48FB1", "#F06292", "#EC407A"][i];	// 표준 10색 중 색을 반환
				})
			  .transition()
			  .duration(1000)
			  .delay(function(d,i){   // 그릴 원 그래프의 시간을 어긋나게 표시
					return i*1000;
				})
			  .attrTween("d", function(d, i){	// 보간 처리
					var interpolate = d3.interpolate(
						{ startAngle : d.startAngle, endAngle : d.startAngle }, // 각 부분의 시작 각도
						{ startAngle : d.startAngle, endAngle : d.endAngle }    // 각 부분의 종료 각도
			       	 );
					return function(t){
						return arc(interpolate(t)); // 시간에 따라 처리
					}
				})
            },
            error : function() {
            	alert('ERROR');
            }
        });
	
</script>
</body>
</html>