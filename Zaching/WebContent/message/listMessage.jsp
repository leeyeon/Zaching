<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!--   jQuery , Bootstrap CDN  -->

<style>


body {
	padding-top: 50px;
}

html, body {
	height: 98%;
	position: relative;
	margin: 0;
}

body {
	font-family: Helvetica, Arial, serif;
	font-size: 16px;
	padding: 1%
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

::-webkit-scrollbar {
	width: 8px;
	height: 8px;
	border: 3px solid #fff;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	display: block;
	height: 10px;
	background: url('./images/bg.png') #efefef
}

::-webkit-scrollbar-track {
	background: #efefef;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 4px rgba(0, 0, 0, .2)
}

::-webkit-scrollbar-thumb {
	height: 50px;
	width: 50px;
	background: rgba(0, 0, 0, .2);
	-webkit-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: inset 0 0 4px rgba(0, 0, 0, .1)
}
</style>


<script type="text/javascript">

var roomindex = 0;

	$('#build').bind('click', function() {
		var inputText = $('#buildInput').val();
		var regMessage = /^#(\d):\s([^#.]*)/gm;
		var messages = inputText.split(regMessage);
		$('#phone').empty();
		for (var i = 1; i < messages.length; i = i + 3) {
			if (window.CP.shouldStopExecution(1)) {
				break;
			}
			addMsg(messages[i], messages[i + 1]);
		}
		window.CP.exitedLoop(1);
		return false;
	});

	/* 입력한 메세지를 저장하는 함수 */
	$('#send').bind('submit', function() {
		var msgText = $('#msgInput').val();
		$('#msgInput').val('');
		if (msgText != '')
			addMsg(1, msgText);
		$('#phone').animate({
			scrollTop : $('#phone').height()
		}, 600);
		return false;
	});

	/* 메세지를 메세지 박스로 출력해주는 함수 */
	function addMsg(people, msg) {
		var side = 'right';
		var $_phone = $('#phone');
		var $_lastMessage = $('#phone .message:last');
		if (people == 1)
			side = 'right';
		if (people == 2)
			side = 'left';
		if ($_lastMessage.hasClass(side)) {
			$_lastMessage.append($('<div>').addClass('message-text').text(msg));
		} else {
			$_phone.append($('<div>').addClass('message ' + side).append(
					$('<div>').addClass('message-text').text(msg)));
		}
	}
	
	$(function() {
		
		
		$( "a.send-btn:contains('send')" ).on("click" , function() {
			addMessage();
		});
		
		$( "#msgInput" ).on( "keydown" , function(e) {
			if(e.keyCode == 13) {
				addMessage();
				return false;
			}
		});

	 	$(document).on('click',"div[name='messageContent']", function() {
	 		var index= $($("input[name=roomId]")[$("div[name='messageContent']").index(this)]).val(); 		
	 		roomindex =  $($("input[name=friendIdinfo]")[$("div[name='messageContent']").index(this)]).val();
	 		
	 		$.ajax({
	 		               url : "/message/json/listMessage",
	 		               method : "POST",
	 		               contentType : "application/json; charset=UTF-8",
	 		               data : JSON.stringify({
	 		                  "searchKeyword" :   index
	 		               }),
	 		               dataType : "json",
	 		               async: false,
	 		               success : function(serverData) {
	 		            	   var messageContent="";
	 		            	   
	 		            	   if(serverData != null) {
	 		            		   var friendId;
	 		            		   var profile;
	 		            		   var checkImage=0;
	 		            		  var friendName;
	 		            		  if(serverData[0].userId != ${user.userId}){
	 		            		  	friendId = serverData[0].userId;
	 		            		  	for(checkImage;checkImage<serverData.length; checkImage++){
	 		            		  		if(serverData[checkImage].userId == ${user.userId}){
	 		            		  			profile = serverData[checkImage].friendProfileImage;
	 		            		  			friendName = serverData[checkImage].friendName;
	 		            		  			break;
	 		            		  		}
	 		            		  		
	 		            		  	}
	 		            		   /*	while(serverData[checkImage].userId != ${user.userId}){
	 		            		   		checkImage++;
	 		            		   		profile = serverData[checkImage].friendProfileImage;
	 		            		   		friendName = serverData[checkImage].friendName;
	 		            		   		alert(profile);
	 		            		   	}*/
	 		            		  }else{
	 		            			  friendId = serverData[0].friendId;
	 		            			 profile = serverData[0].friendProfileImage;
	 		            			friendName = serverData[0].friendName;
	 		            		  }
	 		            		  if(profile == null && checkImage < serverData.length){
	 		            			  
	 		            			  messageContent += '<div><img src="../resources/images/profile_default.png" style="width:60px; height:60px; border-radius: 150px; margin: 10pt;" >&nbsp;'+friendName+'</div>';
	 		            		  
	 		            		  }
	 		            		 if(profile == null && checkImage == serverData.length){
	 		            			  
	 		            			  messageContent += '<div><img src="../resources/images/profile_default.png" style="width:60px; height:60px; border-radius: 150px; margin: 10pt;" >&nbsp;친구가 아직 수락하지 않았습니다.</div>';
	 		            		  
	 		            		  }
	 		            		  if(profile != null){
	 		            			  
	 		            			  messageContent += '<div><img src="../resources/images/'+profile+'" style="width:60px; height:60px; border-radius: 150px; margin: 10pt;">&nbsp;'+friendName+'</div>';
	 		            		  }
	 		            		 messageContent +=' <input type="hidden" value="${sessionScope.user.userId}" name="userId"/>	'			
									+ '<input type="hidden" value = "'+friendId+'" name= "friendId"/>'
									+ '<input type="hidden" value = "'+index+'" name= "roomId"/><div style="overflow-y: auto;  height: 450px;">';
	 		            		   
		 		            	   for(var i=0; i<serverData.length; i++){
		 		            		  	//messageContent +='<div style="overflow:scroll;">'
		 		            		  if(serverData[i].userId != ${user.userId}){
		 		            			messageContent +=  '<div class="message left"><div class="message-text">'
			 		            		   +serverData[i].content+'</div>'
			 		            		  +'<div class="row col-xs-12" style="padding-left: 40px; font-size: 11px;">'+serverData[i].createdDate+'</div></div>';
		 		            		    
		 		            		  }else{
		 		            			messageContent +=  '<div class="message right"><div class="message-text">'
			 		            		   +serverData[i].content+'</div>'
			 		            		  +'<div class="row col-xs-12 text-right" style="padding-left: 40px; font-size: 11px;">'+serverData[i].createdDate+'</div></div>';
		 		            		  }
		 		            		  	
		 		            		  	//messageContent += '<div class="row col-xs-12" style="padding-left: 40px; font-size: 13px;">'+serverData[i].createdDate+'</div></div>';
		 		            	   }
		 		            	  messageContent += '</div>';
	 		            	   } else {
	 		            		   messageContent += "메시지가 없습니다.";
	 		            	   }
	 		            	   $("#messegeBox").html("");
	 		            	   $("#messegeBox").append(messageContent);
	 		            	  $("#messageModal").modal('show');
	 		            	 $("#messageModal").scrollTop($("#messageModal")[0].scrollHeight);
	 		            	  
	 		               },
	 		               error:function(request,status,error){
	 		                   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		               }
	 		            });
	 			
	 		});
	
		});
	
 	function addMessage(){
 		
 		//alert(JSON.stringify($("#send").serializeObject()));
		var content = $("input[name='content']").val();
			
		　if(content=="" || content.length<1){ 
		　	alert('메세지를 입력해주세요.');
				return;
		　} 
			
			$.ajax({
	               url : "/message/json/addMessage",
	               method : "POST",
	               contentType : "application/json; charset=UTF-8",
	               data : JSON.stringify($("#send").serializeObject()),
	               dataType : "json",
	               async: false,
	               success : function(serverData) {
	            	   var messageContent =  '<div class="message right"><div class="message-text">'
	 		            		   +serverData.content +'</div></div>';
	 		            		   
	            	   $("#messegeBox").append(messageContent);
	            	  
	               },
	               error:function(request,status,error){
	                   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	               }
	        });
	
		};

	$.fn.serializeObject = function()

	{

	   var o = {};

	   var a = this.serializeArray();

	   $.each(a, function() {

	       if (o[this.name]) {

	           if (!o[this.name].push) {

	               o[this.name] = [o[this.name]];

	           }

	           o[this.name].push(this.value || '');

	       } else {

	           o[this.name] = this.value || '';

	       }

	   });

	   return o;

	};

</script>

</head>


<body>


	<div class="container" style=" width: 100%">

		<div class="page-header text-info" style="color: #000000; border-bottom-color: #927490; margin-bottom:0;">
			<img src="../resources/images/Message_Icon.png" width="20px" height="20px" align="left"/><h2> &nbsp;메세지목록</h2>
		</div>
		
		<table class="table table-hover">
			<!--  <div class="row">
				<div class="col-xs-3 col-sm-3 ">
					<h2>
						<b>친구이름</b>
					</h2>
				</div>
				<div class="col-xs-6 col-sm-6 ">
					<h2>
						<b>내용</b>
					</h2>
				</div>
				<div class="hidden-xs">
				<div class="col-xs-3 col-sm-3 ">
					<h2>
						<b>날짜</b>
					</h2>
				</div>
				</div>
			</div>-->

				<c:forEach var="message" items="${list}">
				<div class="row" style="border-bottom:1px solid gray; padding-bottom:30px; padding-top:10px;">
					<input type="hidden" name="roomId" value="${message.roomId }">
							<input type="hidden" value="${message.userId}" name="friendIdinfo"/>
					<h3><a href="/user/getTimeLine?userId=${message.friendId}"  class="col-xs-2 col-sm-2 " style="color: #000000; padding-right:20pt;" name="messageName">
						<img src="../resources/upload_files/images/${message.friendProfileImage}" id="profile" width="70px" height="70px"
				       		style="border-radius: 50%" onerror="this.src='../resources/images/profile_default.png'" align="right" >
						
					</a></h3>
					<h3><div class="col-xs-10 col-sm-10 "style="color: #000000; display: inline-block; height: 60px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; padding-left:15px;"  name="messageContent">
						<div style="margin-bottom: 4pt; float: left;">${message.friendName}</div><p style="line-height: normal; padding-bottom:5px;"align=right>${message.createdDate}</p>
					<c:if test="${message.userId eq sessionScope.user.userId }">
						<div style="font-family: 'Nanum Gothic', serif; font-size: 20px; float: left; cursor: pointer;" name="messageContent" >${message.content }</div>
					</c:if>
					<c:if test="${message.userId ne sessionScope.user.userId }">
						<div style="font-style: italic; float: left; cursor: pointer;" >${message.content }</div>
					</c:if>
						
					</div>
					</h3>
					
				</div>
				</c:forEach>
		</table>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="wrapper">
				<form id="send">
					<div class="phone-containter">
						<div id="phone" class="phone">
							<button type="button" class="close" data-dismiss="modal" varia-hidden="true" id="close" style="display:none;"></button>
							<div id="messegeBox"></div>
						</div>
						<div class="send-container">
							<input type="text" id="msgInput" class="send-input" placeholder="메세지내용" name="content">
							<a href="#" class="send-btn" data-dismiss="modal"  value="Send" style="padding: 20px;">send</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>

</html>