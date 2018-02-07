<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="payment" items="${payment}">
	<div class="row listPayment">
		<div class="col-xs-4">
 		<fmt:parseDate value="${payment.createdDate}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
		<fmt:formatDate value="${Date}" pattern="yyyy.MM.dd"/>
 	</div>
 	<div class="col-xs-4">
 		<c:if test="${payment.paymentCode eq 'P01'}">포인트 충전</c:if>
 		<c:if test="${payment.paymentCode eq 'P02'}">포인트 사용</c:if>
 		<c:if test="${payment.paymentCode eq 'P03'}">포인트 반환 신청</c:if>
 		<c:if test="${payment.paymentCode eq 'P04'}">포인트 반환 완료</c:if>
 		<c:if test="${payment.paymentCode eq 'P05'}">포인트 반환 신청 취소</c:if>
 		<c:if test="${payment.paymentCode eq 'P06'}">포인트 사용 취소</c:if>
 	</div>
 	<div class="col-xs-4">
 		<c:if test="${payment.paymentCode eq 'P01' || payment.paymentCode eq 'P05' || payment.paymentCode eq 'P06'}">+</c:if>
 		<c:if test="${payment.paymentCode eq 'P02' || payment.paymentCode eq 'P03' || payment.paymentCode eq 'P04'}">-</c:if>
 		<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /> p
 	</div>
	</div>
	
	<div class="row text-left listExplain" style="background: #ccc; margin:10px; padding: 15px 10px 10px 10px; display: none;">
		<p>거래일시 : ${payment.createdDate}</p>
		<p>적립/포인트 : 
			<span style="font-weight: bold;"> 
  		<c:if test="${payment.paymentCode eq 'P02' || payment.paymentCode eq 'P03' || payment.paymentCode eq 'P04'}">-</c:if>
 			<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /> p
			</span></p>
 	<p>내역 : 
 		<c:set var="content" value="${fn:split(payment.content,':')}" />

 		<c:if test="${fn:indexOf(payment.content, 'B03') != -1}">
 			주기적으로 만나 <a href="/bob/getBob?category=B03&bobId=${content[1]}">'${content[2]}'</a> 에 회비 포인트 지출
 		</c:if>
 		<c:if test="${fn:indexOf(payment.content, 'B03') == -1}">
 			${content[2]}
 		</c:if>
 	</p>
	</div>
	<hr>
</c:forEach>
${paymentPage }

<c:if test="${paymentPage.totalCount > (paymentPage.currentPage * paymentPage.pageUnit)}">
<div class="row text-center" style="height:50px; margin: 5px; line-height: 50px;
			border-bottom: 2px solid #ccc; cursor: pointer;">더 보기</div>
</c:if>

   

       	
	        	