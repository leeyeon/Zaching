<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

<title>zaching</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!--   jQuery , Bootstrap CDN  -->


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style rel="stylesheet">

/* 글꼴 수정 */
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);	
	
		
		* {
			font-family: 'Nanum Gothic', serif;
		}


.navbar-fixed-top {
	background: #ffffff;
	border-color: #ffffff;
}

#navigationbar {
	padding-top: 25px;
	margin-top: 5px;
}

#navbar > ul > li > a {
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
	padding-top: 40px;
}

.modal-dialog.login {
	width: 800px;
	height: 700px;
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
  width: 100%;
  height: 100%;
  margin: 0;
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

	background-size: cover;
    background-repeat: no-repeat, no-repeat;
    background-position: center center;
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
  height: 170px;
}
#loginemail,#name{
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
#loginpassword,#checkEmail{
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
#signinbtn,#checkbtn{
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
#findPassword,#pw{
  -moz-animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.7s cubic-bezier(0.37, 0.82, 0.2, 1);
}
.sns-login,#pw2{
  -moz-animation: slideIn 0.8s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.8s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.8s cubic-bezier(0.37, 0.82, 0.2, 1);
}
#singup{
  -moz-animation: slideIn 0.9s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.9s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.9s cubic-bezier(0.37, 0.82, 0.2, 1);
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
@-webkit-keyframes slidein {
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


.frame {
  width: 500px;
  height: auto;
  margin: 15% auto 0;
  position: absolute;
  width: 100%;
}

svg {
  max-width: 100%;
  height: auto;
  display: block;
}


#loginModal > div > div > div.modal-body > form > div.row.social-login { margin: 5px;}

.icon-search {
    background-image: url(../resources/images/sp.png);
    vertical-align: top;
    color: transparent;
    width: 20px;
    height: 20px;
    display: inline-block;
    background-position: -362px -159px;
    position: absolute;
    top: 44%;
    right: 50%;
}

.fullscreen_popup__close {
    position: absolute;
    top: 15px;
    right: 20px;
    width: 25px;
    height: 25px;
    padding: 15px;
    cursor: pointer;
}

.circle-close-button {
    vertical-align: middle;
    background-image: url(../resources/images/stylenanda.png);
    background-repeat: no-repeat;
    width: 25px;
    height: 25px;
    background-position: -37px -61px;
}

@media only screen and (min-device-width : 320px) and (max-device-width : 600px) {
	body > nav > div.container > div.navbar-header > a > div > img {
		padding-left : 10pt;
	}
	body > nav > div.container > div.navbar-header > a{
		margin-top:-5px;
	}
	body > nav{
		height:90px;
	}
}


</style>
<script type="text/javascript">



		$( function() {
			
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
		        		
		        		if(serverData.list[i].status != '1'){	
	        				++status;
	        			}
		        	
		        	}
		      	
		        	$(".badge").text(status);
		        	
		        	
		        	
		        	
		        }
			});
			
			</c:if>

			
			
		$( "#notice" ).on("click" , function() {
			self.location = "/user/getTimeLine?userId=${sessionScope.user.userId}";
			
		});
		

		
	

		
		//==>"Login"  Event 연결
		$("#signinbtn").on("click" , function() {
			

			var email =$("input[name='email']").val();
			var password =$("input[name='password']").val();
		
			
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

		$("li > a:contains('라이브방송')").on("click", function() {
			self.location = "/broadcast/listBroadcast";
		});
		
	 	$("li > a:contains('밥친구')" ).on("click" , function() {
			$(self.location).attr("href","/bob/mainBob");			
	 	});

		$("li > a:contains('생활정보')").on("click", function() {
			self.location = "/livingInfo/mainLivingInfo";
		});
	

		$("a:contains('로그아웃')").on("click", function() {
			self.location = "/logout";

		});
		
		$("li > a:contains('보이스리플')").on("click", function() {
			self.location = "/voice/listVoice";
		});
		
		$(".ufo").on("click", function() {
			self.location = "/newsfeed/ufo";
		});
		
		$( "#profile" ).on("click" , function() {
			self.location = "/user/getTimeLine?userId=${sessionScope.user.userId}";			
	 	});
		
		$("#findPassword").on("click", function() {
			
				var windowW = 500;  // 창의 가로 길이
		        var windowH = 500;  // 창의 세로 길이
		        var left = Math.ceil((window.screen.width - windowW)/2);
		        var top = Math.ceil((window.screen.height - windowH)/2);

				window.open("/user/findPassword", '', 
						"l top="+top+", left="+left+", height="+windowH+", width="+windowW,
						"resizable=no");
				opener.location.reload(true);
			    

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
		

			
//===============================회원가입===========================================
	
	//회원가입 모달창 닫기 이벤트
	
		
	
	//==>"회원가입" Event 처리 및 연결

	 $(function() {
		
			
		 $( "#singup" ).on("click" , function() {
			
				//alert("회원가입 버튼클릭");
				
				fncAddUser();
				
				
				
			});
		});	
		
		function fncAddUser() {
			
			
			var email = $("#checkEmail").val();
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			var name = $("input[name='name']").val();
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return false;
			}
			if(email == null || email.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return false;
			}
			if(pw == null || pw.length <4){
				alert("패스워드는  3자리 이상 입력하셔야 합니다.");
				return false;
			}
			if(pw2 == null || pw2.length <4){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return false;
			}
			
			
			if( pw != pw2 ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("#pw2").focus();
				return false;
			}

            $.ajax({
            	url: "/user/rest/addUser",
            	method:"POST",
            	contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
					
					"email" : email,
					"password": pw,
					"name": name,
					
				
				}),
				async : false,
				dataType : "json",
                success: function(data){
                	
                	console.log(data);
                    
              	}
                
            	
            
            });    //end ajax    
            //end on    
            self.location ="/index.jsp";
	}
		
		//포커스이벤트
		$(function(){
			  var focus1 = $('#checkEmail');
			  
			  focus1.focus(function(){
				  
				  $('#checkMsg').html('<p style="color:red">이메일을 입력해주세요.</p>');
			  });
			  
			 focus1.blur(function(){
				 if(focus1 != null){
					  
					  $('#checkMsg').html('<p style="color:red">중복체크를 해주세요</p>');  
					  return false;
				  }
				 	if(focus1 == null){
					 
			 		$('#checkMsg').html('<p style="color:red">이메일을 입력해주세요.</p>');		
				 }
				  
			  });
			  
			 
		});
		
	
		//이메일 중복체크
		
		
		
			$(function() {
				  $('#checkbtn').on('click', function(){
			        	fncCheckSingup();
			        	
			        	
				});
			});
			
		function fncCheckSingup(){
			 var checkEmail = $("#checkEmail").val();
			 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			 if(checkEmail == null|| checkEmail.length <1){
				 $('#checkMsg').html('<p style="color:red">이메일을 입력해주세요.</p>');
	        		
	        		return false;

			 }else if(exptext.test(checkEmail) == false){
	        		$("#checkEmail").val('');
	        		$('#checkMsg').html('<p style="color:red">이메일형식으로 입력해주세요.</p>');
	        		return false;
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
		
		$(document).ready(function(){
			
		  $('nav .hamburger').click(function() {
			  $('#navigationbar').toggle();
			  $('nav .hamburger').toggleClass('is-open');
			  $('nav .hamburger').toggleClass('is-closed');
			  $('nav .hamburger').toggleClass('indexcity');
		  });
	});
	
</script>

<link rel="stylesheet" href="/resources/css/navber-yh.css">
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" style="height: 105px; background-color: #FFF;  
    	background-image: url('/resources/images/toolbar_img.png');     background-repeat: repeat-x;
    	border-bottom: 1px solid rgba(214, 213, 212, 0.64);">

      <div class="container" style="color:#000; padding-left: 20px;">
        <div class="navbar-header">          
          <button type="button" class="navbar-toggle hamburger custom-toggle is-closed" data-target="#navigationbar" aria-expanded="false" aria-controls="navbar">
            <span class="hamb-top"></span>
   			<span class="hamb-middle"></span>
			<span class="hamb-bottom"></span>
          </button>
          
          <a class="navbar-brand" href="#" style="margin-top: 20px; */">
        	  <div class="row">
	          	<img alt="뉴스피드로 이동" src="/resources/images/zaching2.png"  height="40px"/>
	          </div>
	       </a>
        </div>
        
        <div id="navigationbar" class="collapse navbar-collapse" style="max-height: 100%; font-family: 'Hanna', serif;">
          <ul class="nav navbar-nav">
            <li><a href="#" style="color:#000;">밥친구</a></li>
            <li><a href="#" style="color:#000;">라이브방송</a></li>
            <li><a href="#" style="color:#000;">보이스리플</a></li>
            <li><a href="#" style="color:#000;">생활정보</a></li>
          
          </ul>
          <ul class="nav navbar-nav navbar-right">



          	<c:if test="${user.userId ne null && sessionScope.user.profileImage eq null}">
	          	<li>
	          		<div class="col-xs-12" style="padding-top: 10px; color:#333;">
			          	<img src="../resources/images/paper-plane.png" id="notice" width="30px"/>
			          	<div class="badge   badge-primary"></div>&nbsp;&nbsp;
			          	<img src="../resources/images/profile_default.png" id="profile" width="30px" height="30px"/>&nbsp;
			          	<a href="#profile" style="color: #f0ad4e;" title="타임라인으로이동">${sessionScope.user.name}</a>&nbsp;님 환영합니다!
	          		</div>
	          	</li>

	          	<li><a href="#">로그아웃</a></li>
          	</c:if>


          	<c:if test="${user.userId ne null && sessionScope.user.profileImage ne null}">
	          	<li>
		          	<div class="col-xs-12" style="padding-top: 10px; color:#333;">
						<img src="../resources/images/paper-plane.png" id="notice" width="30px"/>
						<div class="badge   badge-primary"></div>&nbsp;&nbsp;
				        <c:if test="${sessionScope.user.password ne null}">
				       		<img src="../resources/upload_files/images/${sessionScope.user.profileImage}" id="profile" width="30px" height="30px"
				       		style="border-radius: 50%"/>&nbsp;
				       	</c:if>
				       	<c:if test="${sessionScope.user.password eq null}">
				       		<img src="${sessionScope.user.profileImage}" id="profile" width="30px" height="30px" style="border-radius: 50%"/>&nbsp;
				       	</c:if>
				        <a href="#profile" style="color: #f0ad4e;" title="타임라인으로이동">${sessionScope.user.name}</a>
				        &nbsp;님 환영합니다!
		          	</div>
	          	</li>

	          	<li><a href="#">로그아웃</a></li>
	          	 
          	</c:if>
          	 
            <c:if test="${user.userId eq null}">
	           <li><a data-toggle="modal" data-target="#loginModal">로그인</a></li>
	        </c:if>
	        
          </ul>
    	</div>
     </div><!--/.nav-collapse -->
    
    <div class="noticelist" align="right" style="display:none;"></div>
</nav>


	<!-- Modal -->
	<div id="loginModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog" style="width: 800px; height: 600px;">
				<div class="fullscreen_popup__close" style="top: -38px; right: -19px;">
			    	<div class="circle-close-button" data-dismiss="modal" aria-hidden="true"></div>
			  	</div>
	
			<!-- Modal content-->
			<div class="modal-content" style="height: 100%;">
			
				<div class="login-modal" style="width: 100%; height: 100%;">
				<section class="login-container">
				<article class="half" style="width:56%;">

			       <img src="/resources/images/zaching2.png" class="img-logo" width="50%">
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">로그인</a></span>
				            <span class="tab signup"><a href="#signup">회원가입</a></span>
			        </div>
			        <div class="content text-center">
			            <div class="signin-cont cont">
				                <form action="#" method="post" enctype="multipart/form-data" id="signin">
					                    <input type="text" name="email" id="loginemail" class="inpt" required="required" placeholder="이메일">
					                    <label for="email">Your email</label>
					                    <input type="password" name="password" id="loginpassword" class="inpt" required="required" placeholder="패스워드">
               						    <label for="password">Your password</label>
					                    <div class="submit-wrap" style="top: 110px; height: 50px;">
						                   <input type="submit" value="로그인" class="submit" id="signinbtn">
						                </div>
       					        </form>
	       					<div class="findPassword"  style="margin-top: -10px; margin-bottom: 20px;">
	     					    <hr>
	     					    <a href="#" class="more" id="findPassword" >비밀번호를 잊으셨나요?</a>
	       					</div>
	        				<div class="row social-login text-center">
								<ul class="sns-login" style="list-style-type: none;">
									<li><a href="#kakaoLogin" id="kakaoLogin"> <img
											src="/resources/images/KakaoTalk_lcon.png" class="img-rounded"
											width="50" height="50" type="button" id="kakaologin" /></a>
	
									<a href="#facebookLogin" id="facebookLogin"> <img
											src="/resources/images/facebook_Icon.png" class="img-rounded"
											width="50" height="50" type="button" id="facebooklogin"></a>
	
									<a href="#naverLogin" id="naverLogin"> <img
											src="/resources/images/Naver_Icon.png" class="img-rounded"
											width="50" height="50" type="button" id="naverlogin" /></a>
	
									<a href="#googleLogin" id="googleLogin"> <img
											src="/resources/images/Google_Icon.jpg" class="img-rounded"
											width="50" height="50" type="button" id="googlelogin" /></a></li>
								</ul>
							</div>        					        
    				    </div>
    				<div class="signup-cont cont">                	
					    <input type="text" name="name" id="name" class="inpt" required="required" placeholder="이름">
                        <input type="text" name="email" id="checkEmail" class="inpt" required="required" placeholder="이메일">
                        <span id="checkbtn" class="icon-search"></span>
						<div id="checkMsg"></div>
						<input type="password" name="password" id="pw" class="inpt" required="required" placeholder="비밀번호">
                		<input type="password" name="password2" id="pw2" class="inpt" required="required" placeholder="비밀번호 확인">
						
						<div style="width: 100%;">
						   <input type="submit" value="회원가입" class="submit" id="singup">
						</div>
        			
            		</div>
			       </div>
		    	</article>

		    		<div class="half bg" id="frog" style="padding-top:0px;  width:44%; background-image: url(/resources/login/0.jpg);"></div>

				</section>
				</div>
			
			</div>
			<!-- Modal content-->
		</div>
		<!-- Modal dialog -->
	</div>
	<!-- Modal Fade  -->
	
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> --> 

<script type="text/javascript">
$('.tabs .tab').click(function(){
	
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
        random_image();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
        random_image();
    }
});

$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});

function random_image(){
 var myimages = new Array();
 
 myimages[0] = "0.jpg";
 myimages[1] = "1.jpg";
 myimages[2] = "2.jpg";
 myimages[3] = "3.jpg";
 myimages[4] = "4.jpg";
 myimages[5] = "5.jpg";
 myimages[6] = "6.jpg";
 myimages[7] = "7.jpg";
 myimages[8] = "8.jpg";
 myimages[9] = "9.jpg";
 myimages[10] = "10.jpg";
 myimages[11] = "11.jpg";
 myimages[12] = "12.jpg";
 myimages[13] = "13.jpg";
 myimages[14] = "14.jpg";
 
 
 

 var ry = Math.floor( Math.random() * (myimages.length-1) );
 
 $('#frog').css('background-image','url(/resources/login/'+myimages[ry]+')');
 
}
random_image();

</script>
	




</body>
</html>