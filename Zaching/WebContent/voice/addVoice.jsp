<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
</head>

<script type="text/javascript" src="../resources/javascript/FileButton.js"></script>

<script>
	$(function() {
		var myFileButton = new FileButton("imageswap", "imagesrc"); //new FileButton
		window.onload = function () { 
			myFileButton.run(); 
		}
		$("select").change(function() {
			
			if($("select option:selected").val() != '1'){
				$(".category1").css("display","none");
			}
			else{
				$(".category1").css("display","block");
			}

			
		});
		$(".makevoiceroom").on('click', function(){
			addVoice();
		});
		
		function addVoice(){
			var title = document.Form.voiceName.value;
			if (title == null || title.length < 1) {
				alert("방 제목을 입력해 주세요!");
				return;
			}
			$("form").attr("method", "POST").attr("action", "/voice/addVoice")
			.submit();
		}
		$("#search").on('click',function() {

							var keyword = $("input[name=searchsong]").val();

							$.ajax({
										url : "/voice/rest/searchVoice",
										method : "POST",
										contentType : "application/json; charset=UTF-8",
										data : JSON.stringify({
											"keyword" : keyword
										}),
										async : false,
										dataType : "json",
										success : function(serverData) {
											var name = "";

											//'<tr><td align="left">'+song.song[i].songName+'</td><td align="left">${user.email}</td></tr>'+
									console.log(serverData.size);
											for (var i = 0; i < 30; i++) {
											
												name = name
														+ '<tr><td align="left"><input type="hidden" id="songId" name="songId" value="'+serverData.melon.songs.song[i].songId+'" /><input type="hidden" id="name" name="name" value="'+serverData.melon.songs.song[i].artists.artist[0].artistName+'" /><input type="hidden" id="title" name="title" value="'+serverData.melon.songs.song[i].songName+'" />'
														+ serverData.melon.songs.song[i].songName
														+ '</td><td align="left">'
														+ serverData.melon.songs.song[i].artists.artist[0].artistName
														+ '</td></tr>';
														
												
											}

											var displayValue = '<div class="list"><table class="table table-hover table-striped"><tr><thead>'
													+ '<tr class="th" align="left">노래제목</tr><tr class="th" align="left">가수명</tr></tr><tbody>'
													+ name
													+ '</tbody></table></div>';

											$(".viewlist").html(displayValue);

											$(".viewlist td")
													.click(
															function() {
																var title = $($("input[name='title']")[$('.viewlist td:nth-child(1)').index(this)]-1).val();
																var name = $($("input[name='name']")[$('.viewlist td:nth-child(1)').index(this)]-1).val();
																var songId = $($("input[name='songId']")[$('.viewlist td:nth-child(1)').index(this)]-1).val();

																$("input[name='selectsong']").val(title);
																$("input[name='selectsinger']").val(name);
																$("input:hidden[name='voicelyrics']").val(songId+"/"+title+"/"+name);
																
																
																
																
																$("input[name='ok']").val(title+ " - "+ name);
																});
										}
									});
						});

		$("#searchsong").on('input', function() {
			if ($("#searchsong").val() == '')
				$("#search").attr("disabled", true);
			else
				$("#search").attr("disabled", false);
		});

	});
</script>
<style>
body {
	padding-top: 130px;
}

body>div.container {
	margin-top: 10px;
}

