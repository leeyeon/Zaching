<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
User user = (User) request.getAttribute("user");

%>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/resources/layout/sub_toolbar.jsp"/>
	<style>
 		body {
            padding-top : 80px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
	
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
			<c:if test="${user.role eq '1'}">
    		<h3 class="text-info">추가정보입력</h3>
    		<h5 class="text-muted"> <strong class="text-danger">추가정보</strong>를입력해 주세요.</h5>
    		</c:if>
    		<c:if test="${user.role eq '2'}">
    		<h3 class="text-info">회원정보조회</h3>
    		<h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
    		</c:if>
	  
	    </div>
	
		
		
		<div class="center">
			       <div style="width: 120px; height: 90px; overflow: hidden">
    <a href="#">
    <img src="../resources/images/main@2x.png" style="width: 120px; height: auto;" alt="유저이름${user.name}" onclick="clickBtn();" ></a>
</div>
	  		<div class="col-xs-4 col-md-2 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-4">${user.name}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이름</strong></div>
			<div class="col-xs-8 col-md-4">${user.name}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이름</strong></div>
			<div class="col-xs-8 col-md-4"></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이름</strong></div>
			<div class="col-xs-8 col-md-4">${user.name}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="updateUser">회원정보수정</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>