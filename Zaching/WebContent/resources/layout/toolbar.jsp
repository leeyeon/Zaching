<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		
		.mainbar-menu:hover, .mainbar-menu.active{
		    border-bottom: 4px solid RGB(237,125,49);
		}
	/* ////////////////////로그인 모달 창 style/////////////////////// */
		.modal-dialog.modal{
 		 width: 50%;
 		 height: 50%;
 		 margin: 0;
 		 padding: 0;

		}
		img.img-logo{

		margin-left: 250px;

		}

		img.img-rounded{
		margin-top: 10px;
		margin-left: 10px;
		margin-right: 10px;
		margin-bottom: 10px;

		}
		
	</style>
	
	<script type="text/javascript">
	
	
	
		$(function() {
			
			$(".mainbar-menu").on("click", function() {
				self.location = "/livingInfo/mainLivingInfo.jsp";
			});
			
			$("#login").on("click", function() {
				self.location = "/user/login.jsp";
			});
			
			$("#join").on("click", function() {
				self.location = "/user/addUser.jsp";
			});
			
			$("#logo").on("click", function() {
				self.location = "/index.jsp";
			});
			
			$('.collapse .navbar-collapse').css('visibility','hidden');
			
			$('body > nav > div.container > div > div:nth-child(3)').addClass('active');
			
			$('.mainbar-menu').on('click', function(){
				 $('.active').removeClass('active');
				 $(this).addClass('active');
			})
			
			/*
			var filter = "win16|win32|win64|mac|macintel"; 
			
			if ( navigator.platform ) { 
				if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) { 
					//mobile
					alert('mobile 접속'); 
				} else { 
					//pc 
					alert('pc 접속');
				}
			}
			*/

			$(window).resize(function(){
			     if($( window ).width() > 1200) {
			    	 $('.mainbar').show();
			    	 $('.navbar-brand').css('visibility','hidden');
			    	 $('.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form')
						.css('visibility','hidden');
			     } else {
			    	 $('.mainbar').hide();
			    	 $('.navbar-brand').css('visibility','visible');
			    	 $('.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form')
						.css('visibility','visible');
			     }
			}).resize();
	
			  $(document).ready(function(){
				$(function () {
					$(window).scroll(function () {
			            // set distance user needs to scroll before we fadeIn navbar
			            if($( window ).width() >= 768) {
							if ($(this).scrollTop() > 200) {
								$('.mainbar').slideUp();
								$('.navbar-brand').css('visibility','visible');
								$('.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form')
									.css('visibility','visible');
							} else {
								$('.mainbar').slideDown();
								 $('.navbar-brand').css('visibility','hidden');
								$('.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form')
								.css('visibility','hidden');
							}
			            }
					});
	
				});
	
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
          <a class="navbar-brand" href="#" style="visibility: hidden;">
          	<img alt="뉴스피드로 이동" src="/resources/images/temp_logo.png"  height="40px" 
          		style="margin-top: -10px;" id="logo"/>
          </a>
        </div>
        <div id="navbar" class="collapse navbar-collapse" style="visibility: hidden;">
          <ul class="nav navbar-nav">
            <li><a href="#">밥친구</a></li>
            <li><a href="#">라이브방송</a></li>
            <li><a href="#">보이스리플</a></li>
            <li><a href="#">생활정보</a></li>
            
          </ul>
          <ul class="nav navbar-nav" style="float:right;">
            <li><a href="#" id="login">로그인</a></li>
            <li><a href="#" id="join">회원가입</a></li>
          </ul>
        </div><!--/.nav-collapse -->
	  </div>
       
       <div class="container">
       		<div class="mainbar">
		      <div class="mainbar-menu" align="center">
			  	밥친구
			  </div>
			  <div class="mainbar-menu" align="center">
			  	라이브방송
			  </div>
			  <div class="mainbar-menu" style="padding-top:30px;">
			  	<img alt="뉴스피드로 이동" src="/resources/images/temp_logo.png"  height="80px"/>
			  </div>
			  <div class="mainbar-menu" align="center">
			  	보이스리플
			  </div>
			  <div class="mainbar-menu" align="center">
			  	생활정보
			  </div>
		  </div>
		  

     	</div>
     	
  
  

 

     	
    </nav>

</body>
</html>