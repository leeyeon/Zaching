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
	
	$("#report").click(function() {

		
		var chageIndex = document.getElementsByName("cb");
		
		var count = 0;

		for (var i = 0; i < chageIndex.length ; i++) {
			
			 	if (chageIndex[i].checked){

			 		
			 	var reportId = $($("input[name='reportId']")[i-1]).val();
			 	


			 $.ajax({
				 
	         url : "/admin/rest/updateReport",
	         method : "POST",
	         contentType : "application/json; charset=UTF-8",
	         data : JSON.stringify({
	            "reportId" : reportId
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
	
});




function fncGetUserList(currentPage) {
	
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "/admin/listReport").submit();
}

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

 <div class="container">
 	<div class="list">
 	<table class="table table-hover table-striped">
 	<tr><thead>
 	<td class="th" align="left">회원ID</td>
 	<td class="th" align="left">신고내용</td>
 	<td class="th" align="left">처리유무</td>
 	<td class="right" align="right"><input type="checkbox" id="cb1"></td>
 	</tr>
 	<tbody>
 	<c:set var="i" value="0" />
	 <c:forEach var="reprot" items="${list}">
 	<tr class="ct_list_pop">
 	<td align="left"><input type="hidden" name="reportId" value="${report.reportId}">${report.reportUserID}</td>
 	<td align="left">${report.text}</td>
 	<td align="left">${report.flag}</td>
 	<td align="right"> <input type="checkbox" id="${i}" name="cb"></td> 	
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