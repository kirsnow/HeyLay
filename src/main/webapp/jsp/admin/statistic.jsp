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
<title>관리자 통계 | Quration: 답을 열어 줄 그런 사람</title>
<style>
   svg{
    height : 210px;
   }

   h1 > i {
      font-color: gray;
   }
   
   .fa {
      color : #BDBDBD;
   }
   
   small {
      color : #03A9F4;
   }
 
    .border10px{
       border : 10px solid  #F7F7F7;
    
    }
    
	.pie { stroke: white; stroke-width: 3;}
    
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
            <section class="section">
               <div class="row ">
                  <div class=" text-center col-md-12 ">
                     <div class="col-md-3 panel ">
                        <h1><i class="fa fa-user " aria-hidden="true"></i>
                            <span id="newUserCnt"></span><small> 명</small>
                        </h1>
                        <p>
                           <small class="text-center ">신규 가입 유저</small>
                        </p>
                     </div>
                     <div class="col-md-3 panel ">
                        <h1><i class="fa fa-search" aria-hidden="true"></i>
                            <span id="serachToday"></span><small> 회</small>
                        </h1>
                        <p>
                           <small class="text-center">오늘의 검색&nbsp;횟수</small>
                        </p>
                     </div>
                     <div class="col-md-3 panel">
                        <h1><i class="fa fa-star" aria-hidden="true"></i>
                            <span id="savedContent"></span><small> 개</small>
                        </h1>
                        <p>
                           <small class="text-center">오늘 저장된 컨텐츠</small>
                        </p>
                     </div>
                     <div class="col-md-3 panel">
                        <h1><i class="fa fa-search-plus" aria-hidden="true"></i>
                             <span id="popularKeyword"></span>
                        </h1>
                        <p>
                           <small class="text-center">오늘의 인기 검색어</small>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <div class="col-md-4 panel border10px">
                        <h4 class="text-center marginBottom30">회원 전체의 조회수가 높은 사이트</h4>
                        <svg class="col-md-10 marginBottom col-md-offset-3" id="myGraph4"></svg>
                     </div>
                     <div class="col-md-8 panel border10px ">
                        <h4 class="text-center marginBottom30 ">회원 전체의 조회수가 높은 콘텐츠</h4>
                        <svg class="col-md-10 marginBottom" id="myGraph3"></svg>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <div class="col-md-4 panel border10px">
                        <h4 class="text-center marginBottom30 ">회원 전체 자주 담은 사이트 타입</h4>
                        <svg class="marginBottom col-md-offset-3" id="myGraph2"></svg>
                     </div>
                     <div class="col-md-4 panel border10px">
                        <h4 class="text-center marginBottom30">회원 전체 자주 담은 사이트</h4>
                        <svg class="c marginBottom col-md-offset-3" id="myGraph"></svg>
                     </div>
                     <div class="col-md-4  marginTop40 marginTop80">
                        <!-- <div class="text-center">
                           <section id="auth-button"></section>
                           <section id="view-selector"></section>
                           <section id="timeline"></section>
                        </div> -->
                        <div class="text-center marginTop80">
                           <a href="https://analytics.google.com/analytics/web/?hl=ko&pli=1#dashboard/uwKM73EoRiOPz9RMGZuRGw/a90558257w134284174p138375987/%3F_u.date00%3D20170124%26_u.date01%3D20170124/"
                              class="btn btn-primary marginBottom30" role="button" target="_blank"
                              title="구글 애널리틱스에서 관리자용 통계 더 보기">구글 애널리틱스에서 통계 더 보기
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>
         <!-- /page content -->
      </div>
   </div>
   <!-- footer -->
         <jsp:include page="/jsp/include/footer.jsp" />
    <!-- /footer -->

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
   
   /*오늘 저장된 컨텐츠  */
   $.ajax({
         url: "${ pageContext.request.contextPath }/admin/statics/savedContent.do",
         type : 'get',
         contentType : "application/json",
         success: function(result){
              $("#savedContent").text(result);
              //console.log(result);
              
   }});
   
   
   /*오늘의 인기 검색어 */
   $.ajax({
         url: "${ pageContext.request.contextPath }/admin/statics/popularKeyword.do",
         type : 'get',
         contentType : "application/json",
         success: function(result){
              $("#popularKeyword").text(result);
              //console.log(result);
              
       }});
       
   /*오늘의 검색 횟수 */
   $.ajax({
         url: "${ pageContext.request.contextPath }/admin/statics/serachToday.do",
         type : 'get',
         contentType : "application/json",
         success: function(result){
               $("#serachToday").text(result);
               //console.log(result);
               
           }});
   
   /*신규 가입 유저 수 확인 */
   $.ajax({
         url: "${ pageContext.request.contextPath }/admin/statics/newUserCnt.do",
         type : 'get',
         contentType : "application/json",
         success: function(result){
               $("#newUserCnt").text(result);
               //console.log(result);
               
           }});
   /* 회원 전체의 조회수가 높은 콘텐츠  */
   $.ajax({
         url : '${ pageContext.request.contextPath }/admin/statics/cntContents.do',
         type : 'get',
         contentType : "application/json",
         data : {
            "contentStaticsList" : '${ staticsVO.columnName}'
         },
         success : function(json) {
            var w = 600;
            var h = 30;
            var barElements;

            var colorSet_colorful = [ "#DCE775", "#FFAB91", "#FFF59D",
                  "#81D4FA", "#E1BEE7" ]; //무지개
            var colorSet_blue = [ "#03A9F4", "#9E9E9E", "#BDBDBD",
                  "#E0E0E0", "#EEEEEE" ]; //블루 & 그레이
            var color = d3.scale.ordinal().range(colorSet_blue); //컬러 변경

            var dataSet = []; // 데이터를 저장할 배열을 준비

            for (var i = 0; i < json.staticsList.length; i++) { //데이터 줄수만큼 반복
               dataSet.push({
                  "label" : json.staticsList[i].columnName,
                  "value" : json.staticsList[i].cnt,
                  "viewCnt" : json.staticsList[i].data
               });
            }


            // 그래프 그리기
            barElements = d3.select("#myGraph3").selectAll("rect") // rect 요소 지정
            .data(dataSet) // 데이터를 요소에 연결

            //cnt를 통해 그래프 그리기  
            barElements.enter() // 데이터 개수만큼 반복
            .append("rect") // 데이터 개수만큼 rect 요소가 추가됨
            .attr("class", "rect") // CSS 클래스를 지정
            .attr("fill", function(d, i) {
               return color(i)
            })
            
            .attr("width", "0px")
            .transition()
  		    .delay(function(d,i){   // 그래프의 시간을 어긋나게 표시
  				return i*200;
  			 })
            .duration(200)
            .attr("width", function(d, i) { // 넓이를 지정. 두 번째의 파라미터에 함수를 지정
               return dataSet[i].value * 10; // 데이터 값을 그대로 넓이로 반환
            })
		  
            .attr("height", h) // 높이를 지정
            .attr("x", 300) // X 좌표를 0으로 함
            .attr("y", function(d, i) { // Y 좌표를 지정함
               return i * 40 // 표시 순서에 20을 곱해 위치를 계산
           
            })
         
			
            //columnName를 통해 title 입력
            barElements.enter() // text 요소 지정●↓
            .append("text") // text 요소 추가
            .attr("y", function(d, i) { // X 좌표를 지정
               return i * 40 + 20; // 막대그래프의 표시 간격을 맞춤
            }).attr("x", 120) // Y 좌표를 지정
            .text(function(d, i) { // 데이터 표시
               return dataSet[i].label;
            })

            //view_cnt를 그래프에 넣기  
            barElements.enter() // 데이터 개수만큼 반복
            .append("text") // text 요소 추가
            .attr("y", function(d, i) { // X 좌표를 지정
               return i * 40 + 20; // 막대그래프의 표시 간격을 맞춤
            }).attr("x", 310) // Y 좌표를 지정
            .text(function(d, i) { // 데이터 표시
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

         var colorSet_colorful = [ "#FFF9C4", "#FFF59D", "#FFF176",
               "#FFEE58", "#FFEB3B" ]; //핑크
         var colorSet_blue = [ "#03A9F4", "#BDBDBD", "#E0E0E0", "#EEEEEE",
               "#F5F5F5" ]; //블루 & 그레이
         var color = d3.scale.ordinal().range(colorSet_blue); //컬러 변경

         var data = [];

         for (var i = 0; i < response.staticsList.length; i++) {
            data.push({
               "label" : response.staticsList[i].columnName,
               "value" : response.staticsList[i].cnt
            });
         }

         var vis = d3.select("#myGraph4")
         			 .append("svg:svg").data([ data ])
                     .attr("width", w)
                     .attr("height", h)
                     .append("svg:g")
                     .attr("transform", "translate(" + r + "," + r + ")");
        
         var pie = d3.layout.pie().value(function(d) {
            return d.value;
         });

         var arc = d3.svg.arc().outerRadius(r);

         var pieElements  = vis.selectAll("g.slice")
         			   .data(pie)
         			   .enter()
         			   .append("svg:g")
                       .attr("class", "slice");

         pieElements .append("svg:path").attr("fill", function(d, i) {
            return color(i);
            // return color(d.data.value)
         })
         .transition()
			  .duration(200)
			  .delay(function(d,i){   // 그릴 원 그래프의 시간을 어긋나게 표시
					return i*200;
				})
		 .attr("d", function(d) {
            return arc(d);
            
         })
         .attr('stroke', '#FFFFFF')
         // <-- THIS
         .attr('stroke-width', '3')
         
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
         // add the text
         pieElements .append("svg:text").attr("transform", function(d) {
	            d.innerRadius = 0;
	            d.outerRadius = 0;
	            var c = arc.centroid(d);
	            return "translate(" + c[0] + "," + c[1] + ")";
	         })
	         .attr("text-anchor", "middle")
	         .attr("dominant-baseline","central")
	         .style("font-size", "15px")
	         .style(
	               "text-decoration", "bold")
	         .text(function(d, i) {
	            return data[i].label;
	         });
	         pieElements .append("svg:text")
	         	 .attr("transform", function(d) {
	            var c = arc.centroid(d);
	            return "translate(" + c[0] + "," + c[1] + ")";
	         }).attr('dy', '2em')
	           .attr("text-anchor", "middle")
	           .style(
	               "font-size", "12px")
	           .style("text-decoration", "bold").text(
	               function(d, i) {
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
               var svgWidth = 200;
               var svgHeight = 200;
               var r = svgHeight / 2;
               
               var dataSet = [];

               for (var i = 0; i < response.staticsList.length; i++) {
            	   dataSet.push({
                     "label" : response.staticsList[i].columnName,
                     "value" : response.staticsList[i].cnt
                  });
               }
	
	    var vis = d3.select("#myGraph2")
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
			},
		   error : function() {
		   	alert('ERROR');
		   }
		});


   /* 회원 전체 자주 담은 사이트 */
   $
         .ajax({
            url : '${ pageContext.request.contextPath }/admin/statics/savedSource.do',
            type : 'get',
            contentType : "application/json",
            data : {
               "no" : '${ userVO.no}'
            },
            success : function(response) {
                var svgWidth = 200;
                var svgHeight = 200;
                var r = svgHeight / 2;
                
                var dataSet = [];

                for (var i = 0; i < response.staticsList.length; i++) {
             	   dataSet.push({
                      "label" : response.staticsList[i].columnName,
                      "value" : response.staticsList[i].cnt
                   });
                }

        var vis = d3.select("#myGraph")
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
 			},
 		   error : function() {
 		   	alert('ERROR');
 		   }
 		});

  
</script>
</body>
</html>