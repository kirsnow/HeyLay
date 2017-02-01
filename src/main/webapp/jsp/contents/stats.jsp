<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	svg { width: 320px; height: 210px; }
	.pie { fill: orange; stroke: white; stroke-width: 3;}
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
				<section>
					<div class="container text-center">
						<c:choose>
							<c:when test="${ empty staticsList }">
								 <div class="row">
									<div>아직 카드를 담지 않았군요 카드를 담아볼까요!</div>
								 </div> 
				            </c:when>
				       		<c:otherwise> 
								<div class="row">
									<div class="well div col-md-push-2 col-md-4">
										<h4 class="text-center">${ userVO.firstName } 님이 자주 담은 사이트 유형</h4>
										<svg class="col-md-offset-1" id="myGraph"></svg>
										<div id="rmfo"></div>
									</div>
									<div class="well div col-md-push-2 col-md-4">
										<h4 class="text-center">${ userVO.firstName } 님이 자주 담은 사이트</h4>
										<svg class="col-md-offset-1" id="myGraph2"></svg>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
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
		url : '${ pageContext.request.contextPath }/statics/sourceType.do',
	    type: 'get',
	    contentType: "application/json", 
	    data : { "no" : '${ userVO.no}' },
	    success : function(response){
	    	var svgWidth = 200;	// SVG 요소의 넓이
	    	var svgHeight = 200;	// SVG 요소의 높이
	    	var r = svgHeight / 2;
	    	
			var dataSet = [];
			
			for(var i = 0; i < response.staticsList.length; i++) {
				dataSet.push({
					"label" : response.staticsList[i].columnName, 
					"value" : response.staticsList[i].cnt
				});
			}
			
			var vis = d3
					.select("#myGraph")
					.append("svg:svg")
					.data([ dataSet ])
					.attr("width", svgWidth)
					.attr("height", svgHeight)
					.append("svg:g")
					.attr("transform", "translate(" + svgWidth/2 + ", " + svgHeight/2 + ")");
			
			// 원 그래프의 좌표값을 계산하는 메서드
			var pie = d3.layout.pie()	// 원 그래프 레이아웃
						.value(function(d) {
									return d.value;
								});
			// 원 그래프의 안쪽 반지름, 바깥쪽 반지름 설정
			var arc = d3.svg.arc().outerRadius(r)
			// 원 그래프 그리기
			
			var pieElements = vis.selectAll("g.slice")
									.data(pie)
									.enter()
									.append("svg:g")
									.attr("class", "slice");
			
			pieElements	// 데이터 수만큼 반복
			  .append("svg:path")	// 데이터의 수만큼 path 요소가 추가됨
			  .attr("class", "pie")	// CSS 클래스 설정
			  .style("fill", function(d, i){
					return ["#C8E6C9", "#A5D6A7", "#81C784", "#66BB6A", "#4CAF50"][i];	// 통신사의 색을 반환
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
				
			pieElements.append("text")
						.attr("transform", function(d) {
										d.innerRadius = 0;
										d.outerRadius = 0;
										var c  =arc.centroid(d);
										return "translate(" + c[0] + "," + c[1] + ")";
									})
						.attr("text-anchor","middle")
						.attr("dominant-baseline", "central")
						.style("font-size","15px")
						.style("text-decoration","bold")
						.text(function(d, i) {
									return dataSet[i].label;
								})
			pieElements.append("svg:text")
					.attr("transform", function(d) {
							var c = arc.centroid(d);
							return "translate("+ c[0] + "," + c[1] + ")";	})
					.attr('dy', '2em')
					.attr("text-anchor", "middle")
					.style("font-size","12px")
					.style("text-decoration","bold")
					.text(function(d, i) {
							return dataSet[i].value;
						})
        },
        error : function() {
        	alert('ERROR');
        }
    });

	$.ajax({
		url : '${ pageContext.request.contextPath }/statics/savedSource.do',
        type: 'get',
        contentType: "application/json", 
        data : { "no" : '${ userVO.no}' },
        success : function(response){
        	var svgWidth = 200;	// SVG 요소의 넓이
        	var svgHeight = 200;	// SVG 요소의 높이
        	var r = svgHeight / 2;
        	
			var dataSet = [];
			
			for(var i = 0; i < response.staticsList.length; i++) {
				dataSet.push({
					"label" : response.staticsList[i].columnName, 
					"value" : response.staticsList[i].cnt
				});
			}
			
			var vis = d3
					.select("#myGraph2")
					.append("svg:svg")
					.data([ dataSet ])
					.attr("width", svgWidth)
					.attr("height", svgHeight)
					.append("svg:g")
					.attr("transform", "translate(" + svgWidth/2 + ", " + svgHeight/2 + ")");
			
			// 원 그래프의 좌표값을 계산하는 메서드
			var pie = d3.layout.pie()	// 원 그래프 레이아웃
						.value(function(d) {
									return d.value;
								});
			// 원 그래프의 안쪽 반지름, 바깥쪽 반지름 설정
			var arc = d3.svg.arc().outerRadius(r)
			// 원 그래프 그리기
			
			var pieElements = vis.selectAll("g.slice")
									.data(pie)
									.enter()
									.append("svg:g")
									.attr("class", "slice");
			
			pieElements	// 데이터 수만큼 반복
			  .append("svg:path")	// 데이터의 수만큼 path 요소가 추가됨
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
				
			pieElements.append("text")
						.attr("transform", function(d) {
										d.innerRadius = 0;
										d.outerRadius = 0;
										var c  =arc.centroid(d);
										return "translate(" + c[0] + "," + c[1] + ")";
									})
						.attr("text-anchor","middle")
						.attr("dominant-baseline", "central")
						.style("font-size","15px")
						.style("text-decoration","bold")
						.text(function(d, i) {
									return dataSet[i].label;
								})
			pieElements.append("svg:text")
						.attr("transform", function(d) {
								var c = arc.centroid(d);
								return "translate("+ c[0] + "," + c[1] + ")";	})
						.attr('dy', '2em')
						.attr("text-anchor", "middle")
						.style("font-size","12px")
						.style("text-decoration","bold")
						.text(function(d, i) {
								return dataSet[i].value;
							})
            },
            error : function() {
            	alert('ERROR');
            }
        });
	
</script>
</body>
</html>