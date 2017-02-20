<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 카드분석 - 내 검색어 페이지 입니다. --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인통계-워드클라우드 | Quration: 답을 열어 줄 그런 사람</title>
<style>
	#word-cloud{
		width : 1000px;
		height : 600px;
	}
</style>
<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css"
	type="text/css" rel="stylesheet">

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>
<body class="nav-md">
	<div class="container body">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		
		<div class="main_container marginTop60">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->
			
			<div class="right_col" role="main">
				<!-- page content -->
				<div class="container text-center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h4><b>한 눈에 보는 내 검색어 워드 크라우드</b></h4>
						</div>
					</div>
					<c:choose>
						<c:when test="${ (wordCloudList eq null) or (empty wordCloudList ) }">
							 <div class="row">
								<div >검색어가 없습니다. 검색 후 사용해 주세요 &#58;O</div>
							 </div> 
			            </c:when>
			       		<c:otherwise> 
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
					            	<svg id="word-cloud"></svg>
					            </div>
						    </div> 
						    <small>많이 검색된 검색어일수록 크게 보여집니다.</small>
						</c:otherwise>
					</c:choose> 
		        </div>
		        <!-- /page content -->
			</div>
			<!-- footer -->
			<jsp:include page="/jsp/include/footer.jsp" />
			<!-- /footer -->
			
			</div>
		</div>
	
	
	<!-- for word Cloud d3.js library -->
    <script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
    <script type="text/javascript" src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"></script> 
    
    <!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	
	<!-- for word Cloud js -->
	<script>
     	var width = 850,
			height = 600;
     	
		var fill = d3.scale.category20(); //워드 클라우드 색 채우기 부분
			
		$.ajax({
			url : '${ pageContext.request.contextPath }/statics/word_cloud.do',
		    type: 'get',
		    contentType: "application/json", 
		    data : { "memberNo" : '${ userVO.no}' },
		    success :  function (json) { //json
		   		
		    /* console.log("json : " , json);
		    console.log("wordCloudList : " , json.staticsList);
	        console.log("items : " , json.staticsList[0].cnt); */
	        
		    var leaders =  [];	 
		    
		    for(var i = 0; i < json.staticsList.length; i++) {
		    	leaders.push({text: json.staticsList[i].columnName, size: json.staticsList[i].cnt});
		    }
		    
		    console.log(Object.values(leaders));
		    
		    var leaders = leaders.sort(function(a,b){
		        return (a.size < b.size)? 1:(a.size == b.size)? 0:-1
		    }).slice(0,100);
		
		    var leaderScale = d3.scale.linear()
	        .range([10,70])
	        .domain([d3.min(leaders,function(d) { return d.size; }),
	                 d3.max(leaders,function(d) { return d.size; })
	               ]);
	
		    d3.layout.cloud().size([width, height])
		      .words(leaders)
		      .padding(10)
		      .rotate(function() { return ~~Math.random(); })
		      .font("Impact")
		      .fontSize(function(d) { return leaderScale(d.size)*2; })
		      .on("end", draw) 
		      .start(); 
		   
		    }
		});
		
		  //글자 위치 및 폰트 사이즈  function
		  function draw(words) {
		    d3.select("#word-cloud").append("svg")
		        .attr("width", width)
		        .attr("height", height)
		      .append("g")
		        .attr("transform", "translate("+(width / 2)+","+(height / 2)+")")
		      .selectAll("text")
		        .data(words)
		      .enter().append("text")
		        .style("font-size", function(d) { return (d.size*1) + "px"; })
		        .style("font-family", "Impact")
		        .style("fill", function(d, i) { return fill(i); })
		        .attr("text-anchor", "middle")
		        .attr("transform", function(d) {
		          return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
		        })
		        .text(function(d) { return d.text; });
		  }
		
</script>
</body>
</html>



