<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

	

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
function check() {
	var form = document.authform;
	var authnum = document.authform;
	
	if(!form.authnum.value!=authnum){
		alert("인증번호를 입력해주셔요");
		return false;
	}
	if(form.authnum.value != authnum){
		alert("인증번호가 일치하지 않습니다.")
		form.authnum.value="";
		return false;
	}
	if(form.authnum.value == authnum){
		alert("인증이 완료 되었습니다.")
		opener.document.userinput.emailAuth.value ="인증완료";
		self.close();
	}
}

</script>

</head>
<body>
<br><br/>
<h4>인증번호를 입력하세요</h4>

<div class="container-center">
	<form action="post" name="authenform" onSubmit="return check();">
		<input type="text" name="authnum"><br><br/>
		<input type="submit" class="btn btn-warning" value="submit">
	</form>
</div>

</body>
</html>