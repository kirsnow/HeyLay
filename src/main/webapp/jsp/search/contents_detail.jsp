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
    
	<script>
    	<!-- google analytics -->
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
                
                <hr/>
                <div id="stats">
                    <p class="lead"><i class="fa fa-pie-chart" aria-hidden="true"></i> stats</p>
                </div>
               
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
       			<div id="addMemo" class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--0dp">
	       			<c:choose>
	       				<c:when test="${ (userVO ne null) and (not empty userVO) }">
	       					<button type="button" class="btn btn-default btn-block"
									data-toggle="modal" data-target="#writeMemo" 
									style="min-height: 15.2em">
								<i class="fa fa-plus-circle fa-5x text-muted" aria-hidden="true"></i>
							</button>
	       				</c:when>
	       				<c:otherwise>
	       					<button type="button" class="btn btn-default btn-block" onclick="location.href='${ pageContext.request.contextPath }/login/login.do'"
									style="min-height: 15.2em">
								<i class="fa fa-plus-circle fa-5x text-muted" aria-hidden="true"></i>
							</button>
	       				</c:otherwise>
	       			</c:choose>
					
				</div>
					
	        	<%-- 메모가 있을 때 --%>
	        	<c:if test="${ (memoList ne null) and (not empty memoList) }">
	        		<c:forEach var="memo" items="${ memoList }" varStatus="loop">
	                <!-- card -->
	                <div id="${ memo.no }" class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">
	                    <div class="mdl-card__title mdl-color-text--grey-500">
	                        <h5 class="author mdl-card__title-text">
	                        	<c:out value="${ memo.firstName } ${ memo.lastName }"/>
	                        </h5>
	                    </div>
	                    <div class="content mdl-card__supporting-text mdl-color-text--grey-800">
	                        <p id="${ memo.no }" class="message text-justify"><c:out value="${ memo.message }"/></p>
	                    </div>
	                    <div class="mdl-card__menu">
	                        <div id="report" class="btn-group dropdown pull-right" title="신고">
	                            <a href="#" role="button" class="dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="메모 관리">
	                                <i class="fa fa-bars fa-lg" aria-hidden="true"></i>
	                            </a>
	                            <ul class="dropdown-menu" role="menu">
	                            <c:if test="${ memo.memberNo eq userVO.no }">
	                                <li>
	                                	<a href="#" id="${ memo.no }" class="editMemo" role="button" title="메모 수정">
		                                	<i class="fa fa-pencil fa-fw" aria-hidden="true"></i>
		                                	수정
	                                	</a>
	                                </li>
	                                <li>
	                                	<a href="#" id="${ memo.no }" class="delMemo" role="button" title="메모 삭제">
		                                	<i class="fa fa-trash fa-fw" aria-hidden="true"></i>
		                                	삭제
	                                	</a>
	                                </li>
	                                <li role="presentation" class="divider"></li>
	                            </c:if>
	                                <li>
	                                	<a href="${ pageContext.request.contextPath }/contact/bug.do?no=${ memo.no }&type=memo" title="오류 신고">
		                                	<i class="fa fa-bug fa-fw" aria-hidden="true"></i>
		                                	오류 신고
	                                	</a>
	                                </li>
	                            <c:if test="${ memo.memberNo ne userVO.no }">
	                                <li>
	                                	<a href="${ pageContext.request.contextPath }/contact/spamMemo.do?no=${ memo.no }" title="유해물 신고">
	                                		<i class="fa fa-ban fa-fw" aria-hidden="true"></i>
	                                		유해물 신고
	                                	</a>
	                                </li>
	                            </c:if>
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
	<jsp:include page="/jsp/modal/memo_add.jsp" />
	<script>
		/* modal autofocus */
		$('#writeMemo').on('shown.bs.modal', function () {
		  $('button#saveMemo').removeAttr('disabled', 'disabled').removeClass('btn-warning btn-success btn-danger').addClass('btn-primary')
  			.html('<i class="fa fa-pencil" aria-hidden="true"></i> 작성');
		  $('#memoMessage').focus()
		});
		
		/* memo 추가용 변수 */
     	
     	var memoHeader  =  '<!-- card -->';
	     	memoHeader  += '<div id="';
     	var memoHeader2 =  			'" class="mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp">';
	     	memoHeader2 += '	<div class="mdl-card__title mdl-color-text--grey-500">';
	     	memoHeader2 += '		<h5 class="author mdl-card__title-text">';
	    var memoHeader3 =  		'</h5>';
	    	memoHeader3 += '	</div>';
	    	
    	var memoText  =  '	<div class="content mdl-card__supporting-text mdl-color-text--grey-800">';
	     	memoText  += '		<p class="text-justify">';
	     	memoText  += '		<p id="';
	    var memoText2 =  			'" class="message text-justify">';
	    var memoText3 =  		'</p>';
		    memoText3 += '	</div>';
		    
	    var memoMenu  =  '	<div class="mdl-card__menu">';
		    memoMenu  += '		<div id="report" class="btn-group dropdown pull-right" title="신고">';
		    memoMenu  += '			<a href="#" role="button" class="dropdown-toggle mdl-color-text--grey-500" data-toggle="dropdown" aria-expanded="false" title="메모 관리">';
		    memoMenu  += '				<i class="fa fa-bars fa-lg" aria-hidden="true"></i>';
		    memoMenu  += '			</a>';
		    memoMenu  += '			<ul class="dropdown-menu" role="menu">';
		    memoMenu  += '				<li>';
		    memoMenu  += '					<a href="#" id="';
    	var	memoMenu2 =  						'" class="editMemo" role="button" title="메모 수정">';
	    	memoMenu2 += '						<i class="fa fa-pencil fa-fw" aria-hidden="true"></i> 수정';
	    	memoMenu2 += '					</a>';
	    	memoMenu2 += '				</li>';
	    	memoMenu2 += '				<li>';
	    	memoMenu2 += '					<a href="#" id="';
   		var memoMenu3 =  						'" class="delMemo" role="button" title="메모 삭제">';
	  		memoMenu3 += '					<i class="fa fa-trash fa-fw" aria-hidden="true"></i> 삭제';
	  		memoMenu3 += '					</a>';
	  		memoMenu3 += '				</li>';
	  		memoMenu3 += '				<li role="presentation" class="divider"></li>';
	  		memoMenu3 += '				<li>';
	  		memoMenu3 += '					<a href="${ pageContext.request.contextPath }/contact/bug.do?no=';
   		var memoMenu4 =  								'&type=memo" title="오류 신고">';
	   		memoMenu4 += '						<i class="fa fa-bug fa-fw" aria-hidden="true"></i>';
	   		memoMenu4 += '						오류 신고';
	   		memoMenu4 += '					</a>';
	   		memoMenu4 += '				</li>';
	   		memoMenu4 += '			</ul>';
	   		memoMenu4 += '		</div>';
	   		memoMenu4 += '	</div>';
	   		
   		var memoFooter =  '</div>';
	   		memoFooter += '<!-- /card -->';
     	
	   	/* 메모 추가 모달에서 작성 버튼 클릭 시, ajax를 통해 DB에 메모 추가 */
	    $('button#saveMemo').click(function() {
	    	$(this).attr('disabled', 'disabled').removeClass('btn-primary').addClass('btn-warning')
    		.html('<i class="fa fa-spinner fa-pulse" aria-hidden="true"></i> 작성 중');
	    	
	        $.ajax({
	        	url: '${ pageContext.request.contextPath }/memo/ajax/addMemo.do'
	        	, type: 'POST'
	        	, data : { 
	        		'memoMessage' : $('#memoMessage').val()
	        		, 'contentsNo' : '${ contents.no }'
			    }, success: function(added) {
	            	$('#memoMessage').val('');
	            	var memo = memoHeader;
	            	memo += added.no;
	            	memo += memoHeader2;
	            	memo += added.firstName + '&nbsp;' + added.lastName;
	            	memo += memoHeader3;
	            	memo += memoText;
	            	memo += added.no;
	            	memo += memoText2;
	            	memo += added.message;
	            	memo += memoText3;
	            	memo += memoMenu;
	            	memo += added.no;
	            	memo += memoMenu2;
	            	memo += added.no;
	            	memo += memoMenu3;
	            	memo += added.no;
	            	memo += memoMenu4;
	            	memo += memoFooter;
	            	
	            	$('button#saveMemo').removeClass('btn-warning').addClass('btn-success')
    	    		.html('<i class="fa fa-check" aria-hidden="true"></i> 작성 완료');
	            	
	            	$('#writeMemo').modal('hide');
	            	
	            	$('button#saveMemo').removeAttr('disabled', 'disabled').removeClass('btn-warning btn-success btn-danger').addClass('btn-primary')
	      			.html('<i class="fa fa-pencil" aria-hidden="true"></i> 작성');
	            	
	            	$('#addMemo').after(memo).fadeIn("slow", function() {});
	            	
	        	}, error : function() {
	        		console.log('메모 작성 오류');
	        		$('button#saveMemo').removeClass('btn-warning').addClass('btn-danger')
    	    		.html('<i class="fa fa-exclamation-circle" aria-hidden="true"></i> 작성 오류');
        	}});
	    });
	    
	    
	    /* 메모 수정 메뉴 클릭 시, 수정 폼 로드 */
	    $(document).on('click','a.editMemo', function() {
	    	var memoNo = $(this).attr('id');
	    	var message = $('p#' + memoNo + '.message');
	    	message.html('<textarea id="editMessage" class="form-control" rows="3">' + message.text() + '</textarea><button type="button" id="' + memoNo + '" class="saveEdit btn btn-primary btn-block"><i class="fa fa-pencil" aria-hidden="true"></i> 수정</button>');
	    });
	    
	    /* 메모 수정 폼에서 수정 버튼 클릭 시, ajax를 통해 DB에서 메모 수정 */
	    $(document).on('click','button.saveEdit', function(){
	    	$(this).attr('disabled', 'disabled').removeClass('btn-primary').addClass('btn-warning')
	    		.html('<i class="fa fa-spinner fa-pulse" aria-hidden="true"></i> 수정 중');
	    	$.ajax({
	        	url: '${ pageContext.request.contextPath }/memo/ajax/editMemo.do'
	        	, type: 'POST'
	        	, data : { 
	        		'memoMessage' : $('#editMessage').val()
	        		, 'memoNo' : $(this).attr('id')
			    }, success: function(edited) {
	            	console.log(edited);
	            	$('#memoMessage').val('');
	            	$('button#' + edited.no +'.saveEdit').removeClass('btn-warning').addClass('btn-success')
	    	    		.html('<i class="fa fa-check" aria-hidden="true"></i> 수정 완료');
	            	$('p#' + edited.no + '.message').html(edited.message);
	            	console.log('메모 수정 성공');
	        	}, error : function() {
	        		console.log('메모 수정 오류');
	        }});
	    });
	    
	    /* 메모 삭제 메뉴 클릭 시, ajax를 통해 DB에서 메모 삭제 */
	    $(document).on('click','a.delMemo', function(){
	    	$(this).parents('div.mdl-card').fadeTo("slow", 0.4, function() {
	    		$(this).children('div.content').addClass('lead text-center vcenter')
	    		.html('<i class="fa fa-spinner fa-5x fa-spin" aria-hidden="true"></i>');
	    	});
	    		
	        $.ajax({
	        	url: '${ pageContext.request.contextPath }/memo/ajax/delMemo.do'
	        	, type: 'POST'
	        	, data : { 
	        		'memoNo' : $(this).attr('id')
			    }, success: function(deleted) {
	            	$('div.mdl-card#' + deleted).fadeOut("slow", function() { $(this).remove() });
	            	console.log('메모 ' + deleted + '번 삭제 성공');
	        	}, error : function() {
	        		console.log('메모 삭제 오류');
	        }});
	    });
	</script>
	<!-- /Modal -->
	
</body>

</html>