<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
</head>
<style>

.navbar-fixed-top {
		    background: #ffffff;
		    border-color: #ffffff;
		}
		
		#navbar > ul> li> a {
			color:#FFFFFF;
			padding-left: 50px;
			align: center;
		}
		
		.navbar-inverse .navbar-brand {
		    color: #FFFFFF;
		}
		
		.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.open>a {
		    background-image: linear-gradient(to bottom,#cccccc 0,#cccccc 100%);
		}
		
		.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
		    background: #000000;
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
		
		.centerbar{
			padding:100px;
		}
</style>
<script type="text/javascript">
$(function() {
	

$("a:contains('회원관리')").on("click" , function() {
	self.location = "/admin/listUser";
	});

$("a:contains('신고관리')").on("click", function() {
	self.location = "/admin/listReport";
});

$("a:contains('포인트관리')").on("click", function() {
	self.location = "/admin/listPoint";
});

$("a:contains('HOME')").on("click", function() {
	self.location = "/admin/mainAdmin";
});

});
</script>
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid" style="background: #000000; height:50px;">
      
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        
        <div id="navbar" class="collapse navbar-collapse" >
          <ul class="nav navbar-nav">
          	<li><a href="#">HOME</a></li>
            <li><a href="#">회원관리</a></li>
            <li><a href="#">신고관리</a></li>
            <li><a href="#">포인트관리</a></li>
          </ul>
          <ul class="nav navbar-nav" style="float:right;">
            <li><a data-toggle="modal" data-target="#loginModal">로그아웃</a></li>
          </ul>
        </div><!--/.nav-collapse -->
        
	  </div>
  </nav>
  
  
</body>
</html>