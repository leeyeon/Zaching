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
        
        div.row{
      	    padding-top: 10px;
    		padding-left: 10px;
    		padding-right: 10px;
    		padding-bottom: 20px;
        }
        
        body{
        	background-color:rgb(253, 228, 241);
        	padding-top: 130px;
        }
        
        
        .btn-group a {
    		background-color: rgb(253, 228, 241); /* Green background */
    		border: 1px solid #800067; /* Green border */
    		border-radius: 10px;
    		color: black; /* White text */
    		padding: 10px 24px; /* Some padding */
    		cursor: pointer; /* Pointer/hand icon */
    		float: center; /* Float the buttons side by side */
		}
		
       		.btn-group:after {
    			content: "";
    			clear: both;
    			display: table;
    			
			}
			
			.bnt-group{
			
				float: right;
			}
			
		
       form.op-form{
        	padding-top: 10px;
    		padding-left: 10px;
    		padding-right: 10px;
    		padding-bottom: 20px;
       		border: 2px solid #333;
       		border: 1px solid green;
       }
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
     	
     	#profile > div > label > input{
     		opacity: 0;       /*input type="file" tag 투명하게 처리*/
  			position: relative;
  			background-color: #333;
  			width: 140px;
    		height: 25px;
     		
     	}
     	
		



    </style>
    <!--   a 태그 활성화 없애기
   		<style type="text/css">
 		a:link { color: red; text-decoration: none;}
 		a:visited { color: black; text-decoration: none;}
 		a:hover { color: blue; text-decoration: underline;}
		</style>
     -->
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
		
		
		//FOLLOW Event
		
		
		//메세지 전송 Event
		
		
		//신고하기 Event
	});
	
	
	function upload(){
        $("#op-form").ajaxForm({
            url : "/user/upload",
            enctype : "multipart/form-data",
            dataType : "json",
            error : function(){
                alert("에러") ;
            },
            success : function(result){
                alert("성공") ;
            }
        });
 
        $("#op-form").submit() ;
    }


</script>


</head>


<body>
<div class="container">

	<form class="op-form" action="/settings/profile" method="POST" enctype="multipart/form-data">
	
	<div class="row header" align="center">
		<div class="col-xs-3" id="profile" align="left">
		<c:if test="${user.profileImage eq null }">
	
		<div class="profileImage" align="center">
        <figure class="default-Profile" style="">
        	<img  class="img-circle" src="../resources/images/profile_default.png" 
        	width="150px" height="150px"/>
        </figure>
        <label class="file-chooser-button horizontal-center btn btn-border btn-primary btn-lg">
         <input class="upload" type="file" name="profileImage" accept="image/*" > 
        </label>
      </div>
       </c:if>
		
		<c:if test="${user.profileImage ne null }">
		<div class="profileImage" align="center">
        <figure class="default-Profile" style="">
        	<img  class="img-circle" src="../resources/images/upload_files/images/${sessionScope.user.profileImage}" 
        	width="150px" height="150px"/>
        </figure>
        <label class="file-chooser-button horizontal-center btn btn-border btn-primary btn-lg">
         <input class="upload" type="file" name="profileImage" accept="image/*" > 
        </label>
    	</div>
       </c:if>
       </div>
        
        <div class="col-xs-3" id="name" style="margin-top: 100px; margin-left: 20px">
		<h3>${user.name}</h3>
        </div>
    </div>
    
     <c:if test="${user.userId eq sessionScope.user.userId}"><!-- 세션에있는 아이디랑  -->
    <div class="btn-group"  id="myPage">
    	<a class="btn" id="memoryMap">추억지도</a>
    	<a class="btn" id="point">포인트관리</a>
    	<a class="btn" id="listFreind">친구목록</a>
    	<c:if test="${sessionScope.user.role eq '1'}">
    	<a class="btn" id="getUser">추가정보입력</a></c:if>
    	<c:if test="${sessionScope.user.role eq '2'}">
    	<a class="btn" id="getUser">내정보조회</a></c:if>
    	<a class="btn" id="listNotice">알림함</a>
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
    </form>
    
    <div class="timeLine">
    		<h1>여기는 뉴스피드 게시물</h1>
    </div>
</div>


</body>
</html>