.modal {
	overflow: inherit;
	overflow-y: inherit;
	text-align: center;
	padding: 0;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal-dialog {
	max-width: 500px;
	padding: 0;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal-content {
	border: 0;
	border-radius: 0;
}

.modal-header {
	border: 0; padding 0;
	position: relative;
}

.modal-header .close {
	margin: 0;
	position: absolute;
	top: -10px;
	right: -10px;
	width: 23px;
	height: 23px;
	border-radius: 23px;
	background-color: #00aeef;
	color: #ffe300;
	font-size: 9px;
	opacity: 1;
	z-index: 10;
}

.modal-content p {
	padding: 0 20px;
}

.modal-body {
	padding: 0 0 10px 0;
	height: 450px;
	overflow: auto;
}

.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 15px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #5F4B8B;
	color: white;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 15px;
	border: none;
	width: 300px;
	color: #000000;
}

.topnav .search-container button {
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	font-size: 15px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

.songSelect{
padding-top: 40px;
background: #fff;
padding-bottom: 80px;
}

.songSelectButton{
background: #fff;

}

.makevoice{
	text-align: left;
	vertical-align: middle;
	align : center;
}

.makevoiceroom {
	-moz-box-shadow:inset 0px 1px 0px 0px #cae3fc;
	-webkit-box-shadow:inset 0px 1px 0px 0px #cae3fc;
	box-shadow:inset 0px 1px 0px 0px #cae3fc;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #4197ee) );
	background:-moz-linear-gradient( center top, #79bbff 5%, #4197ee 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#4197ee');
	background-color:#79bbff;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #469df5;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:100px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 5px #287ace;
}
.makevoiceroom:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4197ee), color-stop(1, #79bbff) );
	background:-moz-linear-gradient( center top, #4197ee 5%, #79bbff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4197ee', endColorstr='#79bbff');
	background-color:#4197ee;
}.makevoiceroom:active {
	position:relative;
	top:1px;
}

.songSelectButton {
	-moz-box-shadow:inset 0px 0px 50px -1px #97c4fe;
	-webkit-box-shadow:inset 0px 0px 50px -1px #97c4fe;
	box-shadow:inset 0px 0px 50px -1px #97c4fe;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0) );
	background:-moz-linear-gradient( center top, #3d94f6 5%, #1e62d0 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0');
	background-color:#3d94f6;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #337fed;
	display:inline-block;
	color:#ffffff;
	font-family:Comic Sans MS;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:100px;
	text-decoration:none;
	text-align:center;
	text-shadow:0px 1px 0px #1570cd;
}
.songSelectButton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6) );
	background:-moz-linear-gradient( center top, #1e62d0 5%, #3d94f6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6');
	background-color:#1e62d0;
}.songSelectButton:active {
	position:relative;
	top:1px;
}
</style>
<body>


<div class="container">
<div class="songSelect">
	<form name='Form' class="form-vertical" enctype="multipart/form-data">
		<input type="hidden" name="userId" value="${user.userId}">
		<input type="hidden" name="voicelyrics" value="">
			<div class="row">
				<div class="form-group" >
					<br/><div></div>
					<div class="col-sm-3 text-center" style="margin: 30px 0 30px 60px;">
						<input type="file" name="uploadFile" imageswap="true" imagesrc="../resources/images/imageButton.PNG"/>
					</div>
					<div class="col-sm-8 text-center" style="margin: 30px 0 30px 0;">
						<input type="text" name=voiceName placeholder="방 제목을 입력해주세요"
							style="font-size: 20px; width: 100%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;" maxlength="30"/><br/>
							<div class="form-group" align="left">
						   <strong style="font-size: 15px">카테고리</strong> <select 	name="categoryCode"	id="categoryCode" class="form-control" 
							style="height: 40px" maxLength="20">
						<option value="R02" selected="selected">노래 이어 부르기</option>
						<option value="R03">글 읽어주기</option>
						<option value="R04">ASMR</option>
						<option value="R05">알림음 만들기</option>
						<option value="R06">프리토킹</option>
					</select>
					<br/>
					<div class="category1">
					<input type="text" name="ok" id="ok" placeholder="무슨 노래인가요?"
							style="font-size: 20px; width: 80%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;" readonly/>
							<button type="button" class="songSelectButton" data-toggle="modal"data-target="#myModal">노래 검색</button>
						  </div></div>
					</div>
				</div>
			</div>
			<div class="makevoice">
			<center>
		<button type="button" class="makevoiceroom">완료</button>
		</center>
		</div>
	</form>
</div>
</div>

	<div class="col-xs-12">
		
	<!-- 
	<input type="text" placeholder="선택된노래" name="selectsong"id="selectsong" value=""> 
	<input type="text"placeholder="가수이름" name="selectsinger" id="selectsinger" value="">
	-->	
	</div>







	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<b>노래를 검색하세요!</b>
					</h4>
				</div>
				<div class="modal-body">
					<div class="topnav">
						<div class="search-container">
							<input type="text" placeholder="제목이나 가수명을 입력하세요"
								name="searchsong" id="searchsong" value="">
							<button type="button" class="btn btn-primary" id="search">검색</button>
							<button type="submit" class="btn btn-primary" data-dismiss="modal" id="select">선택</button>
							<br />
							<div class="viewlist"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="topnav">
						<div class="search-container">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>