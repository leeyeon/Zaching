<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<jsp:include page="sub_toolbar.jsp"/>

	<style>
	
		/* sub toolbar 처음에 시작할 때 hidden */
		
		/*
		.navbar-brand {
			visibility: hidden;
		}
		
		#navbar > ul:nth-child(1) {
			visibility: hidden;
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
		
		.mainbar {
			margin-top:40px;
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
		*/
	
		
	</style>
	
	<script type="text/javascript">
	
		$(function() {
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

			/*
			$(window).resize(function(){
			     if($( window ).width() > 1200) {
			    	 $('.mainbar').show();
			    	 $('.navbar-brand').css('visibility','hidden');
			    	 $('#navbar > ul:nth-child(1)').css('visibility','hidden');
			     } else {
			    	 $('.mainbar').hide();
			    	 $('.navbar-brand').css('visibility','visible');
			    	 $('#navbar > ul:nth-child(1)').css('visibility','visible');
			     }
			}).resize();
			
			var loadFlag = 0;
			
			  $(document).ready(function(){
				$(function () {
					$(window).scroll(function () {
						
			            if($( window ).width() >= 768) {
							if ($(this).scrollTop() > 0) {
								$('.mainbar').slideUp();
								$('.navbar-brand').css('visibility','visible');
								$('#navbar > ul:nth-child(1)').css('visibility','visible');
							} else {
								$('.mainbar').slideDown();
								 $('.navbar-brand').css('visibility','hidden');
								$('#navbar > ul:nth-child(1)').css('visibility','hidden');
							}
			            }
					});
	
				});
	
			});
			  */
			  
		    $(".mainbar-menu:contains('밥친구')").on("click" , function() {
				$(self.location).attr("href","/bob/mainBob");
		 	});

			$(".mainbar-menu:contains('생활정보')").on("click", function() {
				$(self.location).attr("href","/livingInfo/mainLivingInfo");
			});
			
			$(".mainbar-menu:contains('라이브방송')").on("click", function() {
				$(self.location).attr("href","/broadcast/listBroadcast");
			});
			
			$(".mainbar-menu img").on("click", function() {
				$(self.location).attr("href","/");
			});
			
			$('#loginModal').on('show.bs.modal', function (e) {
				if (!data) return e.preventDefault();
			});

		});
		
		
	
	</script>

<title>zaching</title>
</head>
<body>
      <!-- 
       <div class="container" style="margin-top:50px;">
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
 --> 
		
</body>
</html>