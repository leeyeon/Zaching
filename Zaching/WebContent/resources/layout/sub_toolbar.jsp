<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!--   jQuery , Bootstrap CDN  -->
	
  
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

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
		
		#navbar > ul> li> a {
			color:#FFFFFF;
		}
		
		.navbar-inverse .navbar-brand {
		    color: #FFFFFF;
		}
		
		.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.open>a {
		    background-image: linear-gradient(to bottom,#cccccc 0,#cccccc 100%);
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
		
		.mainbar-menu:hover, .mainbar-menu .active{
		    border-bottom: 4px solid RGB(237,125,49);
		}
		
		/* //////////////// main css */
		
		/* 모달 크기조정 */
		.social-login{
			margin-left: 20px;
		}
		
		.modal-dialog.login{
	 		width: 300px;
	  		height: 200px;
	  		margin: 0;
	  		padding: 0;
		}
		
		/* ////////////////////로그인 모달 창 style/////////////////////// */
		.modal-dialog.modal{
	 		 width: 50%;
	 		 height: 50%;
	 		 margin: 0;
	 		 padding: 0;

		}
		
		img.img-rounded{
			margin-top: 10px;
			margin-left: 10px;
			margin-right: 10px;
			margin-bottom: 10px;
		}
		
		.notice{
		 overflow: inherit;
  	overflow-y: inherit;
 	 text-align: center;
  	display: inline-block;
  	vertical-align: right;
  	 width: 300px;
  	 height: 150px;
  	 overflow-y: scroll;
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
									        	$(".badge").text(status);
									        }									
											
										});
										
									});
					           
					        }
			 
	 		
			});
			
			
			
			
		});

		$("input[name='email']").focus();

		
		//==>"Login"  Event 연결
		$("#login").on("click" , function() {
			

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
			self.location = "/broadcast/mainBroadcast";
		});
		
	 	$( "a:contains('밥친구')" ).on("click" , function() {
			$(self.location).attr("href","/bob/mainBob");			
	 	});

		$("a:contains('생활정보')").on("click", function() {
			self.location = "/livingInfo/mainLivingInfo";
		});
	
		$("a:contains('회원가입')").on("click", function() {
			self.location = "/user/addUser";
		});
		
		$("a:contains('로그아웃')").on("click", function() {
			self.location = "/user/logout";
		});
		
		$( "#profile" ).on("click" , function() {
			self.location = "/user/getTimeLine?userId=${sessionScope.user.userId}";			
	 	});
		
		$("a:contains('패스워드찾기')").on("click", function() {
			self.location = "/user/findPassword";

		});
		

		
		//이름으로 타임라인 이동
		$("#navigationbar > ul:nth-child(2) > li:nth-child(1) > div > a").on("click", function() {
			self.location = "/user/getTimeLine?userId=${sessionScope.user.userId}";


		});
		

		//카카오로그인 으로 이동
		$("#kakaologin").on("click", function() {
			var windowW = 400;  // 창의 가로 길이
		    var windowH = 500;  // 창의 세로 길이
			var left = Math.ceil((window.screen.width - windowW)/2);
		    var top = Math.ceil((window.screen.height - windowH)/2);
		    
			window.open("/kakaoLoginRequest",'popup',"l top="+top+",left="+left+", height="+windowH+", width="+windowW);
			opener.location.reload(true);
			    self.close();
	
		});

		
		//네이버 로그인
		$("#naverLogin").on("click", function() {
			var windowW = 400;  // 창의 가로 길이
		    var windowH = 500;  // 창의 세로 길이
			var left = Math.ceil((window.screen.width - windowW)/2);
		    var top = Math.ceil((window.screen.height - windowH)/2);
		    
			window.open("/naverLoginRequest",'popup',"l top="+top+",left="+left+", height="+windowH+", width="+windowW);
			opener.location.reload(true);
			    self.close();
	
		});
		
		//구글로그인
		$("#googleLogin").on("click", function() {
			var windowW = 400;  // 창의 가로 길이
		    var windowH = 500;  // 창의 세로 길이
			var left = Math.ceil((window.screen.width - windowW)/2);
		    var top = Math.ceil((window.screen.height - windowH)/2);
		    
			window.open("/googleLoginRequest",'popup',"l top="+top+",left="+left+", height="+windowH+", width="+windowW);
			opener.location.reload(true);
			    self.close();
	
		});
		
		
		//페이스북로그인
		$("#facebookLogin").on("click", function() {
			var windowW = 400;  // 창의 가로 길이
		    var windowH = 500;  // 창의 세로 길이
			var left = Math.ceil((window.screen.width - windowW)/2);
		    var top = Math.ceil((window.screen.height - windowH)/2);
		    
			window.open("/facebookLoginRequest",'popup',"l top="+top+",left="+left+", height="+windowH+", width="+windowW);
			opener.location.reload(true);
			    self.close();
	
		});

	});
		
	
		$(document).ready(function(){
			
			var userId = $("input[name='userId']").val();

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
			});
			
		
		
	
