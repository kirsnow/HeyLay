<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row marginTop20">
	<div class="col-xs-12">
		<b>이런 단어로 검색해보시겠어요?</b>
	</div>
	
		<div class="col-xs-12">
			<ul class="list-unstyled marginTop20 font20 marginBottom100">
				<li class="marginTop"><a href="${ pageContext.request.contextPath }/search/result.do?q=Bloter" title="Bloter 검색">Bloter</a></li>
				<li class="marginTop"><a href="${ pageContext.request.contextPath }/search/result.do?q=에듀 테크" title="에듀 테크 검색">에듀 테크</a></li>
				<li class="marginTop"><a href="${ pageContext.request.contextPath }/search/result.do?q=인공지능" title="인공지능 검색">인공지능</a></li>
				<li class="marginTop"><a href="${ pageContext.request.contextPath }/contents.do?no=143" title="Java에 대해 보기">Java란?</a></li>
			</ul>
		</div>
</div>