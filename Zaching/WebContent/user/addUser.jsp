<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/resources/layout/sub_toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	
            margin-top: 130px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//==>"ID중복확인" Event 처리 및 연결
	 $(function() {
		 $("button.btn.btn-info").on("click" , function() {
			popWin 
			= window.open("/user/checkDuplication.jsp",
										"popWin", 
										"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
										"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		});
	});	
	
	
	//==>"회원가입" Event 처리 및 연결
	 $(function() {
			
		 $( "#signUp" ).on("click" , function() {
				fncAddUser();
			});
		});	
	//이메일형식 검사 필요!!
		
		function fncAddUser() {
			
			var email = $("input[name='email']").val();
			var pw = $("input[name='password']").val();
			var pw2 = $("input[name='password2']").val();
			var name = $("input[name='name']").val();
			
			
			if(email == null || email.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw2 == null || pw2.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw2 ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
			
			
		//==>"취소?" Event 처리 및 연결	
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	</script>		
    
</head>

<body>

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="text-center">회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이 메 일</label>
		    <div class="col-sm-4">
		    	<c:if test="${sessionScope.user.snsType  ne null }">
		      		<input type="text" class="form-control" name="email" placeholder="중복확인하세요" value="${sessionScope.user.email}">
		      	</c:if>
		      	
		      	<c:if test="${sessionScope.user.snsType  eq null }">
		      		<input type="email" class="form-control" name="email" placeholder="중복확인하세요" readonly>
		      	</c:if>
		      
		      
		      <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">입력전 중복확인 부터..</strong>
		      </span>
		      
   			 <div class="col-sm-3">
		      <button type="button" class="btn btn-info">중복확인</button>
		    </div>
		    
		    </div>
		   
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" name="password2" placeholder="비밀번호 확인" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="name" placeholder="회원이름">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="signUp" >가 &nbsp;입</button>
			  <a class="btn btn-primary cancelbtn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>