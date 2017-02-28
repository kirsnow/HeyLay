<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
		var contentsNo;
		var likeBtn;
		var likeCancelBtn;
	
		$('.likeBtn').click( function() { 
			
			contentsNo = $(this).attr("id");
			$(this).addClass('disabled');
			
			$.ajax({
		           url:"${ pageContext.request.contextPath }/contents/likeCntUp.do",
		           type:'POST',
		           data: {"contentsNo" : contentsNo},
		           success:function(data){
		        	   console.log('좋아요 성공');
	
		             // page UI
		             // change Btn (content_detail.jsp)
		              	$('a#' + contentsNo + '.likeBtn').hide().removeClass('disabled');
		              	$('a#' + contentsNo + '.likeCancelBtn').show();
	
		           },
		           error:function(){
		        	   console.log('좋아요 오류');
		           }
			    });
		});
		
		
		$('.likeCancelBtn').click( function() { 
			contentsNo = $(this).attr("id");
			$(this).addClass('disabled');
			
			$.ajax({
				url:"${ pageContext.request.contextPath }/contents/likeCancel.do",
		           type:'POST',
		           data: {"contentsNo" : contentsNo},
		           success: function(data){
		        	   console.log('좋아요 취소 성공');
	
			             // page UI
			             // change Btn (content_detail.jsp)
			              	$('a#' + contentsNo + '.likeCancelBtn').hide().removeClass('disabled');
			              	$('a#' + contentsNo + '.likeBtn').show();
		           },
		           error: function(){
		        	   console.log('좋아요 취소 오류');
		           }
			    });
		});
	</script>