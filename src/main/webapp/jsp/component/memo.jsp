<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
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