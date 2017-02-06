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