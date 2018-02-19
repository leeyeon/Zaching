<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width; initial-scale=1.5; user-scalable=no;">
		<title>jPlayer - Circle Player</title>

		<link rel="stylesheet" href="../resources/css/not.the.skin.css">
		<link rel="stylesheet" href="../resources/css/circle.skin/circle.player.css">

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
		<script type="text/javascript" src="../resources/javascript/jquery.transform2d.js"></script>
		<script type="text/javascript" src="../resources/javascript//jquery.grab.js"></script>
		<script type="text/javascript" src="../resources/javascript//jquery.jplayer.js"></script>
		<script type="text/javascript" src="../resources/javascript//mod.csstransforms.min.js"></script>
		<script type="text/javascript" src="../resources/javascript//circle.player.js"></script>
		<!--<script type="text/javascript" src="https://getfirebug.com/firebug-lite.js"></script>-->

		<script type="text/javascript">
		$(document).ready(function(){
			var myCirclePlayer = new Array();
			alert(${comment.size()});
			/*
			 * Instance CirclePlayer inside jQuery doc ready
			 *
			 * CirclePlayer(jPlayerSelector, media, options)
			 *   jPlayerSelector: String - The css selector of the jPlayer div.
			 *   media: Object - The media object used in jPlayer("setMedia",media).
			 *   options: Object - The jPlayer options.
			 *
			 * Multiple instances must set the cssSelectorAncestor in the jPlayer options. Defaults to "#cp_container_1" in CirclePlayer.
			 */
			 
			for(i=1; i<${comment.size()}+1; i++){
				myCirclePlayer[i] = new CirclePlayer('#jquery_jplayer_'+i,
						{
							m4a: "http://www.jplayer.org/audio/m4a/Miaow-07-Bubble.m4a",
							oga: "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg"
						}, {
							cssSelectorAncestor: '#cp_container_'+i
						});
			}
		
			/*var myCirclePlayer = new CirclePlayer("#jquery_jplayer_1",
			{
				m4a: "http://www.jplayer.org/audio/m4a/Miaow-07-Bubble.m4a",
				oga: "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg"
			}, {
				cssSelectorAncestor: "#cp_container_1"
			});

			// This code creates a 2nd instance. Delete if not required.

			var myOtherOne = new CirclePlayer("#jquery_jplayer_2",
			{
				m4a:"http://www.jplayer.org/audio/m4a/Miaow-04-Lismore.m4a",
				oga:"http://www.jplayer.org/audio/ogg/Miaow-04-Lismore.ogg"
			}, {
				cssSelectorAncestor: "#cp_container_2"
			});
			
			var myOtherOne2 = new CirclePlayer("#jquery_jplayer_3",
					{
						m4a:"http://www.jplayer.org/audio/m4a/Miaow-04-Lismore.m4a",
						oga:"http://www.jplayer.org/audio/ogg/Miaow-04-Lismore.ogg"
					}, {
						cssSelectorAncestor: "#cp_container_3"
					});*/
		});
		</script>
	</head>
	<body>

		<c:set var="i" value="0" />
				<c:forEach var="reply" items="${comment}">
					<c:set var="i" value="${ i+1 }" />
					<div id="jquery_jplayer_${i}" class="cp-jplayer"></div>
					
				</c:forEach>
		<!-- <div id="jquery_jplayer_1" class="cp-jplayer"></div>

		<div id="jquery_jplayer_2" class="cp-jplayer"></div>-->
		
		

		<div class="prototype-wrapper"> <!-- A wrapper to emulate use in a webpage and center align -->


			<!-- The container for the interface can go where you want to display it. Show and hide it as you need. -->
			<c:set var="i" value="0" />
						<c:forEach var="reply" items="${comment}">
							<c:set var="i" value="${ i+1 }" />
							<div id="cp_container_${i}" class="cp-container">
								<div class="cp-buffer-holder"> <!-- .cp-gt50 only needed when buffer is > than 50% -->
									<div class="cp-buffer-1"></div>
									<div class="cp-buffer-2"></div>
								</div>
								<div class="cp-progress-holder"> <!-- .cp-gt50 only needed when progress is > than 50% -->
									<div class="cp-progress-1"></div>
									<div class="cp-progress-2"></div>
								</div>
								<div class="cp-circle-control"></div>
								<ul class="cp-controls">
									<li><a class="cp-play" tabindex="1">play</a></li>
									<li><a class="cp-pause" style="display:none;" tabindex="1">pause</a></li> <!-- Needs the inline style here, or jQuery.show() uses display:inline instead of display:block -->
								</ul>
							</div>
							
							
						</c:forEach>
			<!-- <div id="cp_container_1" class="cp-container">
				<div class="cp-buffer-holder">
					<div class="cp-buffer-1"></div>
					<div class="cp-buffer-2"></div>
				</div>
				<div class="cp-progress-holder">
					<div class="cp-progress-1"></div>
					<div class="cp-progress-2"></div>
				</div>
				<div class="cp-circle-control"></div>
				<ul class="cp-controls">
					<li><a class="cp-play" tabindex="1">play</a></li>
					<li><a class="cp-pause" style="display:none;" tabindex="1">pause</a></li> 
				</ul>
			</div> 

			<div id="cp_container_2" class="cp-container">
				<div class="cp-buffer-holder">
					<div class="cp-buffer-1"></div>
					<div class="cp-buffer-2"></div>
				</div>
				<div class="cp-progress-holder">
					<div class="cp-progress-1"></div>
					<div class="cp-progress-2"></div>
				</div>
				<div class="cp-circle-control"></div>
				<ul class="cp-controls">
					<li><a class="cp-play" tabindex="1">play</a></li>
					<li><a class="cp-pause" style="display:none;" tabindex="1">pause</a></li>
				</ul>
			</div>
			-->
			

		</div>
	</body>
</html>
