<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/resources/layout/sub_toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->




	<script type="text/javascript">
		function fncGetUserList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}
		
		 
	</script>		
	
</head>


<body >


<div class="container" style="padding-top: 80px;">

		<div class="page-header text-info">
			<h3>메세지목록</h3>
		</div>
		
	<div class="row">
	
	
	<table class="table table-hover">
	<div class="col-xs-6 col-sm-4 ">이름</div>
	<div class="col-xs-6 col-sm-4 ">내용</div>
	<div class="col-xs-6 col-sm-4 ">날짜</div>
	<tbody>
	
	 <c:forEach var="message" items="${list}">
 <input type="hidden" name="messageId" value="${message.friendName }">
 <div class="col-xs-6 col-sm-4 ">${message.friendName }</div>
 <div class="col-xs-6 col-sm-4 ">${message.content }</div>
 <div class="col-xs-6 col-sm-4 ">${message.createdDate }</div>
 		
 		</c:forEach>
 		</tbody>
	
</table>
</div>
</div>





</body>

</html>