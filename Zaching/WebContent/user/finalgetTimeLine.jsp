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
    
    
      <link rel='dns-prefetch' href='//s.w.org' />
<link rel="alternate" type="application/rss+xml" title="DW Timeline &raquo; Feed" href="http://demo.designwall.com/dw-timeline/feed/" />
<link rel="alternate" type="application/rss+xml" title="DW Timeline &raquo; About Comments Feed" href="http://demo.designwall.com/dw-timeline/about/feed/" />


<link rel='stylesheet' id='dwqa-style-css'  href='http://demo.designwall.com/dw-timeline/wp-content/plugins/dw-question-answer/templates/assets/css/style.css?ver=180720161352' type='text/css' media='all' />
<link rel='stylesheet' id='dwqa-rtl-css'  href='http://demo.designwall.com/dw-timeline/wp-content/plugins/dw-question-answer/templates/assets/css/rtl.css?ver=180720161352' type='text/css' media='all' />
<link rel='stylesheet' id='dw_timeline_main-css'  href='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/css/main.css?ver=6c39f42987ae297a5a21e2bb35bf3402' type='text/css' media='all' />
<link rel='stylesheet' id='dw_timeline_style-css'  href='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/style.css?ver=c1a58eb4baaf24c3771085df3d54ff8d' type='text/css' media='all' />

<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/js/vendor/modernizr-2.7.0.min.js'></script>

<meta name="generator" content="WordPress 4.7.9" />
<link rel="canonical" href="http://demo.designwall.com/dw-timeline/about/" />
<link rel='shortlink' href='http://demo.designwall.com/dw-timeline/?p=60' />
<link rel="alternate" type="application/json+oembed" href="http://demo.designwall.com/dw-timeline/wp-json/oembed/1.0/embed?url=http%3A%2F%2Fdemo.designwall.com%2Fdw-timeline%2Fabout%2F" />
<link rel="alternate" type="text/xml+oembed" href="http://demo.designwall.com/dw-timeline/wp-json/oembed/1.0/embed?url=http%3A%2F%2Fdemo.designwall.com%2Fdw-timeline%2Fabout%2F&#038;format=xml" />
<link rel="stylesheet" type="text/css" href="../resources/css/newsfeedStyle.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<jsp:include page="/resources/layout/sub_toolbar.jsp"/>
<script type="text/javascript">

$( function () {
		
	
	//내정보조회 Event && 추가 저보 입력
	$( "#getUser" ).on("click" , function() {
		self.location = "/user/getUser?userId=${user.userId}";
		
 	});


	
	//추억지도 Event
	
	$("#memoryMapshow").hide();
	$("#noticeshow").hide();
	
	//친구목록 Event
	$( "#listFreind" ).on("click" , function() {

		self.location = "/friend/listFriend";

 	});
	
	//알림함 Event
	$("#listNotice").on("click", function() {
		
		$("#memoryMapshow").hide();
		$("#timelineshow").hide();
		$("#noticeshow").show();
		
		$("#memoryMap").css('backgroundColor', '#fff');
		$("#listtimeline").css('backgroundColor', '#fff');
		$("#listNotice").css('backgroundColor', '#adbfdea1');
	});

	
		
		//메세지함
		$("#listMessage").on("click", function() {
			self.location ="/message/listMessage?userId=${user.userId}";	
		})
		

			
		$("#listtimeline").on("click", function() {
			
			$("#timelineshow").show();
			$("#memoryMapshow").hide();
			$("#noticeshow").hide();
			
			$("#memoryMap").css('backgroundColor', '#fff');
			$("#listtimeline").css('backgroundColor', '#adbfdea1');
			$("#listNotice").css('backgroundColor', '#fff');
			
		})
		
		$( "#memoryMap" ).on("click" , function() {
			$("#memoryMapshow").show();
			$("#timelineshow").hide();
			$("#noticeshow").hide();
			map.relayout();
			$("#memoryMap").css('backgroundColor', '#adbfdea1');
			$("#listtimeline").css('backgroundColor', '#fff');
			$("#listNotice").css('backgroundColor', '#fff');
	 	});
		
		
		
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
	});

	</script>
	
