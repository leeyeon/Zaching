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
	<jsp:include page="sub_toolbar.jsp"/>
	
	<script type="text/javascript">
		$(function() {
			
			$('.collapse .navbar-collapse').css('visibility','hidden');
			
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
			  
		    $(".mainbar-menu:contains('밥친구')").on("click" , function() {
				$(self.location).attr("href","/bob/listBob");
				
		 	});

			$(".mainbar-menu:contains('생활정보')").on("click", function() {
				$(self.location).attr("href","/livingInfo/mainLivingInfo");

			});
			
			$(".mainbar-menu:contains('라이브방송')").on("click", function() {
				$(self.location).attr("href","http://192.168.0.31:9001");

			});


		});
	
	</script>

<title>zaching</title>
</head>
<body>
       
       <div class="container">
       		<div class="mainbar">
		      <div class="mainbar-menu" align="center">
			  	밥친구
			  </div>
			  <div class="mainbar-menu" align="center">
			  	라이브방송
			  </div>
			  <div class="mainbar-menu active" style="padding-top:30px;">
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