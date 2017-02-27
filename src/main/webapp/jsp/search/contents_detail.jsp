<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Needs -->
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:set var="plainTitle" value="${ fn:replace( fn:replace(contents.title, '<mark>', ''), '</mark>', '') }" />
	<title><c:out value="${ plainTitle }" /> | Quration: 답을 열어 줄 그런 사람</title>
	<!-- 각 콘텐츠 제목을 title로 동적 지정 -->
	
	<!-- MDL Hosted start -->
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />
	
	<!-- Bootstrap CSS SET -->
	<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
	
	<script>
	<!-- google analytics -->
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'https://www.google-analytics.com/analytics.js', 'ga');
	
		ga('create', 'UA-90558257-1', 'auto');
		ga('send', 'pageview');
	</script>
	<style type="text/css">
		.modal-backdrop fade in {
			height: 0px !important; 
		}
		
	</style>
</head>

<body>
	<div class="container">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>

		<!-- Breadcrumb -->
		<div class="row">
			<ol class="col-xs-12 breadcrumb" style="margin-top: 75px">
				<li><a href="${ pageContext.request.contextPath }/">Home</a></li>
				<li><a href="#">${ contents.categoryName }</a></li>
				<li class="active"><c:out value="${ plainTitle }" /></li>
			</ol>
		</div>
		<!-- /Breadcrumb -->

		<c:if test="${contents.ban == \"Y\"}">
			<div class="alert alert-warning alert-dismissible" role="alert" id="banAlert">
				<strong>Warning!</strong> 제한된 콘텐츠입니다. 내 카드 서랍에서 제외하시겠습니까?
			</div>

			<button class="btn btn-primary banBtn alert-warning" hidden="true" 
				data-toggle="modal" data-target="#myModal" data-needpopup-show="#myModal" id="${ contents.ban }">...</button>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					style="position: fixed; margin-top: 300px;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel" style="color: #FFB300;">
								<strong>Warning</strong>
							</h4>
						</div>
						<div class="modal-body">제한된 콘텐츠 입니다. 내 카드 서랍에서 제외하실 수 있습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning banUp" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<div class="row">
			<section class="card-ancestor col-xs-12 col-sm-8">
				<!-- main information of contents -->
				<div class="row marginBottom30">
					<article class="col-xs-12">
						<header>
							<c:if test="${ contents.ban == \"N\" }">
								<div class="pull-right">
									<c:if test="${ contents.prevContentsNo > 0 }">
										<a href="${ pageContext.request.contextPath }/contents.do?no=${ contents.prevContentsNo }"><i class="fa fa-angle-left fa-lg" aria-hidden="true"></i>
										이전 글</a>
									</c:if>
									<c:if test="${ contents.nextContentsNo > 0 }">
										| <a href="${ pageContext.request.contextPath }/contents.do?no=${ contents.nextContentsNo }">다음 글
										<i class="fa fa-angle-right fa-lg" aria-hidden="true"></i></a>
									</c:if>
								</div>
							</c:if>
							<div class="card-labels">
								<span 
								class="label label-default">${ contents.categoryName }</span><span 
								class="label label-info">${ contents.dataTypeName }</span><a href="${ contents.sourceUrl }" 
								class="label label-primary" target="_blank" 
								title="원본 사이트로 이동(새 창)">${ contents.sourceName }</a>
							</div>
							<h2 class="card-title marginBottom30">
								${ contents.title }
							</h2>
						</header>

						<p class="card-content text-justify marginBottom">
							${ contents.summary }
						</p>
						<footer class="text-right">
							<time class="text-muted">${ contents.scrapedDaysAgo }</time>
						</footer>
					</article>
				</div>

				<div class="row marginBottom30">
					<div role="toolbar" class="toolbar col-xs-12 text-right">
						<%-- 로그인 상태 --%>
						<c:choose>
							<c:when test="${ (userVO ne null) and (not empty userVO) }">
								<%-- 카드 담기 버튼 --%>
								<button type="button" id="${ contents.contentsNo }"
									<c:if test="${ contents.isSaved }">style="display:none"</c:if>
									title="카드 담기" class="btn btn-primary saveCardBtn" data-toggle="modal" data-target="#saveCardModal">
									<i class="fa fa-bookmark" aria-hidden="true"></i> 카드 담기
								</button>
								
								<%-- 카드 담기 취소 버튼 --%>
								<button type="button" id="${ contents.contentsNo }"
									<c:if test="${ not contents.isSaved }">style="display:none"</c:if>
									title="카드 담기 취소" class="btn btn-default saveCancelBtn">
									<i class="fa fa-bookmark-o" aria-hidden="true"></i> 담기 취소
								</button>
							</c:when>
							
							<%-- 비로그인 상태 --%>
							<c:otherwise>
								<button type="button" id="${ contents.contentsNo }" onclick="location.href='${ pageContext.request.contextPath }/login/login.do'"
									title="카드 담기: 로그인이 필요한 서비스입니다" class="btn btn-primary saveCardBtn">
									<i class="fa fa-bookmark" aria-hidden="true"></i> 카드 담기
								</button>
							</c:otherwise>
						</c:choose>
						
						<%-- likeBtn --%>
						<c:choose>
							<c:when test="${ (userVO ne null) and (not empty userVO) }">
								<%-- 카드 좋아요 버튼 --%>
								<button type="button" id="${ contents.contentsNo }" 
									<c:if test="${ contents.isLiked }">style="display:none"</c:if>
									title="좋아요" class="btn btn-primary likeBtn" data-toggle="modal" data-target="#saveCardModal">
									<i class="fa fa-heart" aria-hidden="true"></i> 좋아요
								</button>
								<%-- 카드 좋아요 취소 버튼 --%>
								<button type="button" id="${ contents.contentsNo }" 
									<c:if test="${ not contents.isLiked }">style="display:none"</c:if>
									title="좋아요 취소" class="btn btn-default likeCancelBtn">
									<i class="fa fa-heart-o" aria-hidden="true"></i> 좋아요 취소
								</button>
							</c:when>
							
							<c:otherwise>
								<%-- 비로그인 --%>
								<button type="button" id="${ contents.contentsNo }" onclick="location.href='${ pageContext.request.contextPath }/login/login.do'"
									title="좋아요: 로그인이 필요한 서비스입니다" class="btn btn-primary likeBtn">
									<i class="fa fa-heart" aria-hidden="true"></i> 좋아요
								</button>
							</c:otherwise>
						</c:choose>
						
						<%-- spam/bug report Btn --%>
						<div id="report" class="btn-group" title="신고">
							<a href="#" role="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-expanded="false" title="오류 및 유해물 신고">
								<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
								Report <span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#" role="button" id="${ contents.contentsNo }"
									class="bugReportBtn nofocus" data-toggle="modal"
									data-target="#bugModal" title="오류 신고"> <i
										class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고
								</a></li>
								<li><a href="#" role="button" id="${ contents.contentsNo }"
									class="spamReportBtn nofocus" data-toggle="modal"
									data-target="#spamModal" title="유해물 신고"> <i
										class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고
								</a></li>
							</ul>
						</div>
						
					</div> <!-- /div.toolbar -->
				</div>
			</section>
			<!-- /main information of contents -->

			<!-- additional information of contents -->
			<aside class="col-xs-12 col-sm-3 col-sm-offset-1 well">
				<div id="info">
					<p class="lead">
						<i class="fa fa-info-circle" aria-hidden="true"></i> 정보
					</p>
					<ul class="list-unstyled">
						<li><strong class="viewCnt">${ contents.viewCnt }</strong>회 조회</li>
						<li><strong class="savedCnt">${ contents.savedCnt }</strong>명이 저장함</li>
						<li><strong class="likedCnt">${ contents.likeCnt }</strong>명이 좋아함</li>
						<li><a href="${ contents.url }" target="_blank" title="원본 페이지로 이동(새 창)">
								<i class="fa fa-external-link"aria-hidden="true"></i> 원본 보기
							</a></li>
					</ul>
				</div>
				<hr />
				<div id="share">
					<p class="lead">
						<i class="fa fa-share-alt" aria-hidden="true"></i> 공유
					</p>
					<ul class="list-unstyled" role="menu">
						<!-- <li><a href="#" title="카카오톡으로 공유"><i class="fa fa-commenting fa-fw" aria-hidden="true"></i> KakaoTalk</a></li> -->
						<li><a href="javascript:facebook('${contents.contentsNo}')" title="페이스북으로 공유">
							<i class="fa fa-facebook fa-fw" aria-hidden="true"></i> Facebook
						</a></li>
						<li><a href="javascript:twitter('${contents.contentsNo}')" title="트위터로 공유">
							<i class="fa fa-twitter fa-fw" aria-hidden="true"></i> Twitter
						</a></li>
						<!-- <li><a href="#" title="에버노트로 공유"><i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> Evernote</a></li> -->
					</ul>
				</div>
			</aside>
			<!-- /additional information of contents -->
		</div>

		<!-- memo list -->
		<section id="memo" class="row">
			<div class="col-xs-12">
				<hr/>
				<h4>Memo</h4>
			</div>
			<%-- 메모가 없을 때 --%>
			<c:if test="${ (memoList eq null) or (empty memoList) }">
				<div class="col-xs-12">
					<p id="no-memo" class="lead text-muted">첫 메모를 남겨보세요 &#58;&#41;</p>
				</div>
			</c:if>

			<div class="col-xs-12 card-container mdl-grid">
				<!-- Button trigger modal -->
				<div id="addMemo" class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--0dp">
					<button type="button" class="btn btn-default btn-block" style="min-height: 15.2em"
						<c:choose>
							<c:when test="${ (userVO ne null) and (not empty userVO) }">
								data-toggle="modal" data-target="#writeMemo"
							</c:when>
							<c:otherwise>
								onclick="location.href='${ pageContext.request.contextPath }/login/login.do'"
							</c:otherwise>
						</c:choose>
						><i class="fa fa-plus-circle fa-5x text-muted" aria-hidden="true"></i>
					</button>
				</div>

				<%-- 메모가 있을 때 --%>
				<c:if test="${ (memoList ne null) and (not empty memoList) }">
					<c:forEach var="memo" items="${ memoList }" varStatus="loop">
						<!-- memo -->
						<div id="${ memo.no }" class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--12-col-phone mdl-shadow--3dp">
							<div class="mdl-card__title mdl-color-text--grey-500">
								<h5 class="author mdl-card__title-text">
									<c:out value="${ memo.lastName } ${ memo.firstName }" />
								</h5>
							</div>
							<div
								class="content mdl-card__supporting-text mdl-color-text--grey-800">
								<p id="${ memo.no }" class="message text-justify">
									<c:out value="${ memo.message }" />
								</p>
							</div>
							<div class="mdl-card__menu">
								<div id="report" class="btn-group dropdown pull-right"
									title="신고">
									<a href="#" role="button"
										class="dropdown-toggle mdl-color-text--grey-500"
										data-toggle="dropdown" aria-expanded="false" title="메모 관리">
										<i class="fa fa-bars fa-lg" aria-hidden="true"></i>
									</a>
									<ul class="dropdown-menu" role="menu">
										<c:if test="${ memo.memberNo eq userVO.no }">
											<li><a href="#" id="${ memo.no }" class="editMemo"
												role="button" title="메모 수정"> <i
													class="fa fa-pencil fa-fw" aria-hidden="true"></i> 수정
											</a></li>
											<li><a href="#" id="${ memo.no }" class="delMemo"
												role="button" title="메모 삭제"> <i
													class="fa fa-trash fa-fw" aria-hidden="true"></i> 삭제
											</a></li>
											<li role="presentation" class="divider"></li>
										</c:if>
										<li><a href="#" role="button" id="${ memo.no }"
											class="bugReportBtn nofocus" data-toggle="modal"
											data-target="#bugModal" title="오류 신고"> <i
												class="fa fa-bug fa-fw" aria-hidden="true"></i> 오류 신고
										</a></li>
										<c:if test="${ memo.memberNo ne userVO.no }">
											<li><a href="#" role="button" id="${ memo.no }"
												class="spamReportBtn nofocus" data-toggle="modal"
												data-target="#spamModal" title="유해물 신고"> <i
													class="fa fa-ban fa-fw" aria-hidden="true"></i> 유해물 신고
											</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						<!-- /memo -->
					</c:forEach>
				</c:if>
			</div>
		</section>
		<!-- /memo list -->
	</div>
	<!-- /container -->

	<!-- footer -->
	<jsp:include page="/jsp/include/footer.jsp" />
	<!-- /footer -->

	<!-- Bootstrap JS SET -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	
	<!-- icon-font -->
	<script src="https://use.fontawesome.com/bbddce3010.js"></script>
	

	<!-- Modal -->
	<jsp:include page="/jsp/modal/memo_add.jsp" />
	<jsp:include page="/jsp/modal/card_save.jsp" />
	<jsp:include page="/jsp/modal/report_bug.jsp" />
	<jsp:include page="/jsp/modal/report_spam.jsp" />

	<script>
		//<!-- 페이스북 공유 -->
		function facebook(no) {
			//alert(no);
		    
		    var url = "https://quration.herokuapp.com/contents.do?no="+no;
		    window.open("http://www.facebook.com/sharer/sharer.php?u=" + url);
		}
		
		//<!-- 트위터  공유 -->
		function twitter(no) {
			//alert(no);
		    
		    var url = "https://quration.herokuapp.com/contents.do?no="+no;
		    window.open("https://twitter.com/intent/tweet?text=Quration:답을 열어 줄 그런 사람&url=" + url);
		}
		
		var contentsNo;
		var likeBtn;
		var likeCancelBtn;

		$('.likeBtn').click( function() { 
			
			contentsNo = $(this).attr("id");
			
			$(this).prop('disabled', true).removeClass('btn-info').addClass('btn-warning')
	   		.html('<i class="fa fa-spinner fa-pulse" aria-hidden="true"></i> 좋아요');
			
			$.ajax({
		           url:"${ pageContext.request.contextPath }/contents/likeCntUp.do",
		           type:'POST',
		           data: {"contentsNo" : contentsNo},
		           success:function(data){
		              	console.log("I like it!");

		             // page UI
		             // add likedCnt (content_detail.jsp)
				    	var likedCnt = $('li .likedCnt').text()*1;
				    	$('li .likedCnt').text(likedCnt + 1);
		             
		             // change Btn (content_detail.jsp)
		              	$('button.likeBtn').hide().prop('disabled', false).removeClass('btn-warning').addClass('btn-primary')
		              		.html('<i class="fa fa-heart fa-pulse" aria-hidden="true"></i> 좋아요');
		              	$('button.likeCancelBtn').show();

		           },
		           error:function(jqXHR, textStatus, errorThrown){
		        	   $('button.likeBtn').removeClass('btn-warning').addClass('btn-danger')
	   	    			.html('<i class="fa fa-exclamation-circle" aria-hidden="true"></i> 오류');
		           }
			    });
		});
		
		
		$('.likeCancelBtn').click( function() { 
			contentsNo = $(this).attr("id");
			
			$(this).prop('disabled', true).removeClass('btn-info').addClass('btn-warning')
	   		.html('<i class="fa fa-spinner fa-pulse" aria-hidden="true"></i> 좋아요 취소');
			
			$.ajax({
				url:"${ pageContext.request.contextPath }/contents/likeCancel.do",
		           type:'POST',
		           data: {"contentsNo" : contentsNo},
		           success: function(data){
			        	console.log("Like canceled!");

			             // page UI
			             // add likedCnt (content_detail.jsp)
					    	var likedCnt = $('li .likedCnt').text()*1;
					    	$('li .likedCnt').text(likedCnt - 1);
			             
			             // change Btn (content_detail.jsp)
		              	$('button.likeCancelBtn').hide().prop('disabled', false).removeClass('btn-warning').addClass('btn-primary')
		              		.html('<i class="fa fa-heart-o fa-pulse" aria-hidden="true"></i> 좋아요 취소');
						$('button.likeBtn').show();
		           },
		           error: function(){
		        	   $('button.likeCancelBtn').removeClass('btn-warning').addClass('btn-danger')
	   	    			.html('<i class="fa fa-exclamation-circle" aria-hidden="true"></i> 오류');
		           }
			    });
		});
		
		$(document).ready(function() {
			$("#banAlert").hide();
			var banBtn = $('.banBtn').attr("id");
			// $(".banBtn").hide();
			
			if(banBtn == 'Y'){
				$(".banBtn").trigger('click');
			}
			
		});
		
		$('.banUp').click( function() { 
			$("#banAlert").show('slow');
		});
	</script>
</body>

</html>