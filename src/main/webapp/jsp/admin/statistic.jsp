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
<!-- Custom Theme Style -->
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">    

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
   svg { width: 320px; height: 210px; }  
   .barNum {
				font-size: 10pt;
				text-anchor : middle;
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
</style>
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
                  <div class="row">
                     <div class="col-md-10">
                        <div class="div col-md-4 col-md-push-1 ">
                           <h4 class="text-center marginBottom30">회원 전체 자주 담은 사이트 타입</h4>
                           <svg class="col-md-offset-3 " id="myGraph2"></svg>
                        </div>
                           
                        <div class="div col-md-4 col-md-push-1 ">
                           <h4 class="text-center marginBottom30">회원 전체 자주 담은 사이트</h4>
                           <svg class="col-md-offset-3 " id="myGraph"></svg>
                        </div>
                        <div class="div col-md-4 col-md-push-1">
                           <h4 class="text-center marginBottom30">회원 전체의 조회수가 높은 사이트</h4>
                           <svg class="col-md-offset-3 " id="myGraph4"></svg>
                        </div> 
                     </div>
                  </div>
                  <div class="row">
                     <div class="div col-md-push-2 col-md-14 marginTop60">
                        <h4 class="text-center marginBottom30">회원 전체의 조회수가 높은 콘텐츠</h4>
                        <div>
                       		<svg class="col-md-8 col-md-offset-2 text marginBottom30" id="myGraph3"></svg>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="div col-md-push-2 col-md-8">
                        <div class="row">
                           <div class="text-center">
                              <section id="auth-button"></section>
                              <section id="view-selector"></section>
                              <section id="timeline"></section>
                           </div>
                        </div>
                        <div class="row">
                           <div class="text-center">
                              <a href="https://analytics.google.com/analytics/web/?hl=ko&pli=1#dashboard/uwKM73EoRiOPz9RMGZuRGw/a90558257w134284174p138375987/%3F_u.date00%3D20170124%26_u.date01%3D20170124/" 
                                 class="btn btn-primary" role="button" target="_blank" title="구글 애널리틱스에서 관리자용 통계 더 보기">구글 애널리틱스에서 통계 더 보기</a>
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
<script   src="${ pageContext.request.contextPath }/js/custom.min.js"></script>

<!-- Embed API -->
<script>

/* 회원 전체의 조회수가 높은 콘텐츠  */

$.ajax({
   url : '${ pageContext.request.contextPath }/admin/statics/cntContents.do',
   type : 'get',
   contentType : "application/json",
   data : { "contentStaticsList" : '${ staticsVO.columnName}' },
   success : function(json){
    var w = 600;
    var h = 30;
    var barElements;
    
    var colorSet_colorful= [ "#DCE775", "#FFAB91", "#FFF59D", "#81D4FA", "#E1BEE7" ]; //무지개
    var colorSet_blue= [ "#03A9F4", "#9E9E9E", "#BDBDBD", "#E0E0E0", "#EEEEEE" ]; //블루 & 그레이
    var color = d3.scale.ordinal().range( colorSet_blue ); //컬러 변경
   
    var dataSet = [ ];   // 데이터를 저장할 배열을 준비
            
      for(var i = 0; i < json.staticsList.length; i++) { //데이터 줄수만큼 반복
    	  dataSet.push({
              "label" : json.staticsList[i].columnName,
              "value" : json.staticsList[i].cnt,
              "viewCnt" : json.staticsList[i].data
           	});
          }
    	
         console.log(Object.values(dataSet));
         
         // 그래프 그리기
         barElements = d3.select("#myGraph3")
           .selectAll("rect")   // rect 요소 지정
           .data(dataSet)   // 데이터를 요소에 연결
           
         //cnt를 통해 그래프 그리기  
         barElements.enter()   // 데이터 개수만큼 반복
           .append("rect")   // 데이터 개수만큼 rect 요소가 추가됨
           .attr("class", "rect")   // CSS 클래스를 지정
           .attr("fill",function(d,i){return color(i)})
           .attr("width", function(d,i){   // 넓이를 지정. 두 번째의 파라미터에 함수를 지정
            return dataSet[i].value * 10;   // 데이터 값을 그대로 넓이로 반환
            })
           
           .attr("height", h)   // 높이를 지정
           .attr("x", 400)   // X 좌표를 0으로 함
           .attr("y", function(d, i){   // Y 좌표를 지정함
               return i * 40  // 표시 순서에 20을 곱해 위치를 계산
            })
        
          //columnName를 통해 title 입력
          barElements.enter()	// text 요소 지정●↓
			.append("text")	// text 요소 추가
			.attr("y", function(d, i){	// X 좌표를 지정
				return i * 40 + 20;	// 막대그래프의 표시 간격을 맞춤
			})
			.attr("x", 200)	// Y 좌표를 지정
			.text(function(d, i){	// 데이터 표시
				return dataSet[i].label;
		    })
		    
		 //view_cnt를 그래프에 넣기  
         barElements.enter()   // 데이터 개수만큼 반복
            .append("text")	// text 요소 추가
			.attr("y", function(d, i){	// X 좌표를 지정
				return i * 40 + 20;	// 막대그래프의 표시 간격을 맞춤
			})
			.attr("x", 410)	// Y 좌표를 지정
			.text(function(d, i){	// 데이터 표시
				return dataSet[i].viewCnt;
		    })
        }
   }); 



	

   /* 회원 전체의 조회수가 높은 사이트 */
   $.ajax({
      url : '${ pageContext.request.contextPath }/admin/statics/cntCite.do',
      type : 'get',
      contentType : "application/json",
      data : {
         "no" : '${ userVO.no}'
      },
      success : function(response) {
         var w = 200;
         var h = 200;
         var r = h / 2;
   
         var colorSet_colorful= [ "#FFF9C4", "#FFF59D", "#FFF176", "#FFEE58", "#FFEB3B"]; //핑크
         var colorSet_blue= [ "#03A9F4", "#BDBDBD", "#E0E0E0", "#EEEEEE", "#F5F5F5" ]; //블루 & 그레이
         var color = d3.scale.ordinal().range( colorSet_blue ); //컬러 변경
   
         var data = [];
   
         for (var i = 0; i < response.staticsList.length; i++) {
            data.push({
               "label" : response.staticsList[i].columnName,
               "value" : response.staticsList[i].cnt
            });
         }
   
         var vis = d3.select("#myGraph4").append("svg:svg").data([ data ]).attr(
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
               .style("font-size", "15px").style("text-decoration", "bold")
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


   /* 회원 전체 자주 담은 사이트 타입 */


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
   
         var colorSet_colorful= [ "#FCE4EC", "#F8BBD0", "#F48FB1", "#F06292", "#EC407A"]; //그린
         var colorSet_blue= [ "#03A9F4", "#BDBDBD", "#E0E0E0", "#EEEEEE", "#F5F5F5" ]; //블루 & 그레이
         var color = d3.scale.ordinal().range( colorSet_blue ); //컬러 변경
   
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
               .style("font-size", "15px").style("text-decoration", "bold")
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
    
   /* 회원 전체 자주 담은 사이트 */
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

         var colorSet_colorful= [ "#C8E6C9", "#A5D6A7", "#81C784", "#66BB6A", "#4CAF50"]; //옐로우
         var colorSet_blue= [ "#03A9F4", "#BDBDBD", "#E0E0E0", "#EEEEEE", "#F5F5F5" ]; //블루 & 그레이
         var color = d3.scale.ordinal().range( colorSet_blue ); //컬러 변경
               
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
               .style("font-size", "15px").style("text-decoration", "bold")
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