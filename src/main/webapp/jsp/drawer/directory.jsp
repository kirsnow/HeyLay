<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<!DOCTYPE html>
<html lang="ko">
<%-- 카드 서랍 속 유형별 정렬 페이지 --%>
<head>
<!-- Basic Page Needs -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>폴더 수정 모드 | Quration: 답을 열어 줄 그런 사람</title>

<!-- Bootstrap -->
<link href="${ pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/css/ssh.css" type="text/css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- icon-font -->
<script src="https://use.fontawesome.com/bbddce3010.js"></script>

<!-- MDL Hosted start -->
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-light_blue.min.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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
<body class="nav-md">
	<div class="container body">
		<header>
			<jsp:include page="/jsp/include/nav_search.jsp" />
		</header>
		<div class="main_container marginTop60">
			<!-- nav -->
			<jsp:include page="/jsp/include/nav_personal.jsp" />
			<!-- /nav -->

			<div class="right_col" role="main">
				<!-- page content -->

				<div class="container">
					<form>
						<div class="row">
							<div class="pull-right">
								<button type="button" class="btn btn-default addFormBtn" title="폴더 추가 버튼">추가</button>
								<button type="button" class="btn btn-default" id="allSelectToggle" title="전체 선택 버튼">전체 선택</button>
								<button type="button" class="btn btn-default delFormBtn" title="삭제 버튼">삭제</button>
								<button type="button" class="btn btn-success" onclick="location.href='${ pageContext.request.contextPath }/drawer.do?sort=directory'" title="편집 종료 버튼">편집 종료</button>
							</div>
						</div>
								<hr/>
						<c:forEach var="directory" items="${ folderList }">
							<div class="row editDiv">
								<div class="col-xs-1">
									<input type="checkbox" alt="변경할  폴더 선택 체크 박스" class="no form-control" value=${ directory.no } />
								</div>
								<div class="col-xs-8">
									<div class="input-group">
										<p id="lblName" class="editLabel form-control-static"
										 	style="margin-left: 13px; padding-bottom: 0px; font-size: 15px;">
										 	<span class="editSpan text-primary">${ directory.name }</span>
											<span class="text-muted pull-right" style="margin-right: 13px;"><small>${ directory.regDate }</small></span>
										</p>
										<input type="hidden" class="editForm form-control col-xs-3" value="${ directory.name }" id="editForm">
										<span class="input-group-btn">
											<button type="button" class="btn btn-primary editBtn form-control">수정</button>
										</span>
									</div><!-- /input-group -->
								
								</div>
							</div>
							<hr/>
						</c:forEach>
						
						<input type="hidden" name="count" value="0">
           				<div class="row" id="addedFormDiv"></div> <!-- 폼을 삽입할 DIV -->
						
					</form>
				</div>
				<!-- /page content -->
			</div>
			<!-- footer -->
			<jsp:include page="/jsp/include/footer.jsp" />
			<!-- /footer -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${ pageContext.request.contextPath }/js/custom.min.js"></script>
	
	<script>
	
		$('.editBtn').click( function() {
			var editBtn = $(this);
			
			var editDiv = editBtn.parents('.editDiv');
			
			var editSpan = editDiv.find('.editSpan').text();
			var editLabel = editDiv.find('.editLabel');
			var editForm = editDiv.find('.editForm');
			
			var dirNo = editDiv.find('.no').val();
			
			if( $(this).html() == '수정' ) {
	  	    	$(this).html('확인');
	  	    	editLabel.hide();
	  	    	editForm.attr("type", "text");
	  	    } else {
	  	      $(this).html('수정');
	  	      	var dirName = editDiv.find('.editForm').val();
	  	        	
	  	      	if( editSpan != dirName ) {
	  	      		
		  	      	editForm.attr("type", "hidden");
		  	    	editLabel.show();
					
		  	    	$.ajax({
			           url:"${ pageContext.request.contextPath }/contents/updateDir.do",
			           type:'POST',
			           data: {"no" : dirNo, "name" : dirName},
			           success:function(data){
			              if(data == "완료")
			              	alert("완료!");
			           		window.location.reload(true);
			           },
			           error:function(jqXHR, textStatus, errorThrown){
			               alert("냥냥펀치 \n" + textStatus + " : " + errorThrown);
			           }
				    });
	  	      		
	  	      	} else{
	  	      		alert("폴더 이름이 같습니다. 변경하지 않겠습니다.");
		  	      	editForm.attr("type", "hidden");
		  	    	editLabel.show();
	  	      	}
	  	        
	  	    }
			
		});

			
		// 폴더 추가 폼 및 삭제
		$('.addFormBtn').click( function() {

			$(this).hide();
			
			var addedFormDiv = document.getElementById("addedFormDiv");
             
			var str = "";
			str+="<div class=\"row editDiv\"><div class=\"col-xs-1\"></div>";
			str+="<div class=\"col-xs-7\"><div class=\"input-group\">";
			str+="<p id=\"lblName\" class=\"form-control-static\" style=\"display:none; margin-left: 13px; padding-bottom: 0px; font-size: 15px;\">";
			str+="<span class=\"text-primary\">${ directory.name }</span></p>";
			str+="<input type=\"text\" class=\"form-control addName\" value=\"${ directory.name }\">";
			str+="<span class=\"input-group-btn\"><button type=\"button\" onclick=\"addDir()\" class=\"btn btn-primary addBtn form-control\">추가</button>";
			str+="</span></div></div></div>";
			// 추가할 폼(에 들어갈 HTML)
			
            var addedDiv = document.createElement("div"); // 폼 생성
            addedDiv.id = "added"; // 폼 Div에 ID 부여 (삭제를 위해)
            addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입
            addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입
			
		});
   
    	function addDir(){
              var addedFormDiv = document.getElementById("addedFormDiv");
              
              var name = $('.addName').val();
              // console.log(name);
              if(name == '') {
            	  alert("폴더 이름을 입력해 주세요..");
            	  return false;
              } else {
	              $.ajax({
			           url:"${ pageContext.request.contextPath }/contents/addDir.do",
			           type:'POST',
			           data: {"name" : name},
			           success:function(data){
			              if(data == "완료")
			              	alert("완료!");
			           		window.location.reload(true);
			           },
			           error:function(jqXHR, textStatus, errorThrown){
			               alert("냥냥펀치 \n" + textStatus + " : " + errorThrown);
			           }
				  });
	              
	              var addedDiv = document.getElementById("added");
	              addedFormDiv.removeChild(addedDiv);
	              
//	              return true;
              }
              
              return true;
              
    	}
	
		$('#allSelectToggle').click(function() {
			if($(".no:checked").length < $(".no").length) $(".no").prop('checked', true);
			else $(".no").prop('checked', false);
		});
		
		function checkedValue() {

		      var checkboxValues = [];
		      $(".no:checked").each(function() {
		          checkboxValues.push($(this).val());
		      });
		      
		      var name = $("#name").val();
		       
		      var allData = { "no": checkboxValues, "name": name };
		      
		      return allData;
		   }
		
		$('.delFormBtn').click(function() {
			
			var checkedTarget = $('div.editDiv input[type=checkbox]:checked');
			var deleteNoArr = new Array();
			for(var i = 0; i < checkedTarget.size(); i++) {
				var deleteNo = checkedTarget.eq(i).val();
				deleteNoArr.push(deleteNo);
			}
			
			console.log(deleteNoArr);
			
			$.ajax({
		           url:"${ pageContext.request.contextPath }/contents/delDir.do",
		           type:'POST',
		           data: {"no" : deleteNoArr},
		           success:function(data){
		        	   if(data == "완료")
		        		   alert("완료");
		        		   window.location.reload(true);
		           },
		           error:function(jqXHR, textStatus, errorThrown){
		        	   alert("냥냥펀치 \n" + textStatus + " : " + errorThrown);
		           }
			});
		});
		
	</script>
</body>
</html>