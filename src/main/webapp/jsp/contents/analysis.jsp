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
						<div class="well div col-md-push-2 col-md-4">
							<h4>내가 자주 담은 사이트 타입</h4>
							<svg class="well div col-md-8 col-md-offset-2" id="myGraph2"></svg>
						</div>
						<div class="well div col-md-push-2 col-md-4">
							<h4>내가 자주 담은 사이트</h4>
							<svg class="well div col-md-8 col-md-offset-2" id="myGraph"></svg>
						</div>
					</div>
				</div>
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
			var arc = d3.svg.arc().innerRadius(30).outerRadius(100)
			// 원 그래프 그리기
			var pieElements = d3.select("#myGraph")
			  .selectAll("g")	// g 요소 지정
			  .data(pie(dataSet))	// 데이터를 요소에 연결
			  .enter()
			  .append("g")	// 무게 중심 계산을 위하 그룹화하기
			  .attr("transform", "translate("+svgWidth/2+", "+svgHeight/2+")")    // 원 그래프의 중심으로 함
			// 데이터 추가
			pieElements	// 데이터 수만큼 반복
			  .append("path")	// 데이터의 수만큼 path 요소가 추가됨
			  .attr("class", "pie")	// CSS 클래스 설정
			  .style("fill", function(d, i){
					return ["#C5CAE9", "#9FA8DA", "#7986CB", "#5C6BC0", "#3F51B5"][i];	// 통신사의 색을 반환
				})
			  .transition()
			  .duration(200)
			  .delay(function(d,i){   // 그릴 원 그래프의 시간을 어긋나게 표시
					return i*200;
				})
			  .ease("linear")	// 직선적인 움직임으로 변경
			  .attrTween("d", function(d, i){	// 보간 처리
					var interpolate = d3.interpolate(
						{ startAngle : d.startAngle, endAngle : d.startAngle }, // 각 부분의 시작 각도
						{ startAngle : d.startAngle, endAngle : d.endAngle }    // 각 부분의 종료 각도
	       			 );
					return function(t){
						return arc(interpolate(t)); // 시간에 따라 처리
					}
				})
			// 합계와 문자 표시
// 			var textElements = d3.select("#myGraph")
// 			  .append("text")	// text 요소 추가
// 			  .attr("class", "total")	// CSS 클래스 설정
// 			  .attr("transform", "translate("+svgWidth/2+", "+(svgHeight/2+5)+")")    // 가운데에 표시
// 			  .text("점유율")	// 문자 표시
			// 숫자를 부채꼴의 가운데 표시
			pieElements
			  .append("text")	// 데이터의 수만큼 text 요소가 추가됨
			  .attr("class", "pieNum")	// CSS 클래스 설정
			  .attr("transform", function(d, i){
					return "translate("+arc.centroid(d)+")";    // 부채꼴의 중심으로 함
				})
			  .text(function(d, i){
					return d.value;	// 값 표시
				})
            },
            error : function() {
            	alert('ERROR');
            }
        });
	
