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
						

						
						for(var i=0; i<10; i++){
							displayValue = displayValue + '<div class="container"><div class="card">'+
							' <div class="col-xs-8"><h4><b>'+(i+1)+'.'+JSONData.melon.songs.song[i].songName+'</b> - '+JSONData.melon.songs.song[i].artists.artist[0].artistName+'</h4>'+
							'</div></div></div>';

						}
						

						
						
						$(".musicChart").html(displayValue);
						 
						
						 
					}
		});
			 
});		 
 


</script>

<body>



</body>
</html>