</script>

<title>zaching</title>
</head>

<body style="background-color: rgb(240, 239, 238);">

    <nav class="navbar navbar-inverse navbar-fixed-top" style="height: 105px; background-color: #FFF;  
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
	          	<img alt="뉴스피드로 이동" src="/resources/images/temp_logo.png"  height="40px" 
	          		style="margin-top: 20px;"/>
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
				<a href="#"><img src="../resources/images/paper-plane.png" id="notice"
		          	width="30px"/></a><div class="badge   badge-primary"></div>&nbsp;&nbsp;
		       	<img src="../resources/images/profile_default.png" id="profile"

		          	width="30px"/>&nbsp;<a href="#profile" style="color: #f0ad4e;" title="타임라인으로이동">${sessionScope.user.name}</a>&nbsp;님 환영합니다!

		       
	          	</div></li>
	          	<li><a href="#">로그아웃</a></li>
          	</c:if>
          	

          
          	<c:if test="${user.userId ne null && sessionScope.user.profileImage ne null}">
	          	<li><div style="padding-top: 10px; color:#333;">
	          	<a href="#"><img src="../resources/images/paper-plane.png" id="notice"
		          	width="30px"/></a><div class="badge   badge-primary"></div>&nbsp;&nbsp;
		       	<img src="../resources/upload_files/images/${sessionScope.user.profileImage}" id="profile" width="30px"/>&nbsp;
		        <a href="#profile" style="color: #f0ad4e;" title="타임라인으로이동">${sessionScope.user.name}</a>
		        &nbsp;님 환영합니다!

		       
	          	</div></li>
	          	<li><a href="#">로그아웃</a></li>
	          	 
          	</c:if>
          	 
          	 
            <c:if test="${user.userId eq null}">
            <li><a data-toggle="modal" data-target="#loginModal">로그인</a></li>
            <li><a href="#">회원가입</a></li>
          </c:if>
          </ul>
          			
        </div><!--/.nav-collapse -->
        <div class="noticelist" align="right" style="display:none;">
						
					</div>
	  </div>
		

		
    </nav>
   

	 <!-- Modal -->
  <div  id="loginModal"  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  
  <div class="modal-dialog">
    
  <!-- Modal content-->
      <div class="modal-content">
      
      <!-- Modal Header start-->
       <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <div class="modal-title" align="center" style="margin-bottom:15px;"><!-- 자췽로고 -->
          <img src="/resources/images/temp_logo.png" class="img-logo" width="50" height="50" ></div> 
       </div><!-- Modal Header end -->  

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
				placeholder="이메일을입력하세요"	style="margin-left: 5px"/>
   			
           </div>
         </div>
         
         <div class="row">
           <div class="col-sm-6">
           	<label for="inputlg" style="margin-left: 5px" 
           	style="margin-top: 5px">패스워드(PW)</label>
           </div>
         </div>
       
       
         <div class="row">
           <div class="col-sm-6">
   			 <input type="password" class="form-control input-lg" name="password"
   				placeholder="패스워드를입력하세요"	 style="margin-left: 5px">
           </div>
		</div>
		
		
		<div class="row">
              <div class="social-login" align="left">

   			 	<a href="#kakaoLogin" id="kakaoLogin">
   			 	<img src="/resources/images/KakaoTalk_lcon.png" class="img-rounded" width="50" height="50" type="button" id="kakaologin"/></a>
   			 	<a href="#facebookLogin" id="facebookLogin">
   			 	<img src="/resources/images/facebook_Icon.png" class="img-rounded" width="50" height="50"  type="button" id="facebooklogin"></a>
   			 	<a href="#naverLogin" id="naverLogin">
   			 	<img src="/resources/images/Naver_Icon.png"  class="img-rounded" width="50" height="50"  	type="button" id="naverlogin"/></a>
   			 	<a href="#googleLogin" id="googleLogin">
   			 	<img src="/resources/images/Google_Icon.jpg" class="img-rounded" width="50" height="50" 	type="button" id="googlelogin"/></a>

             </div>  
        </div>
        
        <div class="row">
			  <div class="col-sm-offset-4 col-sm-6 text-center">
		      <button type="submit" class="btn btn-primary" id="login" >로 &nbsp;그 &nbsp;인</button>
			  <a class="btn btn-primary btn" href="#" role="button">패스워드찾기</a>
			  </div>
		</div>
		</form>
      </div><!--Modal Body  -->
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      
     </div><!-- Modal content-->
    </div> <!-- Modal dialog -->  
   </div> <!-- Modal Fade  --> 	


</body>
</html>