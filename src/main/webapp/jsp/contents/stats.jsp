<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	svg { width: 250px; height: 250px; }
	.pie { fill: orange; stroke: white; stroke-width: 3;}
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
<style type="text/css">
	.row .scene_wrapper {
		height: 700px;
	}
</style>
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
						<div class="row scene1">
							<div class="div col-md-12 scene_wrapper">
								<h2>${ userVO.firstName } 님은 큐레이션을 통해,<br/>총 개의 카드를 만났습니다.</h2>
								<div class="row card-container mdl-grid">
					                <!-- card -->
					                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
					                    <!-- card top: contents source -->
					                    <div class="mdl-card__title mdl-color-text--grey-500">
					                        <span class="label label-default">분야</span>
				                            <span class="label label-info">유형</span>
				                            <span class="label label-primary">사이트</span>
					                    </div>
						                    <!-- card image -->
						                    <figure class="mdl-card__media" style="margin:0px">
<!-- 							                        <img src="/Quration/img/sample/img1.jpg" style="width:350px; height:200px"> -->
						                    </figure>
					                    <!-- card title -->
					                    <div class="mdl-card__title">
					                        <h5 class="author mdl-card__title-text">lorem ipsum&nbsp;</h5>
					                    </div>
					
					                    <!-- card text -->
					                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
					                        <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
					                    </div>
					
					                    <!-- card menu (top-right) -->
					                    <div class="mdl-card__menu">
					                        <div id="report" class="btn-group dropdown pull-right"
					                            title="신고">
					                            <a href="#" role="button" class="" title="카드를 보관함에 담기"> 
					                               <i class="fa fa-star fa-lg" aria-hidden="true"></i>
					                            </a>
					                        </div>
					                    </div>
					
					                    <!-- card action buttons (bottom) -->
					                    <div class="mdl-card__actions mdl-card--border">
					                        <!-- buttons (bottom-right) -->
					                        <div class="pull-right">
					                            <div id="share" class="btn-group dropup">
					                                <a href="#" role="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
					                                    <i class="fa fa-share-alt fa-lg mdl-color-text--grey-500" aria-hidden="true"></i>
					                                </a>
					                            </div>
					                            <div id="report" class="btn-group dropup" title="신고">
					                                <a href="#" role="button" class="btn dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="신고">
					                                    <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
					                                </a>
					                            </div>
					                        </div> <!-- /buttons (bottom-right) -->
					                    </div> <!-- /card action buttons (bottom) -->
					                </div> <!-- /card -->
						        </div>
							</div>
						</div>
					
					
					
					
					
						<div class="row marginBottom100">
							<div class="div col-md-8 col-md-push-2 marginTop">
								<h2>${ userVO.firstName } 님의 취향 통계</h2>
							</div>
						</div>
						<div class="row marginBottom100">
							<div class="div col-md-8 col-md-push-2">
								<div class="lead marginBottom30" id="myGraphText"></div>
								<svg id="myGraph"></svg>
							</div>
						</div>
						<div class="row marginBottom100">
							<div class="div col-md-8 col-md-push-2">
								<div class="lead marginBottom30" id="myGraphText2"></div>
								<svg id="myGraph2"></svg>
							</div>
						</div>
						<div class="row marginBottom100">
							<div class="div col-md-8 col-md-push-2">
								<div class="lead marginBottom30" id="myGraphText3"></div>
								<svg id="myGraph3"></svg>
							</div>
						</div>
						<div class="row marginBottom100">
							<div class="div col-md-8 col-md-push-2">
								<div class="lead marginBottom30" id="myGraphText4"></div>
								<svg id="myGraph4"></svg>
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
		url : '${ pageContext.request.contextPath }/statics/savedSourceType.do',
	    type: 'get',
	    contentType: "application/json", 
	    data : { "no" : '${ userVO.no}' },
	    success : function(response){
	    	var svgWidth = 250;	// SVG 요소의 넓이
	    	var svgHeight = 250;	// SVG 요소의 높이
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
					return ["#03A9F4", "#BDBDBD", "#E0E0E0", "#EEEEEE", "#F5F5F5"][i];
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
						.style("font-size","18px")
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
					.style("font-size","15px")
					.style("text-decoration","bold")
					.text(function(d, i) {
							return dataSet[i].value;
						})
			$('#myGraphText').text('${ userVO.firstName } 님은 ' + dataSet[0].label + ' 유형을 많이 담으셨군요!');
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
        	var svgWidth = 250;	// SVG 요소의 넓이
        	var svgHeight = 250;	// SVG 요소의 높이
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
					return ["#03A9F4", "#BDBDBD", "#E0E0E0", "#EEEEEE", "#F5F5F5"][i];
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
			$('#myGraphText2').text('${ userVO.firstName } 님은 ' + dataSet[0].label + ' 사이트에서 많이 담으셨군요!');			
            },
            error : function() {
            	alert('ERROR');
            }
        });
	
	$.ajax({
		url : '${ pageContext.request.contextPath }/statics/likeSourceType.do',
	    type: 'get',
	    contentType: "application/json", 
	    data : { "no" : '${ userVO.no}' },
	    success : function(response){
	    	var svgWidth = 250;	// SVG 요소의 넓이
	    	var svgHeight = 250;	// SVG 요소의 높이
	    	var r = svgHeight / 2;
	    	
			var dataSet = [];
			
			for(var i = 0; i < response.staticsList.length; i++) {
				dataSet.push({
					"label" : response.staticsList[i].columnName, 
					"value" : response.staticsList[i].cnt
				});
			}
			
			var vis = d3
					.select("#myGraph3")
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
					return ["#03A9F4", "#BDBDBD", "#E0E0E0", "#EEEEEE", "#F5F5F5"][i];
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
			$('#myGraphText3').text('${ userVO.firstName } 님은 ' + dataSet[0].label + ' 유형을 좋아하시는군요!');
        },
        error : function() {
        	alert('ERROR');
        }
    });

	$.ajax({
		url : '${ pageContext.request.contextPath }/statics/likeSource.do',
        type: 'get',
        contentType: "application/json", 
        data : { "no" : '${ userVO.no}' },
        success : function(response){
        	var svgWidth = 250;	// SVG 요소의 넓이
        	var svgHeight = 250;	// SVG 요소의 높이
        	var r = svgHeight / 2;
        	
			var dataSet = [];
			
			for(var i = 0; i < response.staticsList.length; i++) {
				dataSet.push({
					"label" : response.staticsList[i].columnName, 
					"value" : response.staticsList[i].cnt
				});
			}
			
			var vis = d3
					.select("#myGraph4")
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
					return ["#03A9F4", "#BDBDBD", "#E0E0E0", "#EEEEEE", "#F5F5F5"][i];
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
			$('#myGraphText4').text('${ userVO.firstName } 님은 ' + dataSet[0].label + ' 사이트를 좋아하시는군요!');
        },
            error : function() {
            	alert('ERROR');
            }
        });
	
</script>
</body>
</html>