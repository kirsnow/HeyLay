<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:forEach var="card" items="${ requestScope.cards }" varStatus="loop">
<c:set var="plainTitle" value="${ fn:replace( fn:replace(card.title, '<mark>', ''), '</mark>', '') }"/>
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
			<h5 class="card-title mdl-card__title-text drop-text-2" title="<c:out value="${ plainTitle }" />" 
				data-toggle="tooltip" data-placement="bottom">
			${ card.title }</h5>
		</div>
	
		<!-- card text -->
		<div class="content mdl-card__supporting-text mdl-color-text--grey-800" style="width: 100%">
			<p class="card-content drop-text-5">
				${ card.summary }
			</p>
			<div class="text-muted text-right">
				<c:choose>
					<c:when test="${ (userVO ne null) and (not empty userVO) }">
						<span>이 카드를 ${ card.personalVieCnt }번 방문했습니다.</span>
					</c:when>
					<c:when test="${ card.savedDaysAgo ne null }">
						<span title="<fmt:formatDate pattern="yyyy. MM. dd." value="${ card.savedDate }"/>"
							 data-toggle="tooltip" data-placement="left">
							 ${ card.savedDaysAgo }
						</span>
					</c:when>
					<%-- <c:when test="${ (card.scrapedDaysAgo ne null) and (card.savedDaysAgo eq null) }">
						<span title="<fmt:formatDate pattern="yyyy. MM. dd." value="${ card.scrapedDate }"/>"
							 data-toggle="tooltip" data-placement="left">
							 ${ card.scrapedDaysAgo }
						</span>
					</c:when> --%>
				</c:choose>
			</div>
			
		</div>
	
		<!-- card menu (top-right) -->
		<div class="mdl-card__menu">
			<div id="save" class="btn-group dropdown pull-right">
				<c:choose>
					<%-- 로그인 상태 --%>
					<c:when test="${ (userVO ne null) and (not empty userVO) }">
						<%-- 카드 저장 버튼 --%>
						<a id="${ card.contentsNo }" title="카드 담기" class="saveCardBtn nofocus" 
							<c:if test="${ card.isSaved }">style="display: none;"</c:if>
							data-toggle="modal" data-target="#saveCardModal" href="#">
						<i class="fa fa-bookmark fa-3x" aria-hidden="true"></i></a>
						
						<%-- 카드 저장 취소 버튼 --%>
						<a id="${ card.contentsNo }" title="카드 담기 취소" class="saveCancelBtn nofocus" 
							<c:if test="${ not card.isSaved }">style="display: none;"</c:if>
							href="#">
						<i class="fa fa-bookmark fa-3x" aria-hidden="true"></i></a>
					</c:when>
					
					<%-- 비로그인 상태 --%>
					<c:otherwise>
						<a id="${ card.contentsNo }" href="${ pageContext.request.contextPath }/login/login.do"
							title="카드 담기: 로그인이 필요한 서비스입니다" class="saveCardBtn">
						<i class="fa fa-bookmark fa-3x" aria-hidden="true"></i></a>
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
							<a href="javascript:facebook('${card.contentsNo}')" title="페이스북으로 공유">
								<i class="fa fa-facebook fa-fw" aria-hidden="true"></i> 
								Facebook
							</a>
						</li>
						<li>
							<a href="javascript:twitter('${card.contentsNo}')" title="트위터로 공유">
								<i class="fa fa-twitter fa-fw" aria-hidden="true"></i> 
								Twitter
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
							<a href="#" role="button" id="${ card.contentsNo }" class="bugReportBtn nofocus" title="오류 신고">
								<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
								오류 신고
							</a>
						</li>
						<li>
							<a href="#" role="button" id="${ card.contentsNo }" class="spamReportBtn nofocus"
							   data-toggle="modal" data-target="#spamModal" title="유해물 신고">
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
	    
	    var url = "https://quration.herokuapp.com/contents.do?no="+no;
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + url);
	}
	
	//<!-- 트위터  공유 -->
	function twitter(no) {
		//alert(no);
	    
	    var url = "https://quration.herokuapp.com/contents.do?no="+no;
	    window.open("https://twitter.com/intent/tweet?text=Quration:답을 열어 줄 그런 사람&url=" + url);
	}
	
</script>