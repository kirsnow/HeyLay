<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비밀번호 변경 | Quration: 답을 열어줄 그런 사람</title>
	
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

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/nav_search.jsp" />
	</header>
	
	<!-- 비밀번호 변경 section -->
	<section id="changePassword">
	 	<div class="container marginTop60 minHeight">
	 		<!-- include myPage -->
	 		<jsp:include page="/jsp/include/my_page.jsp" />
	 		<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center">
					 <h4>비밀번호  입력</h4>
				</div>
			</div>
			<form name="changePasswordForm" action="${ pageContext.request.contextPath }/myPage/changePw.do" method="post" 
			      onsubmit="return changePassword()" autocomplete="off">	
				
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginTop">
						<input type="hidden" name="no" class="form-control" value="${ userVO.no }" />
						<input type="text" name="beforePassword"  id="pwcheck" class="form-control" placeholder="기존 비밀번호 입력" alt="기존 비밀번호 입력 폼"/>
						<small class="paddingleft30">비밀번호 변경을 위해 기존 비밀번호를 입력해주시길 바랍니다.</small>
						<p class="paddingleft30 ajaxFont" id="pwcheck_eq"></p>
						
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<input type="text" name="password" id="password" placeholder="신규 비밀번호 " class="form-control" alt="신규 비밀번호 입력 폼">		
						<small class="paddingleft30" > 비밀번호는 4자리 이상의 영문 대/소문자, 숫자를 혼합해서 사용하실 수 있습니다. </small>
						<div>
							<small class="paddingleft30">
								비밀번호 변경시 안전성을 위하여 유추하기 어려운 비밀번호로 변경하시길 바랍니다.	
							</small>	
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 marginBottom marginTop">
						<input type="text" name="passwordCheck" id="password_check" placeholder="신규 비밀번호 확인" class="form-control"  alt="신규 비밀번호 재입력 폼">
						<small class="paddingleft30"> 재확인을 위해서 입력하신 비밀번호를 다시 한번 입력해 주세요. </small>	
						<span id="password_eq ajaxFont"></span>	
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center marginTop">
						<button type="submit" class="btn btn-primary marginRight">확인</button>
						<button type="reset" class="btn">취소</button>
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

	$(document).ready(function() {

		$('#pwcheck').keyup(function() {
			var pwcheck = $('#pwcheck').val();
			var pwcheck_eq = '${userVO.password}';
			console.log(pwcheck_eq);

			if (pwcheck_eq != pwcheck.substr(0, pwcheck.length)) {
				notMatchPw();
			} else {
				matchPw();
			}
		});

		function notMatchPw() {
			$('pwcheck_eq').addClass('not_valid');
			$('#pwcheck_eq').html('입력하신 비밀번호가 일치하지 않습니다.');
		}

		function matchPw() {
			$('#pwcheck').removeClass('not_valid');
			$('#pwcheck_eq').html('');
		}

		/* 새 비밀번호와 새비밀번호 확인 비교 부분  */
		$('#password_check').keyup(function() {
			var password = $('#password').val();
			var checkword = $('#password_check').val();

			if (checkword != password.substr(0, checkword.length)) {
				notMatchPw2();
			} else {
				matchPw2();
			}
		});

		$('#password').keyup(function() {
			var password = $('#password').val();
			var checkword = $('#password_check').val();

			if (checkword.length != 0) {
				if (checkword != password) {
					$('#password').addClass('not_valid');
					notMatchPw2();
				} else {
					matchPw2();
				}
			}
		});

		function notMatchPw2() {
			$('#password_check').addClass('not_valid');
			$('#password_eq').html('비밀번호가 일치하지 않습니다.');
		}
		function matchPw2() {
			$('#password').removeClass('not_valid');
			$('#password_check').removeClass('not_valid');
			$('#password_eq').html('');
		}
	});

	/* alert창 띄우는 script */

	function changePassword() {

		var changePw = document.changePasswordForm;
		if (changePw.beforePassword.value == '') {
			changePw.beforePassword.focus();
			return false;

		} else if (changePw.password.value == '') {
			alert('신규 비밀번호 확인을 입력하세요');
			changePw.password.focus();
			return false;

		} else if (changePw.newPasswordCheck.value == '') {
			alert('신규 비밀번호 확인을 입력하세요');
			changePw.newPasswordCheck.focus();
			return false;

		}
		return true;
	}

/* 	
	if("${ msg }") {
		if('${ userVO.password }' == '#beforePassword') 
			alert('${ msg }');
		else {
			alert('${ msg2 }');
		}
	} */
	
	
</script>
</body>
</html>