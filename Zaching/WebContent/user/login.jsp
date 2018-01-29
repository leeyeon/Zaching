<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


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


.modal-dialog.modal{
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

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">


//로그인
	$( function() {
		
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#login").focus();
		
		//==>"Login"  Event 연결
		$("#login").on("click" , function() {

			var email=$("#email").val();
			var password=$("#password").val();
			
			if(email == null || email.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#email").focus();
				return;
			}
			
			if(password == null || password.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
			
			////////////////////////////////////////////////// 추가 , 변경된 부분 ////////////////////////////////////////////////////////////
			//$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			$.ajax( 
					{
						url : "/user/json/login",
						method : "POST" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							email : email,
							password : password
						}),
						success : function(JSONData , status) {

							//Debug...
							console.log("JSONData : \n "+JSONData);
							console.log(status);
							console.log( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
							console.log(JSONData != null);
							
							//alert(status);
							//alert("JSONData : \n"+JSONData);
							//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
							//alert( JSONData != null );
							
							if( JSONData != null ){
								
								$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?email="+JSONData.email);
								
								//==> 방법 1 , 2 , 3 결과 학인
							}
						}
				});  			
		});
	});

//회원가입하기 
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#']").on("click" , function() {
			self.location = "/user/addUser"
		});
	});
//패스워드 찾기



//===========sns계정로그인============
	
	
//카카오톡

//페이스북

//네이버

//구글



</script>

</head>




<body>

<div class="container">
  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-login btn-lg" 
    data-toggle="modal" data-target="#myModal">로그인</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
  
  <div class="modal-dialog modal-center">
    
  <!-- Modal content-->
      <div class="modal-content">
      
      <!-- Modal Header start-->
       <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="modal-title"><!-- 자췽로고 -->
          <img src="/resources/images/temp_logo.png" class="img-logo" width="50" height="50" ></div> 
       </div> <!-- Modal Header end --> 
       
       <div class="modal-body">
       	
       	<div class="row email">
          <div class="col-xs-4">
           	<label for="inputlg" style="margin-left: 5px">이메일(ID)</label>
           	
          </div>
        </div>
        
        
         <div class="row login">
           <div class="col-sm-6">
   			<input class="form-control input-lg" id="email" type="text" name="email"
   			style="margin-left: 5px">
   			
           </div>
         </div>
         
         <div class="row">
           <div class="col-sm-6">
           	<label for="inputlg" style="margin-left: 5px" 
           	style="margin-top: 5px">패스워드(PW)</label>
           </div>
         </div>
       
       
         <div class="row">
           <div class="col-sm-6">
   			 <input class="form-control input-lg" id="password" type="text" name="password"
   			 style="margin-left: 5px">
           </div>
		</div>
		
		
		<div class="row">
              <div class="social-login">
   			 	<img src="/resources/images/KakaoTalk_lcon.png" class="img-rounded" width="50" height="50" >
   			 	<img src="/resources/images/facebook_Icon.png" class="img-rounded" width="50" height="50" >
   			 	<img src="/resources/images/Naver_Icon.png"  class="img-rounded" width="50" height="50" />
   			 	<img src="/resources/images/Google_Icon.jpg" class="img-rounded" width="50" height="50" >
              </div>
        </div>
       	<div class="row">
			 <div class="col-sm-offset-4 col-sm-6 text-center">
		     <button type="button" class="btn btn-primary" id="login"  >로 &nbsp;그 &nbsp;인</button>
			 <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
		     </div>
	   </div>
       
       </div><!--Modal Body  -->
          
        
      </div><!-- Modal content-->
    
    </div> <!-- Modal dialog -->  
    
    </div> <!-- Modal Fade  --> 

</div><!-- Container -->

</body>

</html>