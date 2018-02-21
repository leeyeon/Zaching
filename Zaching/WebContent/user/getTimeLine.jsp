<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>
    
    <!-- Meta Tag -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    


    <link rel="shortcut icon" href="images/favicon/favicon.ico">
    
    <!-- All CSS Plugins -->
    <link rel="stylesheet" type="text/css" href="/resources/css/userplugin.css">
    
    <!-- Main CSS Stylesheet -->
    <link rel="stylesheet" type="text/css" href="/resources/css/userstyle.css">
    
<jsp:include page="/resources/layout/sub_toolbar.jsp"/>
    
<style>
body{
padding-top: 110px;
}
.menu {
align: left;
}

html, body {

	position: relative;
	margin: 0;
}

body {
	font-family: Helvetica, Arial, serif;
	font-size: 16px;
}

.wrapper {
	width: 612px;
	height: 100%;
	margin: 0 auto;
}

.phone-containter {
	width: 340px;
	height: 100%;
}

.phone {
	height: 60%;
	border: 1px solid #dcdcdc;
	overflow-y: auto;
	overflow-x: hidden;
	background-color: #fff;
}

.button {
	background-color: none;
	border: 1px solid #36a9fc;
	text-decoration: none;
	border-radius: 10px;
	padding: 5px 10px;
	color: #36a9fc;
	display: block;
	width: 80px;
	text-align: center;
	overflow: hidden;
	text-oveflow: ellipsis;
	margin: 20px auto;
}

.build-container {
	width: 230px;
	height: 100%;
	margin-left: 20px;
	float: right;
}

#buildInput {
	width: 100%;
	height: 60%;
}

/* Messages baloon: 메세지 풍선 */
.message {
	margin: 10px 0;
	overflow: hidden;
}

.message-text {
	padding: 10px 20px;
	float: right;
	clear: both;
	border-radius: 25px;
	position: relative;
	margin-bottom: 1px;
}

.message.left .message-text {
	margin-right: 70px;
	margin-left: 20px;
	background-color: #e5e5ea;
	float: left;
}

.message.right .message-text {
	margin-left: 70px;
	margin-right: 20px;
	background-color: #36a9fc;
	color: #fff;
	float: right;
}

.message-text:last-child:before, .message-text:last-child:after {
	content: '';
	position: absolute;
	bottom: 0;
	width: 35px;
	height: 25px;
	z-index: -1;
}

.message.right .message-text:before, .message.right .message-text:after
	{
	border-radius: 0 0 0 50%;
}

.message.right .message-text:before {
	height: 20px;
	right: -23px;
	background-color: #36a9fc;
}

.message.right .message-text:after {
	right: -35px;
	bottom: -3px;
	background-color: #fff;
}

.message.left .message-text:before, .message.left .message-text:after {
	border-radius: 0 0 50% 0;
}

.message.left .message-text:before {
	height: 20px;
	left: -23px;
	background-color: #e5e5ea;
}

.message.left .message-text:after {
	left: -35px;
	bottom: -3px;
	background-color: #fff;
}

.send-container {
	background-color: #f6f6f6;
	border: 1px solid #dcdcdc;
	margin-top: -1px;
	padding: 10px;
}

.send-input {
	border-radius: 5px;
	border: 1px solid #dbdbdb;
	background-color: #fff;
	padding: 5px 5px;
	font-size: 1em;
	width: 78%;
}

.send-btn {
	text-decoration: none;
	color: #939297;
	font-weight: bold;
	background-color: transparent;
	border: none;
	font-size: 1em;
	cursor: pointer;
}


