<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	var authnum= ${authNum};
	
	if(!form.authnum.value!=authNum){
		alret("������ȣ�� �Է����ּſ�");
		return false;
	}
}

</script>

</head>
<body>
<br><br/>
<h4>������ȣ�� �Է��ϼ���</h4>

<div class="container">
<form action="post" name="authenform" onSubmit="return check();">
	<input type="text" name="authnum"><br><br/>
	<input type="submit" class="btn btn-warning" value="submit">

</form>

</div>
</body>
</html>