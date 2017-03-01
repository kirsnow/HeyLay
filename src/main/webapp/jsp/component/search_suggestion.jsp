<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row marginTop20">
	<div class="col-xs-12">
		<p>아래 키워드로 검색해보시겠어요?</p>
	</div>
	<div class="col-xs-12">
		<ul class="list-inline" style="margin-bottom:0px">
			<li><a href="${ pageContext.request.contextPath }/search/result.do?q=인공지능" title="인공지능 검색" class="btn btn-default">
				인공지능 <i class="fa fa-search text-muted"></i>
			</a></li>
			<li><a href="${ pageContext.request.contextPath }/search/result.do?q=구글" title="구글 검색" class="btn btn-default">
				구글 <i class="fa fa-search text-muted"></i>
			</a></li>
			<li><a href="${ pageContext.request.contextPath }/search/result.do?q=프로그래밍 언어에 대하여" title="프로그래밍 언어에 대하여 검색" class="btn btn-default">
				프로그래밍 언어에 대하여 <i class="fa fa-search text-muted"></i>
			</a></li>
		</ul>
	</div>
</div>