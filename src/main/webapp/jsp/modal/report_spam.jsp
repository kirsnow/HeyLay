<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade" id="spamModal" tabindex="-1" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-muted" id="gridSystemModalLabel">
					<i class="fa fa-ban fa-fw" aria-hidden="true"></i> 신고합니다 <small>유해
						게시물 신고</small>
				</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-10 col-md-offset-1 marginTop">
							<input type="text" name="email" class="form-control"
								placeholder="계정 (이메일)" alt="계정(이메일)입력 폼"
								id="email" value="${ userVO.email }" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-offset-1 marginTop">
							<input type="text" name="contentsNo" class="form-control contentsNo"
								placeholder="유해 게시물 번호" alt="유해 게시물 번호" value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-offset-1 marginTop">
							<select name="selected" class="form-control" id="selected">
								<option value="신고 내용 선택" disabled selected>신고 내용 선택</option>
								<option value="개인정보 노출">개인정보 노출</option>
								<option value="내 창작물에 대한 저작권 위반">내 창작물에 대한 저작권 위반</option>
								<option value="비방/비하, 명예훼손, 사생활침해">비방/비하, 명예훼손, 사생활침해</option>
								<option value="부적절한 홍보(불법물, 프리서버 홍보 등)">부적절한 홍보(불법물,
									프리서버 홍보 등)</option>
								<option value="음란/청소년에게 부적합한 내용">음란/청소년에게 부적합한 내용</option>
								<option value="악성코드">악성코드</option>
							</select>
						</div>
					</div>

					<div class="row">
						<div class="col-md-10 col-md-offset-1 marginBottom">
							<textarea id="inputUser" class="col-md-6 form-control marginTop"
								rows="5" placeholder="유해 게시물 신고 내용"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary marginRight" id="spamOk" onclick="">작성완료</button>
			</div>
		</div>
	</div>
</div>
<script>
	var spamReportBtn;
	var contentsNo;

	/* modal set cardInfo */
	$('.spamReportBtn').on('click', function() {
		spamReportBtn = $(this);
		contentsNo = spamReportBtn.attr('id');
		
		$('div#spamModal input.contentsNo').attr('value', contentsNo);
	});

	/* modal autofocus */
	$('#spamModal').on('shown.bs.modal', function() {
		$('#email').focus();
	});
	
	$('button#spamOk').click(function() {
		
		var select = document.getElementById("selected");
		var selected = select.options[select.selectedIndex].value;
		var userInput = $('div#spamModal textarea#inputUser').val();
		
		if(selected == "신고 내용 선택") {
			alert("신고 내용을 선택해 주세요.");
		} else {
			

			$(this).attr('disabled', 'disabled').removeClass('btn-primary').addClass('btn-warning')
	   		.html('<i class="fa fa-spinner fa-pulse" aria-hidden="true"></i> 담는 중');
	    	
	        $.ajax({
	        	url: '${ pageContext.request.contextPath }/contact/spamContents.do'
	        	, type: 'POST'
	        	, data : { 
	        		'contentsNo' : contentsNo
	        		, 'selected': selected
	        		, 'userInput' : selected
			    }, success: function(data) {
			    	console.log('spam 성공');
			    	
			    	/* Success button */
			    	$('button#spamOk').removeClass('btn-warning').addClass('btn-success')
	   	    		.html('<i class="fa fa-check" aria-hidden="true"></i> 완료');
	            	
			    	/* modal close */
	            	$('#spamModal').modal('hide');
	            	
	            	/* modal UI reset */
	            	$('button#spamOk').removeAttr('disabled', 'disabled').removeClass('btn-warning btn-success btn-danger').addClass('btn-primary')
	      			.html('담기');
//	             	$('input#dirName').val('나의 첫 폴더').attr('readonly', 'readonly');
//	             	$('#memoMessage').val('');
	            	
	            	/* page UI reset */
	            	spamReportBtn.html('<i class="fa fa-bookmark fa-lg" aria-hidden="true"></i>');
	            	
			    }, error : function(request,status,error) {
	        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	        		/* Error button */
	        		$('button#spamOk').removeClass('btn-warning').addClass('btn-danger')
	   	    		.html('<i class="fa fa-exclamation-circle" aria-hidden="true"></i> 오류');
	       	}});
			
		}
		

	});
</script>