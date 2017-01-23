<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
   <!-- Basic Page Needs -->
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>사이트맵 | Quration: 답을 열어 줄 그런 사람</title>
   
   <!-- Bootstrap CSS SET -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
   
   <!-- MDL Hosted start -->
   <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />
   
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
   <div class="container">
      <header>
            <jsp:include page="/jsp/include/nav_search.jsp" />
        </header>

      <!-- Breadcrumb -->
        <div class="row">
           <div class="col-md-12">
               <ol class="breadcrumb" style="margin-top: 75px">
                   <li><a href="/">Home</a></li>
                   <li>List</li>
                   <li class="active">Sitemap</li>
               </ol>
           </div>
        </div>
        <!-- /Breadcrumb -->
        
		<section class="row">
			<div class="col-md-2">
				<h4 class="paddingleft30">둘러보기</h4>
				<ul>
					<li><a href="${ pageContext.request.contextPath }/list/category.do" title="주제 분야 페이지로 이동">주제 분야</a></li>
					<li><a href="${ pageContext.request.contextPath }/list/source.do" title="콘텐츠 소스 페이지로 이동">발행처</a></li>
				</ul>
			</div>
			<div class="col-md-2">
				<h4 class="paddingleft30">사이트</h4>
				<ul>
					<li><a href="#" title="사이트 소개 페이지로 이동">사이트 소개</a></li>
					<li><a href="${ pageContext.request.contextPath }/notice/list.do" title="공지사항 페이지로 이동">공지사항</a></li>
					<li><a href="${ pageContext.request.contextPath }/contact/partnership.do" title="제휴 문의 페이지로 이동">제휴 문의</a></li>
					<li><a href="${ pageContext.request.contextPath }/contact/qna.do" title="Q&A 페이지로 이동">Q &amp; A</a></li>
					<li><a href="${ pageContext.request.contextPath }/contact/bug.do">오류 신고</a></li>
					<li><a href="${ pageContext.request.contextPath }/contact/spamContents.do">유해 게시물 신고</a></li>
					<li><a href="${ pageContext.request.contextPath }/contact/spamMemo.do">유해 게시글 신고</a></li>
					<li><a href="#" title="서비스 이용 약관 페이지로 이동">서비스 이용 약관</a></li>
					<li><a href="#" title="개인정보 처리 방침 페이지로 이동">개인정보 처리 방침</a></li>
				</ul>
			</div>
			<div class="col-md-2">
				<h4 class="paddingleft30">회원</h4>
				<ul>
					<li><a href="${ pageContext.request.contextPath }/membership/membership.do" title="회원 가입 페이지로 이동">회원 가입</a></li>
					<li><a href="${ pageContext.request.contextPath }/login/login.do" title="로그인 페이지로 이동">로그인</a></li>
					<li><a href="${ pageContext.request.contextPath }/membership/findAccount.do" title="아이디 찾기 페이지로 이동">아이디 찾기</a></li>
					<li><a href="${ pageContext.request.contextPath }/membership/findPw.do" title="비밀번호 찾기 페이지로 이동">비밀번호 찾기</a></li>
					<li><a href="${ pageContext.request.contextPath }/myPage/mypage.do" title="회원 정보 확인/수정 페이지로 이동">회원 정보 확인/수정</a></li>
					<li><a href="${ pageContext.request.contextPath }/" title="Freemium 서비스 페이지로 이동">Freemium 서비스</a></li>
					<li><a href="${ pageContext.request.contextPath }/myPage/leavedQuestion.do" title="회원 탈퇴 페이지로 이동">회원 탈퇴</a></li>
				</ul>
			</div>
			<div class="col-md-2">
				<h4 class="paddingleft30">내 카드</h4>
				<ul>
					<li><a href="#" title="개인 통계 페이지로 이동">개인 통계</a></li>
					<li><a href="#" title="검색 키워드 보기 페이지로 이동">검색 키워드 보기</a></li>
					<li><a href="#" title="내 카드 관리 페이지로 이동">내 카드 관리</a></li>
					<li><button type="button" class="btn btn-info" id="myBtn">Open Modal</button></li>
				</ul>
			</div>

			  <!-- Modal -->
			  <div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Modal Header</h4>
			        </div>
			        <div class="modal-body">
			          <p>Some text in the modal.</p>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
			<!-- 관리자box는 관리자 로그인 시에만 표시되어야 함 -->
			<div class="col-md-2">
				<h4 class="paddingleft30">관리자</h4>
				<ul>
					<li><a href="#" title="공지사항 관리 페이지로 이동">공지사항 관리</a></li>
					<li><a href="#" title="Q&A 관리 페이지로 이동">Q &amp; A 관리</a></li>
					<li><a href="#" title="자주 묻는 질문 관리 페이지로 이동">자주 묻는 질문 관리</a></li>

               <li><a href="#" title="광고 관리 페이지로 이동">광고 관리</a></li>
               <li><a href="#" title="콘텐츠 소스 관리 페이지로 이동">콘텐츠 소스 관리</a></li>

               <li><a href="#" title="오류 신고 관리 페이지로 이동">오류 신고 관리</a></li>
               <li><a href="#" title="유해 게시물 관리 페이지로 이동">유해 게시물 관리</a></li>

               <li><a href="#" title="통계 조회 페이지로 이동">통계 조회</a></li>
               <li><a href="#" title="회원 관리 페이지로 이동">회원 관리</a></li>
               <li><a href="#" title="회원 탈퇴 사유 조회 페이지로 이동">회원 탈퇴 사유 조회</a></li>
            </ul>
         </div>
      </section>
   </div>
   <!-- /container -->

   <!-- footer -->
    <jsp:include page="/jsp/include/footer.jsp" />
    <!-- /footer -->
    
    <!-- Bootstrap JS SET -->
    <script src="${ pageContext.request.contextPath }/js/jquery.1.11.1.js"></script>
    <script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
    
    <script>
// 		function MyEnroll() {
// 			bootbox.confirm({
// 			    title: "Destroy planet?",
// 			    message: "Do you want to activate the Deathstar now? This cannot be undone.",
// 			    buttons: {
// 			        cancel: {
// 			            label: '<i class="fa fa-times"></i> Cancel'
// 			        },
// 			        confirm: {
// 			            label: '<i class="fa fa-check"></i> Confirm'
// 			        }
// 			    },
// 			    callback: function (result) {
// 			        console.log('This was logged in the callback: ' + result);
// 			    }
// 			});
// 		}

		$(document).ready(function(){
		    $("#myBtn").click(function(){
		        $("#myModal").modal();
		    });
		});
	</script>
</body>
</html>
         