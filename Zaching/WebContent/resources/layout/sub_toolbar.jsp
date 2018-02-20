<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!--   jQuery , Bootstrap CDN  -->


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

/* 글꼴 수정 */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Nanum Gothic', serif;
}

.navbar-fixed-top {
	background: #ffffff;
	border-color: #ffffff;
}

#navigationbar {
	margin-top: 10px;
	padding-top: 20px;
	background: #FFFFFF;
}

#navbar>ul>li>a {
	margin :5px 5px 5px 5px;
	color: #FFFFFF;
}

.navbar-inverse .navbar-brand {
	color: #FFFFFF;
}

.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.open>a
	{
	background-image: linear-gradient(to bottom, #cccccc 0, #cccccc 100%);
}

.mainbar {
	padding: 0px;
	height: 150px;
	width: 100%;
	text-align: center;
}

.mainbar-menu {
	display: inline-block;
	cursor: pointer;
	width: 20%;
	height: 130px;
	line-height: 140px;
	padding: 10px;
	font-size: 20px;
	background: none;
	color: #000000;
	font-weight: bold;
	float: left;
	padding: 5px;
}

.mainbar-menu:hover, .mainbar-menu .active {
	border-bottom: 4px solid RGB(237, 125, 49);
}

/* //////////////// main css */

/* 모달 크기조정 */
.social-login {
	margin-left: 20px;
}

.modal-dialog.login {
	width: 700px;
	height: 500px;
	margin: 0;
	padding: 0;
}


.modal-dialog.modal {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.notice {
	overflow: inherit;
	overflow-y: inherit;
	text-align: center;
	display: inline-block;
	vertical-align: right;
	width: 300px;
	height: 150px;
	overflow-y: scroll;
	background: #fff;
}

/* ////////////////////로그인 모달 창 style/////////////////////// */
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

body .login-container {
  position: relative;
  overflow: hidden;
  width: 700px;
  height: 500px;
  margin: 40px auto 40px;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .login-container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 58px 40px 0;
}
body .login-container .half.bg {
  background-image: url("http://www.blueb.co.kr/SRC2/_image/v01.jpg");
  background-size: 400px;
  background-repeat: no-repeat;
}
body .login-container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .login-container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .login-container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .login-container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .login-container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .login-container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .login-container .content form {
  position: relative;
  height: 287px;
}
body .login-container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .login-container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .login-container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .login-container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .login-container .content label:not([for='remember']) {
  display: none;
}
body .login-container .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .login-container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .login-container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .login-container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .login-container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .login-container .content input.inpt:focus {
  border-color: #999999;
}
body .login-container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .login-container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .login-container .content input:focus {
  outline: none;
}
body .login-container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .login-container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .login-container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .login-container .content .checkbox:checked + label:before {
  content: "✓";
}
body .login-container .content .submit-wrap {
  position: absolute;
  bottom: 0;
  width: 100%;
}
body .login-container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .login-container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .login-container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

</style>

<script type="text/javascript">
		$( function() {

		$( "#notice" ).on("click" , function() {
			
        	var displayValue = '';
			var tr = '';
			var category = '';
			var status = 0;
			
	
			if ($('.noticelist').attr('hide') == "true") {
		    	$('.noticelist').slideUp(function() {
		    		$(this).attr('hide', false);
		   	 	});
		    } else {
		    	$('.noticelist').slideDown(function() {
		    		$(this).attr('hide', true);
		   	 	});
		    }


			var userId = $("input[name='userId']").val();
			$.ajax( {
							url : "/notice/rest/noticeList",
							method : "POST",
					        contentType : "application/json; charset=UTF-8",
					        data : JSON.stringify({
					        	"RECEIVER_ID" : userId
					        }),
					        dataType : "json",
					        success : function(serverData) {
					         	
					        	for(var i=0; i<serverData.list.length; i++){
					        		
					        		if(serverData.list[i].category == 'V'){
					        			category = '보이스리플에 게시글을 올렸습니다.';
					        		}
					        		else if(serverData.list[i].category == 'B'){
					        			category = '밥친구에 초대하였습니다.';
					        		}
					        		
					        		if(serverData.list[i].status == '0'){
					        			++status;
					        		}	

					        		tr = tr + '<tr class="notice_list_click"><td align="left"><input type="hidden" name="noticeid" value="'+serverData.list[i].noticeId+'">'+
					        		serverData.list[i].name+'님이 '+ category+'</td></tr>'
					        	
					        	}
					        		
									displayValue = '<div class="notice"><table class="table table-hover">'+ tr + '</table></div>';
									
								
									$(".noticelist").html(displayValue);
									$(".badge").text(status);
									
									$(".notice_list_click td").on("click" , function() {
										
					
										var noticeId = $($("input[name='noticeid']")[$('.notice_list_click td:nth-child(1)').index(this)]).val();
										
										$.ajax( {
											
											url : "/notice/rest/noticeUpdate",
											method : "POST",
									        contentType : "application/json; charset=UTF-8",
									        data : JSON.stringify({
									        	"NOTICE_ID" : noticeId
									        }),

									        success : function(serverData) {
									        	--status;
									        	
									        	if(status < 0)
									        		{
									        		status = 0;
									        		}
									        	$(".badge").text(status);
									        }									
											
										});
										
									});
					           
					        }
			 
	 		
			});
			
			
			
			
		});
		
		//모달창 닫기 버튼 이벤트
		$(function() {
				  $('#close').on('click', function(){
			        	
			        	$("#loginemail").val('');
			        	$("#loginpassword").val('');
				});
			});
		
	

		
		//==>"Login"  Event 연결
		$("#signin").on("click" , function() {
			

			var email =$("input[name='email']").val();
			var password =$("input[name='password']").val();
			
			alert(email);
			alert(password);
			
			if(email == null || email.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("input[name='email']").focus();
				return;
			}
			
			if(password == null || password.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("input[name='password']").focus();
				return;
			}
			
			
			$("#signin").attr("method","POST").attr("action","/login").attr("target","_parent").submit();
			
		});

		$('body > nav > div.container > div > div:nth-child(3)').addClass('active');
		
		$('.mainbar-menu').on('click', function(){
			 $('.active').removeClass('active');
			 $(this).addClass('active');
		})
		
		$( ".navbar-brand img" ).on("click" , function() {
			$(self.location).attr("href","/");
		});
		
		$('body > nav > div.container > div > div:nth-child(3)').addClass('active');
		
		
		$('.mainbar-menu').on('click', function(){
			 $('.active').removeClass('active');
			 $(this).addClass('active');
		})
		
		$( ".navbar-brand img" ).on("click" , function() {
			$(self.location).attr("href","/");			
	 	});

		$("a:contains('라이브방송')").on("click", function() {
			self.location = "/broadcast/listBroadcast";
		});
		
	 	$( "a:contains('밥친구')" ).on("click" , function() {
			$(self.location).attr("href","/bob/mainBob");			
	 	});

		$("a:contains('생활정보')").on("click", function() {
			self.location = "/livingInfo/mainLivingInfo";
		});
	
		
		$("a:contains('로그아웃')").on("click", function() {
			self.location = "/logout";
		});
		
		$("a:contains('보이스리플')").on("click", function() {
			self.location = "/voice/listVoice";
		});
		
		$(".ufo").on("click", function() {
			self.location = "/newsfeed/ufo";
		});
		
		$( "#profile" ).on("click" , function() {
			self.location = "/user/getTimeLine?userId=${sessionScope.user.userId}";			
	 	});
		
		$("a:contains('패스워드찾기')").on("click", function() {
			
				var windowW = 500;  // 창의 가로 길이
		        var windowH = 500;  // 창의 세로 길이
		        var left = Math.ceil((window.screen.width - windowW)/2);
		        var top = Math.ceil((window.screen.height - windowH)/2);

				window.open("/user/findPassword", '', 
						"l top="+top+", left="+left+", height="+windowH+", width="+windowW,
						"resizable=no");
				opener.location.reload(true);
			    self.close();

		});
		

		
		//이름으로 타임라인 이동
		$("#navigationbar > ul:nth-child(2) > li:nth-child(1) > div > a").on("click", function() {
			self.location = "/user/getTimeLine?userId=${sessionScope.user.userId}";
		});
		

		//카카오로그인 으로 이동
		$("#kakaologin").on("click", function() {
			self.location ="/kakaoLoginRequest";
		});

		
		//네이버 로그인
		$("#naverLogin").on("click", function() {
			self.location = "/naverLoginRequest";
		});
		
		//구글로그인
		$("#googleLogin").on("click", function() {
			self.location = "/googleLoginRequest";
		});
		
		
		//페이스북로그인
		$("#facebookLogin").on("click", function() {
			 self.location = "/facebookLoginRequest";
	
		});

	});
		
		
		
		
		$(document).ready(function(){
			
			<c:if test="${sessionScope.user.userId ne null}">
				// userId input value 로 못 받아와서 수정함 session에서 가져오는 걸로
				var userId = "${sessionScope.user.userId}";
				
				$.ajax({
					url : "/notice/rest/noticeList",
					method : "POST",
			        contentType : "application/json; charset=UTF-8",
			        data : JSON.stringify({
			        	"RECEIVER_ID" : userId
			        }),
			        dataType : "json",
			        success : function(serverData) {
			        	var status = 0;
			        	
			        
			        	for(var i=0; i<serverData.list.length; i++){
			        		if(serverData.list[i].status == '0'){
		        				++status;
		        			}
			        	
			        	}
	
			        	$(".badge").text(status);
			        	
			        }
				});
				
				</c:if>
				
			
		});
			
//===============================회원가입===========================================
	
	//회원가입 모달창 닫기 이벤트
	$(function() {
				  $('#addclose,#addclose2').on('click', function(){
					  $("#addUserform")[0].reset();
				});
			});
		
	
	//==>"회원가입" Event 처리 및 연결
	 $(function() {
		
			
		 $( "#signup" ).on("click" , function() {
				alert("회원가입 버튼클릭");
				fncAddUser();
				if(result == true){
					alert("회원가입이 완료되었습니다.");
				}
				
			});
		});	
		
		function fncAddUser() {
			
			
			var email = $("#checkEmail").val();
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			var name = $("input[name='name']").val();
			
			
			if(email == null || email.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return false;
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

            $.ajax({
            	url: "/user/rest/addUser",
            	method:"POST",
            	contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
					
					"email" : email,
					"password": pw,
					"name": name
				
				}),
				async : false,
				dataType : "json",
                success: function(data){
                	
                	console.log(data);
                    
                	}
                
            
            
            });    //end ajax    
            //end on    
            alert(name);
			alert(email);
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
			 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			 if(checkEmail == null|| checkEmail.length <1){
				 $('#checkMsg').html('<p style="color:red">이메일을 입력해주세요.</p>');
	        		
	        		return false

			 }else if(exptext.test(checkEmail) == false){
	        		$("#checkEmail").val('');
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
		                        $('#checkMsg').html('<p style="color:blue">사용가능</p>');
		                    }
		                    else if(data == false){
		                        $('#checkMsg').html('<p style="color:red">사용불가능</p>');
		                        alert("이메일을 다시 입력 해주세요");
		                        return $("#checkEmail").val('');

		                 
		                    }
		                }
		            
		            
		            });    //end ajax    
		            //end on    
		    }
	
			
		
	
