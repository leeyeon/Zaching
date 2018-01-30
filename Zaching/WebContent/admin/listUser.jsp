<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="admintoolbar.jsp"/>
</head>
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
 	<td class="left" align="left">회원ID</td>
 	<td class="left" align="left">처리유무</td>
 	<td class="right" align="right">선택 <input id="toggle1" type="checkbox" checked></td>
 	</tr>
 	<tbody>
 	<tr class="ct_list_pop">
 	<td align="left">1</td>
 	<td align="left">2</td>
 	<td align="right"><input id="toggle1" type="checkbox" checked></td> 	
 		</tr>
 	</div>  
  </div>
  
</body>
</html>