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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   
   <!-- jQuery Simple PopUp -->
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="/resources/javascript/jquery.simple-popup.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
		integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
	<link href="/resources/css/jquery.simple-popup.min.css" rel="stylesheet" type="text/css">
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 80px;
        }
        
        #emailAuth{
        	background-color: #5f4b8b;
        }
        
        #popup1 { 
        	display:none; 
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
			//============= "이메일 인증"  Event 연결 =============
			$(function() {
		
				$( "#emailAuth" ).on("click", function() {
					alert("인증버튼클릭!");
					fncEmailAuth();
				});
			});
			
			//============= "emailAuth =============
			 function fncEmailAuth() {
					var email = $("#email").val(); //입력받은이메일
				 	alert(email);
					
					if(email == null || email.length <1){
						alert("이메일은  반드시 입력하셔야 합니다.");
						return false;
					}
					
					$.ajax({
						
						url:"/user/json/emailAuth",
						method:"POST",
						contentType :'application/json',
						data : JSON.stringify({
							"email" : email
						
						}),
						async : false,
						dataType : "json",
						success : function(serverData) {
							alert(serverData);
							
						}
						
						
					});
				}

			
			//=======팝업창에서 "확인" REvent=========
			//============= pop-up 창 띄우기 =============
					
					
			$(document).ready(function() {
				  
				  $("a.demo-2").simplePopup({ 
					  		
					  		type: "html", 
							htmlSelector: "#popup1"
							
						  });
			});
	
			//입력한 인증번호와 세션에 저장된 인증번호 비교
			 function fncAuthNum() {
				var authNum =$("#authNum").val();
				
				
				 alert(authNum);
				 alert("인증버노확인!");
				 
				
				 $.ajax({
					 
				        url : "/user/json/authNum",
				        method : "POST",
				        contentType : "application/json",
				        data : JSON.stringify({
				        	"authNum" : authNum,
				        	
				        }),
				        async : false,
				        dataType : "json",
				        success : function(serverData) {
				        	
				        	alert("인증이가 완료되었습니다.");
				           
				        }
				        
				        
				     });
				
			}
		 
		
	</script>

</head>

<body>

	 <!-- 팝업창 -->
		  	<div id="popup1">
                <form>
  					 <div class="form-group">
    					<label for="exampleTextarea">인증번호</label>
    					<input type="text" name="authNum" id="authNum"/>
    				</div>
  					<button type="submit" class="btn btn-primary" onclick="fncAuthNum()">확인</button>
				</form>
            </div>		
            
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<div class="page-header text-center">
		
		<c:if test="${user.role.trim()=='2'}"> <!-- 정회원일경우 -->
	       <h3 class=" text-info">내정보수정</h3>
	       <h5 class="text-muted">회원님은 <strong class="text-danger">정회원</strong>입니다.</h5>
	    </c:if>
		
		<c:if test="${user.role.trim()=='1'}"> <!-- 준회원일경우 -->
	       <h3 class=" text-info">추가정보입력</h3>
	       <h5 class="text-muted">회원님은 <strong class="text-danger">준회원</strong>입니다.</h5>
	    </c:if>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group ">
				<label for="email" class="col-sm-offset-1 col-sm-3 control-label">이 메 일</label>
		    <div class="col-sm-4">
		      <input type="email" class="form-control" id="email" name="email" placeholder="이메일을입력해주세요"  >
		       <span id="helpBlock" class="help-block">
		    	<strong class="text-danger" name="userinput">이메일 인증여부 출력예정</strong>
		      </span>
		  </div>
		   
		   <div class="col-sm-3" id="contents">
		   		<a class="demo-2 btn btn" type="submit" id="emailAuth">이메일 인증</a>
		   </div>
		</div>
		 
				
		  
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly="readonly">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="address" name="address"  value="${user.address}" placeholder="변경주소">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
	 
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>