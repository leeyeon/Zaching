<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- ToolBar Start /////////////////////////////////////-->

</head>
<body>
<div class="container">
		
		<br/><br/>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-inline">
		
		  <div class="form-group">
		    <label for="email">이 메 일</label>
		    <input type="text" class="form-control" name="email" id="email" value="${user.email}">
		  </div>
		  
		  <div class="form-group">
		  <label for="email">패 스 워 드</label>
		    <input type="password" class="form-control" name="password" id="pw">
		  </div>
		  
		  <div class="form-group" align="center">
		  <button type="button" class="btn btn-info">탈퇴하기</button>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	
 	</div>

</body>
</html>