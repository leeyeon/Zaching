<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="./resources/layout/toolbar.jsp"/>
	
	<style>
	
		body{
		    padding-top: 50px;
		}
		
		@media (max-width: 1217px) {
		  body {
		    margin-top: 0px;
		  }
	
	</style>

</head>
<body>

	<div class="container">
		<jsp:include page="/newsfeed/newsfeed.jsp" />
	</div>

</body>
</html>