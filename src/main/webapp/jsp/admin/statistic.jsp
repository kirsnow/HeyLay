<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	통계 페이지
 --%>
<head>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-KBQV4JX');</script>
<!-- End Google Tag Manager -->

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
<title>통계 | Quration: 답을 열어 줄 그런 사람</title>
<style>
	svg { width: 320px; height: 240px; border: 1px solid black; }
	.pie { fill: orange; stroke: white; }
</style>
</head>
<body class="nav-md">
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KBQV4JX"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
	<div class="container body">
		<div class="main_container">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_admin.jsp" />
			<!-- /nav -->

			<!-- page content -->
			<div class="right_col" role="main">
				<section>
					<div class="container">
						<div class="row">
							<div class="well div col-md-push-2 col-md-4">
								<h4>회원 전체 자주 담은 사이트 타입</h4>
								<svg class="well div col-md-8 col-md-offset-2" id="myGraph2"></svg>
							</div>
							<div class="well div col-md-push-2 col-md-4">
								<h4>회원 전체 자주 담은 사이트</h4>
								<svg class="well div col-md-8 col-md-offset-2" id="myGraph"></svg>
							</div>
						</div>
						<div class="row">
							<div class="well div col-md-push-2 col-md-8">
								<div class="row">
									<div class="col-md-push-3 col-md-6">
										<section id="auth-button"></section>
										<section id="view-selector"></section>
										<section id="timeline"></section>
									</div>
								</div>
								<div class="row">
									<div class="col-md-push-4 col-md-3">
										<a href="https://analytics.google.com/analytics/web/?hl=ko&pli=1#dashboard/uwKM73EoRiOPz9RMGZuRGw/a90558257w134284174p138375987/%3F_u.date00%3D20170124%26_u.date01%3D20170124/" 
											class="btn btn-primary" role="button" target="_blank" title="관리자용 통계 더 보기">통계 더 보기</a>
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
<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<!-- D3.js -->
<script src="${ pageContext.request.contextPath }/js/d3.v3.min.js" charset="utf-8"></script>

<!-- Custom Theme Scripts -->
<script	src="${ pageContext.request.contextPath }/js/custom.min.js"></script>

