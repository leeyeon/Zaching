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
	console.log("gg");	
			 $.ajax({
					url : "/livingInfo/rest/getBestBook",
					method : "GET" ,
					dataType : "json" ,
					
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						console.log("gg");
						var displayValue = '';
						
						console.log(JSONData.item[0].title);
						console.log(JSONData.item[0].cover);
						for(var i=0; i<10; i++){
							displayValue = displayValue + '<h1>'+(i+1)+'</h1><div class="container"><div class="card">'+
							'<div class="col-xs-2"><img src="'+JSONData.item[i].cover+'" width="150px"/></div>'+
							' <div class="col-xs-8"> <h4><b>'+JSONData.item[i].title+'</b><br/></h4>'+JSONData.item[i].author+
							'<br/><br/>'+JSONData.item[i].description+'<br/><br/><b>'+JSONData.item[i].categoryName+'</b><br/></div></div></div>';

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

