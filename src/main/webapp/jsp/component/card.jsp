<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="card" items="${ requestScope.cards }" varStatus="loop">
	<!-- card -->
	<div class="card-ancestor mdl-card mdl-cell mdl-cell--4-col mdl-cell--12-col-phone mdl-shadow--3dp">
	
		<!-- card top: contents source -->
		<div class="card-labels mdl-card__title mdl-color-text--grey-500">
			<span class="label label-default">
				<c:out value="${ card.categoryName }" />
			</span>
			<span class="label label-info"> 
				<c:out value="${ card.dataTypeName }" />
			</span>
			<a href="${ card.sourceUrl }" class="label label-primary" target="_blank" title="원본 사이트로 이동(새 창)"> 
				<c:out value="${ card.sourceName }" />
			</a>
		</div>
		
		<!-- card image -->
		<c:if test="${ card.imgUrl ne null }">
			<figure class="mdl-card__media" style="margin: 0px">
				<img src="<c:out value="${ card.imgUrl }" />"
					alt="${ card.imgAlt }" style="width: 100%; height: 200px">
			</figure>
		</c:if>
		
		<!-- card title -->
		<div class="mdl-card__title">
			<h5 class="card-title mdl-card__title-text drop-text-2" 
			title="${ card.title }" data-toggle="tooltip" data-placement="bottom">
			${ card.title }</h5>
		</div>
	
		<!-- card text -->
		<div class="content mdl-card__supporting-text mdl-color-text--grey-800" style="width: 100%">
			<p class="card-content drop-text-5">
				${ card.summary }
			</p>
			<div class="text-muted text-right">${ card.savedDaysAgo } ${ card.scrapedDaysAgo }</div>
		</div>
	
		<!-- card menu (top-right) -->
		<div class="mdl-card__menu">
			<div id="save" class="btn-group dropdown pull-right">
				<c:choose>
					<c:when test="${ (userVO ne null) and (not empty userVO) }">
						<a href="#" role="button" id="${ card.contentsNo }" class="saveCardBtn nofocus"
							data-toggle="modal" data-target="#saveCardModal"
							title="카드 담기"> 
							<i class="fa fa-bookmark-o fa-2x text-muted" aria-hidden="true"></i>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${ pageContext.request.contextPath }/login/login.do"
							id="${ card.contentsNo }" class="saveCardBtn" title="카드 담기: 로그인이 필요한 서비스입니다">
							<i class="fa fa-bookmark-o fa-2x text-muted" aria-hidden="true"></i>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	
		<!-- card action buttons (bottom) -->
		<div class="mdl-card__actions mdl-card--border">
			<a href="${ pageContext.request.contextPath }/contents.do?no=${ card.contentsNo }&q=${ searchResult.query }" 
				 class="btn btn-link" title="상세 페이지 더 보기">
				더 보기
			</a>
			
			<!-- buttons (bottom-right) -->
			<div class="pull-right">
				<div id="share" class="btn-group dropup">
					<a href="#" role="button" class="btn dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
						<i class="fa fa-share-alt fa-lg mdl-color-text--grey-500" aria-hidden="true"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-right" role="menu">
						<li>
							<a href="#" title="카카오톡으로 공유">
								<i class="fa fa-commenting fa-fw" aria-hidden="true"></i> 
								KakaoTalk
							</a>
						</li>
						<li>
							<a href="javascript:facebook('${card.contentsNo}')" title="페이스북으로 공유">
								<i class="fa fa-facebook fa-fw" aria-hidden="true"></i> 
								Facebook
							</a>
						</li>
						<li>
							<a href="#" title="트위터로 공유">
								<i class="fa fa-twitter fa-fw" aria-hidden="true"></i> 
								Twitter
							</a>
						</li>
						<li>
							<a href="#" title="에버노트로 공유">
								<i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> 
								Evernote
							</a>
						</li>
					</ul>
				</div>
				<div id="report" class="btn-group dropup" title="신고">
					<a href="#" role="button"
						class="btn dropdown-toggle mdl-color-text--grey-500"
						data-toggle="dropdown" aria-expanded="false" title="신고">
						<i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-right" role="menu">
						<li>
							<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ card.contentsNo }&type=contents"
								title="오류 신고">
								<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
								오류 신고
							</a>
						</li>
						<li>
							<a href="${ pageContext.request.contextPath }/contact/spamContents.do?no=${ card.contentsNo }"
								title="유해물 신고">
								<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
								유해물 신고
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- /buttons (bottom-right) -->
			
		</div>
		<!-- /card action buttons (bottom) -->
	</div>
	<!-- /card -->
</c:forEach>
<script>
	//<!-- 페이스북 공유 -->
	function facebook(no) {
		//alert(no);
	    //location.href = "${ pageContext.request.contextPath }/share/faceBook.do?no=" + no;
	    
	    var url = "https://quration.herokuapp.com/search/contents.do?no="+no;
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + url);
	}
</script>