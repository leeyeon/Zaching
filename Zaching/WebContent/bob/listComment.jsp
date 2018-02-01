<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      <c:if test="${empty comments}">
      	<div class="text-center" style="padding: 10px;">
      		등록된 댓글이 없습니다 T.T <br>첫번째 댓글을 달아보세요!
      	</div>
      </c:if>
    	<c:forEach var="comment" items="${comments}">
    		<input type="hidden" name="commentId" value="${comment.commentId}" />
    		<div class="row comment" style="margin: 5px;">
     		<div class="col-sm-2">
			<img width="60px" height="60px"
			style=" border-radius: 40px;
					-moz-border-radius: 40px;
					-khtml-border-radius: 40px;
					-webkit-border-radius: 40px;
					 box-shadow: 1px #cccccc;"
			src = "../resources/upload_files/images/${comment.userImage}"
			onerror="this.src='../resources/images/user-icon.png'" />
			${comment.userName}
		</div>
		<div class="col-sm-7">
			${comment.content}
		</div>
		<div class="col-sm-3" style="font-size: 13px; text-align: end;">
			<div style="padding-right: 50px;">
				<fmt:parseDate value="${comment.createdDate}" var="Date" pattern="yyyy-MM-dd hh:mm"/>
				<fmt:formatDate value="${Date}" pattern="yyyy년 MM월 dd일 a hh:mm"/>
			</div>
			<div class="deleteComment" style="position: relative; right: 10px; top:-10px; text-align: end;">
				X
			</div>
		</div>
	</div>
    	</c:forEach>