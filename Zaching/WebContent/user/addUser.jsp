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
	

	
	//==>"회원가입" Event 처리 및 연결
	 $(function() {
			
		 $( "#signUp" ).on("click" , function() {
				fncAddUser();
				alert("회원가입이 완료되었습니당 !!");
			});
		});	
	//이메일형식 검사 필요!!
		
		function fncAddUser() {
			
			var email = $("#checkEmail").val();
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			var name = $("#userName").val();
			
			
			if(email == null || email.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <4){
				alert("패스워드는  3자리 이상 입력하셔야 합니다.");
				return;
			}
			if(pw2 == null || pw2.length <4){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw2 ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("#pw2").focus();
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
		
		//이메일 중복체크
			$(function() {
				  $('#checkbtn').on('click', function(){
			        	alert("버튼클릭!");
			        	fncCheckSingup();
				});
			});
			
		function fncCheckSingup(){
			 var checkEmail = $("#checkEmail").val();
			 alert(checkEmail);
			 
		      
		            $.ajax({
		            	url: "/user/rest/checkSingup",
		            	method:"POST",
						contentType :'application/json',
						data : JSON.stringify({
							"checkEmail" : checkEmail
						
						}),
						async : false,
						dataType : "json",
		                success: function(data){
		                	console.log(data);
		                    if(data == true){
		                    	console.log("데이터 값==> "+data);
		                        $('#checkMsg').html('<p style="color:blue">사용가능</p>');
		                    }
		                    else{
		                        $('#checkMsg').html('<p style="color:red">사용불가능</p>');
		                    }
		                }
		            
		            
		            });    //end ajax    
		            //end on    
		    }

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
		      		<input type="text" class="form-control" id="checkEmail" name="email" value="${sessionScope.user.email}">
		      		<div id="checkMsg"></div>
		      		<button type="button" id="checkbtn" class="btn btn-default">중복확인</button>
		      	</c:if>
		      	
		      	<c:if test="${sessionScope.user.snsType  eq null }">
		      		<input type="text" class="form-control" id="checkEmail" name="email"  >
		      		<div id="checkMsg"></div>
		      		<button type="button" id="checkbtn" class="btn btn-default">중복확인</button>
		      	</c:if>
		      
		      
   			
		    
		    </div>
		   
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" name="password" id="pw" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" name="password2" id="pw2"placeholder="비밀번호 확인" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="name" id="userName" placeholder="회원이름">
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