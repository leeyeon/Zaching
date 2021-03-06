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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
        

		/* 템플릿적용 */
		.hero {
			background: url('../resources/images/memoryMAP.jpg') no-repeat bottom center;
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center;
			height:500px;
		}
				
		#map{
		    margin-left: 10px;
		    margin-top: 10px;
		    padding-bottom: 100px;
		}
		
		
		
		.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
		.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
		.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
		.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

        /*여기 까지 추억 지도 */
        
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
    		
    	/* 게시물 스타일 */
    	.cell{
    	list-style: none;
		margin: 0;
		padding: 0;
    	}
	
		hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #333;
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
			//window.open("/user/memoryMap?userId=${user.userId}", "memoryMap", "width=800,height=800");
			//self.location = "/user/memoryMap?userId=${user.userId}";
			lodaMemoryMap();
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
		
		
		var status = 0 ;
		
		var keyword = ${sessionScope.user.userId};
		var userId = ${user.userId};
		
					
					$("a:contains('친구끊기')").on("click", function() {
						var friendId = ${user.userId};
						var userId4 = ${sessionScope.user.userId};
						var username = "${user.name}";
						
						if(confirm("친구 상태, 삭제하시겠습니까")){
							
							$.ajax({
								url : "/friend/rest/cutFriend",
								method : "POST",
								contentType : "application/json; charset=UTF-8",
								data : JSON.stringify({
									"friendId" : friendId,
									"userId" : userId4,
									"userName" : username
								}),
								async : false,
								dataType : "json",
								success : function(serverData) {
									$("#friendStatus").text("친구신청");
								}
							});
								
							
						}else{
						}
						
					});
					
					
					$("a:contains('친구신청')").on("click", function() {
						
						var friendId = ${user.userId};
						var userId2 = ${sessionScope.user.userId};
						var username = "${user.name}";
						
						if(status != 0){
							var friendId = ${user.userId};
							var userId3 = ${sessionScope.user.userId};
							var username = "${user.name}";
							
							
							$.ajax({
								url : "/friend/rest/cancelFriend",
								method : "POST",
								contentType : "application/json; charset=UTF-8",
								data : JSON.stringify({
									"friendId" : friendId,
									"userId" : userId3,
									"userName" : username
								}),
								async : false,
								dataType : "json",
								success : function(serverData2) {	
									$("#friendStatus").text("친구신청");
									
									}
								});
							
							--status;
							
						}else{
				
						if(confirm("친구 신청을 하겠습니까")){
							$("#friendStatus").text("친구 요청 중");
							$.ajax({
								url : "/friend/rest/addFriend",
								method : "POST",
								contentType : "application/json; charset=UTF-8",
								data : JSON.stringify({
									"friendId" : friendId,
									"userId" : userId2,
									"userName" : username
								}),
								async : false,
								dataType : "json",
								success : function(serverData2) {
									$("#friendStatus").text("친구 요청 중");
									status++;
									
									}
								});
						}else{
							
						}
						
						}
					});
					
					$("a:contains('차단한 친구')").on("click", function() {
						
						if(confirm("차단을 푸시겠습니까?")){
							
						}else{
							
						}
					});
					
					$("a:contains('친구수락')").on("click", function() {
						
						
					if(status != 0){
						alert("현재 친구끊기가 불가능합니다.");
					}else{
						
						if(confirm("친구요청을 수락하시겠습니까?")){
							var friendId = ${user.userId};
							var userId2 = ${sessionScope.user.userId};
							var username = "${user.name}";
					
								$.ajax({
									url : "/friend/rest/addFriend",
									method : "POST",
									contentType : "application/json; charset=UTF-8",
									data : JSON.stringify({
										"friendId" : friendId,
										"userId" : userId2,
										"userName" : username
									}),
									async : false,
									dataType : "json",
									success : function(serverData2) {
										$("#friendStatus").text("친구 (친구끊기)");										
											++status;
										}
									});
								
							
						}else{
							
						}
					}
						
						
					});
					
					$("a:contains('친구 요청 중')").on("click", function() {
						var friendId = ${user.userId};
						var userId3 = ${sessionScope.user.userId};
						var username = "${user.name}";
						alert(status);
						
						if(status != 0){
							var friendId = ${user.userId};
							var userId2 = ${sessionScope.user.userId};
							var username = "${user.name}";
							
							if(confirm("친구 신청을 하겠습니까")){
								
								$.ajax({
									url : "/friend/rest/addFriend",
									method : "POST",
									contentType : "application/json; charset=UTF-8",
									data : JSON.stringify({
										"friendId" : friendId,
										"userId" : userId2,
										"userName" : username
									}),
									async : false,
									dataType : "json",
									success : function(serverData2) {
										$("#friendStatus").text("친구 요청 중");
										}
									});
								--status;
							}else{
								
							}
							
						}else{
						$.ajax({
							url : "/friend/rest/cancelFriend",
							method : "POST",
							contentType : "application/json; charset=UTF-8",
							data : JSON.stringify({
								"friendId" : friendId,
								"userId" : userId3,
								"userName" : username
							}),
							async : false,
							dataType : "json",
							success : function(serverData2) {
								
								$("#friendStatus").text("친구신청");
								status++;
								}
							});
						
						}
						
						
					});
					
					$("a:contains('팔로우하기')").on("click", function() {
						var friendId = ${user.userId};
						var userId4 = ${sessionScope.user.userId};
						var username = "${user.name}";
						
							$.ajax({
								url : "/friend/rest/addFollow",
								method : "POST",
								contentType : "application/json; charset=UTF-8",
								data : JSON.stringify({
									"friendId" : friendId,
									"userId" : userId4,
									"userName" : username
								}),
								async : false,
								dataType : "json",
								success : function(serverData) {
									$("#followStatus").text("팔로우끊기");
								}
							});
								
							
					});
					
					$("a:contains('팔로우끊기')").on("click", function() {
						var friendId = ${user.userId};
						var userId4 = ${sessionScope.user.userId};
						var username = "${user.name}";
						
						
							
							$.ajax({
								url : "/friend/rest/cancelFollow",
								method : "POST",
								contentType : "application/json; charset=UTF-8",
								data : JSON.stringify({
									"friendId" : friendId,
									"userId" : userId4,
									"userName" : username
								}),
								async : false,
								dataType : "json",
								success : function(serverData) {
									$("#followStatus").text("팔로우신청");
								}
							});
								
						
					});
					
			
		
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
        <input type="hidden" name="userId"/>
         <button class="uploadbutton">데이터전송</button>
        
       <img  class="img-circle" alt="프로필사진변경"  style="width: 150px; height: 150px;"
       src="../resources/upload_files/images/${user.profileImage}"/>
         
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
      <c:if test="${sessionScope.user.userId eq user.userId}">
    	<button type="button" class="btn btn-primary" id="deleteUser">회원탈퇴</button>
    	</c:if>
    </div>
    
    </form>
    
    <!--//////////////////// 버튼 그룹///////////////////// -->
    
     <c:if test="${user.userId eq sessionScope.user.userId}"><!-- 세션에있는 아이디랑  -->
    <div class="row btn-group"  id="myPage" >
    	<a class="btn col-xs-2" id="memoryMap" data-toggle="modal" data-target="#myModal" >추억지도</a>
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
    	<div class="col-xs-3" id="friendSttusInput">
    		<c:if test="${code==0}"><a type="button" id="friendStatus">친구신청</a></c:if>
    		<c:if test="${code==1}"><a type="button" id="friendStatus">친구 요청 중</a></c:if>
    		<c:if test="${code==2}"><a type="button" id="friendStatus">친구 (친구끊기)</a></c:if>
    		<c:if test="${code==3}"><a type="button" id="friendStatus">친구수락</a></c:if>
  		</div>
    	<div class="col-xs-3">
    		<c:if test="${followCode==0}"><a type="button" id="followStatus">팔로우하기</a></c:if>
    		<c:if test="${followCode==1}"><a type="button" id="followStatus">팔로우끊기</a></c:if>
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
    		
    		 <c:set var="i" value="0"/>
			 <c:forEach var="newsfeed" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<li class="cell">
								<input type="hidden" value="${newsfeed.newsfeedId}" name="newsfeedId"/>
								<c:if test="${ !empty newsfeed.fileName }"><img src="../resources/upload_files/images/${newsfeed.fileName}" style="width: 100%"/></c:if>
								<div class="post-info">
									<div class="post-basic-info">
										<span><a href="#"><label> </label><c:if test="${newsfeed.categoryCode.equals('N01')}">자취지식인</c:if>
																			<c:if test="${newsfeed.categoryCode.equals('N10')}">밥친구 후기</c:if>
																			<c:if test="${newsfeed.categoryCode.equals('N02')}">중고거래</c:if>
																			<c:if test="${newsfeed.categoryCode.equals('N04')}">꿀팁</c:if>
										</a></span>
										<p></p>
										<table border="0">
											<tr>
												<td>
													<div class="thumb">
													<c:if test="${!empty newsfeed.profileImage }">
													<img alt="" src="../resources/images/${newsfeed.profileImage}">
													</c:if>
													<c:if test="${empty newsfeed.profileImage }">
													<img alt="" src="../resources/images/profile_default.png">
													</c:if>
													</div>
												</td>
												<td style="vertical-align: middle;">
													<p>${newsfeed.userName}</p>
												</td>
											</tr>
										</table>
										<p style="font-size: 13pt">${newsfeed.content}</p>
										
										<div class="likeit-wrap" id="item" onClick="fnc_addLikey(${newsfeed.newsfeedId})">
											<div class="likeit" data-postid="4" id="countLikey" >
												<span class="like-text">Like</span>
												<ins class="like-count" id="like${newsfeed.newsfeedId}">${newsfeed.countLikey}</ins>
											</div>
											<span class="newliker">Thanks!</span>
											<span class="isliker">You've already liked this</span>
										</div>
										<span class="post-comment">
										<a href="/newsfeed/getNewsfeed?newsfeedId=${newsfeed.newsfeedId}"><c:if test="${newsfeed.countReply == 0 }">No comments</c:if><c:if test="${newsfeed.countReply > 0}">${newsfeed.countReply}</c:if> </a></span>
									</div>
								
								</div>
								
							
							</li><hr>
			</c:forEach>
										
    </div>
    
   
    
    </div>	



</body>
</html>