<!-- Embed API -->
<script>
	$.ajax({
		url : '${ pageContext.request.contextPath }/admin/statics/sourceType.do',
		type : 'get',
		contentType : "application/json",
		data : {
			"no" : '${ userVO.no}'
		},
		success : function(response) {
			var w = 200;
			var h = 200;
			var r = h / 2;
	
			var color = d3.scale.ordinal().range(
					[ "#C8E6C9", "#A5D6A7", "#81C784", "#66BB6A", "#4CAF50" ]); // GPVF
	
			var ydata = [ {
				"good" : 5,
				"pto" : 10,
				"v" : 25,
				"f" : 8
			} ];
	
			var data = [];
	
			for (var i = 0; i < response.staticsList.length; i++) {
				data.push({
					"label" : response.staticsList[i].columnName,
					"value" : response.staticsList[i].cnt
				});
			}
	
			var vis = d3.select("#myGraph2").append("svg:svg").data([ data ]).attr(
					"width", w).attr("height", h).append("svg:g").attr("transform",
					"translate(" + r + "," + r + ")");
			var pie = d3.layout.pie().value(function(d) {
				return d.value;
			});
	
			var arc = d3.svg.arc().outerRadius(r);
	
			var arcs = vis.selectAll("g.slice").data(pie).enter().append("svg:g")
					.attr("class", "slice");
	
			arcs.append("svg:path").attr("fill", function(d, i) {
				return color(i);
				// return color(d.data.value)
			}).attr("d", function(d) {
				return arc(d);
			}).attr('stroke', '#fff')
			// <-- THIS
			.attr('stroke-width', '3');
	
			// add the text
			arcs.append("svg:text").attr("transform", function(d) {
				d.innerRadius = 0;
				d.outerRadius = 0;
				var c = arc.centroid(d);
				return "translate(" + c[0] + "," + c[1] + ")";
			}).attr("text-anchor", "middle").attr("dominant-baseline", "central")
					.style("font-size", "20px").style("text-decoration", "bold")
					.text(function(d, i) {
						return data[i].label;
					});
			arcs.append("svg:text").attr("transform", function(d) {
				var c = arc.centroid(d);
				return "translate(" + c[0] + "," + c[1] + ")";
			}).attr('dy', '2em').attr("text-anchor", "middle").style("font-size",
					"12px").style("text-decoration", "bold").text(function(d, i) {
				return data[i].value;
			});
		},
		error : function() {
			alert('ERROR');
		}
	});
    
	$.ajax({
		url : '${ pageContext.request.contextPath }/admin/statics/savedSource.do',
		type : 'get',
		contentType : "application/json",
		data : {
			"no" : '${ userVO.no}'
		},
		success : function(response) {
			var w = 200;
			var h = 200;
			var r = h / 2;

			var color = d3.scale.ordinal().range(
					[ "#C8E6C9", "#A5D6A7", "#81C784", "#66BB6A", "#4CAF50" ]); // GPVF

			var ydata = [ {
				"good" : 5,
				"pto" : 10,
				"v" : 25,
				"f" : 8
			} ];

			var data = [];

			for (var i = 0; i < response.staticsList.length; i++) {
				data.push({
					"label" : response.staticsList[i].columnName,
					"value" : response.staticsList[i].cnt
				});
			}

			var vis = d3.select("#myGraph").append("svg:svg").data([ data ]).attr(
					"width", w).attr("height", h).append("svg:g").attr("transform",
					"translate(" + r + "," + r + ")");
			var pie = d3.layout.pie().value(function(d) {
				return d.value;
			});

			var arc = d3.svg.arc().outerRadius(r);

			var arcs = vis.selectAll("g.slice").data(pie).enter().append("svg:g")
					.attr("class", "slice");

			arcs.append("svg:path").attr("fill", function(d, i) {
				return color(i);
				// return color(d.data.value)
			}).attr("d", function(d) {
				return arc(d);
			}).attr('stroke', '#fff')
			// <-- THIS
			.attr('stroke-width', '3');

			// add the text
			arcs.append("svg:text").attr("transform", function(d) {
				d.innerRadius = 0;
				d.outerRadius = 0;
				var c = arc.centroid(d);
				return "translate(" + c[0] + "," + c[1] + ")";
			}).attr("text-anchor", "middle").attr("dominant-baseline", "central")
					.style("font-size", "20px").style("text-decoration", "bold")
					.text(function(d, i) {
						return data[i].label;
					});
			arcs.append("svg:text").attr("transform", function(d) {
				var c = arc.centroid(d);
				return "translate(" + c[0] + "," + c[1] + ")";
			}).attr('dy', '2em').attr("text-anchor", "middle").style("font-size",
					"12px").style("text-decoration", "bold").text(function(d, i) {
				return data[i].value;
			});
		},
		error : function() {
			alert('ERROR');
		}
	});

(function(w,d,s,g,js,fjs){
	  g=w.gapi||(w.gapi={});g.analytics={q:[],ready:function(cb){this.q.push(cb)}};
	  js=d.createElement(s);fjs=d.getElementsByTagName(s)[0];
	  js.src='https://apis.google.com/js/platform.js';
	  fjs.parentNode.insertBefore(js,fjs);js.onload=function(){g.load('analytics')};
	}(window,document,'script'));

gapi.analytics.ready(function() {

	  // Step 3: Authorize the user.

	  var CLIENT_ID = '598714586940-safus8v2bg8ujigjcnh90g1eot9ftf8l.apps.googleusercontent.com';

	  gapi.analytics.auth.authorize({
	    container: 'auth-button',
	    clientid: CLIENT_ID,
	  });

	  // Step 4: Create the view selector.

	  var viewSelector = new gapi.analytics.ViewSelector({
	    container: 'view-selector'
	  });

	  // Step 5: Create the timeline chart.

	  var timeline = new gapi.analytics.googleCharts.DataChart({
	    reportType: 'ga',
	    query: {
	      'dimensions': 'ga:date',
	      'metrics': 'ga:sessions',
	      'start-date': '30daysAgo',
	      'end-date': 'today',
	    },
	    chart: {
	      type: 'LINE',
	      container: 'timeline'
	    }
	  });

	  // Step 6: Hook up the components to work together.

	  gapi.analytics.auth.on('success', function(response) {
	    viewSelector.execute();
	  });

	  viewSelector.on('change', function(ids) {
	    var newIds = {
	      query: {
	        ids: ids
	      }
	    }
	    timeline.set(newIds).execute();
	  });
	});
</script>
</body>
</html>