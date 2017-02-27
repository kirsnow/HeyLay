<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:choose>
	<c:when test="${ (dirList ne null) and (not empty dirList) }">
		<c:set var="dir1stNo" value="${ dirList[0].no }" />
		<c:set var="dir1stName" value="${ dirList[0].name }" />
	</c:when>
	<c:otherwise>
		<c:set var="dir1stNo" value="-1" />
	</c:otherwise>
</c:choose>

<div class="modal fade" id="saveCardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-muted" id="myModalLabel">
					<i class="fa fa-bookmark" aria-hidden="true"></i>&nbsp; 카드 담기
				</h4>
			</div>
			<div class="modal-body">
				<section>
					<div class="cardInfo">Labels</div>
					<dl>
						<dt class="cardInfo marginTop20 drop-text-1">Title</dt>
						<dd class="marginTop"><p class="cardInfo drop-text-3">undefined</p></dd>
					</dl>
				</section>
				<textarea id="memoMessage" class="form-control marginTop" rows="3" placeholder="메모 쓰기..."></textarea>
			</div>
			
			<div class="modal-footer">
				<div class="input-group" role="group">
					<input type="text" class="form-control" id="dirName" aria-label="..." 
						<c:if test="${ (dirList ne null) and (not empty dirList) }">
							readonly="readonly" value="${ dirList[0].name }" test="test"
						</c:if>
						placeholder="새 폴더 이름...">
					<div class="input-group-btn">
						<div class="btn-group dropup" role="group">
							<button type="button" class="btn btn-default form-control dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-menu-right" role="menu">
								<c:if test="${ (dirList ne null) and (not empty dirList) }">
									<c:forEach var="dir" items="${ dirList }" varStatus="loop">
										<li role="presentation"><a role="menuitem" tabindex="-1" href="#" id="${ dir.no }" class="dirList">${ dir.name }</a></li>
									</c:forEach>
									<li class="divider"></li>
								</c:if>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#" id="-1" class="newDirectory" >+ 새 폴더</a></li>
							</ul>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="putCard" class="btn btn-primary form-control">담기</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<script>

	var saveCardBtn;
	var contentsNo;
	var dirNo = '${ dir1stNo }' * 1;
	
	// Modal - Set cardInfo
	$('.saveCardBtn').on('click', function() {
		saveCardBtn = $(this);
		contentsNo = saveCardBtn.attr('id');
		
		var card = saveCardBtn.parents('.card-ancestor');
		var title = card.find('.card-title').text();
		var summary = card.find('.card-content').text().substring(0, 200);
		var labels = card.find('div.card-labels').html();
		
		$('div#saveCardModal div.cardInfo').html(labels);
		$('div#saveCardModal dt.cardInfo').text(title);
		$('div#saveCardModal dd p.cardInfo').text(summary + '...');
	})
	
	// Modal - Autofocus
	$('#saveCardModal').on('shown.bs.modal', function() {
	  $('#memoMessage').focus();
	});

	// Modal - Select directory
	$('a.dirList').on('click', function() {
		console.log( 'memoMessage: ' + $('#memoMessage').val() );
		$('input#dirName').val( $(this).text() ).attr('readonly', 'readonly');
		dirNo = $(this).attr('id');
	});
	
	// Modal - Name new directory
	$('a.newDirectory').on('click', function() {
		$('input#dirName').val('').removeAttr('readonly', 'readonly');
		dirNo = $(this).attr('id');
	});
	
	// Modal - 담기 버튼 클릭 시, ajax를 통해 DB에 저장
    $('button#putCard').click(function() {
    	$(this).attr('disabled', 'disabled').removeClass('btn-primary').addClass('btn-warning')
   		.html('<i class="fa fa-spinner fa-pulse" aria-hidden="true"></i> 담는 중');
    	
        $.ajax({
        	url: '${ pageContext.request.contextPath }/drawer/ajax/saveCard.do'
        	, type: 'POST'
        	, data : { 
        		'contentsNo' : contentsNo
        		, 'dirNo' : dirNo
        		, 'dirName': $('input#dirName').val()
        		, 'memoMessage' : $('#memoMessage').val()
		    }, success: function(result) {
		    	console.log('카드 담기 성공');
		    	console.log('result: ' + result);
		    	
		    	// Success button
		    	$('button#putCard').removeClass('btn-warning').addClass('btn-success')
   	    			.html('<i class="fa fa-check" aria-hidden="true"></i> 완료');
            	
		    	// modal close
            	$('#saveCardModal').modal('hide');
            	
            	// modal UI reset
            	$('button#putCard').removeAttr('disabled', 'disabled')
            		.removeClass('btn-warning btn-success btn-danger').addClass('btn-primary').html('담기');
            	$('input#dirName').val('나의 첫 폴더').attr('readonly', 'readonly');
            	$('#memoMessage').val('');
            	
            	// page UI
		    	// change Btn (in cards list)
            	$('a#' + contentsNo + '.saveCardBtn').hide();
            	$('a#' + contentsNo + '.saveCancelBtn').show();
		    	
            	// change Btn (content_detail.jsp)
            	$('button.saveCardBtn').hide();
            	$('button.saveCancelBtn').show();
		    	
		    	// add savedCnt (content_detail.jsp)
		    	var savedCnt = $('li .savedCnt').text()*1;
		    	$('li .savedCnt').text(savedCnt + 1);
            	
		    	// add memo (content_detail.jsp)
		    	if(result.length > 0) { 
		    		$('#addMemo').after(result).fadeIn("slow", function() {}); 
		    	}
		    	
		    }, error : function(result) {
        		console.log('카드 담기 오류');
        		
        		// Error button
        		$('button#putCard').removeClass('btn-warning').addClass('btn-danger')
   	    			.html('<i class="fa fa-exclamation-circle" aria-hidden="true"></i> 오류');
        		
        		// Error Alert
        		alert(result);
       	}});
    });
	
    $('.saveCancelBtn').on('click', function() {
    	contentsNo = $(this).attr('id');
    	$('button.saveCancelBtn').attr('disabled', 'disabled').removeClass('btn-default').addClass('btn-warning')
   			.html('<i class="fa fa-spinner fa-pulse" aria-hidden="true"></i> 담기 취소');
    	
    	$.ajax({
        	url: '${ pageContext.request.contextPath }/drawer/ajax/delCard.do'
        	, type: 'POST'
        	, data : { 
        		'contentsNo' : contentsNo
		    }, success: function(result) {
		    	console.log('카드 담기 취소 성공');
		    	
		    	// page UI reset
		    	// minus savedCnt (content_detail.jsp)
		    	var savedCnt = $('li .savedCnt').text()*1;
		    	$('li .savedCnt').text(savedCnt - 1);
		    	
		    	// change Btn (in cards list)
            	$('a#' + contentsNo + '.saveCancelBtn').hide();
            	$('a#' + contentsNo + '.saveCardBtn').show();
		    	
            	// change Btn (content_detail.jsp)
            	$('button.saveCancelBtn').hide().removeAttr('disabled').removeClass('btn-warning').addClass('btn-default')
            		.html('<i class="fa fa-bookmark-o" aria-hidden="true"></i> 담기 취소');
            	$('button.saveCardBtn').show();
            	
		    }, error : function(result) {
        		console.log('카드 담기 취소 오류');
        		
        		// Error Alert
        		alert(result);
		    }});
	});
</script>
