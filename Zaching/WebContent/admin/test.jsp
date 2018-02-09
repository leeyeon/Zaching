<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
function testbutton(){
	
 	alert("뀨");
 	$("form").attr("method", "POST").attr("action", "/admin/rest/alert").submit();
  }
  
</script>
<body>
<jsp:include page="subalarm.jsp"/>
<form></form>
 <button class="form-control" onclick="testbutton()">show alert bottom</button>
 

</body>
</html>