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


<jsp:include page="../resources/layout/sub_toolbar.jsp"/>

</head>
<style>
#fixedbtn{position:fixed;
			right:50px;
			bottom:50px;
			z-index:1000}
</style>
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
						
						
						for(var i=0; i<5; i++){
							name[i] = JSONData.boxOfficeResult.dailyBoxOfficeList[i].movieNm;
							code[i] = JSONData.boxOfficeResult.dailyBoxOfficeList[i].movieCd;
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
						 
						 for(var i=0; i<5; i++){
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
							
							displayValue = displayValue + '<h1>'+(i+1)+'</h1><div class="container"><div class="card">'+
							'<div class="col-xs-2"><img src="'+img[i]+'" width="150px"/></div>'+
							' <div class="col-xs-8"> <h4><b>'+name[i]+'</b><br/></h4>장르:'+item1[i]+'<br/>주연:'+item3[i]+'<br/>개봉일:'+item2[i]+'<br/></div></div></div>';
							
						}
						 
						 
							
						$(".container").html(displayValue);
						 
					}
		});
			 
			
			
			
			
		
 
	 
});		 
 


</script>
<style>
.card {
    /* Add shadows to create the "card" effect */
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

/* Add some padding inside the card container */
.container {
    padding: 2px 16px;
}
</style>
<body>

<br/>
<br/>
<br/>
<div class="container" >

</div>


</body>
</html>

