<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<title>밥친구(우리지금만나)</title>
	
	<style>
        
       	body {
       		padding-top: 50px;
       		padding-bottom: 50px;
       		background: #f5f5f5;
       	}
       	
       	.bg {
			background: url('../resources/upload_files/images/download.jpg') no-repeat center center;
			position: fixed;
			width: 100%;
			height: 500px;
			background-size: cover;
			top:0;
			left:0;
			z-index: -1;
		}
		
		.jumbotron {
		    margin-bottom: 0px;
		    margin-top: -2px;
		    height: 500px;
		    background: transparent;
		}
		
		.jumbotron .textStyle {
			color: white;
		    text-shadow: black 0.3em 0.3em 0.3em;
		    backgroud-color: #000000;
		    padding: 10px;
		}
		
		.overlay {
			left: 0;
			top: 0;
			height: 65px;
			background-color: rgba(0,0,0, 0.6);
			overflow-x: hidden;
		}
		
		.blog-sidebar .textBold, .textBold {
			font-weight: bold;
			font-size: 20px;
		}
		
		body > div.container > div > div.col-sm-3.col-sm-offset-1.blog-sidebar, .custumRow {
			-webkit-box-shadow: 0px 0px 6px 4px rgba(237,237,237,1);
			-moz-box-shadow: 0px 0px 6px 4px rgba(237,237,237,1);
			box-shadow: 0px 0px 6px 4px rgba(237,237,237,1);
			background: #FFFFFF;
			padding:10px;
		}
		
       	.btn-bob {
       		background: #5F4B8B; 
       		border: none; 
       		display: inline-block;
       		color: rgb(255, 255, 255); 
       		font-size: 18px; 
       		font-weight: bold;
       		text-align: center;
       		height: 70px;
			line-height: 70px;
       		width: 100%;
       		text-decoration: none;
       	}
       	
       	.select-bob {
       		background: rgba(237,237,237,1); 
       		border: none; 
       		display: inline-block;
       		color: #000000;
       		font-size: 18px; 
       		font-weight: bold;
       		text-align: center;
       		height: 70px;
			line-height: 70px;
       		text-decoration: none;
       		border: 2px solid #FFFFFF;
       		cursor: pointer;
       	}
       	
        .select-bob:hover, .select-bob.active{
		    background: #5F4B8B;
		    color: #FFFFFF;
		}
       	
       	.col-sm-3.col-sm-offset-1.blog-sidebar img {
       		cursor: pointer;
       	}
       	
       	.row .col-xs-1 {
       		border: 1px solid #FFFFFF;
			border-radius: 40px;
			-moz-border-radius: 40px;
			-khtml-border-radius: 40px;
			-webkit-border-radius: 40px;
			 background: #FFFFFF;
			 width: 70px;
			 height: 70px;
			 line-height: 70px;
			 font-size: 17px;
			 font-weight: bold;
			 float:right;
			 margin-right: 10px;
			 cursor: pointer;
       	}
       	
       	
       	
    </style>
    
    <script type="text/javascript">
    
  		$(function() {
  			
  		    var jumboHeight = $('.jumbotron').outerHeight();
  		    function parallax(){
  		        var scrolled = $(window).scrollTop();
  		        $('.bg').css('height', (jumboHeight-scrolled) + 'px');
  		    }
  		
  		    $(window).scroll(function(e){
  		        parallax();
  		    });
  		    
  		  $('.select-bob').on('click', function(){
				 $('.active').removeClass('active');
				 $(this).addClass('active');
			})

  		});

    </script>
    
</head>
<body>

	<div class="bg"></div>

	<div class="container" style="font-size: 17px;">
   
 
      <div class="row custumRow" style="margin-top:20px; padding-top: 30px;">
	    <div class="text-center textBold" style="font-size: 35px;">회비 장부</div>
      	<hr>
      	
      	<div class="row" style="padding: 10px;">
      		<div class="col-xs-4 select-bob">두달전두달전두달전두달전</div>
      		<div class="col-xs-4 select-bob">저번달두달전두달전두달전</div>
      		<div class="col-xs-4 select-bob active">이번달두달전두달전두달전</div>
      		<div class="col-xs-4 select-bob active">이번달두달전두달전두달전</div>
      		<div class="col-xs-4 select-bob active">이번달두달전두달전두달전</div>
      		<div class="col-xs-4 select-bob active">이번달두달전두달전두달전</div>
      	</div>
      </div>
      
      <!-- /회비 div 끝 -->

    </div><!-- /.container -->

</body>
</html>