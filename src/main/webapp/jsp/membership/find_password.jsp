<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비밀번호 찾기 | Quration: 답을 열어 줄 그런 사람</title>
	
	<!-- 공통css  -->
 	<jsp:include page="/jsp/include/css.jsp" />
    	
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
<body>
	
	<header>
		<jsp:include page="/jsp/include/nav_search.jsp" />
	</header> 
	
	<div class="body">
	  	<!-- 비밀번호 찾기 Section -->
	    <section id="findPassword" class="sectionContent">
	    	<div class="container marginTop60">
	    		<div class="row">
				    <div class="page-header  text-center col-md-6 col-md-offset-3">
				        <h1>비밀번호 찾기</h1>
				    </div>
				 </div>
			    <form  name="findPasswordForm" action="${pageContext.request.contextPath }/membership/findPw.do" method="post" 
					   onsubmit="return checkForm()" >			    
				    <div class="row">
	                    <div class="col-md-6 col-md-offset-3 marginTop" id="error">
	                        <input id="findpwEmail" type="email" name="email" class="form-control" placeholder="계정(이메일)" alt="계정(이메일)입력 폼"/>
	                        <div id="emailChk"></div>
	                    </div><!-- /.col-lg-6 -->
	                </div><!-- /.row -->
					<div class="row">
						<div class="col-md-push-3 col-md-3 marginBottom marginTop">
							<input type="text" name="firstName" class="form-control" placeholder="이름" alt="회원 가입시 작성한 이름 입력 폼"/>
						</div>
						<div class="col-md-push-3 col-md-3 marginBottom marginTop">
							<input type="text" name="lastName" class="form-control" placeholder="성" alt="회원 가입시 작성한 성 입력 폼"/>		
						</div>
					</div>
					<div class="row">
		                  <div class="col-md-6 col-md-offset-3">
		                     <select name="question" class="form-control " >
		                        <option value="계정 or 비밀번호 찾기용 선택하세요" disabled selected> 계정 or 비밀번호 찾기용 질문 </option>
		                        <c:forEach var="idenQuestion" items="${ idenQuestionList }">
		                        	<option value="${ idenQuestion.no }"> ${ idenQuestion.question }</option>
		                        </c:forEach>
		                     </select>
		                  </div> 
		               </div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3 text-center  marginTop marginBottom">
							<input type="text" name="answer" class="form-control" placeholder="답변" alt="계정 찾기용 질문 답변 입력 폼"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3  text-center marginTop">
							<button type="submit" class="btn btn-primary marginRight">확인</button>
							<a href="${pageContext.request.contextPath}/" class="btn btn-default" title="홈 화면 이동 링크" role="button">홈으로</a>
						</div>	
					</div>
				</form>
			</div>
		</section>
	</div>
	
	<!-- Footer -->
    <Footer class="footer">
		<jsp:include page="/jsp/include/footer.jsp" />
	</Footer> 
	
	<!-- 공통 js -->
	<jsp:include page="/jsp/include/commonJs.jsp" />
	
	<script>
	$(document).ready(function() {
		$('#findpwEmail').focusout(function() {
			var email = $('#findpwEmail').val();
		    var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	        
		    if ( !regEmail.test( $('#findpwEmail').val()) ) {  
	        	 addInvolve();
	         } else {
	        	 removeDontMiss();
	         }
		    
	         function addInvolve() {
	 	    	$('#error').addClass('has-error');
	 	        $('#emailChk').text('@를 포함하여 이메일 양식에 맞게 작성해주세요.').addClass('text-danger');
	 	     } 
	 	     
	 	     function removeDontMiss(){
	 	        $('#error').removeClass('has-error');
	 	        $('#emailChk').text('');
	 	     }
		});
	});
		
	function checkForm() {
	
	    var form = document.findPasswordForm;
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
	    } else if (form.question.options[0].selected) {
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
	
	if("${ msg }" != '') {
		alert('${ msg }');
	}
	</script>
</body>
</html>