<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<%--
	통계 페이지
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
<title>통계 | Quration: 답을 열어 줄 그런 사람</title>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_admin.jsp" />
			<!-- /nav -->

			<!-- page content -->
			<div class="right_col" role="main">
				<section>
					<div class="container">
<%-- 						<img src="${ pageContext.request.contextPath }/img/layout/Gif.gif" width="1000px" /> --%>
						<div class="row">
							<div class="well div col-md-push-2 col-md-8">
								<div id="embed-api-auth-container"></div>
								<div id="chart-container"></div>
								<div id="view-selector-container"></div>
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

<!-- Custom Theme Scripts -->
<script	src="${ pageContext.request.contextPath }/js/custom.min.js"></script>

<!-- Embed API -->
<script>
(function(w,d,s,g,js,fs){
  g=w.gapi||(w.gapi={});g.analytics={q:[],ready:function(f){this.q.push(f);}};
  js=d.createElement(s);fs=d.getElementsByTagName(s)[0];
  js.src='https://apis.google.com/js/platform.js';
  fs.parentNode.insertBefore(js,fs);js.onload=function(){g.load('analytics');};
}(window,document,'script'));

gapi.analytics.ready(function() {
	

	  /**
	   * Authorize the user immediately if the user has already granted access.
	   * If no access has been created, render an authorize button inside the
	   * element with the ID "embed-api-auth-container".
	   */
	  gapi.analytics.auth.authorize({
	    container: 'embed-api-auth-container',
	    clientid: 'REPLACE WITH YOUR CLIENT ID'
	  });


	  /**
	   * Create a new ViewSelector instance to be rendered inside of an
	   * element with the id "view-selector-container".
	   */
	  var viewSelector = new gapi.analytics.ViewSelector({
	    container: 'view-selector-container'
	  });

	  // Render the view selector to the page.
	  viewSelector.execute();


	  /**
	   * Create a new DataChart instance with the given query parameters
	   * and Google chart options. It will be rendered inside an element
	   * with the id "chart-container".
	   */
	  var dataChart = new gapi.analytics.googleCharts.DataChart({
	    query: {
	      metrics: 'ga:sessions',
	      dimensions: 'ga:date',
	      'start-date': '30daysAgo',
	      'end-date': 'yesterday'
	    },
	    chart: {
	      container: 'chart-container',
	      type: 'LINE',
	      options: {
	        width: '100%'
	      }
	    }
	  });


	  /**
	   * Render the dataChart on the page whenever a new view is selected.
	   */
	  viewSelector.on('change', function(ids) {
	    dataChart.set({query: {ids: ids}}).execute();
	  });

	});
</script>
</body>
</html>