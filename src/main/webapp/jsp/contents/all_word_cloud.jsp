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
<title>전체 유저 통계-워드클라우드 | Quration: 답을 열어 줄 그런 사람</title>

	<!-- 공통css  -->
 	<jsp:include page="/jsp/include/css.jsp" />

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

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
		
		<div class="main_container marginTop60">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->
			
			<div class="right_col" role="main">
				<!-- page content -->
				<div class="container text-center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 marginTop">
							<h3><b>인기 검색어</b></h3>
						    <small>많이 검색된 검색어일수록 크게 보여집니다.</small>
						</div>
					</div>
					<c:choose>
						<c:when test="${ (AllWordCloudList eq null) or (empty AllWordCloudList ) }">
							 <div class="row">
								<div class="marginTop60">검색어가 없습니다. 검색 후 사용해 주세요 &#58;O</div>
							</div> 
			            </c:when>
			       		<c:otherwise> 
			       			<!-- <div class="circleLoading marginTop180 marginBottom100">
								<p class="font20">Loading...</p>
				       			<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>
							</div> -->
							<div class="row">
								<div class="col-md-8 col-md-offset-2 marginBottom100">
					            	<svg id="word-cloud"></svg>
					            </div>
						    </div> 
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
	
	<!-- jQuery -->
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	
	<!-- for word Cloud d3.js library -->
    <script type="text/javascript" src="https://d3js.org/d3.v3.min.js"></script>
    <script type="text/javascript" src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"></script> 
    
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	<!-- for word Cloud js -->
	<script>
	
	   //로딩 중 아이콘 1.6초후 삭제
		/* setTimeout(function(){
			$('.circleLoading').remove();
		},2000);  */
	   
	 	var width = 850,
			height = 600;
     	
		var fill = d3.scale.category20(); //워드 클라우드 색 채우기 부분
			
		$.ajax({
			url : '${ pageContext.request.contextPath }/statics/AllUserWordCloud.do',
		    type: 'get',
		    contentType: "application/json", 
		    data : { "memberNo" : '${ userVO.no}' },
		    success :  function (json) { //json
		   		
		    console.log("json : " , json);
		    console.log("wordCloudList : " , json.staticsList);
	        console.log("items : " , json.staticsList[0].cnt);
	        
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
		      .padding(8)
		      //세로 괄호 지정해주는 부분
		      .rotate(function() { return ~~ Math.random(); })
		      //.rotate(function() { return ~~(Math.random() * 10) * 90; })
		      .font("Impact")
		      .fontSize(function(d) { return leaderScale(d.size*1.5); })
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
		        .style("font-size", function(d) { return d.size*1+ "px"; })
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



