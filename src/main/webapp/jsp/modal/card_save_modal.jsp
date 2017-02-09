<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade" id="saveCard" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-muted" id="myModalLabel">
					<i class="fa fa-inbox" aria-hidden="true"></i>&nbsp;
					카드 저장
				</h4>
			</div>
			<div class="modal-body">
				<div class="col-md-6 col-md-offset-3">
					<div class="col-md-6 paddingleft30 marginTop20">
						<div class="mdl-card__title mdl-color-text--grey-500">
							<div><span class="label label-default" id="category"></span></div>
			                        <span class="label label-default">dd</span>
		                            <span class="label label-info">dd</span>
<%-- 		                            <a href="${ card.sourceUrl }" class="label label-primary" target="_blank" title="원본 사이트로 이동(새 창)">
		                            	<c:out value="${ contents.source }" />
		                            </a> --%>
			                    </div>
						<div class="row">
							<div class="col-md-4">title</div>
							<div class="col-md-8">자바란?</div>
						</div>
						<div class="row">
							<div class="col-md-5">contents</div>
							<div class="col-md-7">자바 (Java) - 객체 지향 프로그래밍 언어</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-md-offset-3 marginTop30 ">
					<textarea name="memo" id="memo" class="form-control" rows="4" placeholder="메모쓰기"></textarea>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="row">
				<div class="marginTop">
					<div id="report"
						class="btn-group dropdown col-md-2 col-md-offset-3" title="신고">
						<a href="#" role="button" class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
							<i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
							Report
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#" title="오류 신고"><i class="fa fa-bug fa-fw"
									aria-hidden="true"></i>오류 신고</a></li>
							<li><a href="#" title="유해물 신고"><i
									class="fa fa-ban fa-fw" aria-hidden="true"></i>유해물 신고</a></li>
						</ul>
					</div>

					<div class="col-md-push-1 col-md-3">
						<div class="btn-group">
							<select class="form-control"
								onchange="if (this.value) window.location.href = this.value;">
								<!-- 색 변경 이유  -->
								<option value="#">옮길 폴더 선택</option>
								<option value="#">my favorite</option>
								<option value="#">PlanB☆</option>
								<option value="#">나의 첫 폴더♡</option>
								<option value="#">+ 새 폴더 추가</option>
							</select>
						</div>
					</div>
					<div class="col-md-1">
						<button type="button" id="btnCardSave" class="btn btn-primary btn-block">
							저장
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

</script>
