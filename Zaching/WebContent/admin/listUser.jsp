<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	
	input[type=checkbox] + label {
  display: inline-block;
  width: 15px;
  height: 15px;
  border: 2px solid #bcbcbc;
  cursor: pointer;
	}
	
	input[type=checkbox]:checked + label:after {
  content: '\2714';
  font-size: 11px;
	}
	
	input[type=checkbox] {
  display: none;
	}
	
	.th{
		color: rgba(0,158,216,1);
		font-weight:bold;
	}
	.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #009ed8;
	-webkit-box-shadow:inset 0px 1px 0px 0px #009ed8;
	box-shadow:inset 0px 1px 0px 0px #009ed8;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #009ed8), color-stop(1, #009ed8));
	background:-moz-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-webkit-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-o-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-ms-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:linear-gradient(to bottom, #009ed8 5%, #009ed8 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#009ed8', endColorstr='#009ed8',GradientType=0);
	background-color:#009ed8;
	-moz-border-radius:9px;
	-webkit-border-radius:9px;
	border-radius:9px;
	border:1px solid #84bcf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	padding:6px 13px;
	text-decoration:none;
	text-shadow:0px 1px 0px #009ed8;
	}
	.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #009ed8), color-stop(1, #009ed8));
	background:-moz-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-webkit-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-o-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-ms-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:linear-gradient(to bottom, #009ed8 5%, #009ed8 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#009ed8', endColorstr='#009ed8',GradientType=0);
	background-color:#009ed8;
	}
	.myButton:active {
	position:relative;
	top:1px;
	}
</style>
<body>

 <div class="container">
 	<div class="list">
 	<table class="table table-hover table-striped">
 	<tr><thead>
 	<td class="th" align="left">회원ID</td>
 	<td class="th" align="left">이메일</td>
 	<td class="th" align="left">이름</td>
 	<td class="th" align="left">휴대폰번호</td>
 	<td class="th" align="left">현재포인트</td>
 	<td class="th" align="left">등급</td>
 	<td class="select" align="right"><input type="checkbox" id="cb1"><label for="cb1"></label></td>
 	</tr>
 	<tbody>
 	<tr class="ct_list_pop">
 	<td align="left">1</td>
 	<td align="left">2</td>
 	<td align="left">3</td>
 	<td align="left">4</td>
 	<td align="left">5</td>
 	<td align="left">6</td>
 	<td align="right"> <input type="checkbox" id="cb2"><label for="cb2"></label></td> 	
 		</tr>
 		</tbody>
 		</table>
 		
 		
 	</div>
 	<div class="change" align="right"><a href="#" class="myButton" id="point">처리하기</a></div>
 	<jsp:include page="../common/pageNavigator.jsp" />
  </div>
  
 
    
</body>
</html>