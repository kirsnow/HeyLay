<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade" id="bugModal" tabindex="-1" role="dialog" 
	aria-labelledby="gridSystemModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-muted" id="gridSystemModalLabel">
					신고합니다 <small>오류 신고</small>
				</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 marginTop">
							<input type="text" name="email" class="form-control" id="email"
								placeholder="계정 (이메일)" alt="계정(이메일)입력 폼" value="${ userVO.email }"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3 marginTop">
							<p>정확한 장애(오류) 해결을 위해 고객님의 PC사양 정보가 필요하며, 수집된 PC사양 정보는 문제 해결
								이외의 다른 용도로 사용하지 않습니다. PC사양조사 수동설치 시에는 웹페이지를 닫고 다시 실행하신 후에 문의를
								입력해 주세요.
							<p>
							<div class="well">
								<dl class="dl-horizontal">
									<dt>Browser</dt>
									<dd class="agtInfo">agent</dd>
									<dt>OS</dt>
									<dd class="osInfo">osInfo</dd>
								</dl>
								<input type="hidden" name="browser"
									value=""
									readonly="readonly" /> <input type="hidden" name="os"
									value="" readonly="readonly" />
								<div class="input-group pull-right">
									<label for="pcInfoAgree">PC 사양 제공에 동의합니다.</label> <input
										type="checkbox" name="pcInfoAgree" id="pcInfoAgree" class=""
										alt="PC사양 제공 동의 체크박스(필수)" />
								</div>
								<div class="row"></div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<input type="text" name="url" class="form-control"
								placeholder="오류 발생  URL 입력" alt="오류  URL 입력 폼" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<textarea id="userInput" name="userInput"
								class="form-control marginTop" rows="4" maxlength="1000"
								placeholder="오류 화면 캡처, 오류 발생 일시, PC 정보 제공과 함께 오류 현상을 기재해 주세요."></textarea>
							<p>
								<small><span id="text_length">1000</span>자 입력 가능</small>
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="panel panel-default">
								<div class="panel-body">
									<input type="file" name="attachfile"
										alt="오류 사항에 관한 파일을 첨부하는 버튼" id="attachfile"
										aria-describedby="attachment" /> <small id="attachment"
										class="help-block">5MB 이하 파일을 첨부하실 수 있습니다.</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">작성완료</button>
			</div>
		</div>
	</div>
</div>
<script>
	$("#userInput").on('keydown',function(event) {
		var input = $('#userInput'), display = $('#text_length'), count = 0, limit = 1000;
	
		count = input.val().length
		remaining = limit - count
		update(remaining);
	
		input.keyup(function(e) {
			count = $(this).val().length;
			remaining = limit - count;
	
			update(remaining);
		});
	
		function update(count) {
			var txt = count
			display.html(txt);
		}
	
	});
	
	var bugReportBtn;
	var contentsNo;
	
	/* modal set Info */
	$('.bugReportBtn').on('click', function() {
		bugReportBtn = $(this);
		contentsNo = saveCardBtn.attr('id');
		
// 		var card = saveCardBtn.parents('.card-ancestor');
// 		var title = card.find('.card-title').text();
// 		var summary = card.find('.card-content').text().substring(0, 200);
// 		var labels = card.find('div.card-labels').html();
		
		
// 		$('div#bugModal div.cardInfo').html(labels);
// 		$('div#bugModal dt.cardInfo').text(title);
// 		$('div#bugModal dd.cardInfo').text(summary + '...');

		var agt = navigator.userAgent.toLowerCase();
		if (agt.indexOf("chrome") != -1) return 'Chrome'; 
		if (agt.indexOf("opera") != -1) return 'Opera'; 
		if (agt.indexOf("staroffice") != -1) return 'Star Office'; 
		if (agt.indexOf("webtv") != -1) return 'WebTV'; 
		if (agt.indexOf("beonex") != -1) return 'Beonex'; 
		if (agt.indexOf("chimera") != -1) return 'Chimera'; 
		if (agt.indexOf("netpositive") != -1) return 'NetPositive'; 
		if (agt.indexOf("phoenix") != -1) return 'Phoenix'; 
		if (agt.indexOf("firefox") != -1) return 'Firefox'; 
		if (agt.indexOf("safari") != -1) return 'Safari'; 
		if (agt.indexOf("skipstone") != -1) return 'SkipStone'; 
		if (agt.indexOf("msie") != -1) return 'Internet Explorer'; 
		if (agt.indexOf("netscape") != -1) return 'Netscape'; 
		if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla'; 
		
		$('div#bugModal dd.agtInfo').text(agt);
	});
	
	/* modal autofocus */
	$('#bugModal').on('shown.bs.modal', function() {
		$('#email').focus();
	});
</script>