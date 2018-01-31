<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
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
		
		.social-login{
			margin-left: 10px;

		}
	</style>
	
	<script type="text/javascript">
	
$( function() {
		
		$("#email").focus();
		
		//==>"Login"  Event 연결
		$("#login").on("click" , function() {

			var email =$("input:text").val();
			var password =$("input:password").val();
			
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
	});
		$(function() {
			
			$('body > nav > div.container > div > div:nth-child(3)').addClass('active');
			
			$('.mainbar-menu').on('click', function(){
				 $('.active').removeClass('active');
				 $(this).addClass('active');
			})
			
			$( ".navbar-brand img" ).on("click" , function() {
				$(self.location).attr("href","/");
				
		 	});
			
		 	$( "a:contains('밥친구')" ).on("click" , function() {
				$(self.location).attr("href","/bob/mainBob");
				
		 	});

			$("a:contains('생활정보')").on("click", function() {
				self.location = "/livingInfo/mainLivingInfo";

			});
		
			$("a:contains('회원가입')").on("click", function() {
				self.location = "/user/addUser.jsp";

			});
			
			$('#loginModal').on('show.bs.modal', function (e) {
				  if (!data) return e.preventDefault() 
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
            <li><a data-toggle="modal" data-target="#loginModal">로그인</a></li>
            <li><a href="#">회원가입</a></li>
          </ul>
        </div><!--/.nav-collapse -->
	  </div>
		

		
    </nav>
   

	 <!-- Modal -->
  <div  id="loginModal"  class="modal fade"  >
  
  <div class="modal-dialog">
    
  <!-- Modal content-->
      <div class="modal-content">
      
      <!-- Modal Header start-->
       <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
          aria-label="Close">&times;</button>
          <div class="modal-title" align="center" style="margin-bottom:15px;"><!-- 자췽로고 -->
          <img src="/resources/images/temp_logo.png" class="img-logo" width="50" height="50" ></div> 
       </div><!-- Modal Header end -->  

       <!-- Modal Body start-->
       <div class="modal-body" align="left">
       	
       	<form>
       	<div class="form-group">
          <div class="col-xs-4">
           	<label for="inputlg" style="margin-left: 5px">이메일(ID)</label>
          </div>
        </div>
        
        
         <div class="form-group">
           <div class="col-sm-6">
   			<input type="text" class="form-control input-lg" id="email"  name="email"
				placeholder="이메일을입력하세요"	style="margin-left: 5px"/>
   			
           </div>
         </div>
         
         <div class="form-group">
           <div class="col-sm-6">
           	<label for="inputlg" style="margin-left: 5px" 
           	style="margin-top: 5px">패스워드(PW)</label>
           </div>
         </div>
       
       
         <div class="form-group">
           <div class="col-sm-6">
   			 <input type="password" class="form-control input-lg" id="password" name="password"
   				placeholder="패스워드를입력하세요"	 style="margin-left: 5px">
           </div>
		</div>
		
		
		<div class="form-group">
              <div class="social-login" align="left">
   			 	<img src="/resources/images/KakaoTalk_lcon.png" class="img-rounded" width="50" height="50" >
   			 	<img src="/resources/images/facebook_Icon.png" class="img-rounded" width="50" height="50" >
   			 	<img src="/resources/images/Naver_Icon.png"  class="img-rounded" width="50" height="50" />
   			 	<img src="/resources/images/Google_Icon.jpg" class="img-rounded" width="50" height="50" >
             </div>  
        </div>
        
        <div class="form-group">
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