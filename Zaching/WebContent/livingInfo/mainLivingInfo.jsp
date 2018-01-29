<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
<script src="/resources/javascript/chatbot.js"></script>
</head>
<style>
 	 	body {
       		padding-top: 50px;
       		padding-bottom: 100px;
       		background: #f5f5f5;
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
       	
       
       	
#fixedbtn{position:fixed;
			right:50px;
			bottom:50px;
			z-index:1000}
</style>


</style>


<script type="text/javascript">



$(function() {
	
	 
	 $( ".col-xs-4:contains('전월세정보')" ).on("click" , function() {
		 self.location = "/livingInfo/getRentCharge";
		});
	 
	 $( ".col-xs-4:contains('주변편의시설')" ).on("click" , function() {
		 self.location = "/livingInfo/getAroundSearch";
		});
	 
	 $( ".col-xs-4:contains('편의점행사정보')" ).on("click" , function() {
		 self.location = "/livingInfo/getEventInfo";
		});
	 
	 $( ".col-xs-4:contains('국내여행정보')" ).on("click" , function() {
		 self.location = "/livingInfo/getTravel";
		});
	 
	 $( ".col-xs-4:contains('알리미정보')" ).on("click" , function() {
		 self.location = "/livingInfo/getNoticeInfo";
		});
	 
	 $( ".col-xs-4:contains('현재영화순위')" ).on("click" , function() {
		 self.location = "/livingInfo/getMovieInfo";
		});
	 $( ".col-xs-4:contains('베스트샐러')" ).on("click" , function() {
		 self.location = "/livingInfo/getBestBook";
		});
	 
});
</script>
<body>
<div class="container" align="center">
<div class="row" style="padding: 200px;">

      		<div class="col-xs-4 select-bob">전월세정보</div>
      		<div class="col-xs-4 select-bob">주변편의시설</div>
      		<div class="col-xs-4 select-bob">편의점행사정보</div>
      		<div class="col-xs-4 select-bob">국내여행정보</div>
      		<div class="col-xs-4 select-bob">알리미정보</div>
      		<div class="col-xs-4 select-bob">현재영화순위</div>
      		<div class="col-xs-4 select-bob">베스트샐러</div>
      		<div class="col-xs-4 select-bob">음악순위</div>
      		</div>
		</div>
	

</body>
<img src="../resources/images/chat.png" id="fixedbtn">

</html>
