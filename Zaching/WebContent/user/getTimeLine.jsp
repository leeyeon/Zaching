<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/resources/layout/sub_toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
        
        
        div.row{
      	    padding-top: 10px;
    		padding-left: 10px;
    		padding-right: 10px;
    		padding-bottom: 10px;
        } 
        
        div.body{
        	
        	padding-top: 150px;
        	height: 100%;
        }
        
        
        .btn-group > a {
    		border-top: 2px solid #fff;
    		margin-right : 5px;
    		color: black; /* White text */
    		padding: 10px 24px; /* Some padding */
    		cursor: pointer; /* Pointer/hand icon */
    		width: 200px;
			height: 40px;
		}
		
		#myPage.btn-group{
			margin-left: 10px;
			margin-top: 10px;
			margin-bottom: 5px;
			margin-top: 5px;
						}
		#myPage.btn-group>a:hover, #myPage.btn-group>a.active{
		    border-top: 2px solid  #333;
		}
 
		
       form.op-form, div.row.body{
       
        	padding-top: 10px;
    		padding-left: 10px;
   		 	padding-right: 10px;
    		padding-bottom: 20px;
    		margin-left: 10px;
    		margin-right: 10px;
       }
       
       form.op-form{ margin-top:  160px;}
       
       
       /* 프로필사진 업로드 */
     	#profile > div > label{
     
     	    position: relative;
    		display: block;
    		margin-top: 15px;
   			margin-left: auto;
    		margin-right: auto;
    		width: 140px;
    		height: 25px;
    		cursor: pointer;
    		text-align: center;
     
     	}
     	
     	/* 파일업로드 버튼 투명하게함 */
     	#profile > div > label > input{
     		opacity: 1;       /*input type="file" tag 투명하게 처리*/
  			position: relative;
  			width: 140px;
    		height: 25px;
     		
     	}
     	
		
		.container{
			padding-right: 30px;
    		padding-left: 30px;
    		margin-right: auto;
    		margin-left: auto;
		}
		
		
		
		.bg {
			background: #f2b1d2;/*페이지 배경 컬러  */
			position: fixed;
			width: 100%;
			height: 100%;
			background-size: cover;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.3;
		}
		
		.profile-upload{
			height: 150px;
    		left: 1;
    		position: absolute;
    		top: 0px;
    		width: 150px;
    		opacity: 0;
    		}
    		
    		
	
		

    </style>
   
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$( function () {
		//내정보조회 Event && 추가 저보 입력
		$( "#getUser" ).on("click" , function() {
			self.location = "/user/getUser?userId=${user.userId}";
			
	 	});
	
	
		
		//추억지도 Event
		$( "#memoryMap" ).on("click" , function() {
			self.location = "/user/memoryMap?userId=${user.userId}";
			
	 	});
		
		//포인트관리 Event
		$( "#point" ).on("click" , function() {
			self.location = "/payment/mainPayment";
			
	 	});
		
		//친구목록 Event
		$( "#listFreind" ).on("click" , function() {
			self.location = "/friend/listFriend?";
			
	 	});
		
		//알림함 Event
		$("#listNotice").on("clcick", function() {
			self.location = "/user/listNotice?userId=${user.userId}";
		});
		
		
		//메세지함
		$("#listMessage").on("click", function() {
			self.location ="/message/listMessage";	
		})
		
		
		//프로필사진 변경
		$(".profile-upload").on("click", function() {
			self.location="";
		})
		
		
		//FOLLOW Event
		
		
		//메세지 전송 Event
		
		
		//신고하기 Event
	});
	
	


</script>


</head>


<body>
<div class="container">
<div class="bg"></div>
	<form class="op-form" action="/settings/profile" method="POST" enctype="multipart/form-data">
	
	<div class="row header" align="center">
		<div class="col-xs-4" id="profile" align="left">
		<c:if test="${user.profileImage eq null }">
	
		<div class="profileImage" align="center">
         <button class="profile-upload">뀨?</button>
        	<img  class="img-circle" src="../resources/images/profile_default.png" 
        	 style="width: 150px; height: 150px;"/>
         <input class="upload_input_hidden" type="file" name="profileImage"> 
      	</div>
      
       </c:if>
		
		<c:if test="${user.profileImage ne null }">
		<div class="profileImage" align="center">
        <button class="profile-upload">뀨?</button>
       <img  class="img-circle" alt="프로필사진변경"  style="width: 150px; height: 150px;"
       src="../resources/images/upload_files/images/${sessionScope.user.profileImage}"/>
       <input class="upload_input_hidden" type="file" name="profileImage"> 
    	</div>
       </c:if>
       
       
       </div>
        
        <div class="col-xs-3" id="name" style=" margin-left: 20px">
		<h3>${user.name}</h3>
		
        </div>
     
      
      <div class="col-xs-4 message" align="right">
      <a><img  id="listMessage" src="../resources/images/Message_Icon.png" 
        	width="50px" height="50px"/>
      </a></div>
    
    </div>
    
    </form>
     <c:if test="${user.userId eq sessionScope.user.userId}"><!-- 세션에있는 아이디랑  -->
    <div class="btn-group"  id="myPage">
    	<a class="btn col-xs-2" id="memoryMap">추억지도</a>
    	<a class="btn col-xs-2" id="point">포인트관리</a>
    	<a class="btn col-xs-2" id="listFreind">친구목록</a>
    	<c:if test="${sessionScope.user.role eq '1'}">
    	<a class="btn col-xs-2" id="getUser">추가정보입력</a></c:if>
    	<c:if test="${sessionScope.user.role eq '2'}">
    	<a class="btn col-xs-2" id="getUser">내정보조회</a></c:if>
    	<a class="btn col-xs-2" id="listNotice">알림함</a>
	  </div>
  </c:if>
  
  <c:if test="${user.userId ne sessionScope.user.userId}">
  <div class="row" id="friendPage">
    	<div class="col-xs-3">
    		<a type="button" >친구신청</a>
    	</div>
    	<div class="col-xs-3">
    		<a type="button" >FOLLOW</a>
    	</div>
    	<div class="col-xs-3">
    		<a type="button" >메세지전송</a>
    	</div>
    	<div class="col-xs-3">
    		<a type="button" >신고하기</a>
    	</div>
  </div>
  </c:if>
   
    <div class="row body" align="center">
    		<h1>여기는 뉴스피드 게시물</h1>
    </div>
</div>


</body>
</html>