// 	$.ajax({
// 		url : '${ pageContext.request.contextPath }/statics/sourceType.do',
//         type: 'get',
//         contentType: "application/json", 
//         data : { "no" : '${ userVO.no}' },
//         success : function(response){
//         	var svgWidth = 320;	// SVG 요소의 넓이
//         	var svgHeight = 240;	// SVG 요소의 높이
// 			var dataSet = [];
// 			for(var i = 0; i < response.staticsList.length; i++) {
// 				dataSet.push(response.staticsList[i].cnt);
// 			}
// 			// 원 그래프의 좌표값을 계산하는 메서드
// 			var pie = d3.layout.pie()	// 원 그래프 레이아웃
// 			// 원 그래프의 안쪽 반지름, 바깥쪽 반지름 설정
// 			var arc = d3.svg.arc().innerRadius(30).outerRadius(100)
// 			// 원 그래프 그리기
// 			var pieElements = d3.select("#myGraph2")
// 			  .selectAll("g")	// g 요소 지정
// 			  .data(pie(dataSet))	// 데이터를 요소에 연결
// 			  .enter()
// 			  .append("g")	// 무게 중심 계산을 위하 그룹화하기
// 			  .attr("transform", "translate("+svgWidth/2+", "+svgHeight/2+")")    // 원 그래프의 중심으로 함
// 			// 데이터 추가
// 			pieElements	// 데이터 수만큼 반복
// 			  .append("path")	// 데이터의 수만큼 path 요소가 추가됨
// 			  .attr("class", "pie")	// CSS 클래스 설정
// 			  .style("fill", function(d, i){
// 					return ["#C8E6C9", "#A5D6A7", "#81C784", "#66BB6A", "#4CAF50"][i];	// 통신사의 색을 반환
// 				})
// 			  .transition()
// 			  .duration(200)
// 			  .delay(function(d,i){   // 그릴 원 그래프의 시간을 어긋나게 표시
// 					return i*200;
// 				})
// 			  .ease("linear")	// 직선적인 움직임으로 변경
// 			  .attrTween("d", function(d, i){	// 보간 처리
// 					var interpolate = d3.interpolate(
// 						{ startAngle : d.startAngle, endAngle : d.startAngle }, // 각 부분의 시작 각도
// 						{ startAngle : d.startAngle, endAngle : d.endAngle }    // 각 부분의 종료 각도
// 	       			 );
// 					return function(t){
// 						return arc(interpolate(t)); // 시간에 따라 처리
// 					}
// 				})
// 			// 합계와 문자 표시
// 			var textElements = d3.select("#myGraph2")
// 			  .append("text")	// text 요소 추가
// 			  .attr("class", "total")	// CSS 클래스 설정
// 			  .attr("transform", "translate("+svgWidth/2+", "+(svgHeight/2+5)+")")    // 가운데에 표시
// 			  .text("합계: " + d3.sum(dataSet))	// 합계 표시
// 			// 숫자를 부채꼴의 가운데 표시
// 			pieElements
// 			  .append("text")	// 데이터의 수만큼 text 요소가 추가됨
// 			  .attr("class", "pieNum")	// CSS 클래스 설정
// 			  .attr("transform", function(d, i){
// 					return "translate("+arc.centroid(d)+")";    // 부채꼴의 중심으로 함
// 				})
// 			  .text(function(d, i){
// 					return d.value;	// 값 표시
// 				})
//             },
//             error : function() {
//             	alert('ERROR');
//             }
//         });


	$.ajax({
		url : '${ pageContext.request.contextPath }/statics/sourceType.do',
        type: 'get',
        contentType: "application/json", 
        data : { "no" : '${ userVO.no}' },
        success : function(response){
        	var w = 220;
			var h = 220;
			var r = h / 2;

			var color = d3.scale
					.ordinal()
					.range(["#C8E6C9", "#A5D6A7", "#81C784", "#66BB6A", "#4CAF50"]); //GPVF
									
			var ydata= [{"good":5,"pto":10,"v":25,"f":8}];						
						
			var data = [];
			
			for(var i = 0; i < response.staticsList.length; i++) {
				data.push({
					"label" : response.staticsList[i].columnName, 
					"value" : response.staticsList[i].cnt
				});
			}

			var vis = d3
					.select("#myGraph2")
					.append(
							"svg:svg")
					.data([ data ])
					.attr("width",
							w)
					.attr("height",
							h)
					.append("svg:g")
					.attr(
							"transform",
							"translate("
									+ r
									+ ","
									+ r
									+ ")");
			var pie = d3.layout
					.pie()
					.value(
							function(
										d) {
								return d.value;
							});

			var arc = d3.svg.arc()
					.outerRadius(r);

			var arcs = vis
					.selectAll(
							"g.slice")
					.data(pie)
					.enter()
					.append("svg:g")
					.attr("class",
							"slice");

			arcs
					.append(
							"svg:path")
					.attr(
							"fill",
							function(
										d,
										i) {
								return color(i);
								// return color(d.data.value)
							})
					.attr(
							"d",
							function(
										d) {
								return arc(d);
							})
					.attr('stroke',
							'#fff')
					// <-- THIS
					.attr(
							'stroke-width',
							'3');

			// add the text
			arcs
					.append(
							"svg:text")
					.attr(
							"transform",
							function(d) {
								d.innerRadius = 0;
								d.outerRadius = 0;
								var c  =arc.centroid(d);
								return "translate(" + c[0] + "," + c[1] + ")";
							})
					.attr("text-anchor","middle")
					.attr("dominant-baseline", "central")
					.style("font-size","20px")
					.style("text-decoration","bold")
					.text(
							function(
										d,
										i) {
								return data[i].label;
							});	
			arcs
			.append(
					"svg:text")
			.attr(
					"transform",
					function(d) {
						var c = arc.centroid(d);
						return "translate("+ c[0] + "," + c[1] + ")";	})
			.attr('dy', '2em')
			.attr("text-anchor", "middle")
			.style("font-size","12px")
			.style("text-decoration","bold")
			.text(
					function(
								d,
								i) {
						return data[i].value;
					});	
            },
            error : function() {
            	alert('ERROR');
            }
        });
</script>
</body>
</html>