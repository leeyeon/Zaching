<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">


</head>

<script>
$(function() {
	
	
	var name = new Array();
	var img = new Array();
	var code = new Array();
	var item1 = new Array();
	var item2 = new Array();
	var item3 = new Array();

	
			 $.ajax( 
				{
					url : "/livingInfo/rest/movieInfo",
					method : "GET" ,
					dataType : "json" ,
					
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
									
						var displayValue = '';		
						
						console.log(JSONData);
						
						for(var i=0; i<10; i++){
							name[i] = JSONData.boxOfficeResult.dailyBoxOfficeList[i].movieNm;
							code[i] = JSONData.boxOfficeResult.dailyBoxOfficeList[i].movieCd;
						}
						
						 for(var i=0; i<10; i++){
						
							 $.ajax( 
										{
											url : "/livingInfo/rest/movieImg/"+name[i],
											method : "GET" ,
											dataType : "json" ,
											async: false,											
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},success : function(moviecode , status) {
												img[i] = moviecode.items[0].link;
												
												}
											});	
						 }
						 
						 for(var i=0; i<10; i++){
							 $.ajax( 
										{

											url : "/livingInfo/rest/movieInfo/"+code[i],
											method : "GET" ,
											dataType : "json" ,
											async: false,											
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},success : function(moviecode , status) {
												console.log(moviecode);
												item1[i] = moviecode.movieInfoResult.movieInfo.genres[0].genreNm;
												item2[i] = moviecode.movieInfoResult.movieInfo.openDt;
												item3[i] = moviecode.movieInfoResult.movieInfo.actors[0].peopleNm+","+moviecode.movieInfoResult.movieInfo.actors[1].peopleNm+","+moviecode.movieInfoResult.movieInfo.actors[2].peopleNm;
		
												}
											});	
						 }
						 
						
						 for(var i=0; i<5; i++){
							 $.ajax( 
										{
											url : "/livingInfo/rest/movieImg/"+name[i],
											method : "GET" ,
											dataType : "json" ,
											async: false,											
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},success : function(moviecode , status) {
												img[i] = moviecode.items[0].link;
												}
											});	
						 }
						 
							var active = '';
						
						
						for(var i=0; i<10; i++){
							
							if(i == 0 ){
								active = '<div class="item active">';
							}
							else{
								active = '<div class="item">';
							}
							
							
							displayValue = displayValue + active + '<h1>'+(i+1)+'</h1><div class="container"><div class="card">'+
							'<div class="col-xs-2"><img src="'+img[i]+'" width="150px"/></div>'+
							' <div class="col-xs-8"> <h4><b>'+name[i]+'</b><br/></h4>장르:'+item1[i]+'<br/>주연:'+item3[i]+'<br/>개봉일:'+item2[i]+'<br/></div></div></div></div>';
							
						}
						
						$("#moviechart").html(displayValue);
						 
					}

		});
			 
	 
});		 
 

</script>
<body>

<div class="container">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" id="moviechart" >
 		
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
    
  </div>
</div>


</body>
</html>

