<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title></title>
<jsp:include page="../resources/layout/sub_toolbar.jsp" />
<!-- Bootstrap core CSS -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- 부가적인 테마 -->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<link rel="stylesheet" href="../resources/css/audioStyle.css">


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
	document.addEventListener("DOMContentLoaded", theDOMHasLoaded, false);
	


	
	var files = new Array();
	var replyImage = new Array();
	var replyuserName = new Array();
	var replyUserId = new Array();
	
	 <c:set var="i" value="0" />
			<c:forEach var="reply" items="${comment}">
				<c:set var="i" value="${ i+1 }" />
				files[${i-1}] = "${reply.content}";
				replyImage[${i-1}] = "${reply.userImage}";
				replyuserName[${i-1}] = "${reply.userName}";
				replyUserId[${i-1}] = "${reply.userId}";
			</c:forEach>

	// array of audio files (stored in a folder called audio)
	
	
	///////////////////////////////////////////////
	// Find and store audio info
	///////////////////////////////////////////////
	
	// array for AudioObjects
	var audioList = [];
	// components and the index for their AudioObject
	var componentDict = {};
	// store AudioObject that is currently playing
	var playingAudio = null;
	// store playhead id if one is being dragged
	var onplayhead = null;
	
	/* AudioObject Constructor */
	function AudioObject(audio, duration) {
		this.audio = audio;
		this.id = audio.id;
		this.duration = duration;
	}
	/* bindAudioPlayer
	 * Store audioplayer components in correct AudioObject
	 * num identifes correct audioplayer
	 */
	AudioObject.prototype.bindAudioPlayer = function (num) {
		this.audioplayer = document.getElementById("audioplayer-" + num);
		this.playbutton = document.getElementById("playbutton-" + num);
		this.timeline = document.getElementById("timeline-" + num);
		this.playhead = document.getElementById("playhead-" + num);
		this.timelineWidth = this.timeline.offsetWidth - this.playhead.offsetWidth;
	}
	
	/* addEventListeners() */
	AudioObject.prototype.addEventListeners = function () {
		this.audio.addEventListener("timeupdate", AudioObject.prototype.timeUpdate, false);
		this.audio.addEventListener("durationchange", AudioObject.prototype.durationChange, false);
		this.timeline.addEventListener("click", AudioObject.prototype.timelineClick, false);
		this.playbutton.addEventListener("click", AudioObject.prototype.pressPlay, false);
		// Makes playhead draggable 
		this.playhead.addEventListener('mousedown', AudioObject.prototype.mouseDown, false);
		window.addEventListener('mouseup', mouseUp, false);
	}
	
	/* populateAudioList */
	function populateAudioList() {
		var audioElements = document.getElementsByClassName("audio");
		for (i = 0; i < audioElements.length; i++) {
			audioList.push(
				new AudioObject(audioElements[i], 0)
			);
			audioList[i].bindAudioPlayer(i);
			audioList[i].addEventListeners();
		}
	}
	
	/* populateComponentDictionary() 
	 * {key=element id : value=index of audioList} */
	function populateComponentDictionary() {
		for (i = 0; i < audioList.length; i++) {
			componentDict[audioList[i].audio.id] = i;
			componentDict[audioList[i].playbutton.id] = i;
			componentDict[audioList[i].timeline.id] = i;
			componentDict[audioList[i].playhead.id] = i;
		}
	}
	///////////////////////////////////////////////
	// Update Audio Player
	///////////////////////////////////////////////
	
	/* durationChange
	 * set duration for AudioObject */
	AudioObject.prototype.durationChange = function () {
		var ao = audioList[getAudioListIndex(this.id)];
		ao.duration = this.duration;
	}
	
	/* pressPlay() 
	 * call play() for correct AudioObject
	 */
	AudioObject.prototype.pressPlay = function () {
		var index = getAudioListIndex(this.id);
		audioList[index].play();
	}
	
	/* play() 
	 * play or pause selected audio, if there is a song playing pause it
	 */
	AudioObject.prototype.play = function () {
		if (this == playingAudio) {
			playingAudio = null;
			this.audio.pause();
			changeClass(this.playbutton, "playbutton play");
		}
		// else check if playing audio exists and pause it, then start this
		else {
			if (playingAudio != null) {
				playingAudio.audio.pause();
				changeClass(playingAudio.playbutton, "playbutton play");
			}
			this.audio.play();
			playingAudio = this;
			changeClass(this.playbutton, "playbutton pause");
		}
	}
	
	/* timelineClick()
	 * get timeline's AudioObject
	 */
	AudioObject.prototype.timelineClick = function (event) {
		var ao = audioList[getAudioListIndex(this.id)];
		ao.audio.currentTime = ao.audio.duration * clickPercent(event, ao.timeline, ao.timelineWidth);
	}
	
	/* mouseDown */
	AudioObject.prototype.mouseDown = function (event) {
		onplayhead = this.id;
		var ao = audioList[getAudioListIndex(this.id)];
		window.addEventListener('mousemove', AudioObject.prototype.moveplayhead, true);
		ao.audio.removeEventListener('timeupdate', AudioObject.prototype.timeUpdate, false);
	}
	
	/* mouseUp EventListener
	 * getting input from all mouse clicks */
	function mouseUp(e) {
		if (onplayhead != null) {
			var ao = audioList[getAudioListIndex(onplayhead)];
			window.removeEventListener('mousemove', AudioObject.prototype.moveplayhead, true);
			// change current time
			ao.audio.currentTime = ao.audio.duration * clickPercent(e, ao.timeline, ao.timelineWidth);
			ao.audio.addEventListener('timeupdate', AudioObject.prototype.timeUpdate, false);
		}
		onplayhead = null;
	}
	
	/* mousemove EventListener
	 * Moves playhead as user drags */
	AudioObject.prototype.moveplayhead = function (e) {
		var ao = audioList[getAudioListIndex(onplayhead)];
		var newMargLeft = e.pageX - ao.timeline.offsetLeft;
		if (newMargLeft >= 0 && newMargLeft <= ao.timelineWidth) {
			document.getElementById(onplayhead).style.marginLeft = newMargLeft + "px";
		}
		if (newMargLeft < 0) {
			playhead.style.marginLeft = "0px";
		}
		if (newMargLeft > ao.timelineWidth) {
			playhead.style.marginLeft = ao.timelineWidth + "px";
		}
	}
	
	/* timeUpdate 
	 * Synchronizes playhead position with current point in audio 
	 * this is the html audio element
	 */
	AudioObject.prototype.timeUpdate = function () {
		// audio element's AudioObject
		var ao = audioList[getAudioListIndex(this.id)];
		var playPercent = ao.timelineWidth * (ao.audio.currentTime / ao.duration);
		ao.playhead.style.marginLeft = playPercent + "px";
		// If song is over
		if (ao.audio.currentTime == ao.duration) {
			changeClass(ao.playbutton, "playbutton play");
			ao.audio.currentTime = 0;
			ao.audio.pause();
			playingAudio = null;
		}
	}
	
	///////////////////////////////////////////////
	// Utility Methods
	///////////////////////////////////////////////
	
	/* changeClass 
	 * overwrites element's class names */
	function changeClass(element, newClasses) {
		element.className = newClasses;
	}
	
	/* getAudioListIndex
	 * Given an element's id, find the index in audioList for the correct AudioObject */
	function getAudioListIndex(id) {
		return componentDict[id];
	}
	
	/* clickPercent()
	 * returns click as decimal (.77) of the total timelineWidth */
	function clickPercent(e, timeline, timelineWidth) {
		return (e.pageX - timeline.offsetLeft) / timelineWidth;
	}
	
	///////////////////////////////////////////////
	// GENERATE HTML FOR AUDIO ELEMENTS AND PLAYERS
	///////////////////////////////////////////////
	
	/* 	var audioString = "<div id=\"audio-players\">"+ "<div class=\"container\"><div class=\"card\"><div class=\"col-xs-1\"><img alt=\"\" src=\"../resources/images/"+replyImage[f]+"\"width=\"40\" height=\"40\">"+replyuserName[f]+"&nbsp;</div>"
			+"<div class=\"col-xs-10\"><audio id=\"audio-" + f + "\" class=\"audio\" preload=\"true\"><source src=\"../resources/upload_files/record/" + files[f] + "\"></audio></div></div></div></div>";
 */
	function createAudioElements() {
		 

		for (f in files) {
			
			var audioString = "<blockquote><div id=\"audio-players\">"+ "<div class=\"col-sm-3\"><a href=\"/user/getTimeLine?userId="+replyUserId[f]+"\" style=\"color: #fff; text-decoration: none;\"><img alt=\"\" src=\"../resources/upload_files/images/"+replyImage[f]+"\"width=\"40\" height=\"40\" style=\"border-radius: 50%;\">&nbsp;&nbsp;"+replyuserName[f]+"</div></a>&nbsp;"
			+"<div class=\"col-sm-3\"><audio id=\"audio-" + f + "\" class=\"audio\" preload=\"true\"><source src=\"../resources/upload_files/record/" + files[f] + "\"></audio>"+
			"<div id=\"audioplayer-" + f + "\" class=\"audioplayer\"><button id=\"playbutton-" + f + "\" class=\"play playbutton\"></button><div id=\"timeline-" + f + "\" class=\"timeline\"><div id=\"playhead-" + f + "\" class=\"playhead\"></div></div></div></div></blockquote><br/>";

			
			$("#jinsubaby").append(audioString);
			
			
			//var playerString = "<div id=\"audioplayer-" + f + "\" class=\"audioplayer\"><button id=\"playbutton-" + f + "\" class=\"play playbutton\"></button><div id=\"timeline-" + f + "\" class=\"timeline\"><div id=\"playhead-" + f + "\" class=\"playhead\"></div></div><br/></div></blockquote>";
			//$("#jinsubaby").append(playerString);
			
		}
		
		
	}
	
	/* createAudioPlayers
	 * create audio players for each file in files */
	
	
	/* theDOMHasLoaded()
	 * Execute when DOM is loaded */
	function theDOMHasLoaded(e) {
		// Generate HTML for audio elements and audio players
		createAudioElements();
		
	
		// Populate Audio List
		populateAudioList();
		populateComponentDictionary();
	}

	$(function() {
		
		
		$("a:contains('가사보기')").on("click",function() {
			var songId = ${voice.voicelyrics};
			showPopup();
			function showPopup() {
				window.open("http://www.melon.com/webplayer/mini.htm?contsIds="	+ songId + "&contsType=S", "a","width=410px, height=700px, left=1000, top=50");
			}
			
		});
		      
		var page = ${search.currentPage};
		var pageSize = ${search.pageSize};

		$("#inside").scroll(function() {
							var elem = $("#inside");
							//alert(elem);
							if (elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight()) {
								page++;
								$.ajax({
											url : "/voice/json/listVoice",
											method : "POST",
											contentType : "application/json; charset=UTF-8",
											data : JSON.stringify({
												"currentPage" : page,
												"pageSize" : pageSize
											}),
											async : false,
											dataType : "json",
											success : function(serverData) {
												var display = '';
												for (var i = 0; i < serverData.length; i++) {
													display = display
															+ '<div class="col-xs-6 col-lg-5" style="padding-left: 0pt; padding-right: 0pt">';
													if (serverData[i].backgroundImage)
														display += '<a href="/voice/getVoice?voiceId='+serverData[i].voiceId+'"><img src="../resources/images/voiceImages/'
																+ serverData[i].backgroundImage
																+ '" width="100%" height="90pt">';
													else
														display += '<img src="../resources/images/voiceImages/default.jpg" width="100%" height="90pt">';
													display = display
															+ '</a></div>'
															+ '<div class="col-xs-6 col-lg-7" style="padding-top: 7pt; line-height: 1.5em; height: 80pt;"><a href="/voice/getVoice?voiceId='+serverData[i].voiceId+'" style="color: black; font-size:12pt;"><strong>'
															+ serverData[i].voiceName
															+ '</strong></a>'
															+ '<br><a href="/user/getTimeLine?userId='+serverData[i].userId+'" style="color:gray;">'
															+ serverData[i].userName
															+ '<br></a>'
															+ '<p5 style="color: gray;"><i class="fas fa-play-circle"></i>&nbsp;'
															+ serverData[i].countReply
															+ '</p5><br></div>';
												}
												$("#voiceList").append(display);
											}
										})
							}
						});
		
		

		
	})
	$(function(){
		$(".fas fa-pause").hide();
	})
	
