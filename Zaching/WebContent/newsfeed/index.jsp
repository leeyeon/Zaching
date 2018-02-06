<!DOCTYPE html>
<html lang="en">
<head>
<meta charset=utf-8>
<meta name="viewport" content="width=620">
<title>HTML5 Demo: geolocation</title>
<link rel="stylesheet" href="css/html5demos.css">
<script src="js/h5utils.js"></script>
</head>
<body>
	<section id="wrapper">		
		<header>
			<h1>geolocation</h1>
		</header>
		<meta name="viewport" content="width=620" />

		<!--구글맵 api를 불러오는 스크립트입니다. 자세한 설정은 js.js에서 설정할 수 있습니다.-->
		<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>

		<!-- 좌표정보 획득 상태를 표시합니다. -->
		<article>
			<p>
				Finding your location: <span id="status">checking...</span>
			</p>
		</article>
		
		<!--지도를 불러올 때 넓이와 높이를 설정할 수 있습니다. 자세한 사항은 script.js에서 설정할 수 있습니다.-->
		<script src="js/script.js"></script>
</body>
</html>
