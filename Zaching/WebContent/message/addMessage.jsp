<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="robots" content="noindex">
  <link rel="canonical" href="Like iOS Messages.html">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>


<script language="javascript" type="text/javascript">  
$('#build').bind('click', function () {
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
$('#send').bind('submit', function () {
	var msgText = $('#msgInput').val();
	$('#msgInput').val('');
	if (msgText != '')
		addMsg(1, msgText);
	$('#phone').animate({ scrollTop: $('#phone').height() }, 600);
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
		$_phone.append($('<div>').addClass('message ' + side).append($('<div>').addClass('message-text').text(msg)));
	}
}

</script>  
  


        
        <style>
        
        	body {
        		padding-top: 50px;
        	}
        
        .btn btn-primary{
        
        
        }
        
        
        html, body {height: 98%; position: relative; margin: 0;}
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

	.message-text:last-child:before,
	.message-text:last-child:after {
	  content: '';
	  position: absolute;
	  bottom: 0;
	  width: 35px;
	  height: 25px;
	  z-index: -1;
	}

	.message.right .message-text:before,
	.message.right .message-text:after {
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


	.message.left .message-text:before,
	.message.left .message-text:after {
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
        
        </head>
        <body>
        
<div class="container">

  <div class="row">
    <div class="col-xs-12">
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">메세지</button>
      </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
   <div class="wrapper">
	

		<!-- 왼쪽 메세지 대화 박스 -->
		<div class="phone-containter">
			<div id="phone" class="phone">
				<div class="message left">
					<div class="message-text">안녕</div>
				</div>
				<div class="message right">
					<div class="message-text">오랜만이네</div>
					<div class="message-text">잘지내냐?</div>
				</div>
				<div class="message left">
					<div class="message-text">그렇지뭐 오늘 시간괜찮으면 밥이나 먹자</div>
				</div>
					<div class="message right">
					<div class="message-text">좋지 어디서먹을까 강남?</div>
				</div>
				<div class="message left">
					<div class="message-text">그래 그럼 5시까지 보자</div>
				</div>
				<div class="message right">
					<div class="message-text">오케이 있다봐</div>
				</div>
			</div>
			
			<!-- 메세지 작성 -->
			<div class="send-container">
				<form id="send">
					<input type="text" id="msgInput" class="send-input" placeholder="메세지내용">
					<input type="submit" class="send-btn" value="Send">
				</form>
			</div>
		</div>
	</div>

</html>