</script>

<title>zaching</title>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top"
		style="height: 105px; background-color: #FFF;  
    	background-image: url('/resources/images/toolbar_img.png');     background-repeat: repeat-x;
    	border-bottom: 1px solid rgba(214, 213, 212, 0.64);">

      <div class="container" style="color:#000">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigationbar" aria-expanded="false" aria-controls="navbar"
          	style="margin-top: 35px;">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            
          </button>
          <a class="navbar-brand" href="#">
        	  <div class="row">
        	
	          	<img alt="뉴스피드로 이동" src="/resources/images/zaching2.png"  height="40px" 
	          		style="margin-top: 20px;"/></div>
	        </a>
        </div>
        <div id="navigationbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#" style="color:#000;">밥친구</a></li>
            <li><a href="#" style="color:#000;">라이브방송</a></li>
            <li><a href="#" style="color:#000;">보이스리플</a></li>
            <li><a href="#" style="color:#000;">생활정보</a></li>
          
          </ul>
          <ul class="nav navbar-nav" style="float:right;">

          	<c:if test="${user.userId ne null && sessionScope.user.profileImage eq null}">
	          	<li><div style="padding-top: 10px; color:#333;">
	         <!-- 여기부터 --><img src="../resources/images/paper-plane.png" id="notice"
		          	width="30px"/><div class="badge   badge-primary"></div>&nbsp;&nbsp;
		          	 <!-- 여기까지 알림임ㅜㅠㅠ 지우지마셈 --> 
	          	<img src="../resources/images/profile_default.png" id="profile"

		          	width="30px"/>&nbsp;<a href="#profile" style="color: #f0ad4e;" title="타임라인으로이동">${sessionScope.user.name}</a>&nbsp;님 환영합니다!

		       
	          	</div></li>
	          	<li><a href="#">로그아웃</a></li>
          	</c:if>
          	

          
          	<c:if test="${user.userId ne null && sessionScope.user.profileImage ne null}">
	          	<li><div style="padding-top: 10px; color:#333;">
	           <!-- 여기부터 --><img src="../resources/images/paper-plane.png" id="notice"
		          	width="30px"/><div class="badge   badge-primary"></div>&nbsp;&nbsp;
		          		 <!-- 여기까지 알림임ㅜㅠㅠ 지우지마셈 --> 
		       	<img src="../resources/upload_files/images/${sessionScope.user.profileImage}" id="profile" width="30px"
		       	style="border-radius: 50%"/>&nbsp;
		        <a href="#profile" style="color: #f0ad4e;" title="타임라인으로이동">${sessionScope.user.name}</a>
		        &nbsp;님 환영합니다!

		       
	          	</div></li>
	          	<li><a href="#">로그아웃</a></li>
	          	 
          	</c:if>
          	 
          	 
            <c:if test="${user.userId eq null}">
            <li><a data-toggle="modal" data-target="#loginModal">로그인</a></li>
            <li><a data-toggle="modal" data-target="#AddUserModal">회원가입</a></li>
            <!-- <li><a href="#">회원가입</a></li> -->
          </c:if>
          </ul>
          			
        </div><!--/.nav-collapse -->
        <div class="noticelist" align="right" style="display:none;">
						

	<div class="container" style="color: #000">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigationbar"
				aria-expanded="false" aria-controls="navbar" style="margin-top: 35px;">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href="#"> <img alt="뉴스피드로 이동"
				src="/resources/images/zaching2.png" height="40px"
				style="margin-top: 20px;" />
			</a>
		</div>
		<div id="navigationbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#" style="color: #000;">밥친구</a></li>
				<li><a href="#" style="color: #000;">라이브방송</a></li>
				<li><a href="#" style="color: #000;">보이스리플</a></li>
				<li><a href="#" style="color: #000;">생활정보</a></li>
			</ul>
			<ul class="nav navbar-nav" style="float: right;">

				<c:if test="${user.userId ne null && sessionScope.user.profileImage eq null}">
					<li><div style="padding-top: 10px; color: #333;">
							<!-- 여기부터 -->
							<img src="../resources/images/paper-plane.png" id="notice"
								width="30px" />
							<div class="badge   badge-primary"></div>
							&nbsp;&nbsp;
							<!-- 여기까지 알림임ㅜㅠㅠ 지우지마셈 -->
							<img src="../resources/images/profile_default.png" id="profile"
								width="30px" class="img-circle"/>&nbsp;<a href="#profile" style="color: #f0ad4e;"
								title="타임라인으로이동">${sessionScope.user.name}</a>&nbsp;님 환영합니다!


						</div></li>
					<li><a href="#">로그아웃</a></li>
				</c:if>



				<c:if test="${user.userId ne null && sessionScope.user.profileImage ne null}">
					<li><div style="padding-top: 10px; color: #333;">
							<!-- 여기부터 -->
							<img src="../resources/images/paper-plane.png" id="notice"
								width="30px" />
							<div class="badge   badge-primary"></div>
							&nbsp;&nbsp;
							<!-- 여기까지 알림임ㅜㅠㅠ 지우지마셈 -->
							<img class="img-circle" src="../resources/upload_files/images/${sessionScope.user.profileImage}" 
								id="profile" width="30px" />
						<a href="#profile"style="color: #f0ad4e;" title="타임라인으로이동">${sessionScope.user.name}</a>
							&nbsp;님 환영합니다!
					</div></li>
					<li><a href="#">로그아웃</a></li>
				</c:if>


				<c:if test="${user.userId eq null}">
					<li><a data-toggle="modal" data-target="#loginModal">로그인</a></li>
					<li><a data-toggle="modal" data-target="#AddUserModal">회원가입</a></li>
				</c:if>
			</ul>

		</div>
		<!--/.nav-collapse -->
		<div class="noticelist" align="right" style="display: none;"></div>
	</div>



	</nav>


	<!-- Modal -->
	<div id="loginModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog" style="width: 800px;">

			<!-- Modal content-->
			<div class="modal-content">

				<!-- Modal Header start-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="close">&times;</button>
				</div>
				<!-- Modal Header end -->
				<div class="login-modal">
				<section class="login-container">
		    	<article class="half">
			       <img src="/resources/images/temp_logo.png" class="img-logo"
							width="50" height="50">
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">로그인</a></span>
				            <span class="tab signup"><a href="#signup">회원가입</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
					                <form action="#" method="post" enctype="multipart/form-data" id="signin">
						                    <input type="text" name="email" id="loginemail" class="inpt" required="required" placeholder="email입력">
						                    <label for="email">Your email</label>
						                    <input type="password" name="password" id="loginpassword" class="inpt" required="required" placeholder="password입력">
                						    <label for="password">Your password</label>
						                    <input type="checkbox" id="remember" class="checkbox" checked>
						                    <label for="remember">Remember me</label>
						                    <div class="submit-wrap">
							                        <input type="submit" value="Sign in" class="submit">
							                        <a href="#" class="more">Forgot your password?</a>
						                    </div>
        					        </form>
    				        </div>
    				<div class="signup-cont cont">
                	<form action="#" method="post" enctype="multipart/form-data" id="singup">
					    <input type="text" name="email" id="name" class="inpt" required="required" placeholder="Your name">
						<label for="name">Your name</label>
                        <input type="text" name="email" id="checkEmail" class="inpt" required="required" placeholder="Your email">
						<label for="email">Your email</label>
						<input type="password" name="password" id="pw" class="inpt" required="required" placeholder="Your password">
                		<label for="password">Your password</label>
                		<input type="password" name="password" id="pw2" class="inpt" required="required" placeholder="Your password">
                		<label for="password">Your password</label>
						<div class="submit-wrap">
						   <input type="submit" value="Sign up" class="submit">
						   <a href="#" class="more">Terms and conditions</a>
						</div>
        			</form>
            		</div>
			       </div>
		    	</article>
		    		<div class="half bg"></div>
				</section>
				</div>
			
			</div>
			<!-- Modal content-->
		</div>
		<!-- Modal dialog -->
	</div>
	<!-- Modal Fade  -->
	
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- 회원가입 Modal -->
	<div id="AddUserModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">

			<!-- 회원가입Modal content-->
			<div class="modal-content">

				<!-- 회원가입Modal Header start-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="addclose">&times;</button>
					<div class="modal-title" align="center"
						style="margin-bottom: 15px;">
						<!-- 자췽로고 -->
						<img src="/resources/images/temp_logo.png" class="img-logo"
							width="50" height="50">
					</div>
				</div>
				<!-- 회원가입Modal Header end -->

				<!-- 회원가입Modal Body start-->
				<div class="modal-body" align="left">
				<form class="form-horizontal" id="addUserform">
		
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
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="name" id="name" placeholder="회원이름">
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
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="signUp" >가 &nbsp;입</button>
			  <a class="btn btn-primary cancelbtn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>

					
	</div>
	<!--Modal Body  -->

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="addclose2">Close</button>
				</div>

			</div>
			<!-- Modal content-->
		</div>
		<!-- Modal dialog -->
	</div>
	<!-- Modal Fade  -->
	
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>
</body>
</html>