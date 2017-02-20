<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Keyword</title>
<!-- Basic Page Needs -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${ searchQuery } 검색어 분석 결과 | Quration: 답을 열어 줄 그런 사람</title>
    <!-- 검색 키워드를 title로 동적 지정 -->

    <!-- MDL Hosted start -->
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

    <!-- Bootstrap CSS SET -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">

    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
</head>
<body>
	<p class="lead">${ searchQuery }</p>
	<c:forEach var="query" items="${ queryList }" varStatus="loop">
		<button class="btn ${ query.btnClass }" type="button" disabled="disabled">
			${ query.token } <span class="badge">${ query.type }</span>
		</button>
	</c:forEach>
	
	
	<c:forEach var="query" items="${ queryList }" varStatus="loop">
		<dl class="dl-horizontal">
			<dt>token</dt>
			<dd>${ query.token }</dd>
			<dt>type</dt>
			<dd>${ query.type }</dd>
			<dt>start</dt>
			<dd>${ query.start }</dd>
			<dt>end</dt>
			<dd>${ query.end }</dd>
			<dt>position</dt>
			<dd>${ query.position }</dd>
		</dl>
	</c:forEach>
</body>
</html>