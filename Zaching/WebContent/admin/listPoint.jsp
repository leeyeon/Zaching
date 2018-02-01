<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/resources/css/adminlist.css" rel="stylesheet" type="text/css">
<jsp:include page="admintoolbar.jsp"/>

</head>
<script>
$(function() {
	
	$("#cb1").click(function() {

	    if($("#cb1").prop("checked")) {

	        $("input[type=checkbox]").prop("checked",true);

	    } else {

	        $("input[type=checkbox]").prop("checked",false); 

	    }

	});
	
	$("#point").click(function() {
		
		var chageIndex = document.getElementsByName("cb");
		
		var count = 0;
		for (var i = 0; i < chageIndex.length ; i++) {

   		 	if (chageIndex[i].checked){

   		 	var paymentId = $($("input[name='paymentId']")[i-1]).val();

   		 $.ajax({
   			 
             url : "/admin/rest/exchargePoint",
             method : "POST",
             contentType : "application/json; charset=UTF-8",
             data : JSON.stringify({
                "categoryCode" : "P04",
                "paymentID" : paymentId,
             }),
             async : false,
             dataType : "json",
             success : function(serverData) {
                console.log(serverData);
                
             },
             error:function(request,status,error){
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
             
          });
   		 		
 			}
   		 	
    	} 
				


	});

	
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/admin/listPoint").submit();
	}
	
});
</script>
<style>
body {
			padding-top:50px;
			padding-bottom: 50px;
			background: rgba(227,227,227,1);
		
	}
	
	.container{
		
		padding-top:50px;
	}
	
	.list{
		background-color: white;
		border-radius: 10px;
		height: 500px;

	}
</style>
<body>
 <input type="hidden" id="currentPage" name="currentPage" value=""/>
 
 <div class="container">
 	<div class="list">
 	<table class="table table-hover table-striped">
 	<tr><thead>
 	<td class="th" align="left">회원ID</td>
 	<td class="th" align="left">은행</td>
 	<td class="th" align="left">계좌번호</td>
 	<td class="th" align="left">이름</td>
 	<td class="th" align="left">포인트</td>
 	<td class="th" align="left">처리유무</td>
 	<td class="right" align="right"><input type="checkbox" name="cb" id="cb1"></td>
 	</tr>
 	<tbody>	
 	 <c:set var="i" value="0" />
	 <c:forEach var="payment" items="${list}">
 	
 	<tr class="ct_list_pop">
 	 	<td align="left"><input type="hidden" name="userId" value="${payment.userId}">
 	<input type="hidden" name="paymentId" value="${payment.paymentId}">
 	<input type="hidden" name="point" value="${payment.point}">
 	${payment.userId}</td>
 	<td align="left">${payment.bankCode}</td>
 	<td align="left">${payment.accountNumber}</td>
 	<td align="left">${payment.realName}</td>
 	<td align="left">${payment.point}</td>
 	<td align="left">
 	<c:choose>
 	<c:when test="${payment.paymentCode == 'P03  '}">처리전</c:when>
 	<c:when test="${payment.paymentCode == 'P04  '}">처리완료</c:when>
 	</c:choose></td>
 	<td align="right">	
 	<c:choose>
 	<c:when test="${payment.paymentCode == 'P03  '}">
 	<input type="hidden" name="1" value="${payment.point}">
 	 <input type="checkbox" id="${i}" name="cb"></c:when>
 	<c:when test="${payment.paymentCode == 'P04  '}"></c:when>
 	</c:choose></td>
 		</tr>
 			</c:forEach>
 		</tbody>
 		</table>
 	</div> 
 	<div class="change" align="right"><a href="#" class="myButton" id="point">처리하기</a></div>
 	
 	<form>	
 	<input type="hidden"	id="currentPage" name="currentPage" value="" />
 		</form>
 	<jsp:include page="../common/pageNavigator.jsp" />
  </div>
  
 
    
</body>
</html>