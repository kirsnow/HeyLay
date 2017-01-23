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
								<section id="auth-button"></section>
								<section id="view-selector"></section>
								<section id="timeline"></section>
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
	      'end-date': 'yesterday',
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