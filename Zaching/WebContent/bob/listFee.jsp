<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="participant" items="${participant}">
	<c:if test="${participant.status eq 0}">
		<div class="col-xs-4" align="left" style="margin-top:20px; padding-right:15px;">
			<img src = "../resources/upload_files/images/${participant.participantProfile}"
	     			onerror="this.src='../resources/images/user-icon.png'"
	     			width="60px" height="60px"
					style=" border-radius: 40px;
							-moz-border-radius: 40px;
							-khtml-border-radius: 40px;
							-webkit-border-radius: 40px;
							 box-shadow: 1px #cccccc;" />
			&nbsp;&nbsp;&nbsp;${participant.participantName}&nbsp;&nbsp;&nbsp;
			<c:if test="${participant.paidFee != 0}">
				<img width="55px" height="55px" src="/resources/images/checkmark.png" />
			</c:if>
		</div>
	</c:if>	
</c:forEach>
   