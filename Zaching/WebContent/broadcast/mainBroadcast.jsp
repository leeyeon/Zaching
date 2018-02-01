<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<title>라이브 방송</title>

	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
   
   		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="/css/vicons-font.css" />
		<link rel="stylesheet" type="text/css" href="/css/base.css" />
		<link rel="stylesheet" type="text/css" href="/css/buttons.css" />
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
         
   	</style>
  
 		<script type="text/javascript">
 		
	$(function() {	
		 $("#ok").on("click" , function() {
			 alert();
			 $(self.location).attr("href","/broadcast/addBroadcast");
		});
	});	
	
	$(function() {
		$("#no").on("click" , function() {
			 alert();
			 $(self.location).attr("href","/broadcast/listBroadcast");
		});
	});	
	</script> 
</head>

<body>
	
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<div class="container">
	
	<form name = "detailForm"class="form-horizontal">
		
		   <section class="content">
				<div class="box bg-2">
					<div id= "ok" class="button button--antiman button--text-thick button--text-upper button--size-s button--inverted-alt button--round-s button--border-thick"><i class="button__icon icon icon-map-marker"></i><span>방송 하기</span></div>
					<div id= "no" class="button button--antiman button--text-thick button--text-upper button--size-s button--inverted-alt button--round-s button--border-thick" ><i class="button__icon icon icon-clock"></i><span>방송 보기</span></div>
				</div>
			</section>

	
	</form>
	</div>
</body>
