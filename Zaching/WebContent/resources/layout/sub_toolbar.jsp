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
	width: 300px;
	height: 200px;
	margin: 0;
	padding: 0;
}

/* ////////////////////로그인 모달 창 style/////////////////////// */
.modal-dialog.modal {
	width: 50%;
	height: 50%;
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

.sns-login > ul {
	
	list-style: none;
	margin: 0;
	padding: 0;
}

.sns-login>li {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
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

/**
 * Paper Plane
 */
/*Paper Plane: Container*/
.plane-container {
	position:fixed;
	right:100px;
	bottom:30%;
  width: 60px;
  margin: 0px auto;
  z-index: 3;
  display: inline-block;
}
 /*Paper Plane: Image*/
.plane {
  width: 100%;
  height: 60px;
}

/*Paper Plane: Animation*/
.plane-container {
  -webkit-animation: paper-plane-scoping 2s alternate infinite;
  -moz-animation: paper-plane-scoping 2s alternate infinite;
  animation: paper-plane-scoping 2s alternate infinite;

  -webkit-animation-timing-function: linear;
  -moz-animation-timing-function: linear;
  animation-timing-function: linear;
}

@-webkit-keyframes paper-plane-scoping {
  0% {
    -webkit-transform: translateY(0px);
    -moz-transform: translateY(0px);
    transform: translateY(0px);
  }
  100% {
    -webkit-transform: translateY(100px);
    -moz-transform: translateY(100px);
    transform: translateY(100px);
  }
}

.plane {
  -webkit-animation-timing-function: ease-in-out;
  -moz-animation-timing-function: ease-in-out;
  animation-timing-function: ease-in-out;

  -webkit-animation: paper-plane-soaring 4s forwards infinite;
  -moz-animation: paper-plane-soaring 4s forwards infinite;
  animation: paper-plane-soaring 4s forwards infinite;
}
@-webkit-keyframes paper-plane-soaring {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  40% {
    -webkit-transform: rotate(15deg);
    -moz-transform: rotate(15deg);
    transform: rotate(15deg);
  }
  50% {
    -webkit-transform: rotate(15deg);
    -moz-transform: rotate(15deg);
    transform: rotate(15deg);
  }
  60% {
    -webkit-transform: rotate(-10deg);
    -moz-transform: rotate(-10deg);
    transform: rotate(-10deg);
  }
  70% {
    -webkit-transform: rotate(-10deg);
    -moz-transform: rotate(-10deg);
    transform: rotate(-10deg);
  }
  100% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    transform: rotate(0deg);
  }
}


#loginModal > div > div > div.modal-body > form > div.row.social-login { margin: 5px;}
</style>

<script type="text/javascript">

function noticeclose(){	
	 jQuery('.plane-container').hide(); 
	
}

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
		        	
		        	if(status != 0){   			        		
		                jQuery(".plane-container").show();  
		            } else { 
		                jQuery(".plane-container").hide();  
		            }      	
		        	
		        	
		        	
		        }
			});
			
			</c:if>

			
			
		$( ".noticeAirplane" ).on("click" , function() {
			self.location = "/notice/listNotice?userId=${user.userId}";
			
		});
		
		//모달창 닫기 버튼 이벤트
		$(function() {
				  $('#close,#endclose').on('click', function(){
			        	
			        	$("#loginemail").val('');
			        	$("#loginpassword").val('');
				});
			});
		
	

		
		//==>"Login"  Event 연결
		$("#login").on("click" , function() {
			

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
			
			
			$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			
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
			self.location = "/user/logout";
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
		

			
//===============================회원가입===========================================
	
	//회원가입 모달창 닫기 이벤트
	$(function() {
				  $('#addclose,#addclose2').on('click', function(){
					  $("#addUserform")[0].reset();
				});
			});
		
	
	//==>"회원가입" Event 처리 및 연결
	 $(function() {
		
			
		 $( "#signUp" ).on("click" , function() {
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
	          	<img src="../resources/images/paper-plane.png" id="notice"
								width="30px" style="display:none;"/>
	          	<img src="../resources/images/profile_default.png" id="profile"

		          	width="30px"/>&nbsp;<a href="#profile" style="color: #f0ad4e;" title="타임라인으로이동">${sessionScope.user.name}</a>&nbsp;님 환영합니다!

		       
	          	</div></li>
	          	<li><a href="#">로그아웃</a></li>
          	</c:if>
          	

          
          	<c:if test="${user.userId ne null && sessionScope.user.profileImage ne null}">
	          	<li><div style="padding-top: 10px; color:#333;">
				<img src="../resources/images/paper-plane.png" id="notice"
								width="30px" style="display:none;"/>
		          		 
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
							<img src="../resources/images/profile_default.png" id="profile"
								width="30px" class="img-circle"/>&nbsp;<a href="#profile" style="color: #f0ad4e;"
								title="타임라인으로이동">${sessionScope.user.name}</a>&nbsp;님 환영합니다!


						</div></li>
					<li><a href="#">로그아웃</a></li>
				</c:if>



				<c:if test="${user.userId ne null && sessionScope.user.profileImage ne null}">
					<li><div style="padding-top: 10px; color: #333;">
							
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
		
	</div>



	</nav>


	<!-- Modal -->
	<div id="loginModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">

				<!-- Modal Header start-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" id="close">&times;</button>
					<div class="modal-title" align="center"
						style="margin-bottom: 15px;">
						<!-- 자췽로고 -->
						<img src="/resources/images/temp_logo.png" class="img-logo"
							width="50" height="50">
					</div>
				</div>
				<!-- Modal Header end -->

				<!-- Modal Body start-->
				<div class="modal-body" align="left">

					<form>
						<div class="row">
							<div class="col-xs-4">
								<label for="inputlg" style="margin-left: 5px">이메일(ID)</label>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<input type="email" class="form-control input-lg" name="email"
									placeholder="이메일을입력하세요" style="margin-left: 5px" id="loginemail" />

							</div>
						</div>

						<div class="row">
							<div class="col-xs-4">
								<label for="inputlg" style="margin-left: 5px"
									style="margin-top: 5px">패스워드(PW)</label>
							</div>
						</div>


						<div class="row">
							<div class="col-sm-6">
								<input type="password" class="form-control input-lg"
									name="password" placeholder="패스워드를입력하세요" id="loginpassword"
									style="margin-left: 5px">
							</div>
						</div>



						<div class="row social-login">
							<ul class="sns-login">
								<li><a href="#kakaoLogin" id="kakaoLogin"> <img
										src="/resources/images/KakaoTalk_lcon.png" class="img-rounded"
										width="50" height="50" type="button" id="kakaologin" /></a></li>

								<li><a href="#facebookLogin" id="facebookLogin"> <img
										src="/resources/images/facebook_Icon.png" class="img-rounded"
										width="50" height="50" type="button" id="facebooklogin"></a></li>

								<li><a href="#naverLogin" id="naverLogin"> <img
										src="/resources/images/Naver_Icon.png" class="img-rounded"
										width="50" height="50" type="button" id="naverlogin" /></a></li>

								<li><a href="#googleLogin" id="googleLogin"> <img
										src="/resources/images/Google_Icon.jpg" class="img-rounded"
										width="50" height="50" type="button" id="googlelogin" /></a></li>
							</ul>
						</div>

					<div class="row">
						<div class="col-sm-offset-4 col-sm-6 text-center">
							<button type="submit" class="btn btn-primary" id="login">로&nbsp;그 &nbsp;인</button>
							<a class="btn btn-primary btn" href="#" role="button">패스워드찾기</a>
						</div>
					</div>
					</form>
				</div>
				<!--Modal Body  -->

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="endclose">Close</button>
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


<div class="frame">
<div class="plane-container" style="display:none;">
<button type="button" class="close" onclick="noticeclose()">&times;</button>
<div class="noticeAirplane">
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
width="1131.53px" height="379.304px" viewBox="0 0 1131.53 379.304" enable-background="new 0 0 1131.53 379.304"
xml:space="preserve" class="plane">
<polygon fill="#D8D8D8" points="72.008,0 274.113,140.173 274.113,301.804 390.796,221.102 601.682,367.302 1131.53,0.223  "/>
<polygon fill="#C4C4C3" points="1131.53,0.223 274.113,140.173 274.113,301.804 390.796,221.102   "/>
</svg>
<div class="badge   badge-primary"></div>
</div>
</div>
</div>

</body>
</html>