</style>

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
			self.location = "/notice/listNotice?userId=${user.userId}";
		});
		
		
		//메세지함
		$("#listMessage").on("click", function() {
			self.location ="/message/listMessage";	
		})
		
		//메세지 전송 Event
		$("#friendPage").on("click", function() {
			alert(${user.userId})
			$("#messageModal").modal('show');
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
		
		
		
		
		//신고하기 Event
	});
	
	//모달창 메세지 입력
	function addMessage(){
		 
		// var userId = ${sessionScope.user.userId};
		// var  friendId= ${user.userId} ;
		
		 var messageContent = document.getElementById('send'); 
			
		　if(!messageContent.value){ 
		　　alert('메세지를 입력해주세요.');
			return;
		　} 
		
		 
		$("form").attr("method", "POST").attr("action", "/message/listMessage").submit();
	}
	
	$(function(){
		
		
			//프로필사진 업데이트
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
<style>
.glyphicon{ position: absolute;
    left: 0px;
    top: 0px;
    font-size: 20px;
    color: #fff;
    background: #23262dc7;
    padding: 12px;}
    
  .social-icon <  li{
  background : #000;
  padding : 500px;
  }
a {text-decoration:none; color:#000}
</style>
 <body>

    <div id="main">
        <div class="container">
            <div class="row">
            	
               
                 
                 <!-- About Me (Left Sidebar) Start -->
                 <div class="col-md-3">
                   <div class="about-fixed">
                    <center>
                     <div class="my-pic">
                     
                     <c:if test="${user.profileImage eq null }"><img  src="../resources/images/profile_default.png" style="width: 100%; height: 100%;"/></c:if>
                     <c:if test="${user.profileImage ne null }"><img  alt="프로필사진변경"  style="width: 100%; height: 100%;" src="../resources/upload_files/images/${user.profileImage}"/></c:if>
                        
                        
                        <a href="javascript:void(0)" class="collapsed" align="left" data-target="#menu" data-toggle="collapse"><i class="glyphicon glyphicon-camera"></i></a>
                        
                         <div id="menu" class="collapse">
                           <ul class="menu-link">
                               <li><div class="profileImage" align="center">
		<input type="file" name="uploadfile" />
		<input type="hidden" name="userId"/>
         <button class="uploadbutton">데이터전송</button>
        	
         

      	</div></li>
                            </ul>
                         </div>
                         
                        </div>
                      </center>
                      
                      
                      <div class="my-detail">
                    	
                        <div class="white-spacing">
                            <h1>${user.name}</h1>
                            <span></span>
                        </div> 
                       <center>
                      
                        <c:if test="${user.userId eq sessionScope.user.userId}">
                            <div class="social-icon-info" style="padding-top: 26px; padding-bottom: 26px;">
                            <center>                 
                        <c:if test="${sessionScope.user.role eq '1'}"><a type="button" id="getUser">
                        <img src="/resources/images/userupdate.png"  style="width: 50px; height: 50px;"/>
                        </a></c:if>&nbsp;&nbsp;&nbsp;&nbsp;
                       <a type="button" id="point">
                        <img src="/resources/images/usercoin.png"  style="width: 50px; height: 50px;"/>
                        </a>
                       
    	
                        </center>
                        </div>
                        </c:if>
                        
                        
                          <c:if test="${user.userId ne sessionScope.user.userId}">
                        	 <div class="social-icon-info" style="font-color: #000; text-decoration : none; padding-top: 20px; padding-bottom: 20px;">                    
                        	<c:if test="${code==0}"><a type="button" id="friendStatus">친구신청</a></c:if>
    		<c:if test="${code==1}"><a type="button" id="friendStatus">친구 요청 중</a></c:if>
    		<c:if test="${code==2}"><a type="button" id="friendStatus">친구 (친구끊기)</a></c:if>
    		<c:if test="${code==3}"><a type="button" id="friendStatus">친구수락</a></c:if><br/>
                        	<c:if test="${followCode==0}"><a type="button" id="followStatus">팔로우하기</a></c:if>
    		<c:if test="${followCode==1}"><a type="button" id="followStatus">팔로우끊기</a></c:if>
                       	 </div>                         
                          </c:if>                    
                        
                        
                        </center>

                    </div>
                  </div>
                </div>
                <!-- About Me (Left Sidebar) End -->
                
                
                
                
                 
                 <!-- Blog Post (Right Sidebar) Start -->
                 <div class="col-md-9">
                    <div class="col-md-12 page-body">
                    	<div class="row">
                    		
                            
                            <div class="sub-title" >
                           		<h3> <c:if test="${user.userId eq sessionScope.user.userId}"><!-- 세션에있는 아이디랑  -->
    
    	<a class="btn col-xs-3" id="memoryMap" data-toggle="modal" data-target="#myModal" ><b>추억지도</b></a>    	
    	<a class="btn col-xs-3" id="listFreind"><b>친구목록</b></a>    	
    	
    	<a class="btn col-xs-3" id="listNotice"><b>알림함</b></a>

  </c:if>
  
  <c:if test="${user.userId ne sessionScope.user.userId}">
  
  <div class="row" id="friendPage" >
    	<div class="col-xs-12">
    	<input type="hidden" name="roomId" value="${message.roomId }">
    		<a type="button" ><img src="../resources/images/Message_Icon.png" height="20px" align="left"  name="messageContent"/>&nbsp;메세지전송</a>
    	</div>
    	<!--  
    	<div class="col-xs-6">
    		<a type="button" >신고하기</a>
    	</div>-->
  </div>
  </c:if>
                           		
                           		
                           		</h3>
                           		<c:if test="${user.userId eq sessionScope.user.userId}">
                                <a><img  id="listMessage" src="../resources/images/Message_Icon.png" width="50px" height="50px" align="right"/></a>
                                </c:if>
                             </div>
                            
                            
                            <div class="col-md-12 content-page">
                            	
                                
                                <!-- Blog Post Start -->
                                <div class="col-md-12 blog-post">
                                    </div>
                                <!-- Blog Post End -->
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
                
            </div>
         </div>
      </div>
      
      
      
      
      <!-- Modal -->
			<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="wrapper">


						<!-- 왼쪽 메세지 대화 박스 -->
						
						
						
						<div class="phone-containter">
							<div id="phone" class="phone">
								<button type="button" class="close" data-dismiss="modal" varia-hidden="true" id="close">×</button>
								<div id="messegeBox"></div>
							</div>

							<!-- 메세지 작성 -->
							<div class="send-container">
								<form id="send">
								<input type="hidden" value="${user.userId }" name="userId"/>
								<input type="hidden" value="${sessionScope.user.userId}" name="friendId"/>
									<input type="text" id="msgInput" class="send-input" placeholder="메세지내용">
									<a href="#" onclick="addMessage();" class="send-btn" data-dismiss="modal"  value="Send">send</a>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
      
    
    
    
    
    <!-- All Javascript Plugins  -->
    <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/plugin.js"></script>
    
    <!-- Main Javascript File  -->
    <script type="text/javascript" src="/resources/js/scripts.js"></script>

    
   </body>
 </html>