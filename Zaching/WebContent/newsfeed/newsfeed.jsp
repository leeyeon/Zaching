<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Loading Effects for Grid Items | Demo 2</title>
		<meta name="description" content="Loading Effects for Grid Items with CSS Animations" />
		<meta name="keywords" content="css animation, loading effect, google plus, grid items, masonry" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />
		<link rel="stylesheet" type="text/css" href="../resources/css/component.css" />
		<link rel='dns-prefetch' href='//fonts.googleapis.com' />
		<link rel='dns-prefetch' href='//s.w.org' />
		<script src="../resources/javascript/modernizr.custom.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >	
		
		<script type='text/javascript' defer="defer" src='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/themify/js/main.js?ver=3.3.9'></script>
		
		<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-content/plugins/contact-form-7/includes/js/scripts.js?ver=4.9.1'></script>
		<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/jquery/jquery.form.min.js?ver=4.2.1'></script>
		<script type='text/javascript' defer="defer" src='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/js/jquery.isotope.min.js?ver=4.9.1'></script>
		<script type='text/javascript' defer="defer" src='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/js/jquery.infinitescroll.min.js?ver=4.9.1'></script>
		
		<script type='text/javascript' defer="defer" src='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/js/themify.script.js?ver=4.9.1'></script>
		<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/comment-reply.min.js?ver=4.9.1'></script>
		<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/wp-embed.min.js?ver=4.9.1'></script>
		<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
		<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
		<link rel='https://api.w.org/' href='https://themify.me/demo/themes/pinboard/wp-json/' />
		<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://themify.me/demo/themes/pinboard/xmlrpc.php?rsd" />
		<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://themify.me/demo/themes/pinboard/wp-includes/wlwmanifest.xml" /> 
		<meta name="generator" content="WordPress 4.9.1" />
		<link rel='shortlink' href='https://themify.me/demo/themes/pinboard/?p=186' />
		<link rel="alternate" type="application/json+oembed" href="https://themify.me/demo/themes/pinboard/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Flayouts%2Flarge-board%2F" />
		<link rel="alternate" type="text/xml+oembed" href="https://themify.me/demo/themes/pinboard/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Flayouts%2Flarge-board%2F&#038;format=xml" />
		<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.3\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.3\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.9.1"}};
			!function(a,b,c){function d(a,b){var c=String.fromCharCode;l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,a),0,0);var d=k.toDataURL();l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,b),0,0);var e=k.toDataURL();return d===e}function e(a){var b;if(!l||!l.fillText)return!1;switch(l.textBaseline="top",l.font="600 32px Arial",a){case"flag":return!(b=d([55356,56826,55356,56819],[55356,56826,8203,55356,56819]))&&(b=d([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]),!b);case"emoji":return b=d([55358,56794,8205,9794,65039],[55358,56794,8203,9794,65039]),!b}return!1}function f(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var g,h,i,j,k=b.createElement("canvas"),l=k.getContext&&k.getContext("2d");for(j=Array("flag","emoji"),c.supports={everything:!0,everythingExceptFlag:!0},i=0;i<j.length;i++)c.supports[j[i]]=e(j[i]),c.supports.everything=c.supports.everything&&c.supports[j[i]],"flag"!==j[i]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[j[i]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(h=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",h,!1),a.addEventListener("load",h,!1)):(a.attachEvent("onload",h),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),g=c.source||{},g.concatemoji?f(g.concatemoji):g.wpemoji&&g.twemoji&&(f(g.twemoji),f(g.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
		
		<style type="text/css">
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
		
		li {
		  overflow: hidden; 
		  text-overflow: ellipsis;
		  white-space: nowrap;
		}
		
		.post-content {
	min-width: 120px;
	padding: 0.925em;
}
a.themify_lightbox_post{
	cursor: not-allowed;
}
.themify_lightbox_loaded a.themify_lightbox_post{
	cursor:auto;
}
		</style>

	</head>
	<body>
		<div class="container">
			<!-- Top Navigation -->
			
			<header>
				<h1>자췽 뉴스피드 <span>카테고리를 선택하세요</span></h1>	
				<nav class="codrops-demos">
					<a href="index.html">자취지식인</a>
					<a class="current-demo" href="index2.html">전체보기</a>
					<a href="index3.html">밥친구 후기</a>
					<a href="index4.html">꿀팁</a>
					<a href="index5.html">중고거래</a>
					<a href="index6.html">친구글만</a>
					<a href="index7.html">팔로워글만</a>
				</nav>
			</header>
			<ul class="grid effect-2" id="grid">
			
			<c:set var="i" value="0" />
				<c:forEach var="newsfeed" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<li><div class="post-content">
					<p class="author-pic">
					<img alt='' src='../resources/images/profile_test.png' srcset='https://secure.gravatar.com/avatar/cb2e9e4d63e271d04ee4e5753d24586f?s=80&#038;d=mm&#038;r=g 2x' itemprop='image' class='avatar avatar-40 photo' height='40' width='40'/>
					<span class="post-author">
						<span class="author vcard"><a class="url fn n" href="../resources/images/profile_test.png" rel="author">소현태</a></span> 
						<em>&sdot;</em>
					</span>
					<time datetime="2012-03-20" class="post-date entry-date updated">${newsfeed.regDate}</time></p>
					</div>
					
					<c:if test="${!empty newsfeed.fileName}"><a href="http://drbl.in/fWMM"><img src="../resources/images/${newsfeed.fileName }"></a></c:if>
					<h3 class="post-title entry-title"><a href="https://themify.me/demo/themes/pinboard/baking-cake/?post_in_lightbox=1" class="themify_lightbox_post">${newsfeed.content} </a> </h3><hr style="border:solid 0.5px gray">
					<p class="post-meta entry-meta">
					<span class="post-category">
					<a href="https://themify.me/demo/themes/pinboard/category/life/" rel="category tag"><i class="glyphicon glyphicon-thumbs-up"></i>${newsfeed.countLikey}</a><i class="glyphicon glyphicon-pencil"></i>${newsfeed.countReply }</span></p>
					
					</li>
				</c:forEach>
				<li><div class="post-content">
				<p class="author-pic">
				<img alt='' src='../resources/images/profile_test.png' srcset='https://secure.gravatar.com/avatar/cb2e9e4d63e271d04ee4e5753d24586f?s=80&#038;d=mm&#038;r=g 2x' itemprop='image' class='avatar avatar-40 photo' height='40' width='40'/>
				<span class="post-author">
				
					<span class="author vcard"><a class="url fn n" href="../resources/images/profile_test.png" rel="author">소현태</a></span> 
					<em>&sdot;</em>
				</span>
				<time datetime="2012-03-20" class="post-date entry-date updated">March 20, 2012</time></p>
				
				</div>
				<a href="http://drbl.in/fWMM"><img src="../resources/images/author.png"></a>
				<h3 class="post-title entry-title"><a href="https://themify.me/demo/themes/pinboard/baking-cake/?post_in_lightbox=1" class="themify_lightbox_post">야무지게 먹어드립니다.</a>먹방 </h3>	
				<p class="post-meta entry-meta">
				<span class="post-category">
				<a href="https://themify.me/demo/themes/pinboard/category/life/" rel="category tag"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a></span></p>
				
				</li>
				<li><a href="http://drbl.in/fWPV"><img src="../resources/images/test_3.jpg"></a></li>
				<li><a href="http://drbl.in/fWMT"><img src="../resources/images/test_4.jpg"></a></li>
				<li><a href="http://drbl.in/fQdt"><img src="../resources/images/test_12.png"></a></li>
				<li><a href="http://drbl.in/fHaa"><img src="../resources/images/test_13.png"></a></li>
				<li><a href="http://drbl.in/gXMo"><img src="../resources/images/test_10.png"></a></li>
				<li><a href="http://drbl.in/gXMn"><img src="../resources/images/test_9.jpg"></a></li>
				<li><a href="http://drbl.in/fzYo"><img src="../resources/images/test_2.jpg"></a></li>
				<li><a href="http://drbl.in/fARU"><img src="../resources/images/test_14.png"></a></li>
				<li><a href="http://drbl.in/fGhI"><img src="../resources/images/test_5.jpg"></a></li>
				<li><a href="http://drbl.in/fKCf"><img src="../resources/images/test_6.jpg"></a></li>
				<li><a href="http://drbl.in/fLBG"><img src="../resources/images/test_7.jpg"></a></li>
				<li><a href="http://drbl.in/fPEY"><img src="../resources/images/test_8.jpg"></a></li>
				<li><a href="http://drbl.in/fWwG"><img src="../resources/images/test_9.jpg"></a></li>
				<li><a href="http://drbl.in/fQdt"><img src="../resources/images/test_12.png"></a></li>
				<li><a href="http://drbl.in/fHaa"><img src="../resources/images/test_13.png"></a></li>
				<li><a href="http://drbl.in/gXMo"><img src="../resources/images/test_10.png"></a></li>
				<li><a href="http://drbl.in/gXMn"><img src="../resources/images/test_11.png"></a></li>
				<li><a href="http://drbl.in/fzYo"><img src="../resources/images/test_2.jpg"></a></li>
				<li><a href="http://drbl.in/fARU"><img src="../resources/images/test_14.png"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="../resources/images/test_1.jpg"></a></li>
				<li><a href="http://drbl.in/fWPV"><img src="../resources/images/test_3.jpg"></a></li>
				<li><a href="http://drbl.in/fWMT"><img src="../resources/images/test_4.jpg"></a></li>
				<li><a href="http://drbl.in/fGhI"><img src="../resources/images/test_5.jpg"></a></li>
				<li><a href="http://drbl.in/fKCf"><img src="../resources/images/test_6.jpg"></a></li>
				<li><a href="http://drbl.in/fLBG"><img src="../resources/images/test_7.jpg"></a></li>
				<li><a href="http://drbl.in/fPEY"><img src="../resources/images/test_8.jpg"></a></li>
				<li><a href="http://drbl.in/fWwG"><img src="../resources/images/test_9.jpg"></a></li>
				<li><a href="http://drbl.in/fQdt"><img src="../resources/images/test_12.png"></a></li>
				<li><a href="http://drbl.in/fHaa"><img src="../resources/images/test_13.png"></a></li>
				<li><a href="http://drbl.in/gXMo"><img src="../resources/images/test_10.png"></a></li>
				<li><a href="http://drbl.in/gXMn"><img src="../resources/images/test_11.png"></a></li>
				<li><a href="http://drbl.in/fzYo"><img src="../resources/images/test_2.jpg"></a></li>
				<li><a href="http://drbl.in/fARU"><img src="../resources/images/test_14.png"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="../resources/images/test_1.jpg"></a></li>
				<li><a href="http://drbl.in/fWPV"><img src="../resources/images/test_3.jpg"></a></li>
				<li><a href="http://drbl.in/fWMT"><img src="../resources/images/test_4.jpg"></a></li>
				<li><a href="http://drbl.in/fGhI"><img src="../resources/images/test_5.jpg"></a></li>
				<li><a href="http://drbl.in/fKCf"><img src="../resources/images/test_6.jpg"></a></li>
				<li><a href="http://drbl.in/fLBG"><img src="../resources/images/test_7.jpg"></a></li>
				<li><a href="http://drbl.in/fPEY"><img src="../resources/images/test_8.jpg"></a></li>
				<li><a href="http://drbl.in/fWwG"><img src="../resources/images/test_9.jpg"></a></li>
				<li><a href="http://drbl.in/fQdt"><img src="../resources/images/test_12.png"></a></li>
				<li><a href="http://drbl.in/fHaa"><img src="../resources/images/test_13.png"></a></li>
				<li><a href="http://drbl.in/gXMo"><img src="../resources/images/test_10.png"></a></li>
				<li><a href="http://drbl.in/gXMn"><img src="../resources/images/test_11.png"></a></li>
				<li><a href="http://drbl.in/fzYo"><img src="../resources/images/test_2.jpg"></a></li>
				<li><a href="http://drbl.in/fARU"><img src="../resources/images/test_14.png"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="../resources/images/test_1.jpg"></a></li>
				<li><a href="http://drbl.in/fWPV"><img src="../resources/images/test_3.jpg"></a></li>
				<li><a href="http://drbl.in/fWMT"><img src="../resources/images/test_4.jpg"></a></li>
				<li><a href="http://drbl.in/fGhI"><img src="../resources/images/test_5.jpg"></a></li>
				<li><a href="http://drbl.in/fKCf"><img src="../resources/images/test_6.jpg"></a></li>
				<li><a href="http://drbl.in/fLBG"><img src="../resources/images/test_7.jpg"></a></li>
				<li><a href="http://drbl.in/fPEY"><img src="../resources/images/test_8.jpg"></a></li>
				<li><a href="http://drbl.in/fWwG"><img src="../resources/images/test_9.jpg"></a></li>
				<li><a href="http://drbl.in/fQdt"><img src="../resources/images/test_12.png"></a></li>
				<li><a href="http://drbl.in/fHaa"><img src="../resources/images/test_13.png"></a></li>
				<li><a href="http://drbl.in/gXMo"><img src="../resources/images/test_10.png"></a></li>
				<li><a href="http://drbl.in/gXMn"><img src="../resources/images/test_11.png"></a></li>
				<li><a href="http://drbl.in/fzYo"><img src="../resources/images/test_2.jpg"></a></li>
				<li><a href="http://drbl.in/fARU"><img src="../resources/images/test_14.png"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="../resources/images/test_1.jpg"></a></li>
				<li><a href="http://drbl.in/fWPV"><img src="../resources/images/test_3.jpg"></a></li>
				<li><a href="http://drbl.in/fWMT"><img src="../resources/images/test_4.jpg"></a></li>
				<li><a href="http://drbl.in/fGhI"><img src="../resources/images/test_5.jpg"></a></li>
				<li><a href="http://drbl.in/fKCf"><img src="../resources/images/test_6.jpg"></a></li>
				<li><a href="http://drbl.in/fLBG"><img src="../resources/images/test_7.jpg"></a></li>
				<li><a href="http://drbl.in/fPEY"><img src="../resources/images/test_8.jpg"></a></li>
				<li><a href="http://drbl.in/fWwG"><img src="../resources/images/test_9.jpg"></a></li>
				<li><a href="http://drbl.in/fQdt"><img src="../resources/images/test_12.png"></a></li>
				<li><a href="http://drbl.in/fHaa"><img src="../resources/images/test_13.png"></a></li>
				<li><a href="http://drbl.in/gXMo"><img src="../resources/images/test_10.png"></a></li>
				<li><a href="http://drbl.in/gXMn"><img src="../resources/images/test_11.png"></a></li>
				<li><a href="http://drbl.in/fzYo"><img src="../resources/images/test_2.jpg"></a></li>
				<li><a href="http://drbl.in/fARU"><img src="../resources/images/test_14.png"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="../resources/images/test_1.jpg"></a></li>
				<li><a href="http://drbl.in/fWPV"><img src="../resources/images/test_3.jpg"></a></li>
				<li><a href="http://drbl.in/fWMT"><img src="../resources/images/test_4.jpg"></a></li>
				<li><a href="http://drbl.in/fGhI"><img src="../resources/images/test_5.jpg"></a></li>
				<li><a href="http://drbl.in/fKCf"><img src="../resources/images/test_6.jpg"></a></li>
				<li><a href="http://drbl.in/fLBG"><img src="../resources/images/test_7.jpg"></a></li>
				<li><a href="http://drbl.in/fPEY"><img src="../resources/images/test_8.jpg"></a></li>
				<li><a href="http://drbl.in/fWwG"><img src="../resources/images/test_9.jpg"></a></li>
				<li><a href="http://drbl.in/fWPV"><img src="../resources/images/test_3.jpg"></a></li>
				<li><a href="http://drbl.in/fGhI"><img src="../resources/images/test_5.jpg"></a></li>
				<li><a href="http://drbl.in/fzYo"><img src="../resources/images/test_2.jpg"></a></li>
			</ul>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.0.0/masonry.pkgd.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js"></script>
		<script src="../resources/javascript/classie.js"></script>
		<script src="../resources/javascript/AnimOnScroll.js"></script>
		<script>
			new AnimOnScroll( document.getElementById( 'grid' ), {
				minDuration : 0.4,
				maxDuration : 0.7,
				viewportFactor : 0.2
			} );
		</script>
		<!-- For the demo ad -->   
		<script src="../tympanus.net/codrops/adpacks/demoad.js"></script>
	</body>
</html>