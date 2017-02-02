<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${ contents.title } | Quration: 답을 열어 줄 그런 사람</title>
    <!-- 각 콘텐츠 제목을 title로 동적 지정 -->

    <!-- Bootstrap CSS SET -->
    <link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    
    <!-- icon-font -->
    <script src="https://use.fontawesome.com/bbddce3010.js"></script>
    
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
	                <li><a href="${ pageContext.request.contextPath }/">Home</a></li>
	                <li><a href="#">${ contents.category }</a></li>
	                <li class="active">${ contents.title }</li>
	            </ol>
            </div>
        </div>
        <!-- /Breadcrumb -->

        <div class="row">
            <section class="col-md-9">
                <!-- main information of contents -->
                <article>
                    <header>
                        <p class="pull-right">
                        	<a href="${ contents.url }" target="_blank" title="원본 페이지로 이동(새 창)">
	                        	<i class="fa fa-external-link" aria-hidden="true"></i>
	                        	원본 보기
                        	</a>
                        </p>
                        <p>
                            <span class="label label-default">
                            	${ contents.category }
                            </span>
                            <span class="label label-info">
                            	${ contents.dataType }
                            </span>
                            <a href="${ contents.sourceUrl }" class="label label-primary" target="_blank" title="원본 사이트로 이동(새 창)">
                            	${ contents.source }
                            </a>
                        </p>
                        <div class="page-header">
                        	<h2>${ contents.title }</h2>
                        </div>
                    </header>
                    
                    <p class="text-justify">${ contents.summary }</p>
                    <footer class="text-right ">
                        <time class="text-muted"><small>${ contents.lastScraped } 확인</small></time>
                    </footer>
                </article>

                <hr/>
                <div role="toolbar">
                    <button type="button" class="btn btn-xs btn-default" title="카드를 보관함에 담습니다.">
                        <i class="fa fa-star-o" aria-hidden="true"></i> ${ contents.saveCnt }
                    </button>
                    <button type="button" class="btn btn-xs btn-default" title="카드를 좋아합니다.">
                        <i class="fa fa-heart-o" aria-hidden="true"></i> ${ contents.likeCnt }
                    </button>
                    <div id="share" class="btn-group">
                        <a href="#" role="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                            <i class="fa fa-share-alt" aria-hidden="true"></i> Share
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#" title="카카오톡으로 공유"><i class="fa fa-commenting fa-fw" aria-hidden="true"></i> KakaoTalk</a></li>
                            <li><a href="#" title="페이스북으로 공유"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i> Facebook</a></li>
                            <li><a href="#" title="트위터로 공유"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i> Twitter</a></li>
                            <li><a href="#" title="에버노트로 공유"><i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> Evernote</a></li>
                        </ul>
                    </div>
                    <div id="report" class="btn-group" title="신고">
                        <a href="#" role="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Report
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                            	<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ contents.no }&type=contents" title="오류 신고">
	                            	<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
	                            	오류 신고
	                            </a>
                            </li>
                            <li>
	                            <a href="${ pageContext.request.contextPath }/contact/spamContents.do?no=${ contents.no }" title="유해물 신고">
	                            	<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
	                            	유해물 신고
	                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- /main information of contents -->

            <!-- additional information of contents -->
            <aside class="col-md-3 well">
                <div id="img">
                    <p class="lead"><i class="fa fa-image" aria-hidden="true"></i> images</p>
                    <figure>
                        <img src="${ pageContext.request.contextPath }/img/defaultImage.png" alt="Default Image" width="250px" />
                        <figcaption>Fig1. - The Pulpit Rock, Norway.</figcaption>
                    </figure>
                </div>
                <hr/>
                <div id="info">
                	<p class="lead"><i class="fa fa-info-circle" aria-hidden="true"></i> info</p>
                	<ul class="list-unstyled">
                		<li><strong>${ contents.viewCnt }</strong>회 조회되었습니다.</li>
                		<li><strong>${ contents.saveCnt }</strong>명이 저장했습니다.</li>
                		<li><strong>${ contents.likeCnt }</strong>명이 좋아했습니다.</li>
                	</ul>
                </div>
                <%-- 
                <hr/>
                <div id="stats">
                    <p class="lead"><i class="fa fa-pie-chart" aria-hidden="true"></i> stats</p>
                </div>
                --%>
            </aside>
            <!-- /additional information of contents -->
        </div>

        <!-- memo -->
        <section id="memo" class="row">
            <hr/>
            <h4>Memo</h4>
            
			<%-- 메모가 없을 때 --%>
        	<c:if test="${ (memoList eq null) or (empty memoList) }">
				<div class="row">
					<div class="col-md-12">
						<p class="lead text-muted">첫 메모를 남겨보세요 &#58;&#41;</p>
					</div>
				</div>
				<div class="row">
					
				</div>
        	</c:if>
	        	
       		<div class="row card-container mdl-grid">
				<!-- Button trigger modal -->
       			<div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--0dp">
					<button type="button" class="btn btn-default btn-block"
							data-toggle="modal" data-target="#addMemo" 
							<%-- data-backdrop="false" --%>
							style="min-height: 15.2em">
						<i class="fa fa-plus-circle fa-5x text-muted" aria-hidden="true"></i>
					</button>
				</div>
					
	        	<%-- 메모가 있을 때 --%>
	        	<c:if test="${ (memoList ne null) and (not empty memoList) }">
	        		<c:forEach var="memo" items="${ memoList }" varStatus="loop">
	                <!-- card -->
	                <div class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
	                    <div class="mdl-card__title mdl-color-text--grey-500">
	                        <h5 class="author mdl-card__title-text">
	                        	<i class="fa fa-user-circle-o" aria-hidden="true"></i> &nbsp;
	                        	<c:out value="${ memo.firstName } ${ memo.lastName }"/>
	                        </h5>
	                    </div>
	                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
	                        <p class="text-justify">
	                        	<c:out value="${ memo.message }"/>
	                        </p>
	                    </div>
	                    <div class="mdl-card__menu">
	                        <div id="report" class="btn-group dropdown pull-right" title="신고">
	                            <a href="#" role="button" class="dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="외부 서비스로 공유">
	                                <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
	                            </a>
	                            <ul class="dropdown-menu" role="menu">
	                                <li>
	                                	<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ memo.no }&type=memo" title="오류 신고">
		                                	<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
		                                	오류 신고
	                                	</a>
	                                </li>
	                                <li>
	                                	<a href="${ pageContext.request.contextPath }/contact/spamMemo.do?no=${ memo.no }" title="유해물 신고">
	                                		<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
	                                		유해물 신고
	                                	</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	                <!-- /card -->
					</c:forEach>
				</c:if>
       		</div>
        </section>
        <!-- /memo -->
    </div>
    <!-- /container -->
    
    <!-- footer -->
    <jsp:include page="/jsp/include/footer.jsp" />
    <!-- /footer -->

    <!-- Modal -->
	<div class="modal fade" id="addMemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title text-muted" id="myModalLabel">
						<i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;
						<c:choose>
							<c:when test="${ userVO ne null }">
	                   			<c:out value="${ userVO.firstName } ${ userVO.lastName }"/>
		                   	</c:when>
		                   	<c:otherwise>
		                   		Guest
		                   	</c:otherwise>
						</c:choose>
					</h4>
				</div>
				<div class="modal-body">
					<textarea id="memoMessage" class="form-control" rows="7"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">저장</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#addMemo').on('shown.bs.modal', function () {
		  $('#memoMessage').focus()
		})
		
		$('.modal').on('show.bs.modal', function () {
	        if ($(document).height() > $(window).height()) {
	            // no-scroll
	            $('body').addClass("modal-open-noscroll");
	        }
	        else {
	            $('body').removeClass("modal-open-noscroll");
	        }
	    });
	    $('.modal').on('hide.bs.modal', function () {
	        $('body').removeClass("modal-open-noscroll");
	    });
	</script>
	<!-- /Modal -->
	
</body>

</html>