<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원정보 확인 및 수정 | Quration: 답을 열어 줄 그런 사람</title>
	

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
<style>
   #forBottoom > div {
      margin-bottom:15px;
   } 
</style>

</head>
<body>
	
  	<header>
		<jsp:include page="/jsp/include/nav_search.jsp" />
	</header> 
   	
  		<!-- 회원정보 확인 및 수정 Section -->
	 <section id="membership">
	 	<div class="container marginTop60">
	 		<!-- include myPage -->
	 		<jsp:include page="/jsp/include/my_page.jsp" />
 			
			<form name="membershipForm" action="${pageContext.request.contextPath }/myPage/update.do" 
			      method="post" onsubmit="return checkForm()" autocomplete="off" class="formBottom15">  	
					
					<div class="row">
						<div class="col-md-6 col-md-offset-3 marginTop">
							<input type="text" name="email" class="form-control" value="${userVO.email}" alt="계정(이메일)입력 폼" readonly/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-push-3 col-md-3">
							<input type="text" name="firstName" class="form-control" value="${userVO.firstName}" alt="이름 입력 폼"/>
						</div>
						<div class="col-md-push-3 col-md-3">
							<input type="text" name="lastName" class="form-control" value="${userVO.lastName}" alt="성 입력 폼"/>		
						</div> 
					</div>
					<div class="row">
                  		<div class="col-md-6 col-md-offset-3">
                     		<input type="date"  name="birth" class="form-control" value="${userVO.birth}"alt="생년월일 선택 폼" readonly/> 
                  		</div>
                 		</div>
					<div class="row">
	                  	<div class="col-md-6 col-md-offset-3">
		                  <div class="form-control">
		                     <span class="spanPadding">성별을 표시해 주세요.</span>
		                     <span>
		                      	 <label for="genderMen">남</label>  <input type="radio" name="gender" id="genderMen" value="M" alt="성별 선택 라디오 박스 (남)"/> 
		                       	 <label for="genderWomen">여</label> <input type="radio" name="gender" id="genderWomen" value="F" alt="성별 선택 라디오 박스 (여)"/>  
		                         <label for="genderEtc">기타</label> <input type="radio" name="gender" id="genderEtc" value="O" alt="성별 선택 라디오 박스 (기타)"/>  
		                     </span>
	                     </div>
	                  </div>
                  </div>
                  <div class="row">
                 	 <div class="col-md-6 col-md-offset-3">
		                 <div class="form-control">
		                     <span class="spanPadding">메일 수신여부를 선택해주세요.</span>
		                     <span>
					           <label for="yes"> 네  </label> 
					           		<input type="radio" name="emailReceive" id="yes" value="Y" alt="메일 수신여부 선택 라디오 박스(네)"/> 
					           <label for="no"> 아니오   </label>
					           		<input type="radio" name="emailReceive" id="no" value="N" alt="메일 수신여부 선택 라디오 박스(아니오)"/>
					         </span>
		                  </div>
	                  </div>
                  </div>
				  <div class="row">
	                  <div class="col-md-push-3 col-md-3">
	                     <input type="text" name="country" value="${userVO.country}" class="form-control" alt="거주 국가 입력 폼"/>
	                  </div>
	                  <div class="col-md-push-3 col-md-3">
	                     <input type="text" name="city" value="${userVO.city}" class="form-control" alt="거주 도시 입력 폼"/>
	                  </div>
                  </div>
				 
				  <div class="row">
					  <div class="col-md-6 col-md-offset-3">   
						 <%--  <section>
								<img src="${ pageContext.request.contextPath }/img/defaultImage.png" class="img-rounded" alt="프로필 이미지"> 
								<img src="${ pageContext.request.contextPath }/img/${userVO.profileImg}" class="img-rounded paddingleft30" alt="프로필 이미지">  
								
								<!-- 나중에 DB에 넣은 사진 불러오게 수정해야 함 -->
								 <div class="pull-right marginRight30">
									<input type="file" name="profileImg" size="100" class="marginBottom" alt="파일 선택 폼"/>	
									<div>
										<small>프로필 이미지를 등록해 주세요.</small>
									</div>
									<div>
										<small>5MB 이하 파일을 첨부하실 수 있습니다.</small>
									</div>
								</div> 
							</section> --%>
							
							<div class="row">
							  <div class= "col-md-6 col-md-offset-3">
							    <input type="password" name="password" id="passwordForUpdate" class="form-control" placeholder="비밀번호" alt="비밀번호 입력 폼"/>
							    <div class="text-center">
							    	<small>회원정보 수정을 위해 비밀번호를 입력해주세요.</small>
							    </div>
							    <!-- 비밀번호가 맞아야 회원 정보 수정이 되게 수정  -->
							  </div>
							</div>	
						</div>
					</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center marginBottom">
						<button type="submit" class="btn btn-primary marginRight" id="update" name="update">회원정보 수정</button>
						<a href="${ pageContext.request.contextPath }/" class="btn btn-default" title="홈화면 이동 링크" role="button">홈으로</a>			
					</div>
				</div>	
			</form>
		</div>
	</section>

    <!-- Footer -->
    <Footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
	
<script>
    
	function checkForm() {

		var form = document.membershipForm;
		if (form.email.value == '') {
			alert('계정(메일주소)를 입력해주세요.');
			form.email.focus();
			return false;
		} else if (form.firstName.value == '') {
			alert('이름을 입력해주세요.');
			form.firstName.focus();
			return false;
		} else if (form.lastName.value == '') {
			alert('성을 입력해주세요.');
			form.lastName.focus();
			return false;
		} else if (form.gender.value == '') {
			alert('성별을 체크해주세요.');
			form.gender.focus();
			return false;
		} else if (form.emailReceive.value == '') {
			alert('메일 수신 여부를 체크해주세요.');
			form.emailReceive.focus();
			return false;
		} else if (form.password.value == '') {
			alert('비밀번호를 입력해주세요.');
			form.password.focus();
			return false;
		} else if (form.country.value == '') {
			alert('국가를 입력해주세요.');
			form.country.focus();
			return false;
		} else if (form.city.value == '') {
			alert('도시를 입력해주세요.');
			form.city.focus();
			return false;
		} else if (form.question.value == '') {
			alert('질문을 선택해주세요.');
			form.question.focus();
			return false;
		} else if (form.answer.value == '') {
			alert('답변을 입력하세요');
			form.answer.focus();
			return false;
		}
		return true;
	}
</script>
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	console.log('${userVO.gender}');
	if ('${userVO.gender}' == 'M') {
		$("input[value='M']").prop("checked", true);
	} else if ('${userVO.gender}' == 'F') {
		$("input[value='F']").prop("checked", true);
	} else {
		$("input[value='O']").prop("checked", true);
}
</script>

<script>
	console.log('${userVO.emailReceive}');
	if ('${userVO.emailReceive}' == 'Y') {
		$("input[value='Y']").prop("checked", true);
	} else {
		$("input[value='N']").prop("checked", true);
	}
</script>


<!-- Google reCAPTCHA API : 로봇이 아닙니다. -->
<script src='https://www.google.com/recaptcha/api.js'></script>
	   
</body>
</html>