<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<%-- 커스터마이징 업그레이드 결제 홤 - 내 검색어 페이지 입니다. --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커스터마이징 결제 페이지| Quration: 답을 열어 줄 그런 사람</title>

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

			<div class="right_col body" role="main">
				<!-- page content -->
					<form name="upgradeForm" class="formBottom15 marginTop60 sectionContent" onsubmit="return checkForm()"
                  		  action="${ pageContext.request.contextPath }/contents/update_type.do?no=${userVO.no}" method="post">
                  		
                  		<div class="text-center">
							<div class="row">
								<h4 ><b>Quration Premium Service</b></h4>	
							</div>
							<div class="row grayfont col-md-4 col-md-offset-4" style="height:30px"> 
						    	<label class="marginRight15" >
						    		<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked >
						   			 ₩3,300 Month(월)
						  		</label>
						  		<label>
							    	<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
							   		 ₩30,000 Year(년)
						  		</label>
							</div>
						</div>
                  		  
					<div class="row">
						<div class=" col-md-4 col-md-offset-4">
							<input type="text" class="form-control" name="name" id="name" placeholder="이름">
						</div>
					</div>	
				
				    <div class="row">
						 <div class="col-md-4 col-md-offset-4 ">
							<input type="text" name="cardNum" id="cardNum" class="form-control" placeholder="카드번호">
							<div id="regCardNum"></div>
							<div><small class="grayfont marginLeft">[Visa]<span class="marginLeft">4로 시작하는 12 or 16자리 </span></small></div>
							<div><small class="grayfont marginLeft">[MasterCard]<span class="marginLeft">51~55로 시작하는 16자리</span></small></div>
						 </div>
					 </div>
				
					 <div class="row">
	                  	<div class="col-md-4 col-md-offset-4 ">
		                  <div class="form-control ">
		                     <span class="spanPadding verticalCenter">카드종류</span>
		                     <span class="pull-right marginRight15">
		                      	 <input type="radio" name="card" id="visa" value="visa" alt="비자카드 라디오박스"/>  
		                      		 <label><i class="fa fa-cc-visa fa-2x" aria-hidden="true"></i></label> 
		                       	 <input type="radio" name="card" id="master" value="master" alt="마스터카드 라디오박스"/>  
		                       	 	<label><i class="fa fa-cc-mastercard fa-2x" aria-hidden="true"></i></label>
		                         <input type="radio" name="card" id="paypal" value="paypal" alt="페이팔 카드 라디오박스"/>  
		                         	<label><i class="fa fa-cc-paypal fa-2x" aria-hidden="true"></i></label>
			                     </span>
		                     </div>
		                  </div>
	                  </div>
						
					  <div class="row">
						 <div class="col-md-2 col-md-offset-4 ">
							<input type="text" class="form-control" name="month" id="month" placeholder="MM">
						 </div>
						 <div class="col-md-2 ">
							<input type="text" class="form-control" name="year" id="year" placeholder="YY">
						 </div>
					  </div>
					  <div class="row">
						<div class=" col-md-4 col-md-offset-4">
							<input type="text" class="form-control" name="cvc" id="cvc" placeholder="CVC">
						</div>
					</div>	
					  
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<select onchange="if (this.value) window.location.href = this.value;" name="select" id="select" class="form-control">
								<option value="" disabled selected>신용카드 발행 국가</option>
								<option value="#">가나</option>
								<option value="#">가봉</option>
								<option value="#">과테말라</option>
								<option value="#">그리스</option>
								<option value="#">나이지리아</option>
								<option value="#">남아프리카 공화국</option>
								<option value="#">네덜란드</option>
								<option value="#">네팔</option>
								<option value="#">노르웨이</option>
								<option value="#">뉴질랜드</option>
								<option value="#">대만</option>
								<option value="#">대한민국</option>
								<option value="#">덴마크</option>
								<option value="#">도미니카</option>
								<option value="#">독일</option>
								<option value="#">동티모르</option>
								<option value="#">라오스</option>
								<option value="#">러시아</option>
								<option value="#">레바논</option>
								<option value="#">루마니아</option>
								<option value="#">룩셈부르크</option>
								<option value="#">르완다</option>
								<option value="#">리투아니아</option>
								<option value="#">마다가스카르</option>
								<option value="#">마카오</option>
								<option value="#">마케도니아</option>
								<option value="#">말레이시아</option>
								<option value="#">멕시코</option>
								<option value="#">모나코</option>
								<option value="#">모로코</option>
								<option value="#">몰디브</option>
								<option value="#">몽골</option>
								<option value="#">미국</option>
								<option value="#">방글라데시</option>
								<option value="#">베네수엘라</option>
								<option value="#">베트남</option>
								<option value="#">벨기에</option>
								<option value="#">부탄</option>
								<option value="#">불가리아</option>
								<option value="#">브라질</option>
								<option value="#">스웨덴</option>
								<option value="#">스위스</option>
								<option value="#">싱가포르</option>
								<option value="#">아르헨티나</option>
								<option value="#">아이슬란드</option>
								<option value="#">아일랜드</option>
								<option value="#">영국</option>
								<option value="#">오스트레일리아</option>
								<option value="#">오스트리아</option>
								<option value="#">우즈베키스탄</option>
								<option value="#">우크라이나</option>
								<option value="#">이라크</option>
								<option value="#">이스라엘</option>
								<option value="#">이집트</option>
								<option value="#">이탈리아</option>
								<option value="#">인도</option>
								<option value="#">인도네시아</option>
								<option value="#">일본</option>
								<option value="#">자메이카</option>
								<option value="#">중국</option>
								<option value="#">중앙 아프리카 공화국</option>
								<option value="#">체코</option>
								<option value="#">칠레</option>
								<option value="#">캄보디아</option>
								<option value="#">캐나다</option>
								<option value="#">케냐</option>
								<option value="#">콜롬비아</option>
								<option value="#">쿠웨이트</option>
								<option value="#">크로아티아</option>
								<option value="#">탄자니아</option>
								<option value="#">태국</option>
								<option value="#">터키</option>
								<option value="#">토고</option>
								<option value="#">파라과이</option>
								<option value="#">파키스탄</option>
								<option value="#">파푸아뉴기니</option>
								<option value="#">팔레스타인</option>
								<option value="#">페루</option>
								<option value="#">포르투칼</option>
								<option value="#">폴란드</option>
								<option value="#">프랑스</option>
								<option value="#">피지</option>
								<option value="#">핀란드</option>
								<option value="#">필리핀</option>
								<option value="#">헝가리</option>
								<option value="#">홍콩</option>
							</select>
						</div>
					</div>
					<div class="row text-center marginTop20 marginBottom100">
						<button type="submit" class="btn btn-primary">프리미엄 구매</button>
					</div>	
				</form>
			<!-- /page content -->
			</div>
			<!-- Footer -->
		    <Footer class="footer">
				<jsp:include page="/jsp/include/footer.jsp" />
			</Footer> 
		</div>
	</div>
	
	<!-- 공통 js -->
	<jsp:include page="/jsp/include/commonJs.jsp" />
	
	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>

	<script type="text/javascript">
	$(document).ready(function() {
		$('#cardNum').focusout(function() {
			
		var cardNum = $('#cardNum').val();
		
		var regCardNum =/^(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})$/;

		
		 if ( !regCardNum.test( $('#cardNum').val()) ) {  
        	 msg();
         } else {
        	 removeMsg();
         }
			 
		     function msg() {
			    	$('#cardNum').addClass('has-error');
			        $('#regCardNum').text('유효하지 않은 카드번호 입니다.').addClass('text-danger');
			 } 
		     
		     function removeMsg(){
		        $('#has-error').removeClass('has-error');
		        $('#has-error-check').removeClass('has-error');
		        $('#regCardNum').text('');
		     }
		});
	});
	
	
	function checkForm() {
		
	var form = document.upgradeForm;
	
	 if (form.name.value == '') {
		alert('이름을 입력하세요');
		form.name.focus();
		return false;
	 } else if (form.cardNum.value == '') {
		alert('신용카드 번호를 입력하세요.');
		form.cardNum.focus();
		return false;
	 } else if (form.card.checked == false) {
		alert('카드 종류를 선택해주세요.');
		form.card.focus();
		return false;
	 } else if (form.month.value == '') {
		alert('카드 만료일 (월)을 정확하게 입력하세요');
		form.month.focus();
		return false;
	 } else if (form.year.value == '') {
		alert('카드 만료일 (년)을 정확하게 입력하세요');
		form.year.focus();
		return false;
	 } else if (form.cvc.value == '') {
		alert('카드 cvc값을 입력하세요. 카드 뒷면에 마지막 3개 혹은 4개 번호입니다.');
		form.cvc.focus();
		return false;
	} else if (form.select.options[0].selected) {
		alert('신용카드 발행국가를 다시 선택해주세요');
		form.select.focus();
		return false;
	}
		return true;
	}
	</script>
</body>
</html>