<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	out.clear();
%>
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
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
	$(function() {
		var music = document.getElementById('music'); // id for audio element
		var duration = music.duration; // Duration of audio clip, calculated here for embedding purposes
		var pButton = document.getElementById('pButton'); // play button
		var playhead = document.getElementById('playhead'); // playhead
		var timeline = document.getElementById('timeline'); // timeline

		var page = $
		{
			search.currentPage
		}
		;
		var pageSize = $
		{
			search.pageSize
		}
		;

		// timeline width adjusted for playhead
		var timelineWidth = timeline.offsetWidth - playhead.offsetWidth;

		// play button event listenter
		pButton.addEventListener("click", play);

		// timeupdate event listener
		music.addEventListener("timeupdate", timeUpdate, false);

		// makes timeline clickable
		timeline.addEventListener("click", function(event) {
			moveplayhead(event);
			music.currentTime = duration * clickPercent(event);
		}, false);

		// returns click as decimal (.77) of the total timelineWidth
		function clickPercent(event) {
			return (event.clientX - getPosition(timeline)) / timelineWidth;
		}

		// makes playhead draggable
		playhead.addEventListener('mousedown', mouseDown, false);
		window.addEventListener('mouseup', mouseUp, false);

		// Boolean value so that audio position is updated only when the playhead is released
		var onplayhead = false;

		// mouseDown EventListener
		function mouseDown() {
			onplayhead = true;
			window.addEventListener('mousemove', moveplayhead, true);
			music.removeEventListener('timeupdate', timeUpdate, false);
		}

		// mouseUp EventListener
		// getting input from all mouse clicks
		function mouseUp(event) {
			if (onplayhead == true) {
				moveplayhead(event);
				window.removeEventListener('mousemove', moveplayhead, true);
				// change current time
				music.currentTime = duration * clickPercent(event);
				music.addEventListener('timeupdate', timeUpdate, false);
			}
			onplayhead = false;
		}
		// mousemove EventListener
		// Moves playhead as user drags
		function moveplayhead(event) {
			var newMargLeft = event.clientX - getPosition(timeline);

			if (newMargLeft >= 0 && newMargLeft <= timelineWidth) {
				playhead.style.marginLeft = newMargLeft + "px";
			}
			if (newMargLeft < 0) {
				playhead.style.marginLeft = "0px";
			}
			if (newMargLeft > timelineWidth) {
				playhead.style.marginLeft = timelineWidth + "px";
			}
		}

		// timeUpdate
		// Synchronizes playhead position with current point in audio
		function timeUpdate() {
			var playPercent = timelineWidth * (music.currentTime / duration);
			playhead.style.marginLeft = playPercent + "px";
			if (music.currentTime == duration) {
				pButton.className = "";
				pButton.className = "play";
			}
		}

		//Play and Pause
		function play() {
			// start music
			if (music.paused) {
				music.play();
				// remove play, add pause
				pButton.className = "";
				pButton.className = "pause";
			} else { // pause music
				music.pause();
				// remove pause, add play
				pButton.className = "";
				pButton.className = "play";
			}
		}

		// Gets audio file duration
		music.addEventListener("canplaythrough", function() {
			duration = music.duration;
		}, false);

		// getPosition
		// Returns elements left position relative to top-left of viewport
		function getPosition(el) {
			return el.getBoundingClientRect().left;
		}

		$("#inside")
				.scroll(
						function() {
							var elem = $("#inside");
							//alert(elem);
							if (elem[0].scrollHeight - elem.scrollTop() == elem
									.outerHeight()) {
								page++;
								$
										.ajax({
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
														display += '<img src="../resources/images/voiceImages/'
																+ serverData[i].backgroundImage
																+ '" width="100%" height="90pt">';
													else
														display += '<img src="../resources/images/voiceImages/default.jpg" width="100%" height="90pt">';
													display = display
															+ '</div>'
															+ '<div class="col-xs-6 col-lg-7" style="padding-top: 7pt; line-height: 1.5em; height: 80pt;"><a href="#" style="color: black; font-size:12pt;"><strong>'
															+ serverData[i].voiceName
															+ '</strong></a>'
															+ '<br><a href="#" style="color:gray;">'
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

	$("a:contains('가사보기')").on(
			"click",
			function() {
				alert("하이하이");
				var songId = $
				{
					voice.voicelyrics
				}
				;

				showPopup();
				function showPopup() {
					window.open(
							"http://www.melon.com/webplayer/mini.htm?contsIds="
									+ songId + "&contsType=S", "a",
							"width=410px, height=700px, left=1000, top=50");
				}

			});
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
}

#audioplayer {
	width: 480px;
	height: 60px;
}

#pButton {
	height: 60px;
	width: 60px;
	border: none;
	background-size: 50% 50%;
	background-repeat: no-repeat;
	background-position: center;
	float: left;
	outline: none;
}

.play {
	background: url('http://www.alexkatz.me/codepen/img/play.png');
}

.pause {
	background: url('http://www.alexkatz.me/codepen/img/pause.png');
}

#timeline {
	width: 400px;
	height: 20px;
	margin-top: 20px;
	float: left;
	border-radius: 15px;
	background: rgba(0, 0, 0, .3);
}

#playhead {
	width: 18px;
	height: 18px;
	border-radius: 50%;
	margin-top: 1px;
	background: rgba(0, 0, 0, 1);
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
</style>
</head>


<body>


	<div class="container">

		<div class="blog-header">
			<h1 class="blog-title">자췽 라디오</h1>
			<p class="lead blog-description">음성을 녹음해보세요!</p>
		</div>

		<div class="row">

			<div class="col-sm-8 blog-main"
				style="overflow-x: hidden; height: 700px; background: url('../resources/images/suzi.jpg'); background-size: 100% 100%; padding-right: 0px; padding-left: 0px;">
				<div class="img-cover"></div>
				<div class="blog-post">
					<h3 class="blog-post-title">&nbsp;${voice.voiceName}</h3>
					<p class="blog-post-meta"
						style="background-color: black; opacity: 0.5;">
						사진사진 <a href="#">이름</a>
					</p>
					<div style="padding-right: 15px; padding-left: 15px;">
						<c:if test="${voice.categoryCode == 'R02'}">
							<a href='#' class="lyrics">가사보기</a>
						</c:if>
						<hr>

						<c:set var="i" value="0" />
						<c:forEach var="reply" items="${comment}">
							<c:set var="i" value="${ i+1 }" />
							<blockquote style="vertical-align: middle;">
								<div
									style="display: -webkit-inline-box; vertical-align: middle;">
									<img alt="" src="../resources/images/${reply.userImage}"
										width="40" height="40">${reply.userName}&nbsp;
									<audio id="music" style="display: hidden;">
										<source
											src="../resources/upload_files/record/${reply.content}"
											type="audio/mpeg">
									</audio>

									<div id="audioplayer">
										<button id="pButton" class="play" onclick="play()"></button>
										<div id="timeline">
											<div id="playhead"></div>
										</div>
									</div>

								</div>
							</blockquote>
						</c:forEach>
						<blockquote style="vertical-align: middle;">
							<div style="display: -webkit-inline-box; vertical-align: middle;">
								<img alt="" src="../resources/images/suzi.jpg" width="40"
									height="40">수지&nbsp;
								<audio id="music" preload="true" style="display: hidden;">
									<source src="../resources/upload_files/record/Ailee.mp3"
										type="audio/mpeg">
								</audio>

								<div id="audioplayer">
									<button id="pButton" class="play" onclick="play()"></button>
									<div id="timeline">
										<div id="playhead"></div>
									</div>
								</div>

							</div>
						</blockquote>
						<blockquote style="align: middle;">
							<div>
								<img alt="" src="../resources/images/suzi.jpg" width="40"
									height="40">수지&nbsp;
								<audio controls="controls">
									<source src="../resources/upload_files/record/Ailee.mp3"
										type="audio/mpeg">
								</audio>
							</div>
						</blockquote>
						<blockquote style="align: middle;">
							<div>
								<img alt="" src="../resources/images/suzi.jpg" width="40"
									height="40">수지&nbsp;
								<audio controls="controls">
									<source src="../resources/upload_files/record/Ailee.mp3"
										type="audio/mpeg">
								</audio>
							</div>
						</blockquote>
						<blockquote style="align: middle;">
							<div>
								<img alt="" src="../resources/images/suzi.jpg" width="40"
									height="40">수지&nbsp;
								<audio controls="controls">
									<source src="../resources/upload_files/record/Ailee.mp3"
										type="audio/mpeg">
								</audio>
							</div>
						</blockquote>
						<blockquote style="align: middle;">
							<div>
								<img alt="" src="../resources/images/suzi.jpg" width="40"
									height="40">수지&nbsp;
								<audio controls="controls">
									<source src="../resources/upload_files/record/Ailee.mp3"
										type="audio/mpeg">
								</audio>
							</div>
						</blockquote>
						<blockquote style="align: middle;">
							<div>
								<img alt="" src="../resources/images/suzi.jpg" width="40"
									height="40">수지&nbsp;
								<audio controls="controls">
									<source src="../resources/upload_files/record/Ailee.mp3"
										type="audio/mpeg">
								</audio>
							</div>
						</blockquote>
						<blockquote style="align: middle;">
							<div>
								<img alt="" src="../resources/images/suzi.jpg" width="40"
									height="40">수지&nbsp;
								<audio controls="controls">
									<source src="../resources/upload_files/record/Ailee.mp3"
										type="audio/mpeg">
								</audio>
							</div>
						</blockquote>

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
							보기</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp;<a href="#" style="color: gray; font-size: 12px;"><i
							class="glyphicon glyphicon-refresh"></i>새로고침</a>
					</div>
					<div
						style="overflow-x: hidden; height: 623px; margin-right: -15px; padding-top: 10pt;"
						id="inside">
						<div class="col-xs-12 col-sm-12">
							<div class="row" id="voiceList">
								<c:set var="i" value="0" />
								<c:forEach var="voice" items="${list}">
									<c:set var="i" value="${ i+1 }" />
									<div class="col-xs-6 col-lg-5"
										style="padding-left: 0pt; padding-right: 0pt">
										<c:if test="${!empty voice.backgroundImage}">
											<img
												src="../resources/images/voiceImages/${voice.backgroundImage}"
												width="100%" height="90pt">
										</c:if>
										<c:if test="${empty voice.backgroundImage}">
											<img src="../resources/images/voiceImages/default.jpg"
												width="100%" height="90pt">
										</c:if>
									</div>
									<div class="col-xs-6 col-lg-7"
										style="padding-top: 7pt; line-height: 1.5em; height: 80pt;">
										<a href="#" style="color: black; font-size: 12pt;"><strong>${voice.voiceName}</strong></a><br>
										<a href="#" style="color: gray;">${voice.userName}<br></a>
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
		data-toggle="modal" data-target="#myModal">



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
						<b>녹음하기</b>
					</h4>
					<div class="modal-body">
						<button onclick="startRecording(this);">record</button>
						<button onclick="stopRecording(this);" disabled>stop</button>

						<h2>Recordings</h2>
						<ul id="recordingslist"></ul>

						<h2>Log</h2>
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
			__log('Recording...');
		}

		function stopRecording(button) {
			recorder && recorder.stop();
			button.disabled = true;
			button.previousElementSibling.disabled = false;
			__log('Stopped recording.');

			// create WAV download link using audio data blob
			createDownloadLink();

			recorder.clear();
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

				au.controls = true;
				au.src = url;
				hf.href = url;
				hf.download = new Date().toISOString() + '.wav';
				hf.innerHTML = hf.download;
				li.appendChild(au);
				li.appendChild(hf);
				recordingslist.appendChild(li);

				//alert(hf.download);
				//alert(au.src);
				//alert(hf);
				link = hf.href;
				alert(hf.href);
				alert(hf.download);
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '/voice/json/testUpload', true);
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
				//var myFile = blobToFile(blob, hf.download);
				// var myFile = new File(blob, hf.download);
				//alert(myFile);
				/*$.ajax({
					url : "/voice/json/testUpload",
					method : "POST" ,
					 contentType : "application/json; charset=UTF-8",
				        async : false,
				        dataType : "json",
				        data : JSON.stringify({
				        	"link" : link,
				        	"fileName" : hf.download,
				        	"blob" : myFile
				        }),
				        success : function(serverData) {
				        	
				        	alert(serverData);
				           
				        }
				});*/
				//self.location="/voice/testUpload?link="+hf+"&fileName="+hf.download;
			});
		}

		window.onload = function init() {
			try {
				// webkit shim
				window.AudioContext = window.AudioContext
						|| window.webkitAudioContext;
				navigator.getUserMedia = navigator.getUserMedia
						|| navigator.webkitGetUserMedia;
				window.URL = window.URL || window.webkitURL;

				audio_context = new AudioContext;
				__log('Audio context set up.');
				__log('navigator.getUserMedia '
						+ (navigator.getUserMedia ? 'available.'
								: 'not present!'));
			} catch (e) {
				alert('No web audio support in this browser!');
			}

			navigator.getUserMedia({
				audio : true
			}, startUserMedia, function(e) {
				__log('No live audio input: ' + e);
			});
		};
	</script>

	<script src="../resources/javascript/recorder.js"></script>

</body>
</html>