<style type="text/css">

body{
padding-top: 110px;
}

*{
font-family: 'Hanna', serif;
}
.menu {
align: left;
}

			body{
				padding-top: 110px;
				background: rgba(255,255,255,1);
			}
			
			img.wp-smiley,
			img.emoji {
				display: inline !important;
				border: none !important;
				box-shadow: none !important;
				height: 1em !important;
				width: 1em !important;
				margin: 0 .07em !important;
				vertical-align: -0.1em !important;
				background: none !important;
				padding: 0 !important;
				
				}
			
			.arrow_box {
				position: relative;
				background: #fff;
				border: 2px solid #a29fbd;
				border-radius: 10px;
			}
			
			.arrow_box:after {
				border-color: rgba(174, 231, 242, 0);
				border-right-color: #aee7f2;
				border-width: 0px;
				margin-top: -0px;
			}
			.arrow_box:before {
				border-color: rgba(162, 159, 189, 0);
				border-right-color: #a29fbd;
				border-width: 3px;
				margin-top: -3px;
			}
    
		        .banner.cover:before {
		      background:       background-image: -webkit-linear-gradient(-45deg, , #d38313);
		      background-image: linear-gradient(-45deg, , #d38313);
		    }
		        
		        .banner hgroup:after {
		      background-color: #f25f48;
		    }
		    .banner #get-started {
		      color: #f25f48; 
		    }
		    
		    .thumb{
		    	display: block;
		    	overflow: hidden;
		    	height: 50px;
		    	width: 50px;
		    }
		    
		    .thumb img{
		    	display: block;
		    	min-width: 100%;
		    	min-height: 100%;
		    	-ms-interpolation-mode: bicubic;
		    }
		    
		    
		    .thumb2{
		    	display: block;
		    	overflow: hidden;
		    	height: 35px;
		    	width: 35px;
		    }
		    
		    .thumb2 img{
		    	display: block;
		    	min-width: 100%;
		    	min-height: 100%;
		    	-ms-interpolation-mode: bicubic;
		    }
		    
		    #respond > div.likeit-wrap {
			    font-size: large;
			    margin-top: 0;
			}
			
			#respond {
			    border-top: none;
			}
			
			#countLikey{
				cursor: pointer;
			}
			
			@-webkit-keyframes bounce {
			    0%, 20%, 50%, 80%, 100% {-webkit-transform: translateY(0);}
			    40% {-webkit-transform: translateY(-30px) }
			    60% {-webkit-transform: translateY(-20px);}
			} 
			@keyframes bounce {
			    0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
			    40% {transform: translateY(-30px);}
			    60% {transform: translateY(-20px);}
			} 
			
			.bounce {
			    -webkit-animation-duration: 1s;
			    animation-duration: 1s;
			    -webkit-animation-name: bounce;
			    animation-name: bounce;
			}
			
			body > nav > div > div.navbar-header > a > div > img{
				height: 40px;
			}
			
			.profile-img {
				border-radius: 50%;
			} 
			
			.glyphicon{ position: absolute;
    left: 0px;
    top: 0px;
    font-size: 20px;
    color: #000;
    padding: 12px;}
    
  .social-icon <  li{
  background : #000;
  padding : 500px;
  }

.hero {
	background: url('../resources/images/memoryMAP.jpg') no-repeat bottom center;
	background-size: cover;
	background-repeat: no-repeat, no-repeat;
	background-position: center center;
	height:500px;
}
		
#map{
    margin-left: 10px;
    margin-top: 50px;
    padding-bottom: 100px;
}



.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

a {
text-decoration:none;
color:#000;
font-family: 'Hanna', serif;
}
#listNotice {
    line-height: 50px;
    color: #000;
    font-size: 15px;
    font-weight: bold;
    border: none;
  
}
#memoryMap {
    line-height: 50px;
    color: #000;
    font-size: 15px;
    font-weight: bold;
    border: none;
}
#listtimeline {
    line-height: 50px;
    color: #000;
    font-size: 15px;
    font-weight: bold;
    border: none;
    background-color:#adbfde;
}
#listMessage {
    line-height: 50px;
    color: #000;
    font-size: 15px;
    font-weight: bold;
    border: none;
}
b{
font-size:14pt;
}


