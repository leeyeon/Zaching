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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/resources/layout/sub_toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

h2 {
	font-family: 'Nanum Pen Script', cursive;
}

@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

b {
	font-family: 'Nanum Pen Script', cursive;
}

@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

h3 {
	font-family: 'Nanum Pen Script', cursive;
}

body {
	padding-top: 50px;
}

.btn btn-primary {
	
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
</style>


<script type="text/javascript">
	function fncGetUserList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("action", "/message/listMessage")
				.submit();
	}

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

		$("#messageSend").on('click', function() {

			alert("보내기완료");
		});
		

	 	$(document).on('click',"a[name='messageContent']", function() {
	 		var index= $($("input[name=roomId]")[$("a[name='messageContent']").index(this)]).val();
	 		alert(index);	 		

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
		 		            	   for(var i=0; i<serverData.length; i++){
		 		            		 
		 		            		  
		 		            		  if(serverData[i].userId != ${user.userId}){
		 		            			messageContent +=  '<div class="message left"><div class="message-text">'
			 		            		   +serverData[i].content
			 		            		   +'</div></div>';
		 		            		    
		 		            		  }else{
		 		            			messageContent +=  '<div class="message right"><div class="message-text">'
			 		            		   +serverData[i].content
			 		            		   +'</div></div>';
		 		            		  
		 		            		  }
		 		            	   }
	 		            	   } else {
	 		            		   messageContent += "메시지가 없습니다.";
	 		            	   }
	 		            	   $("#messegeBox").html("");
	 		            	   $("#messegeBox").append(messageContent);
	 		            	  $("#messageModal").modal('show');
	 		               },
	 		               error:function(request,status,error){
	 		                   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 		                   
	 		                
	 		               }
	 		            });
	 		
	 	});
		
	 	/*
		$("a[name='messageContent']").on("click", function() {
			alert();
		})
		*/
	

	
		
	
		});
	
		


</script>

</head>


<body>


	<div class="container" style="padding-top: 80px;">

		<div class="page-header text-info" style="color: #000000;">
			<h2>메세지목록</h2>
		</div>

		<div class="row">


			<table class="table table-hover">
				<div class="col-xs-6 col-sm-4 ">
					<h2>
						<b>이름</b>
					</h2>
				</div>
				<div class="col-xs-6 col-sm-4 ">
					<h2>
						<b>내용</b>
					</h2>
				</div>
				<div class="col-xs-6 col-sm-4 ">
					<h2>
						<b>날짜</b>
					</h2>
				</div>



				<c:forEach var="message" items="${list}">
					<input type="hidden" name="roomId" value="${message.roomId }">
					<a href="/user/getTimeLine?userId=${message.friendId}"  class="col-xs-6 col-sm-4 " style="color: #000000;" name="messageName"><h3>${message.friendName }</h3></a>
					<a href="#" class="col-xs-6 col-sm-4 "style="color: #000000;"  name="messageContent"><h3>${message.content }</h3></a>
					<div class="col-xs-6 col-sm-4 ">
						<h3>${message.createdDate }</h3>
					</div>

				</c:forEach>

			</table>

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
									<input type="text" id="msgInput" class="send-input"
										placeholder="메세지내용"> <input type="submit"
										class="send-btn" id="messageSend" value="Send">
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
			</div>
</body>

</html>