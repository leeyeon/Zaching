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
    	body > div.container > div.content {
    		background-color: #fff;
    		margin-top: -20px;
    		
    	
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
			self.location = "/friend/listFriend";
			
	 	});
		
		//알림함 Event
		$("#listNotice").on("clcick", function() {
			self.location = "/user/listNotice?userId=${user.userId}";
		});
		
		
		//메세지함
		$("#listMessage").on("click", function() {
			self.location ="/message/listMessage";	
		})
		
		
		
		
		//회원탈퇴
		$("#deleteUser").on("click", function() {
			var windowW = 400;  // 창의 가로 길이
		    var windowH = 500;  // 창의 세로 길이
			var left = Math.ceil((window.screen.width - windowW)/2);
		    var top = Math.ceil((window.screen.height - windowH)/2);
		    
			window.open("/user/deleteUser?userId=${sessionScope.user.userId}",'popup',"l top="+top+",left="+left+", height="+windowH+", width="+windowW);
			opener.location.reload(true);
			    self.close();
		})
		
		//FOLLOW Event
		
		
		//메세지 전송 Event
		
		
		//신고하기 Event
	});
	
	//프로필사진 업데이트
	$(function(){
     $("#uploadbutton").click(function(){
         
         var form = new FormData(form);
         form.append("uploadFile",file);
             $.ajax({
                url: '/user/fileupload',
                method: 'POST',
                contentType: "application/json; charset=UTF-8",
                data: formData,
              	 async : false,
    			dataType : "json",
                success: function(result){
                    alert("업로드 성공!!");
                }
            });
         });
	})



</script>


</head>


<body>
<div class="container">
<div class="bg"></div>
	<div class="content">
	<form id="frm" class="op-form" action="/user/fileupload" method="POST" enctype="multipart/form-data">
	
	<div class="row header" align="center">
		<div class="col-xs-4" id="profile" align="left">
		
		<!--프로필 사진 없으면 기본이미지  -->
		<c:if test="${user.profileImage eq null }">
	
		<div class="profileImage" align="center">
		<input type="file" name="uploadfile" />
		<input type="hidden" name="userId"/>
         <button class="uploadbutton">데이터전송</button>
        	<img  class="img-circle" src="../resources/images/profile_default.png" 
        	 style="width: 150px; height: 150px;"/>
         

      	</div>
      
       </c:if>
		<!-- 프로필 사진 있을때 -->
		<c:if test="${user.profileImage ne null }">
		<div class="profileImage" align="center">
        <input type="file" name="uploadfile" />
         <button class="uploadbutton">데이터전송</button>
        
       <img  class="img-circle" alt="프로필사진변경"  style="width: 150px; height: 150px;"
       src="../resources/upload_files/images/${sessionScope.user.profileImage}"/>
         
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
    	<button type="button" class="btn btn-primary" id="deleteUser">회원탈퇴</button>
    </div>
    
    </form>
    
    <!--//////////////////// 버튼 그룹///////////////////// -->
    
     <c:if test="${user.userId eq sessionScope.user.userId}"><!-- 세션에있는 아이디랑  -->
    <div class="row btn-group"  id="myPage">
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
</div>


</body>
</html>