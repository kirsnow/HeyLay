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
            	memo += added.lastName + '&nbsp;' + added.firstName;
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