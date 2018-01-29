<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<title>로그인 화면</title>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body{
	margin-left: 350px;
	padding-top: 350px;
}

login{
	background-color: #ccc;

}

.social-login{
margin-left: 20px;

}


.modal-dialog.login{
  width: 50%;
  height: 50%;
  margin: 0;
  padding: 0;

}

img.img-logo{

margin-left: 250px;

}

img.img-rounded{
margin-top: 10px;
margin-left: 10px;
margin-right: 10px;
margin-bottom: 10px;

}




</style>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->


<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$( function() {
	
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("#email").focus();
	
	//==>"Login"  Event 연결
	$("#login").on("click" , function() {

		var email =$("input:text").val();
		var password =$("input:password").val();
		
		if(email == null || email.length <1) {
			alert('ID 를 입력하지 않으셨습니다.');
			$("input:text").focus();
			return;
		}
		
		if(password == null || password.length <1) {
			alert('패스워드를 입력하지 않으셨습니다.');
			$("input:password").focus();
			return;
		}
		
		
		$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
		
	});
});

</script>

</head>




<body>

<div class="container">
  
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
				   	 	
	 	 	<div class="col-md-6">
	 	 
				<div class="jumbotron">	

		 	 		<h1 class="text-center">로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>
						
			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="email" class="col-sm-4 control-label">아 이 디</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="email" id="email"  placeholder="아이디" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">패 스 워 드</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary" id="login" >로 &nbsp;그 &nbsp;인</button>
					      <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
						    </div>
					  </div>
						
						<div class="col-sm-offset-3 col-sm-7 text-center">
						<img id="kakaologin"src="../images/kakao_account_login_btn_medium_wide.png" >
					  </div>
						
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->
</body>

</html>