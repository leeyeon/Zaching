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
		
		/* 프로필사진업데이트 */
		.filebox label {
   			 	display: inline-block;
    			padding: .5em .75em;
  			  	color: #999;
    			font-size: inherit;
    			line-height: normal;
    			vertical-align: middle;
			}
 
		.filebox input[type="file"] {  
    		position: absolute;
    		width: 1px;
    		height: 1px;
    		padding: 0;
    		margin: -1px;
    		overflow: hidden;
    		clip:rect(0,0,0,0);
    		border: 0;
		}
		
		#cma_image >img {
    		vertical-align: middle;
    		max-height: 150px;
    		max-width: 150px;
   			 border-radius: 50%;
		}
		
		.profileImage{
			vertical-align: middle;
    		max-height: 150px;
    		max-width: 150px;
   			 border-radius: 50%;
		
		}

    </style>
   
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function getThumbnailPrivew(html, $target) {
	    if (html.files && html.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $target.css('display', '');
	            
	            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
	            $target.html('<img src="' + e.target.result + '" border="0" alt="" />');
	            $('.profileImage').detach();//
	        }
	        reader.readAsDataURL(html.files[0]);
	    }
	}
	
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
		
		
	
		
		//FOLLOW Event
		
		
		//메세지 전송 Event
		
		
		//신고하기 Event
	});
	
	//프로필사진 업데이트
	$(function(){
		
		
		
		var keyword = ${sessionScope.user.userId};
		var userId = ${user.userId};
	
		$.ajax({
			url : "/friend/rest/listFriend",
			method : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify({
				"keyword" : keyword
			}),
			async : false,
			dataType : "json",
			success : function(serverData) {
				
				var display = "";
				
					for(var i=0; i<serverData.list.length; i++){
						
						if(serverData.list[i].friendId == userId){
						
							if(status == 0){								
								display = '<a type="button" >친구끊기</a>';							
							}else if(status == 1){
								display = '<a type="button" >친구신청</a>';								
							}else{
								display = '<a type="button" >차단한 친구</a>';
							}							
						}
						else{
							display = '<a type="button" >친구신청</a>';
						}
					}
					
					$("#friendSttusInput").html(display);
					
					$("a:contains('친구끊기')").on("click", function() {
						
						if(confirm("친구 상태, 삭제하시겠습니까")){
							
							$.ajax({
								url : "/friend/rest/delectFriend",
								method : "POST",
								contentType : "application/json; charset=UTF-8",
								data : JSON.stringify({
									"keyword" : keyword
								}),
								async : false,
								dataType : "json",
								success : function(serverData) {
									
								}
									});
								
							
						}else{
							
						}
						
					});
					
					$("a:contains('친구신청')").on("click", function() {
						
						if(confirm("친구 신청")){
							
						}else{
							
						}
					});
					
					$("a:contains('차단한 친구')").on("click", function() {
						
						if(confirm("차단을 푸시겠습니까?")){
							
						}else{
							
						}
					});
					
			}
			
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
	<form id="form" class="form" action="/user/fileupload" method="POST" enctype="multipart/form-data">
		<input type="hidden" value="${user.userId}" name="userId" id="userId"/>
	<div class="row header" align="center">
		<div class="col-xs-4" id="profile" align="left">
		
		<img alt="" src="../resources/upload_files/images/${user.profileImage }" class="profileImage">
		<div class="filebox">
        <label for="cma_file">프로필사진 업로드</label>
		<input type="file" name="file" id="cma_file" imageswap="true" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))"/>
        <div id="cma_image" style="width:200px;max-width:200px;display:none;"></div>
    	</div>
      	
       
       </div>
        
        <div class="col-xs-3" id="name" style=" margin-left: 20px">
		<h3>${user.name}</h3>
		</div>
     
      
      <div class="col-xs-4 message" align="right">
      <a><img id="listMessage" src="../resources/images/Message_Icon.png" width="50px" height="50px"/></a></div>
   
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
    	<div class="col-xs-3" id="friendSttusInput">
    	
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</body>
</html>