<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
@import url('https://fonts.googleapis.com/css?family=Alegreya+Sans');
.h3 {font-family: 'Alegreya Sans', sans-serif;}
</style>

<c:if test="${empty payment}">
	<div class="text-center" style="padding:30px;">
		포인트 내역이 없습니다.
	</div>
</c:if>

<c:set var="old" value="201802" />
<fmt:formatNumber value="${old}" type="number" var="numberOld" />

<c:forEach var="payment" items="${payment}" varStatus="status">

	<c:set var="content" value="${fn:split(payment.content,':')}" />

	<fmt:parseDate value="${payment.createdDate}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
	<fmt:formatDate var="newDate" value="${Date}" pattern="yyyyMM"/>
	<c:set var="new" value="${newDate}" />

	<c:if test="${status.index eq 0}">
		<div class="col-xs-12 text-center" style ="background: url('../resources/images/bg_tit_month.gif') repeat-x; height: 39px; margin-bottom: 20px;">
	  		<p style ="background: url('../resources/images/bg_tit_month2.gif') no-repeat; width: 110px; height: 39px; margin: 0 auto; line-height: 39px;">
	  			<fmt:formatDate value="${Date}" pattern="yyyy.MM"/>
	  		</p>
	  	</div>
	</c:if>
	
	<c:if test="${old ne newDate}">
		<c:set var="old" value="${newDate}"></c:set>
		<div class="col-xs-12 text-center" style ="background: url('../resources/images/bg_tit_month.gif') repeat-x; height: 39px; margin-bottom: 20px;">
	  		<p style ="background: url('../resources/images/bg_tit_month2.gif') no-repeat; width: 110px; height: 39px; margin: 0 auto; line-height: 39px;">
	  			<fmt:formatDate value="${Date}" pattern="yyyy.MM"/>
	  		</p>
	  	</div>
	</c:if>	
   	
	<div class="row listPayment">
		<div class="col-xs-1">
			<c:if test="${payment.paymentCode eq 'P01'}">
				<span class="state_space" style="background-position: 0 -82px; color: #39c934;">충전</span>
			</c:if>
			<c:if test="${payment.paymentCode eq 'P02'}">
				<span class="state_space" style="background-position: 0 -164px; color: #d95555;">사용</span>
			</c:if>
			<c:if test="${payment.paymentCode ne 'P01' && payment.paymentCode ne 'P02'}">
				<span class="state_space" >기타</span>
			</c:if>
	 	</div>
	 	<div class="col-xs-11">
	 		<div class="row" style="padding-top: 4%;">
			 	<div class="col-xs-9 col-sm-2" style="padding: 3px;">
					<p><fmt:formatDate value="${Date}" pattern="yyyy.MM.dd"/></p>
			 	</div>
			 	<div class="col-xs-12 col-sm-7" style="padding: 3px;">
			 		<c:if test="${payment.paymentCode eq 'P01'}">카카오페이 충전 <img src="../resources/images/payment_icon_small.png"></c:if>
			 		<c:if test="${payment.paymentCode eq 'P02'}">
			 			<c:if test="${fn:contains(payment.content, 'B01')}">
				 			밥친구 우리지금만나 약속비
				 		</c:if>
				 		<c:if test="${fn:contains(payment.content, 'B03')}">
				 			밥친구 주기적으로만나 회비
				 		</c:if>
				 		<c:if test="${fn:contains(payment.content, 'H00')}">
				 			라이브방송에서 포인트선물
				 		</c:if>
			 		</c:if>
			 		<c:if test="${payment.paymentCode eq 'P03'}">포인트 반환 신청</c:if>
			 		<c:if test="${payment.paymentCode eq 'P04'}">포인트 반환 완료</c:if>
			 		<c:if test="${payment.paymentCode eq 'P05'}">포인트 반환 신청 취소</c:if>
			 		<c:if test="${payment.paymentCode eq 'P06'}">포인트 사용 취소</c:if>
			 		<c:if test="${payment.paymentCode eq 'P07'}">포인트 선물</c:if>
			 	</div>
			 	<div class="col-sm-3 col-xs-9" style="padding: 3px;">
			 		<c:if test="${payment.paymentCode eq 'P01' || payment.paymentCode eq 'P05' || payment.paymentCode eq 'P06'}">
			 			<p>+<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /></c:if>
			 		<c:if test="${payment.paymentCode eq 'P02' || payment.paymentCode eq 'P03' || payment.paymentCode eq 'P04'}">
			 			<p style="color:#d21e1e;">-<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /></c:if>
			 		<c:if test="${payment.paymentCode eq 'P07' && sessionScope.user.userId eq content[1]}">
			 			<p>+<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /></c:if>
			 		<c:if test="${payment.paymentCode eq 'P07' && sessionScope.user.userId ne content[1]}">
			 			<p style="color:#d21e1e;">-<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /></c:if>
			 		<img src="../resources/images/point_smail_icon.png" width="15px" height="15px"></p>
			 	</div>
			</div>
			
			
		</div>
	</div>
	
	<div class="row text-left listExplain" style="background: rgb(241, 241, 241); margin:10px; padding: 15px 20px 15px; display: none; padding: 15px 20px 15px;">
		<p style="padding-bottom: 5px;">거래일시 : ${payment.createdDate}</p>
		<p style="padding-bottom: 5px;">적립/사용 포인트 : 
			<span style="font-weight: bold;"> 
  		<c:if test="${payment.paymentCode eq 'P02' || payment.paymentCode eq 'P03' || payment.paymentCode eq 'P04' || 
  					(payment.paymentCode eq 'P07' && sessionScope.user.userId ne content[1])}">-</c:if>
 			<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /> 
 			<img src="../resources/images/point_smail_icon.png" width="15px" height="15px">
			</span></p>
	 	<p>내역 : 
	
	 		<c:if test="${fn:contains(payment.content, 'B03')}">
	 			주기적으로 만나 <a href="/bob/getBob?category=B03&bobId=${content[1]}" style="color:#000;">'${content[2]}'</a> 에 회비 포인트 지출
	 		</c:if>
	 		<c:if test="${fn:contains(payment.content, 'B01')}">
	 			우리지금 만나 <a href="/bob/getBob?category=B01&bobId=${content[1]}" style="color:#000;">'${content[2]}'</a> 에 약속비 지출
	 		</c:if>
	 		<c:if test="${fn:contains(payment.content, 'P07') && sessionScope.user.userId eq content[1]}">
	 			라이브 방송 중 포인트 선물 받음
	 		</c:if>
	 		<c:if test="${fn:contains(payment.content, 'P07') && sessionScope.user.userId ne content[1]}">
	 			<a href="/user/getTimeLine?userId=${content[1]}" style="color:#000;">'${content[2]}'</a>님께 포인트 선물
	 		</c:if>
	 		<c:if test="${!fn:contains(payment.content, 'B') && !fn:contains(payment.content, 'P07')}">
	 			${content[2]}
	 		</c:if>
	 	</p>
	</div>
	
	<hr style="border-top: 1px solid #e2e2e29c;">
	
</c:forEach>

<c:if test="${paymentPage.totalCount > (paymentPage.currentPage * paymentPage.pageUnit)}">
	<div class="row text-center" style="margin: 5px;">
				<button class="more_listing_btn">next</button>
	</div>

</c:if>

   

       	
	        	