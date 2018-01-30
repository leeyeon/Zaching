<!doctype html>
<html lang="ko">
<head>
<title>jQuery(제이쿼리) 강좌와 예제모음 : 제이쿼리로 이미지 동적생하고 masonry 로 정렬해 보기 (갤러리 형태 만들기)</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

<div style="text-align:center; margin:0 0 100px 0; background:#555; line-height:80px;">
	<a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt;" href="http://ktsmemo.cafe24.com/s/jquery/30" target="_blank">http://ktsmemo.cafe24.com/s/jquery/30</a>
</div>


<!-- 예제 시작 -->

<!-- masonry 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.0.0/masonry.pkgd.min.js"></script>

<!-- imagesloaded 로딩 (모든 이미지가 로딩된 후 실행되도록 할때 필요) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js"></script>

<style type="text/css">

	.wrap { margin:0 auto; } /* 이미지들을 가운데로 정렬하기 위해 설정 */
	.wrap img { margin:3px; }

</style>

<div class="wrap"></div>

<script type="text/javascript">

	


	// 83개의 이미지를 생성
	for(var i=1; i<=9; i++){
		// 이미지 이름은 bg_01.jpg 같은 숫자 증가 형태
		$('.wrap').append('<img src="../resources/images/test_' + i + '.jpg">');
	}

	// wrap 클래스안의 모든 이미지가 로딩되면 masonry 적용
	$imgs = $('.wrap').imagesLoaded(function(){
		$imgs.masonry({
			itemSelector : 'img', // img 태그를 대상으로 masonry 적용
			fitWidth : true // 내용물을 가운데 정렬하기, CSS margin:0 auto; 설정이 필요함
		});
	});
	$('.wrap').append('<img src="../resources/images/test_10.png">');
	$('.wrap').append('<img src="../resources/images/test_11.png">');
	$('.wrap').append('<img src="../resources/images/test_12.png">');
	$('.wrap').append('<img src="../resources/images/test_13.png">');
	$('.wrap').append('<img src="../resources/images/test_14.png">');

</script>

<!-- 예제 종료 -->


</body>
</html>