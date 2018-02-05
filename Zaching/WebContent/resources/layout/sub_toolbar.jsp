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
	
	  <!-- CSS -->
	  <%-- 
	  <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
	  <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	  <link href="../css/nivo-lightbox.css" rel="stylesheet" />
	  <link href="../css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	  <link href="../css/owl.carousel.css" rel="stylesheet" media="screen" />
	  <link href="../css/owl.theme.css" rel="stylesheet" media="screen" />
	  <link href="../css/animate.css" rel="stylesheet" />
	  <link href="../css/style.css" rel="stylesheet">
	  <link href="../color/default.css" rel="stylesheet">
	  --%>

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
		
		#navbar > ul> li> a {
			color:#FFFFFF;
		}
		
		.navbar-inverse .navbar-brand {
		    color: #FFFFFF;
		}
		
		.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.open>a {
		    background-image: linear-gradient(to bottom,#cccccc 0,#cccccc 100%);
		}
		
		.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
		    background: #5F4B8B;
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
	
			if ($('.noticelist').attr('hide') == "true") {
		    	$('.noticelist').slideUp(function() {
		    		$(this).attr('hide', false);
		   	 	});
		    } else {
		    	$('.noticelist').slideDown(function() {
		    		$(this).attr('hide', true);
		   	 	});
		    }

			
			console.log($("input[name='userId']").val());
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
					        	
					        	
					        	var displayValue = '';
									
								var tr = '';
								
								var category = '';
					        	
					        	for(var i=0; i<serverData.list.length; i++){
					        		
					        		if(serverData.list[i].category == 'V'){
					        			category = '보이스리플에 게시글을 올렸습니다.';
					        		}
					        		else if(serverData.list[i].category == 'B'){
					        			category = '밥친구에 초대하였습니다.';
					        		}
		
					        		tr = tr + '<tr><td class="th" align="left">'+serverData.list[i].name+'님이 '+ category+'</td></tr>'
					        	
					        	}
					        	
									
									displayValue = '<div class="notice"><table class="table table-hover">'+ tr + '</table></div>';
									
					        	
									$(".noticelist").html(displayValue);
					           
					        }
			 
	 		
			});
			
			
		});
		
		//==>"Login"  Event 연결
		$("#login").on("click" , function() {
			
			$("#email").focus();

			var email =$("#email").val();
			var password =$("#password").val();
			
			if(email == null || email.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("input:text").focus();
				return;
			}
			
			if(password == null || password.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("input:password").focus();
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
		
		$("#kakaologin").on("click", function() {
			self.location =
		"https://kauth.kakao.com/oauth/authorize?client_id=dfe2041581c23da0c4e9c8aefb3c28a1&redirect_uri=http://127.0.0.1:8080/kakaologin&response_type=code";

		});
		
		
		
		

	});
	
</script>

<title>zaching</title>
</head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid" style="background: #5F4B8B; height:50px;">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">
          	<img alt="뉴스피드로 이동" src="/resources/images/temp_logo.png"  height="40px" 
          		style="margin-top: -10px;"/>
          </a>
        </div>
        <div id="navbar" class="collapse navbar-collapse" >
          <ul class="nav navbar-nav">
            <li><a href="#">밥친구</a></li>
            <li><a href="#">라이브방송</a></li>
            <li><a href="#">보이스리플</a></li>
            <li><a href="#">생활정보</a></li>
          </ul>
          <ul class="nav navbar-nav" style="float:right;">
          	<c:if test="${user.userId ne null && user.profileImage eq null}">
	          	<li><div style="padding-top: 10px; color:#FFF;">
	          	<a href="#"><img src="../resources/images/paper-plane.png" id="notice"
		          	width="30px"/></a>&nbsp;&nbsp;
		       	<img src="../resources/images/profile_default.png" id="profile"
		          	width="30px"/>&nbsp;<input type="hidden" name="userId" value="${user.userId}"><u>${sessionScope.user.name}</u>&nbsp;님 환영합니다!
		       
	          	</div></li>
	          	<li><a href="#">로그아웃</a></li>
          	</c:if>
          	
          	<c:if test="${user.userId ne null && user.profileImage ne null}">
	          	<li><div style="padding-top: 10px; color:#FFF;">
	          	<a href="#"><img src="../resources/images/paper-plane.png" id="notice"
		          	width="30px"/></a>
		       	<img src="../resources/upload_files/images/${user.profileImage} id="profile"
		          	width="30px"/>&nbsp;<u>${sessionScope.user.name}</u>&nbsp;님 환영합니다!
		       
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
   			<input type="text" class="form-control input-lg" id="email"  name="email"
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
   			 <input type="password" class="form-control input-lg" id="password" name="password"
   				placeholder="패스워드를입력하세요"	 style="margin-left: 5px">
           </div>
		</div>
		
		
		<div class="row">
              <div class="social-login" align="left">
   			 	<img src="/resources/images/KakaoTalk_lcon.png" class="img-rounded" width="50" height="50" type="button" id="kakaologin">
   			 	<img src="/resources/images/facebook_Icon.png" class="img-rounded" width="50" height="50" >
   			 	<img src="/resources/images/Naver_Icon.png"  class="img-rounded" width="50" height="50" />
   			 	<img src="/resources/images/Google_Icon.jpg" class="img-rounded" width="50" height="50" >
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