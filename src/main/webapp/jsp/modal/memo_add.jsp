<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="writeMemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-muted" id="myModalLabel">
					<i class="fa fa-comment fa-2x fa-flip-horizontal" aria-hidden="true"></i>&nbsp;
					<c:choose>
						<c:when test="${ userVO ne null }">
                   			<c:out value="${ userVO.lastName } ${ userVO.firstName }"/>
	                   	</c:when>
	                   	<c:otherwise>
	                   		Guest
	                   	</c:otherwise>
					</c:choose>
				</h4>
			</div>
			<div class="modal-body text-right">
				<textarea id="editMemoMessage" class="form-control" rows="7" maxlength="4000"></textarea>
				<small class="text-muted"><span id="text_length">4,000</span>자 입력 가능</small>
			</div>
			<div class="modal-footer">
				<button type="button" id="saveMemo" class="btn btn-primary btn-block">
					<i class="fa fa-pencil" aria-hidden="true"></i> 작성
				</button>
			</div>
		</div>
	</div>
</div>
<script>
	/* modal autofocus */
	$('#writeMemo').on('shown.bs.modal', function () {
		$('button#saveMemo').removeAttr('disabled', 'disabled').removeClass('btn-warning btn-success btn-danger').addClass('btn-primary')
			.html('<i class="fa fa-pencil" aria-hidden="true"></i> 작성');
		$('#editMemoMessage').focus()
	});
	
	$('#editMemoMessage').on('keydown',function(event) {
		  var input = $(this), display = $('#text_length'), count = 0, limit = 4000;

		  count = input.val().length
		  remaining = limit - count;
		  update(remaining);

		  input.keyup(function(e) {
		    count = $(this).val().length;
		    remaining = limit - count;
		    update(remaining);
		  });

		  function update(count) {
			var txt = count.toLocaleString("en");
		    display.html(txt);
		  }
		});
	
   	/* 메모 추가 모달에서 작성 버튼 클릭 시, ajax를 통해 DB에 메모 추가 */
    $('button#saveMemo').click(function() {
    	$(this).attr('disabled', 'disabled').removeClass('btn-primary').addClass('btn-warning')
   		.html('<i class="fa fa-spinner fa-pulse" aria-hidden="true"></i> 작성 중');
    	
        $.ajax({
        	url: '${ pageContext.request.contextPath }/memo/ajax/addMemo.do'
        	, type: 'POST'
        	, data : { 
        		'memoMessage' : $('#editMemoMessage').val()
        		, 'contentsNo' : '${ contents.contentsNo }'
		    }, success: function(memo) {
            	$('#editMemoMessage').val('');
            	
            	$('button#saveMemo').removeClass('btn-warning').addClass('btn-success')
   	    		.html('<i class="fa fa-check" aria-hidden="true"></i> 작성 완료');
            	
            	$('#writeMemo').modal('hide');
            	
            	$('button#saveMemo').removeAttr('disabled', 'disabled').removeClass('btn-warning btn-success btn-danger').addClass('btn-primary')
      			.html('<i class="fa fa-pencil" aria-hidden="true"></i> 작성');
            	
            	// add memo
		    	if(memo.length > 0) { 
		    		$('#addMemo').after(memo).fadeIn("slow", function() {}); 
		    	}
            	
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
            	$('#editMemoMessage').val('');
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