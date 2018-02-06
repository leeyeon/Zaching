<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="../resources/javascript/FileButton.js"></script> 
<script type="text/javascript"> 
	var myFileButton = new FileButton("imageswap", "imagesrc"); //new FileButton("true 값을 줘야 하는 사용자 설정 attribute name", "꾸며질 이미지 url") 
	window.onload = function () { 
		myFileButton.run(); //문서로딩 후 한꺼번에 바꿈 
	} 
</script>
<title>Insert title here</title>
<style>
	
	</style>
</head>
<body>
	<input type="file" name="file" imageswap="true" imagesrc="../resources/images/imageButton.PNG" />
	
</body>
</html>