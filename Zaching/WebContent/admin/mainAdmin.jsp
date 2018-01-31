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
	<jsp:include page="admintoolbar.jsp"/>
</head>]
<style>
body {
			padding-top:50px;
			padding-bottom: 50px;
			background: rgba(227,227,227,1);
		
	}

		
		#centerbar{
			padding:50px;
			padding-bottom: 50px;
		}
		
		img{

		border:5px solid white;
		width: 200px;
		height: 200px;
		border-radius: 150px;
		
		}
		
		#text > b{
		color: rgba(0,158,216,1);		
		}
		
		#clickicon{
			padding-right:10px;
		}
		
	
	.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #009ed8;
	-webkit-box-shadow:inset 0px 1px 0px 0px #009ed8;
	box-shadow:inset 0px 1px 0px 0px #009ed8;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #009ed8), color-stop(1, #009ed8));
	background:-moz-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-webkit-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-o-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-ms-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:linear-gradient(to bottom, #009ed8 5%, #009ed8 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#009ed8', endColorstr='#009ed8',GradientType=0);
	background-color:#009ed8;
	-moz-border-radius:9px;
	-webkit-border-radius:9px;
	border-radius:9px;
	border:1px solid #84bcf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	padding:6px 13px;
	text-decoration:none;
	text-shadow:0px 1px 0px #009ed8;
	}
	.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #009ed8), color-stop(1, #009ed8));
	background:-moz-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-webkit-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-o-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:-ms-linear-gradient(top, #009ed8 5%, #009ed8 100%);
	background:linear-gradient(to bottom, #009ed8 5%, #009ed8 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#009ed8', endColorstr='#009ed8',GradientType=0);
	background-color:#009ed8;
	}
	.myButton:active {
	position:relative;
	top:1px;
	}
		
</style>

<script type="text/javascript">
$(function() {
	

$("#user").on("click" , function() {
	self.location = "/admin/listUser";
	});

$("#report").on("click", function() {
	self.location = "/admin/listReport";
});

$("#point").on("click", function() {
	self.location = "/admin/listPoint";
});


});
</script>

<body>
  
  
  <div class="container">
  	<div id="centerbar"><h2><b>ZACHING MANAGEMENT LIST</b></h2></div>
  
  </div>

  <div class="container">
  
  <div id="clickicon">
   <div class="row">
            <div class="col-md-4">
     	       <img src="/resources/images/user.png"/>
  				<div id="text"><b>01. </b>회원관리</div>
  				<br/>
  				<div id="readmore">
  				<a href="#" class="myButton" id="user">READ MORE</a>
  				</div>
            </div>
            <div class="col-md-4">
            	<img src="/resources/images/City-Siren-icon.png"/>
  				<div id="text"><b>02. </b>신고관리</div>
  				<br/>
  				<div id="readmore">
  				<a href="#" class="myButton" id="report" >READ MORE</a>
           		</div>
            </div>
            <div class="col-md-4">
            	<img src="/resources/images/money.png"/>
  				<div id="text"><b>03. </b>포인트관리</div>
  				<br/>
  				<div id="readmore">
  				<a href="#" class="myButton" id="point">READ MORE</a>
  				</div>
            </div>

  	</div>
  	

  </div>
   

</body>
</html>