<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate var="todayFull" value="${today}" pattern="yyyyMMdd"/>
<fmt:formatDate var="todayHour" value="${today}" pattern="HH"/>
<fmt:formatDate var="todayMinutes" value="${today}" pattern="mm"/>

      <c:if test="${empty comments}">
      	<div class="text-center" style="padding: 10px;">
      		등록된 댓글이 없습니다 T.T <br>첫번째 댓글을 달아보세요!
      	</div>
      </c:if>
    	<c:forEach var="comment" items="${comments}">
    		<input type="hidden" name="commentUserId" value="${comment.userId}" />
    		<input type="hidden" name="commentId" value="${comment.commentId}" />
    		<div class="row comment" style="margin: 5px;">
     		<div class="col-sm-2" style="cursor: pointer;">
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
				<fmt:parseDate value="${comment.createdDate}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate var="commentDate" value="${Date}" pattern="yyyyMMdd"/>
				<fmt:formatDate var="commentHour" value="${Date}" pattern="HH"/>
				<fmt:formatDate var="commentMinutes" value="${Date}" pattern="mm"/>
				<!-- 오늘 일때 -->
				<c:if test="${todayFull - commentDate eq 0}">
					<!-- 1시간 내 -->
					<c:if test="${todayHour - commentHour eq 0}">
						${todayMinutes - commentMinutes}분 전
					</c:if>
					<c:if test="${todayHour - commentHour eq 1}">
						<c:if test="${todayMinutes - commentMinutes > 0}">
							${todayHour - commentHour}시간 전
						</c:if>
						<c:if test="${todayMinutes - commentMinutes <= 0}">
							${(60+todayMinutes) - commentMinutes}분 전
						</c:if>						
					</c:if>
					<c:if test="${todayHour - commentHour > 1}">
						${todayHour - commentHour}시간 전
					</c:if>
				</c:if>
				<!-- 어제 -->
				<c:if test="${todayFull-commentDate eq 1}">
					<c:if test="${totayHour - commentHour < 0}">
						${24 - (commentHour - todayHour)}시간 전
					</c:if>
					<c:if test="${totayHour - commentHour >= 0}">
						어제
					</c:if>
				</c:if>
				<c:if test="${todayFull-commentDate > 2}">
					<fmt:formatDate value="${Date}" pattern="MM월 dd일"/>
				</c:if>
			</div>
			<div class="deleteComment" style="position: relative; right: 10px; top:-10px; text-align: end;">
				X
			</div>
		</div>
	</div>
   </c:forEach>

   <c:if test="${commentPage.totalCount > (commentPage.currentPage * commentPage.pageUnit)}">
   <div class="row text-center" style="background: #ccc; height:50px; margin: 5px; line-height: 50px;">더 보기</div>
   </c:if>
   
   