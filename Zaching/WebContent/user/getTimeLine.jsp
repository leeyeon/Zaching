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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$( function () {
		$( "#getUser" ).on("click" , function() {
			self.location = "/user/getUser?userId=${user.userId}";
			
	 	});
		$( function () {
		$( "#listFriend" ).on("click" , function() {
			self.location = "/friend/listFriend?userId=${friend.userId}";
			
	 	});
	});
	});

</script>


</head>


<body>
<div class="container">
	
	<div class="row">
		<div class="col-xs-3" id="profile">
		<img  src="/resources/images/profile_default.png" id="profile"
          	 width="150px" style="margin: 20px;"/>
        </div>
        <div class="col-xs-3" id="name" style="margin-top: 100px; margin-left: 20px">
		<h3>${user.name}</h3>
        </div>
    </div>
    
     <c:if test="${user.userId ne null }"><!-- 세션에있는 아이디랑  -->
    <div class="row" >
    	<div class="col-xs-2">
    		<button type="button" id="memoryMap">추억지도</button>
    	</div>
    	<div class="col-xs-2">
    		<button type="button" id="point">포인트관리</button>
    	</div>
    	<div class="col-xs-2">
    		<button type="button" id="listFriend">친구목록</button>
    	</div>
    	<div class="col-xs-3">
    		<c:if test="${user.role eq '1'}">
    		<button type="button" id="getUser">추가정보입력</button></c:if>
    		<c:if test="${user.role eq '2'}">
    		<button type="button" id="getUser">내정보조회</button></c:if>
    	</div>
    	<div class="col-xs-2">
    		<button type="button" id="listNotice">알림함</button>
    	</div>
  </div>
  </c:if>
  
  <c:if test="${user.userId eq null }">
  <div class="row" >
    	<div class="col-xs-3">
    		<button type="button" >친구신청</button>
    	</div>
    	<div class="col-xs-3">
    		<button type="button" >FOLLOW</button>
    	</div>
    	<div class="col-xs-3">
    		<button type="button" >메세지전송</button>
    	</div>
    	<div class="col-xs-3">
    		<button type="button" >신고하기</button>
    	</div>
  </div>
  </c:if>
    
</div>


</body>
</html>