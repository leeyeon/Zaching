<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty payment}">
	<div class="text-center" style="padding:30px;">
		����Ʈ ������ �����ϴ�.
	</div>
</c:if>

<c:forEach var="payment" items="${payment}">
	<div class="row listPayment">
		<div class="col-xs-4">
 		<fmt:parseDate value="${payment.createdDate}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
		<fmt:formatDate value="${Date}" pattern="yyyy.MM.dd"/>
 	</div>
 	<div class="col-xs-4">
 		<c:if test="${payment.paymentCode eq 'P01'}">����Ʈ ����</c:if>
 		<c:if test="${payment.paymentCode eq 'P02'}">����Ʈ ���</c:if>
 		<c:if test="${payment.paymentCode eq 'P03'}">����Ʈ ��ȯ ��û</c:if>
 		<c:if test="${payment.paymentCode eq 'P04'}">����Ʈ ��ȯ �Ϸ�</c:if>
 		<c:if test="${payment.paymentCode eq 'P05'}">����Ʈ ��ȯ ��û ���</c:if>
 		<c:if test="${payment.paymentCode eq 'P06'}">����Ʈ ��� ���</c:if>
 	</div>
 	<div class="col-xs-4">
 		<c:if test="${payment.paymentCode eq 'P01' || payment.paymentCode eq 'P05' || payment.paymentCode eq 'P06'}">+</c:if>
 		<c:if test="${payment.paymentCode eq 'P02' || payment.paymentCode eq 'P03' || payment.paymentCode eq 'P04'}">-</c:if>
 		<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" />
 		<img src="../resources/images/point_smail_icon.png" width="15px" height="15px">
 	</div>
	</div>
	
	<div class="row text-left listExplain" style="background: #ccc; margin:10px; padding: 15px 10px 10px 10px; display: none;">
		<p style="padding-bottom: 5px;">�ŷ��Ͻ� : ${payment.createdDate}</p>
		<p style="padding-bottom: 5px;">����/����Ʈ : 
			<span style="font-weight: bold;"> 
  		<c:if test="${payment.paymentCode eq 'P02' || payment.paymentCode eq 'P03' || payment.paymentCode eq 'P04'}">-</c:if>
 			<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /> 
 			<img src="../resources/images/point_smail_icon.png" width="15px" height="15px">
			</span></p>
	 	<p>���� : 
	 		<c:set var="content" value="${fn:split(payment.content,':')}" />
	
	 		<c:if test="${fn:contains(payment.content, 'B03')}">
	 			�ֱ������� ���� <a href="/bob/getBob?category=B03&bobId=${content[1]}" style="color:#000;">'${content[2]}'</a> �� ȸ�� ����Ʈ ����
	 		</c:if>
	 		<c:if test="${fn:contains(payment.content, 'B01')}">
	 			�츮���� ���� <a href="/bob/getBob?category=B01&bobId=${content[1]}" style="color:#000;">'${content[2]}'</a> �� ��Ӻ� ����
	 		</c:if>
	 		<c:if test="${!fn:contains(payment.content, 'B')}">
	 			${content[2]}
	 		</c:if>
	 	</p>
	</div>
	<hr>
</c:forEach>

<c:if test="${paymentPage.totalCount > (paymentPage.currentPage * paymentPage.pageUnit)}">
	<div class="row text-center" style="height:50px; margin: 5px; line-height: 50px;
				border-bottom: 2px solid #ccc; cursor: pointer;">�� ����</div>
</c:if>

   

       	
	        	