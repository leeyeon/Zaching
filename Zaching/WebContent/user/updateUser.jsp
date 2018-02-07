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
   	
   	   
	 <!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/resources/layout/sub_toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 130px;
        }
        
        #emailAuth,#check{
        	color:#fff;
        	background-color: #5f4b8b;
        }
        
       
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			$("form")[0].reset();
		});
	});	
			
			$(function() {

			//============= "수정" Event 연결 =============
				$( "#update" ).on("click", function() {
					alert("수정버튼클릭!");
					fncUpdateUser();
				});
			});
			
			function fncUpdateUser() {
				
				var userId =$("input[name='userId']").val();
				var name = $("input[name='name']").val();
				var email =$("input[name='email']").val();
				var pw = $("input[name='password']").val();
				var pw2 = $("input[name ='password2']").val();
				
				
				
				alert(userId);
				alert(name);
				alert(email);
				alert(pw);
				
				$("form").attr("method" , "POST").attr("action" , "/user/updateUser?userId=${sessionScope.user.userId}").submit();		
					
			}
			
			//============= "이메일 인증"  Event 연결 =============
			$(function() {
		
				$( "#emailAuth" ).on("click", function() {
					alert("인증버튼클릭!");
					fncEmailAuth();
				});
			});
			
			//============= "emailAuth =============
			 function fncEmailAuth() {
					var inputEmail = $("#inputEmail").val(); //입력받은이메일
				 	alert(inputEmail);
					
					if(inputEmail == null || inputEmail.length <1){
						alert("이메일은  반드시 입력하셔야 합니다.");
						return false;
					}
					
					$.ajax({
						
						url:"/user/json/emailAuth",
						method:"POST",
						contentType :'application/json',
						data : JSON.stringify({
							"inputEmail" : inputEmail
						
						}),
						async : false,
						dataType : "json",
						success : function(serverData) {
							alert(serverData);
							
						}
						
						
					});
				}

			
			//입력한 인증번호와 세션에 저장된 인증번호 비교
			$(function(){   
				$("#check").on('click',function(){
					alert("클릭?");
				
				var authNum =$("#authNum").val();
				 alert(authNum);
				 alert("인증버노확인!");
				 
				 if(authNum == null || authNum.length <1){
						alert("인증번호를 다시 입력해주세요.");
						return false;
					}
				
				 $.ajax({
					 
				        url : "/user/json/authNum",
				        method : "POST",
				        contentType : "application/json",
				        data : JSON.stringify({
				        	"authNum" : authNum
				        	
				        }),
				        async : false,
				        dataType : "json",
				        success : function(serverData) {
				        	
				        	alert("인증이가 완료되었습니다.");
				           
				        }
				        
				        
				     });
				
				});
				
			});
		 
		
	</script>

</head>

<body>

	<!-- Modal -->

		 	
            
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
			<input type="hidden"  name="userId" value="${sessionScope.user.userId}"/>
			
		  <div class="form-group">
				<label for="email-label" class="col-sm-offset-1 col-sm-3 control-label">이 메 일</label>
		    <div class="col-sm-4">
		      <input type="email" class="form-control" id="inputEmail" name="email" value="${user.email }">
		       
		  </div>
		   
		   <div class="col-sm-3" id="contents">
		   		<a class="button btn" type="submit" id="emailAuth">이메일 인증</a>
		   </div>
		</div>
		 
		   <div class="form-group">
		    <label for="input-authNum" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="authNum" name="authNum" placeholder="인증번호를 입력해주세요">
		    </div>
		    <div class="col-sm-3" id="contents">
		   		<a class="button btn " type="submit" id="check">확인</a>
		   </div>
		  </div>
				
		  
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control"name="password" placeholder="변경비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control"  name="password2" placeholder="변경비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="name" value="${user.name}" readonly="readonly">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="address"  value="${user.address}" placeholder="변경주소">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="phone"  value="${user.phone}" placeholder="연락처">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="update" >수 &nbsp;정</button>
			  	<a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
			    
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
	 
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>