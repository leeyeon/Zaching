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

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

</script>

</head>

<body>

	<div class="container">
  <h2>로그인</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-login btn-lg" data-toggle="modal" data-target="#myModal">로그인</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h1 class="modal-title">로그인</h1>
        </div>
        
        <div class="modal-body">
          <div class="container-fluid">
             
            <div class="row">
              <div class="col-xs-8">
              	<label for="inputlg">이메일(ID)</label>
              </div>
            </div>
              
            <div class="row">
              <div class="col-sm-6">
   				 <input class="form-control input-lg" id="inputlg" type="text">
              </div>
            </div>
              
            <div class="row">
              <div class="col-sm-6">
              	<label for="inputlg">패스워드(PW)</label>
              </div>
            </div>
      
              
              
            <div class="row">
              <div class="col-sm-6">
   				 <input class="form-control input-lg" id="inputlg" type="text">
              </div>
			</div>
			
			<div class="row">
             <h1>     </h1>
			</div>
			
			<div class="row">
              <div class="col-xs-1">
   			 	<img src="/resources/images/KakaoTalk_lcon.png"  width="50" height="50">
              </div>
              
              <div class="col-xs-1">
   			 	<img src="/resources/images/facebook_Icon.png"  width="50" height="50">
              </div>
              
              <div class="col-xs-1">
   			 	<img src="/resources/images/Naver_Icon.png"  width="50" height="50">
              </div>
              
              <div class="col-xs-1">
   			 	<img src="/resources/images/KakaoTalk_lcon.png"  width="50" height="50">
              </div>
            </div>
           	
			<div class="row">
             <h1>     </h1>
			</div>
            
         
         
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
 
    </div>
  </div>
  </div>
</div>
</body>

</html>