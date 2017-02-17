<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row marginTop20">
	<div class="col-xs-12">
		다른 단어로 검색해보시겠어요?
	</div>
	<div class="col-xs-12">
		<ul class="">
			<li><a href="${ pageContext.request.contextPath }/search/result.do?q=John" title="John 검색">John</a></li>
			<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Kim" title="Kim 검색">Kim</a></li>
			<li><a href="${ pageContext.request.contextPath }/search/result.do?q=Elasticsearch" title="Elasticsearch 검색">Elasticsearch</a></li>
			<li><a href="${ pageContext.request.contextPath }/search/contents.do?no=143">view sample Contents</a></li>
		</ul>
	</div>
</div>