<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 <meta charset="utf-8">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
  
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
   <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
   </head>
   
       <style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);		
		
		* {
			font-family: 'Nanum Gothic', serif;
		}

.containerr {
  margin: 0 auto;
  width: 250px;
  height: 200px;
  position: relative;
  perspective: 1000px;
}

.carouselMovie {
  height: 100%;
  width: 100%;
  position: absolute;
  transform-style: preserve-3d;
  transition: transform 1s;

  
}

.itemMovie {
  display: block;
  position: absolute;
  width: 250px;
  height: 200px;
  line-height: 80px;
  font-size: 20px;
  text-align: center;
  color: #00000;
  
 
}

.a {
  transform: rotateY(0deg) translateZ(250px);
}
.b {
  transform: rotateY(60deg) translateZ(250px);
}
.c {
  transform: rotateY(120deg) translateZ(250px);
}
.d {
  transform: rotateY(180deg) translateZ(250px);
}
.e {
  transform: rotateY(240deg) translateZ(250px);
} 
.f {
  transform: rotateY(300deg) translateZ(250px);
}


    </style>
 

</head>
<script>
$(function() {
	
	
	var name = new Array();
	var img = new Array();
	var code = new Array();
	var item1 = new Array();
	var item2 = new Array();
	var item3 = new Array();
	var itemNum = new Array();
	itemNum[0] = 'a';
	itemNum[1] = 'b';
	itemNum[2] = 'c';
	itemNum[3] = 'd';
	itemNum[4] = 'e';
	itemNum[5] = 'f';
	

	
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
						
						for(var i=0; i<6; i++){
							name[i] = JSONData.boxOfficeResult.dailyBoxOfficeList[i].movieNm;
							code[i] = JSONData.boxOfficeResult.dailyBoxOfficeList[i].movieCd;
						}
						
						 for(var i=0; i<6; i++){
						
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
						 
						 for(var i=0; i<6; i++){
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
						 
						
						 for(var i=0; i<6; i++){
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
						
						
						for(var i=0; i<6; i++){
											
							displayValue = displayValue + '<div class="itemMovie '+itemNum[i]+' " ><h1>'+(i+1)+'</h1><div class="containerr">'+
							'<img src="'+img[i]+'" width="150px"/>'+
							' <h4><b>'+name[i]+'</b><br/></h4>장르:'+item1[i]+'<br/>주연:'+item3[i]+'<br/>개봉일:'+item2[i]+'<br/></div></div>';
							
						}
						console.log(displayValue);
						$(".carouselMovie").html(displayValue);
						 
					}

		});
			 
	 
});		
</script>

<body>

<script  src="/resources/js/index.js"></script>
</body>

</html>