</script>
<style>
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

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1;
}

.blog-post {
	position: absolute;
	color: white;
	z-index: 2;
	width: 100%;
}

#fixedbtn {
	position: fixed;
	right: 100px;
	bottom: 50px;
	z-index: 1000
}

.lyrics {
	background-color: #ffffff;
	-moz-border-radius: 28px;
	-webkit-border-radius: 28px;
	border-radius: 28px;
	border: 1px solid #a8a3a8;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 13px;
	padding: 4px 12px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.lyrics:hover {
	background-color: #f6f6f6;
}

.lyrics:active {
	position: relative;
	top: 1px;
}

 ul { list-style: none; }
    #recordingslist audio { display: block; margin-bottom: 10px; }
 
 div.blog-main{
 background-color: rgba(0, 0, 0, 0.3);
 
 }
 .container{
 	padding-right: 0px;
 }
 
 #jinsubaby > blockquote{
    padding-top: 0px;
    padding-bottom: 15px;
}
.nav a{
font-family: 'Hanna', serif;"
}

.pre{
background-color:#fff;
}
</style>
</head>


<body>

	
	<div class="container">

		<div class="blog-header">
			<h1 class="blog-title">자췽 라디오</h1>
			<p class="lead blog-description">음성을 녹음해보세요!</p>
		</div>

		<div class="row" >

			<div class="col-sm-8 blog-main"
				style=" height: 700px; background: url('../resources/images/voiceImages/${voice.backgroundImage}'); background-size: 100% 100%; padding-right: 0px; padding-left: 0px;">
				<div class="img-cover" style="  background-size: cover;  background-color: rgba(0, 0, 0, 0.3);">
				<div class="blog-post">
					<h2 class="blog-post-title">&nbsp;${voice.voiceName} </h2>
					<p class="blog-post-meta"
						style="background-color: black; opacity: 0.5; width:100%; padding:8pt;">
						 <a href="/user/getTimeLine?userId=${voice.userId}" style="font-size: 14pt; text-decoration: none; color:#fff;"><img src="../resources/upload_files/images/${voice.profileImage}" style="border-radius: 10px; width:20pt; height:20pt; border-radius: 50%;">&nbsp;${voice.userName}</a>
					</p>
					<div style=" height: 600px; overflow-y: scroll; padding-right: 15px; padding-left: 15px;">
						<c:if test="${voice.categoryCode == 'R02'}">
							<a href='#' class="lyrics">가사보기</a>
						</c:if>
						<hr >
						
						<div id="jinsubaby"></div>
						
					
					
						
					
						
					</div>
					</div>
				</div>
				
			</div>
			<!-- /.blog-main -->
			<div class="hidden-xs">
				<div class="col-sm-3 col-sm-offset-1 blog-sidebar"
					style="height: 700px; border: 1px solid #A4A4A4; margin-left: 1%; width: 31%;">

					<div
						style="border: 1px solid #A4A4A4; padding: 10pt; margin-top: -1pt; margin-right: -16px; margin-left: -16px; vertical-align: middle;">
						<strong style="padding-left: 5px; font-size: 15pt"> 최신 글
							보기</strong>
					</div>
					<div
						style="overflow-x: hidden; height: 623px; margin-right: -15px; padding-top: 10pt;"
						id="inside">
						<div class="col-xs-12 col-sm-12">
							<div class="row" id="voiceList">
								<c:set var="i" value="0" />
								<c:forEach var="voice" items="${list}">
									<c:set var="i" value="${ i+1 }" />
									
									<div class="col-xs-6 col-lg-5" style="padding-left: 0pt; padding-right: 0pt">
										<a href="/voice/getVoice?voiceId=${voice.voiceId}" style="z-index: 1000;">
										<c:if test="${!empty voice.backgroundImage}">
											<img src="../resources/images/voiceImages/${voice.backgroundImage}" width="100%" height="90pt">
										</c:if>
										<c:if test="${empty voice.backgroundImage}">
											<img src="../resources/images/voiceImages/default.jpg" width="100%" height="90pt">
										</c:if>
									</a>
									</div>
										
									<div class="col-xs-6 col-lg-7" style="padding-top: 7pt; line-height: 1.5em; height: 80pt;">
										<a href="/voice/getVoice?voiceId=${voice.voiceId}" style="color: black; font-size: 12pt;"><strong>${voice.voiceName}</strong></a><br>
										<a href="/user/getTimeLine?userId=${voice.userId}" style="color: gray;">${voice.userName}</a><br>
										<p5 style="color: gray;">
										<i class="fas fa-play-circle"></i>&nbsp;${voice.countReply}</p5>
										<br>
									</div>
								</c:forEach>



							</div>

						</div>
						<!-- /.blog-sidebar -->
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->




	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<footer> </footer>

	<img src="../resources/images/microphone.png" id="fixedbtn"
		data-toggle="modal" data-target="#myModal" style="width:100px;">



	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel" style="font-family: 'Hanna', serif;">
						<b>녹음하기</b>
					</h4>
					<div class="modal-body">
						<i class="fas fa-pause" id="pause" style="font-size: 26px;"></i>
						<button onclick="startRecording(this);" style="background: white; border: none; font-size: 26px;" ><i class="fas fa-play" id="start"></i></button>
						<button onclick="stopRecording(this);"  style="background: white; border: none; font-size: 26px;" disabled><i class="fas fa-stop" id="stop"></i></button>


						<ul id="recordingslist"></ul>

						<pre id="log"></pre>
						
						
						
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


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		function __log(e, data) {
			log.innerHTML += "\n" + e + " " + (data || '');
		}

		var audio_context;
		var recorder;
		var link = 456;

		function startUserMedia(stream) {
			var input = audio_context.createMediaStreamSource(stream);
			__log('Media stream created.');

			// Uncomment if you want the audio to feedback directly
			//input.connect(audio_context.destination);
			//__log('Input connected to audio context destination.');

			recorder = new Recorder(input);
			__log('Recorder initialised.');
		}

		function startRecording(button) {
			recorder && recorder.record();
			button.disabled = true;
			button.nextElementSibling.disabled = false;
			__log('녹음중입니다...');
			$("#pause").show();
			$("#start").hide();
			$("#stop").show();
		}

		function stopRecording(button) {
			recorder && recorder.stop();
			button.disabled = true;
			button.previousElementSibling.disabled = false;
			__log('Stopped recording.');

			// create WAV download link using audio data blob
			createDownloadLink();

			recorder.clear();
			$("#pause").hide();
			$("#start").show();
		}

		function blobToFile(theBlob, fileName) {
			//A Blob() is almost a File() - it's just missing the two properties below which we will add
			theBlob.lastModifiedDate = new Date();
			theBlob.name = fileName;
			return theBlob;
		}

		function createDownloadLink() {
			recorder && recorder.exportWAV(function(blob) {
				//alert(blob);
				var url = URL.createObjectURL(blob);
				var li = document.createElement('li');
				var au = document.createElement('audio');
				var hf = document.createElement('a');
				var uploadButton = document.createElement('input');
				
				uploadButton.type = 'button';
				uploadButton.value = '등록';
				uploadButton.onclick = function(){
					var xhr = new XMLHttpRequest();
					xhr.open('POST', '/voice/json/testUpload/${user.userId}/${voice.voiceId}/${voice.categoryCode}/'+hf.download, true);
					xhr.onload = function(e) {
						console.log("loaded");
					};
					xhr.onreadystatechange = function() {
						console.log("state : " + xhr.readyState);
					};

					xhr.upload.onprogress = function(e) {
						console.log("uploading.....");
					};
					xhr.setRequestHeader("Content-Type", "audio/wav");
					xhr.send(blob);
					
					window.location.reload();
				}

				au.controls = true;
				au.src = url;
				hf.href = url;
				hf.download = new Date().toISOString() + '.wav';
				hf.innerHTML = '녹음파일 다운';
				li.appendChild(au);
				li.appendChild(hf);
				li.appendChild(uploadButton);
				recordingslist.appendChild(li);

				//alert(hf.download);
				//alert(au.src);
				//alert(hf);
				link = hf.href;
				alert(hf.href);
				alert(hf.download);
				
				
			});
		}
			
		$("#pause").hide();
		$("#start").hide();
		$("#stop").hide();
		
		window.onload = function init() {
			try {
				// webkit shim
				
				window.AudioContext = window.AudioContext
						|| window.webkitAudioContext;
				navigator.getUserMedia = navigator.getUserMedia
						|| navigator.webkitGetUserMedia;
				window.URL = window.URL || window.webkitURL;

				audio_context = new AudioContext;
				__log('녹음 준비중... '
						+ (navigator.getUserMedia ? 'available.'
								: 'not present!'));
				
				$("#start").show();

				
			} catch (e) {
				alert('보이스리플을 이용하시려면 크롬으로 이동해주세요.');
				
			}

			navigator.getUserMedia({
				audio : true
			}, startUserMedia, function(e) {
				__log('마이크 장치가 없습니다');
				$("#pause").hide();
				$("#start").hide();
				$("#stop").hide();
			});
		}
	</script>
	
	<script src="../resources/javascript/recorder.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="../resources/javascript/audioplayer.js"></script>
</body>
</html>
