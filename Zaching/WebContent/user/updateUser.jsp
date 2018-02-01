<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 80px;
        }
        
        button.btn.btn-emailAuth{
        	background-color: #5f4b8b;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		//============= "이메일 인증"  Event 연결 =============
		$(function () {
			
			$("#emailAuth").on("click", function() {
				fncEmailAuth();
				
			});
		});
			
			
			
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		
		
		///////////////////////////////////////////////////////////////////////
		function fncEmailAuth() {
			var email=$("input[name='email']").val();
			
			if(email == null || email.length <1){
				alert("이메일은  반드시 입력하셔야 합니다.");
				return;
			}
			
			
			$("form").attr("method","POST").attr("action","/user/emailAuth").submit();
			alert("email");
			
			
		}
		
		
		////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>

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
		
		  <div class="form-group">
		  
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이 메 일</label>
		    <div class="col-sm-4">
		      <input type="email" class="form-control" id="email" name="email" value="${user.email}" placeholder="중복확인하세요"  >
		       <span id="helpBlock" class="help-block">
		    
		      	<strong class="text-danger" name="userinput">이메일 인증여부 출력예정</strong>
		      </span>
		    </div>
		   
		    	<div class="col-sm-3">
		    		<button type="button" class="btn btn-emailAuth" id="emailAuth">이메일 인증</button>
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
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>