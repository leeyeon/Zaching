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
       body > div.container{
        	
            margin-top: 50px;
        }
        
        body > div.row{
        	
        }
        body{
        	background-color:rgb(253, 228, 241);
        
        }
        
        
        mypage > a{
       	text-align:center;
        display: block;
 		margin-left: auto;
  		margin-right: auto;
        color: #333;
       }
       
       /* 프로필사진 업로드 */
       input.upload { 
        width: 200px;
 		height: 100px;
  		border-radius: 3px;
  		font-weight: 600;
       	 padding-top :50px; 
 		 opacity: 0;   /*input type="file" tag 투명하게 처리*/
 		 position: relative;
		}
		button.replace {    /*button tag 에 원하는 스타일 적용*/
  			position: absolute;
  			width: 200px;
  			height: 100px;
  			border-radius: 3px;
  			font-weight: 600;
  			border-color: transparent;
  			font-size: 25px;
  			background: hotpink;
  			color: #fff;
  			cursor: pointer;
		}
		
		
		
		div.row > #profile{
		
		padding-top: 20px;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$( function () {
		//내정보조회 Event && 추가 저보 입력
		$( "#getUser" ).on("click" , function() {
			self.location = "/user/getUser?userId=${user.userId}";
			
	 	});
		$( function () {
		$( "#listFriend" ).on("click" , function() {
			self.location = "/friend/listFriend?userId=${friend.userId}";
			
	 	});
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
		
		//추가정보입력 Event
		$("#listNotice").on("clcick", function() {
			self.location = "/user/listNotice?userId=${user.userId}";
		});
		
		//FOLLOW Event
		
		
		//메세지 전송 Event
		
		
		//신고하기 Event
	});

</script>


</head>


<body>
<div class="container">
	
	<div class="row">
		<div class="col-xs-3" id="profile">
		<c:if test="${user.profileImage eq null }">
		<button class="replace">파일 업로드</button> 
		<input type="file" name="profileImage" class="upload" accept=".jpg, .jpeg, .png">
       
		
		<!-- <img class="img-circle" src= "../resources/images/profile_default.png"  id="profile"
          	 width="150px" height="150px" style="margin: 20px;"/>
		 --></c:if>
		
		<c:if test="${user.profileImage ne null }">
		<input type="file" name="profileImage" imageswap="swapped" imagesrc="../resources/images/imageButton.PNG" 
		style="opacity: 0; font-size: 248px; position: relative; height: 236px; left: -4598.7px; top: -10px;">
        </c:if>
        </div>
        
        <div class="col-xs-3" id="name" style="margin-top: 100px; margin-left: 20px">
		<h3>${user.name}</h3>
        </div>
    </div>
    
     <c:if test="${user.userId eq sessionScope.user.userId}"><!-- 세션에있는 아이디랑  -->
    <div class="row mypage"  id="myPage" style="background-color: #ddd;">
    	<div class="col-xs-2">
    		<a type="button" id="memoryMap">추억지도</a>
    	</div>
    	<div class="col-xs-3">
    		<a type="button" id="point">포인트관리</a>
    	</div>
    	<div class="col-xs-2">
    		<a type="button" id="listFreind">친구목록</a>
    	</div>
    	<div class="col-xs-3">
    		<c:if test="${user.role eq '1'}">
    		<a type="button" id="getUser">추가정보입력</a></c:if>
    		<c:if test="${user.role eq '2'}">
    		<a type="button" id="getUser">내정보조회</a></c:if>
    	</div>
    	<div class="col-xs-2">
    		<a type="button" id="listNotice">알림함</a>
    	</div>
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
    
</div>


</body>
</html>