</style>


	
  </head>

 <body>

								
							
    <div id="main">
        <div class="container">
            <div class="row"><!-- About Me (Left Sidebar) Start -->
           
                 <div class="col-md-3">
                   <div class="about-fixed" >
                    <center>
                     <div class="my-pic" >
                     
                     <c:if test="${user.profileImage eq null }"><img  style="width: 100%; height: 250px;" src="../resources/images/profile_default.png" /></c:if>
                     <c:if test="${user.profileImage ne null }"><img  alt="프로필사진변경"  style="width: 100%; height: 250px;" src="../resources/upload_files/images/${user.profileImage}"/></c:if>
                        
                        
                        <a href="javascript:void(0)" class="collapsed" align="left" data-target="#menu" data-toggle="collapse"><i class="glyphicon glyphicon-camera"></i></a>
                        
                         <div id="menu" class="collapse">
                           <ul class="menu-link">
                               <li><div class="profileImage" align="center">
		<input type="file" name="uploadfile" />
		<input type="hidden" name="userId"/>
         <button class="uploadbutton">데이터전송</button>	</div></li>
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
                       
                       <a type="button" id="getUser" ><img src="/resources/images/userupdate.png"  style="width: 50px; height: 50px;"/></a>
                       &nbsp;&nbsp;&nbsp;&nbsp;                       
                       <a type="button" id="listFreind"><img src="/resources/images/userfrined.png"  style="width: 50px; height: 50px;"/></a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="/payment/mainPayment" type="button" id="point"><img src="/resources/images/usercoin.png" id="point"  style="width: 50px; height: 50px;"/> </a>
                        </center>
                        </div>
                        </c:if>
                        
                        
                          <c:if test="${user.userId ne sessionScope.user.userId}">
                        	 <div class="social-icon-info" style=" font-family: 'Hanna', serif; font-color: #000; text-decoration : none; padding-top: 20px; padding-bottom: 20px;">                    
                        	<c:if test="${code==0}"><a type="button" id="friendStatus" >친구신청</a></c:if>
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
    	<a class="btn col-xs-3" id="listtimeline"><b>타임라인</b></a>
    	<a class="btn col-xs-3" id="memoryMap" data-toggle="modal" data-target="#myModal" ><b>추억지도</b></a>    	
    	<a class="btn col-xs-3" id="listNotice"><b>알림함<div class="badge   badge-primary"></div></b></a>
	 <a class="btn col-xs-3" id="listMessage" ><b><img src="../resources/images/Message_Icon.png" width="20px" height="20px"/>&nbsp;채팅함</b></a>
  </c:if>
  
  <c:if test="${user.userId ne sessionScope.user.userId}">
  <div class="row" id="friendPage">
    	<div class="col-xs-12">
    		<a type="button" ><img src="../resources/images/Message_Icon.png" width="20px" height="20px" align="left"/>&nbsp;메세지전송</a>
    	</div>
    	<!--  
    	<div class="col-xs-6">
    		<a type="button" >신고하기</a>
    	</div>-->
  </div>
 <br/> <br/> <br/>
  </c:if>   
   <hr/> </h3>


          </div>
          
          
         
          
				 <div class="col-md-12 blog-post" >
				 <div id="timelineshow">
				 <c:set var="i" value="0"/>
			 <c:forEach var="newsfeed" items="${list}">
				<c:set var="i" value="${ i+1 }" />                        	
					  <div class="wrap container" role="document" >
    <div class="content row">
      <main class="main col-sm-6 col-sm-offset-1" role="main">
  <div class="page-header">
  <div class="thumb" style="float: left;">
  <c:if test="${!empty newsfeed.profileImage}"><img src="../resources/images/${newsfeed.profileImage}" height='50' width='100' align="left"/></c:if>
  <c:if test="${empty newsfeed.profileImage}"><img src="../resources/images/profile_default.png" height='50' width='100' align="left"/></c:if>
   
   
   </div>
   <div style="font-size: 12pt; line-height: 200%;">&nbsp;${newsfeed.userName}</div>&nbsp;${newsfeed.regDate}
