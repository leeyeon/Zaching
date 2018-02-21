<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
    <script type="text/javascript">
    

	//==>"이메일" 유효성Check  Event 처리 및 연결
	$(function() {
				  $('#checkbtn').on('click', function(){
			        	alert("버튼클릭!");
			        	fncCheckSingup();
			  	});
			});
			
		function fncCheckSingup(){
			 var checkEmail = $("#checkEmail").val();
			 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			 if(checkEmail == null|| checkEmail.length <1){
				 $('#checkMsg').html('<p style="color:red">이메일을 입력해주세요.</p>');
	        		
	        		return false

			 }else if(exptext.test(checkEmail) == false){
	        		$("#email").val('');
	        		$('#checkMsg').html('<p style="color:red">이메일형식으로 입력해주세요.</p>');
	        		return false
			 }
			 
		            $.ajax({
		            	url: "/user/rest/checkSingup",
		            	method:"POST",
		            	contentType : "application/json; charset=UTF-8",
						data : JSON.stringify({
							"checkEmail" : checkEmail
						
						}),
						async : false,
						dataType : "json",
		                success: function(data){
		                	console.log(data);
		                    if(data == true){
		                    	console.log("데이터 값==> "+data);
		                        $('#checkMsg').html('<p style="color:blue">존재하지 않는 이메일 입니다.</p>');
		                    }
		                    else if(data == false){
		                        $('#checkMsg').html('<p style="color:red">이메일전송이 완료되었습니다.</p>');
		                        
		                        return $("#checkEmail").val('');

		                 
		                    }
		                }
		            
		            
		            });    //end ajax    
		            //end on    
		    }
    

</script>

<title>패스워드찾기</title>


</head>
<body>

		<div class="form-group">
			<label for="email" class="col-md-2 control-label">이메일</label>
			<div class="col-md-10">
				<input type="text" class="form-control" name="email"
				 placeholder="이메일을 작성해주세요" id="checkEmail">
			</div>

			<div class="col-md-offset-2 col-md-10">
				<div style="color: red; margin-top: 2px">
				
				</div>
			</div>

		</div>

		<div class="form-group" style="margin-left: 82%">
			<!-- Button -->
				<div id="checkMsg"></div>
				<button type="button" id="checkbtn" class="btn btn-default">중복확인</button>
			<div class="col-md-offset-8 col-md-8">
				<button id="btn-signup" type="submit" class="btn btn-warning">임시비밀번호전송</button>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-12 control">
			<div id="checkMsg"></div>
				<div style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
					가입하신 이메일로 아이디와 비밀번호를 전송해드리겠습니다.</div>
			</div>
		</div>

</body>
</html>