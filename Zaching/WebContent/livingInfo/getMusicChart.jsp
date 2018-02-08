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



</head>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);		
		
		* {
			font-family: 'Nanum Gothic', serif;
		}
.mc{

	color: #404372;
	font-weight: 400;
	font-size: 28px;
	font-family: 'Raleway', Arial, sans-serif;
	font-style: italic;
	
}

.mc2{
	font-weight: 400;
	font-size: 18px;
	font-style: italic;
}

.card {
    /* Add shadows to create the "card" effect */
    padding-top: 5px;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    height: 40px;
    background: #fff;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
</style>
<script>
$(function() {
	
			 $.ajax({
					url : "/livingInfo/rest/getMusicChart",
					method : "GET" ,
					dataType : "json" ,
					
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						var displayValue = '';
						
						var mc = '';
						

						
						for(var i=0; i<10; i++){
							
							if(i < 3){
								mc = '<div class="mc">'+(i+1)+'</div>';
							}else{
								mc = '<div class="mc2">'+(i+1)+'</div>';
							}
							displayValue = displayValue + '<div class="container"><div class="card">'+
							'<div class="col-xs-1"><img src="/resources/images/play-button.png" height="30px" width="30px"/></div>'+
							'<div class="col-xs-10"><h4><b>'+JSONData.melon.songs.song[i].songName+'</b> - '+JSONData.melon.songs.song[i].artists.artist[0].artistName+'</h4>'+
							'</div>'+mc+'</div></div>';

						}
						

						
						
						$(".musicChart").html(displayValue);
						 
						
						 
					}
		});
			 
});		 
 


</script>

<body>


</body>
</html>