</div>
	<c:if test="${!empty newsfeed.fileName}"><a href="/newsfeed/getNewsfeed?newsfeedId=${newsfeed.newsfeedId}"><img src="../resources/upload_files/images/${newsfeed.fileName}" width="100%"></a></c:if>
	
	<br/><br/>
    <p style="font-size: 18pt; font-family: 'Hanna', serif;">${newsfeed.content}</p>
    <br/>
	<div id="respond">
				<hr/>
				<p style="font-size: 20pt">
	<div class="likeit-wrap" id="item">
	<div class="likeit" data-postid="4" id="countLikey">
		<span class="like-text">Like</span>
		<ins class="like-count">${newsfeed.countLikey}</ins>
	</div>
	<span class="newliker">Thanks!</span>
	<span class="isliker">You've already liked this</span>
</div></p>
				
		</div><!-- #respond -->
	
      </main>
    </div>
  </div>	</c:forEach>  	
		</div>	
			
			
			<div id="memoryMapshow">
				<div id="map" style="width:100%; height:700px;"></div>
			</div>
			
			
			<div id="noticeshow">
				<jsp:include page="/notice/listNotice?userId=${user.userId}"/>
			</div>
			
			 </div>
         </div>
      </div>
 
    
    
    
    <!-- All Javascript Plugins  -->
    <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/plugin.js"></script>
    
    <!-- Main Javascript File  -->
    <script type="text/javascript" src="/resources/js/scripts.js"></script>
    <script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/js/vendor/jquery.infinitescroll.min.js?ver=4.7.9'></script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/js/vendor/bootstrap-3.0.3.min.js?ver=4.7.9'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var dwtl = {"template_directory_uri":"http:\/\/demo.designwall.com\/dw-timeline\/wp-content\/themes\/dw-timeline"};
var infinitescroll = {"page":"page","the_end":"the end"};
/* ]]> */
</script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-includes/js/wp-embed.min.js?ver=4.7.9'></script>

    <script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=clusterer"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(39.566826, 122.9786567), 
    level: 13// 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
map.relayout();
var clusterer = new daum.maps.MarkerClusterer({
	
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 5,
    calculator: [3, 5, 10, 20],
    styles: [{ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
        width : '20px', height : '20px',
        background: 'rgba(255, 178, 217, .8)',
        borderRadius: '15px',
        color: '#000',
        textAlign: 'center',
        fontWeight: 'bold',
        lineHeight: '31px',
     },
    {
        width : '30px', height : '30px',
        background: 'rgba(243, 97, 166, .8)',
        borderRadius: '20px',
        color: '#000',
        textAlign: 'center',
        fontWeight: 'bold',
        lineHeight: '41px'
    },
    {
        width : '40px', height : '40px',
        background: 'rgba(241, 95, 95, .8)',
        borderRadius: '25px',
        color: '#000',
        textAlign: 'center',
        fontWeight: 'bold',
        lineHeight: '51px'
    },
    {
        width : '50px', height : '50px',
        background: 'rgba(204, 61, 61, .8)',
        borderRadius: '30px',
        color: '#000',
        textAlign: 'center',
        fontWeight: 'bold',
        lineHeight: '61px'
    }
]



    
});


var userId = "${sessionScope.user.userId}"; //"3";

$(function() {	
	$.ajax({
			url : "/user/rest/memoryMap/"+userId,
			method : "GET" ,
			dataType : "json",										
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},success : function(jsonData , status) {
			       		var markers = $(jsonData.positions).map(function(i, position) {
			        	var imageSrc = jsonData.positions[i].imgsrc, // 마커이미지의 주소입니다    
			            imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
			            imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 
			            //마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
							
			            console.log(imageSrc); 
			        	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
			        	
			        	console.log(markerImage);
			        	
			            return new daum.maps.Marker({
			            	position : new daum.maps.LatLng(position.lat, position.lng),
			                image : markerImage // 마커 이미지 
			            });

			        // 클러스터러에 마커들을 추가합니다
			        
			    });
			        clusterer.addMarkers(markers);
			        
				}
		
		});	
	});


</script>
   </body>
 </html>