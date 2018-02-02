<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>자췽 뉴스피드</title>
		<meta name="description" content="Loading Effects for Grid Items with CSS Animations" />
		<meta name="keywords" content="css animation, loading effect, google plus, grid items, masonry" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"/> 
		
		<link rel="stylesheet" type="text/css" href="../resources/css/component.css" />
		<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
			var page = 1;
			
			/*
			window.onscroll = function(ev) {
			    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
			        alert("you're at the bottom of the page");
			    }
			};
			*/
			
			$(window).scroll(function(){
				if($(window).scrollTop() == $(document).height() - $(window).height()){
					page += 1;
					
					 $.ajax( 
							{
							url : "/newsfeed/json/listNewsfeed/",
							method : "POST" ,
							dataType : "json" ,
							data : {
								resultPage : page,
								category : "${category}"
							},
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
								
								for(var i=0; i<JSONData.length;i++){
								var displayValue =
									'<li>'+
										'<p class="author-pic">'+
										'<img alt="" src="../resources/images/profile_test.png" srcset="https://secure.gravatar.com/avatar/cb2e9e4d63e271d04ee4e5753d24586f?s=80&#038;d=mm&#038;r=g 2x" itemprop="image" class="avatar avatar-40 photo" height="40" width="40" align="left"/>'+
										'<span class="post-author">'+
											'<span class="author vcard"><a class="url fn n" href="../resources/images/profile_test.png" rel="author">소현태</a></span>'+ 
											'<em>&sdot;</em>'+
										'</span>'+
										'<time datetime="2012-03-20" class="post-date entry-date updated">${newsfeed.regDate}</time></p>'+
										'<c:if test="'+JSONData[i].fileName+'"><a href="http://drbl.in/fWMM"><img src="../resources/images/'+JSONData[i].fileName+'></a></c:if>'+
										'<h3 class="post-title entry-title">'+JSONData[i].content+'</h3><hr style="border:solid 0.5px gray">'+
										'<p class="post-meta entry-meta">'+
										'<span class="post-category">'+
										'<a href="https://themify.me/demo/themes/pinboard/category/life/" rel="category tag"><i class="glyphicon glyphicon-thumbs-up"></i>'+JSONData[i].countLikey+'</a><a href="#"><i class="glyphicon glyphicon-pencil"></i>'+JSONData[i].countReply+'</a></span></p>'+
									'</li>';

									$('#grid').append(displayValue);
									}
								}
						});
						
				}
			});
		
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-7243260-2']);
			_gaq.push(['_trackPageview']);
			(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
				})();
			
			
		</script>
		<link rel='dns-prefetch' href='//fonts.googleapis.com' />
		<link rel='dns-prefetch' href='//s.w.org' />
		<script src="../resources/javascript/modernizr.custom.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >	
		
		<style type="text/css">
		
		
		</style>

	</head>
	<body>
		<div class="container" id="news">
			
			<header>
				<h1>자췽 뉴스피드 test04 <span>카테고리를 선택하세요</span></h1>	
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
			
			<c:set var="i" value="0"/>
				<c:forEach var="newsfeed" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<li>
						<p class="author-pic">
						<img alt='' src='../resources/images/profile_test.png' srcset='https://secure.gravatar.com/avatar/cb2e9e4d63e271d04ee4e5753d24586f?s=80&#038;d=mm&#038;r=g 2x' itemprop='image' class='avatar avatar-40 photo' height='40' width='40' align="left"/>
						<span class="post-author">
							<span class="author vcard"><a class="url fn n" href="../resources/images/profile_test.png" rel="author">소현태</a></span> 
							<em>&sdot;</em>
						</span>
						<time datetime="2012-03-20" class="post-date entry-date updated">${newsfeed.regDate}</time></p>
						
						
						<c:if test="${!empty newsfeed.fileName}"><a href="http://drbl.in/fWMM"><img src="../resources/images/${newsfeed.fileName }"></a></c:if>
						<h3 class="post-title entry-title">${newsfeed.content}</h3><hr style="border:solid 0.5px gray">
						<p class="post-meta entry-meta">
						<span class="post-category">
						<a href="https://themify.me/demo/themes/pinboard/category/life/" rel="category tag"><i class="glyphicon glyphicon-thumbs-up"></i>${newsfeed.countLikey}</a><a href="#"><i class="glyphicon glyphicon-pencil"></i>${newsfeed.countReply }</a></span></p>
						
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
		<script src="../resources/javascript/infinite-scroll-docs.min.js?3"></script>
		<script>
			 window.ga=function(){ga.q.push(arguments)};ga.q=[];ga.l=+new Date;
			 ga('create','UA-58739927-7','auto');ga('send','pageview')
		</script>
		<script src="https://www.google-analytics.com/analytics.js" async defer></script>
		
		<script>
			new AnimOnScroll( document.getElementById( 'grid' ), {
				minDuration : 0.4,
				maxDuration : 0.7,
				viewportFactor : 0.2
			} );
		</script>
		
		<script src="//tympanus.net/codrops/adpacks/demoad.js"></script>
	</body>
</html> -->


<!DOCTYPE html>
<html lang="en-US" class="post-lightbox-html">
<head>
<meta charset="UTF-8">

<title>Baking Cake - Pinboard</title>

<link rel="canonical" href="https://themify.me/demo/themes/pinboard/baking-cake/" />

<!-- wp_header -->
<title>Baking Cake - Pinboard</title>

<!-- This site is optimized with the Yoast SEO plugin v6.2 - https://yoa.st/1yg?utm_content=6.2 -->
<meta name="robots" content="noindex,follow"/>
<link rel="canonical" href="https://themify.me/demo/themes/pinboard/baking-cake/" />
<script type='application/ld+json'>{"@context":"http:\/\/schema.org","@type":"WebSite","@id":"#website","url":"https:\/\/themify.me\/demo\/themes\/pinboard\/","name":"Pinboard","potentialAction":{"@type":"SearchAction","target":"https:\/\/themify.me\/demo\/themes\/pinboard\/?s={search_term_string}","query-input":"required name=search_term_string"}}</script>
<!-- / Yoast SEO plugin. -->

<link rel='dns-prefetch' href='//fonts.googleapis.com' />
<link rel='dns-prefetch' href='//s.w.org' />
<link rel="alternate" type="application/rss+xml" title="Pinboard &raquo; Feed" href="https://themify.me/demo/themes/pinboard/feed/" />
<link rel="alternate" type="application/rss+xml" title="Pinboard &raquo; Comments Feed" href="https://themify.me/demo/themes/pinboard/comments/feed/" />
<link rel="alternate" type="application/rss+xml" title="Pinboard &raquo; Baking Cake Comments Feed" href="https://themify.me/demo/themes/pinboard/baking-cake/feed/" />
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
</style>
<link rel='stylesheet' id='themify-common-css'  href='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/themify/css/themify.common.css?ver=4.9.1' type='text/css' media='all' />
<meta name="themify-framework-css" content="themify-framework-css" id="themify-framework-css">
<meta name="builder-styles-css" content="" id="builder-styles-css">
<link rel='stylesheet' id='contact-form-7-css'  href='https://themify.me/demo/themes/pinboard/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=4.9.2' type='text/css' media='all' />
<link rel='stylesheet' id='theme-style-css'  href='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/style.css?ver=3.1.1' type='text/css' media='all' />
<link rel='stylesheet' id='themify-media-queries-css'  href='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/media-queries.css?ver=4.9.1' type='text/css' media='all' />
<link rel='stylesheet' id='themify-google-fonts-css'  href='https://fonts.googleapis.com/css?family=Damion&#038;subset=latin&#038;ver=4.9.1' type='text/css' media='all' />
<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<link rel='https://api.w.org/' href='https://themify.me/demo/themes/pinboard/wp-json/' />
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://themify.me/demo/themes/pinboard/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://themify.me/demo/themes/pinboard/wp-includes/wlwmanifest.xml" /> 
<meta name="generator" content="WordPress 4.9.1" />
<link rel='shortlink' href='https://themify.me/demo/themes/pinboard/?p=4' />
<link rel="alternate" type="application/json+oembed" href="https://themify.me/demo/themes/pinboard/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Fbaking-cake%2F" />
<link rel="alternate" type="text/xml+oembed" href="https://themify.me/demo/themes/pinboard/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Fbaking-cake%2F&#038;format=xml" />




	<script type="text/javascript" defer>
		var tf_mobile_menu_trigger_point = 1200;
	</script>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body class="post-template-default single single-post postid-4 single-format-standard themify-fw-3-3-9 pinboard-3-1-1 skin-default webkit not-ie default_width sidebar1 no-home lightboxed no-touch post-lightbox-iframe builder-parallax-scrolling-active">
	<div id="pagewrap">
		<div id="body">

			<div class="lightbox-post lightbox-item">
		
				
					
<article id="post-4" class="post clearfix post-4 type-post status-publish format-standard has-post-thumbnail hentry category-life category-photos has-post-title has-post-date has-post-category has-post-tag has-post-comment has-post-author ">
	<div class="post-inner">


									<figure class="post-image ">
									<a href="https://themify.me/demo/themes/pinboard/baking-cake/" ><img src="https://themify.me/demo/themes/pinboard/files/2012/06/86531227.jpg" class=" wp-post-image wp-image-5" alt="86531227" srcset="https://themify.me/demo/themes/pinboard/files/2012/06/86531227.jpg 1000w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-300x200.jpg 300w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-335x223.jpg 335w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-306x204.jpg 306w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-280x186.jpg 280w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-192x128.jpg 192w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-474x316.jpg 474w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-670x446.jpg 670w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-229x152.jpg 229w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-222x148.jpg 222w, https://themify.me/demo/themes/pinboard/files/2012/06/86531227-310x206.jpg 310w" sizes="(max-width: 1000px) 100vw, 1000px" /></a>
							</figure>
					
	

<div class="post-content">
	
			<p class="post-meta entry-meta">
			<span class="post-category">
				<a href="https://themify.me/demo/themes/pinboard/category/life/" rel="category tag">Life</a>, <a href="https://themify.me/demo/themes/pinboard/category/photos/" rel="category tag">Photos</a>			</span>
					</p>

	
			 <h1 class="post-title entry-title"><a href="https://themify.me/demo/themes/pinboard/baking-cake/">Baking Cake</a> </h1>	
			<p class="author-pic">
			<img alt='' src='https://secure.gravatar.com/avatar/cb2e9e4d63e271d04ee4e5753d24586f?s=40&#038;d=mm&#038;r=g' srcset='https://secure.gravatar.com/avatar/cb2e9e4d63e271d04ee4e5753d24586f?s=80&#038;d=mm&#038;r=g 2x' itemprop='image' class='avatar avatar-40 photo' height='40' width='40' />		</p>

		<span class="post-author">
			<span class="author vcard"><a class="url fn n" href="https://themify.me/demo/themes/pinboard/author/eliorivero/" rel="author">Elio</a></span> 
			<em>&sdot;</em>
		</span>
	
			<time datetime="2012-03-20" class="post-date entry-date updated">March 20, 2012</time>
	
	<div class="entry-content">

	
		<p>Duis id tincidunt tortor. Curabitur placerat luctus lacinia. In hac habitasse platea dictumst. Suspendisse potenti. Nunc vestibulum, erat et pharetra aliquet, mi nunc iaculis erat, in pharetra libero felis sit amet ipsum.</p>
<div id="themify_builder_content-4" data-postid="4" class="themify_builder_content themify_builder_content-4 themify_builder">

    </div>
<!-- /themify_builder_content -->
	
	</div><!-- /.entry-content -->

	
<div class="likeit-wrap">
	<a href="#" class="likeit" data-postid="4">
		<span class="like-text">Like</span>
		<ins class="like-count">13</ins>
	</a>
	<span class="newliker">Thanks!</span>
	<span class="isliker">You've already liked this</span>
</div>
<!-- /.likeit-wrap -->
			<span class="post-comment">
			<a href="https://themify.me/demo/themes/pinboard/baking-cake/#respond">No comments</a>		</span>
	
	<div class="social-share msss4 sharrre">
            <div class="twitter-share sharrre">
            <a onclick="window.open('//twitter.com/intent/tweet?url=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Fbaking-cake&#038;text=Baking+Cake','twitter','toolbar=0, status=0, width=650, height=360')" title="Twitter" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
            <div class="facebook-share sharrre">
            <a onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Fbaking-cake&#038;t=Baking+Cake&#038;original_referer=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Fbaking-cake%2F','facebook','toolbar=0, status=0, width=900, height=500')" title="Facebook" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
            <div class="pinterest-share sharrre">
            <a onclick="window.open('//pinterest.com/pin/create/button/?url=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Fbaking-cake&#038;description=Baking+Cake&#038;media=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Ffiles%2F2012%2F06%2F86531227.jpg','pinterest','toolbar=no,width=700,height=300')" title="Pinterest" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
            <div class="googleplus-share sharrre">
            <a onclick="window.open('//plus.google.com/share?hl=en-US&#038;url=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Fbaking-cake','googlePlus','toolbar=0, status=0, width=900, height=500')" title="Google+" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
            <div class="linkedin-share sharrre">
            <a onclick="window.open('//www.linkedin.com/cws/share?url=https%3A%2F%2Fthemify.me%2Fdemo%2Fthemes%2Fpinboard%2Fbaking-cake&#038;token=&#038;isFramed=true','linkedin','toolbar=no,width=550,height=550')" title="LinkedIn" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
    </div>

<!-- .post-share -->


	
	
    </div>
<!-- /.post-content -->


			
		
					


<div id="comments" class="commentwrap">
	
	

	<div id="respond" class="comment-respond">
		<h3 id="reply-title" class="comment-reply-title">Leave a Reply <small><a rel="nofollow" id="cancel-comment-reply-link" href="/demo/themes/pinboard/baking-cake/?post_in_lightbox=1&amp;iframe=true&amp;width=700&amp;height=100%25#respond" style="display:none;">Cancel reply</a></small></h3>			<form action="https://themify.me/demo/themes/pinboard/wp-comments-post.php" method="post" id="commentform" class="comment-form" novalidate>
				<p class="comment-notes"><span id="email-notes">Your email address will not be published.</span> Required fields are marked <span class="required">*</span></p><p class="comment-form-comment"><label for="comment">Comment</label> <textarea id="comment" name="comment" cols="45" rows="8" maxlength="65525" aria-required="true" required="required"></textarea></p><p class="comment-form-author"><label for="author">Name <span class="required">*</span></label> <input id="author" name="author" type="text" value="" size="30" maxlength="245" aria-required='true' required='required' /></p>
<p class="comment-form-email"><label for="email">Email <span class="required">*</span></label> <input id="email" name="email" type="email" value="" size="30" maxlength="100" aria-describedby="email-notes" aria-required='true' required='required' /></p>
<p class="comment-form-url"><label for="url">Website</label> <input id="url" name="url" type="url" value="" size="30" maxlength="200" /></p>
<p class="form-submit"><input name="submit" type="submit" id="submit" class="submit" value="Post Comment" /> <input type='hidden' name='comment_post_ID' value='4' id='comment_post_ID' />
<input type='hidden' name='comment_parent' id='comment_parent' value='0' />
</p><p style="display: none;"><input type="hidden" id="akismet_comment_nonce" name="akismet_comment_nonce" value="e67e5cd543" /></p><p style="display: none;"><input type="hidden" id="ak_js" name="ak_js" value="219"/></p>			</form>
			</div><!-- #respond -->
	
</div>
<!-- /.commentwrap -->
			
	</div>
	<!-- /.post-inner -->
</article>
<!-- /.post -->

				
				<script type="text/javascript">
					jQuery(document).ready(function($){
						$('a').on('click', function(){
							history.pushState({}, $(this).parent().text(), window.location);
						});
					});
				</script>

			</div>
			<!-- /.lightbox-post -->
		</div>
		<!-- /#body -->
	</div>
	<!-- /#pagewrap -->


<script type='text/javascript'>
/* <![CDATA[ */
var themify_vars = {"version":"3.3.9","url":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-content\/themes\/pinboard\/themify","map_key":null,"includesURL":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-includes\/","isCached":"on","minify":{"css":{"themify-icons":false,"themify.framework":false,"lightbox":false,"themify-builder-style":false},"js":{"backstretch.themify-version":false,"bigvideo":false,"themify.dropdown":false,"themify.builder.script":false,"themify.scroll-highlight":false,"themify-youtube-bg":false,"themify.parallaxit":false}}};
var tbLocalScript = {"isAnimationActive":"1","isParallaxActive":"1","isParallaxScrollActive":"1","animationInviewSelectors":[".module.wow",".module_row.wow",".builder-posts-wrap > .post.wow"],"backgroundSlider":{"autoplay":5000,"speed":2000},"animationOffset":"100","videoPoster":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-content\/themes\/pinboard\/themify\/themify-builder\/img\/blank.png","backgroundVideoLoop":"yes","builder_url":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-content\/themes\/pinboard\/themify\/themify-builder","framework_url":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-content\/themes\/pinboard\/themify","version":"3.3.9","fullwidth_support":"1","fullwidth_container":"body","loadScrollHighlight":"1","addons":[],"breakpoints":{"tablet_landscape":[769,"1024"],"tablet":[681,"768"],"mobile":"480"}};
var themifyScript = {"lightbox":{"lightboxSelector":".themify_lightbox","lightboxOn":true,"lightboxContentImages":false,"lightboxContentImagesSelector":"","theme":"pp_default","social_tools":false,"allow_resize":true,"show_title":false,"overlay_gallery":false,"screenWidthNoLightbox":600,"deeplinking":false,"contentImagesAreas":"","gallerySelector":".gallery-icon > a","lightboxGalleryOn":true},"lightboxContext":"body"};
var tbScrollHighlight = {"fixedHeaderSelector":"","speed":"900","navigation":"#main-nav","scrollOffset":"0"};
/* ]]> */
</script>
<script type='text/javascript' defer="defer" src='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/themify/js/main.js?ver=3.3.9'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var wpcf7 = {"apiSettings":{"root":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-json\/contact-form-7\/v1","namespace":"contact-form-7\/v1"},"recaptcha":{"messages":{"empty":"Please verify that you are not a robot."}}};
/* ]]> */
</script>
<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-content/plugins/contact-form-7/includes/js/scripts.js?ver=4.9.2'></script>
<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/jquery/jquery.form.min.js?ver=4.2.1'></script>
<script type='text/javascript' defer="defer" src='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/js/jquery.isotope.min.js?ver=4.9.1'></script>
<script type='text/javascript' defer="defer" src='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/js/jquery.infinitescroll.min.js?ver=4.9.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var themifyScript = {"loadingImg":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-content\/themes\/pinboard\/images\/loading.gif","maxPages":"0","autoInfinite":"auto","infiniteURL":"0","lightbox":{"lightboxSelector":".themify_lightbox","lightboxOn":true,"lightboxContentImages":false,"lightboxContentImagesSelector":"","theme":"pp_default","social_tools":false,"allow_resize":true,"show_title":false,"overlay_gallery":false,"screenWidthNoLightbox":600,"deeplinking":false,"contentImagesAreas":"","gallerySelector":".gallery-icon > a","lightboxGalleryOn":true},"lightboxContext":"#pagewrap","sharrrephp":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-content\/themes\/pinboard\/includes\/sharrre.php","sharehtml":"<a class=\"box\" href=\"#\"><div class=\"share\"><span>share<\/span><\/div><div class=\"count\" href=\"#\">{total}<\/div><\/a>","fixedHeader":"fixed-header","ajax_nonce":"2b2ff47dea","ajax_url":"https:\/\/themify.me\/demo\/themes\/pinboard\/wp-admin\/admin-ajax.php","itemBoard":"yes","site_taken":"Bummer. That site name is taken. Please, try again.","email_taken":"That email address is taken.","user_taken":"The user name is taken.","site_avail":"Success! The site name is free so grab it now!","user_avail":"Success! The user name is available.","email_avail":"Success! The email address is available.","checking":"Checking...","networkError":"Unknown network error. Please try again later.","fillthisfield":"Please complete this field.","fillfields":"Please complete all fields.","invalidEmail":"Enter a valid email address.","creationOk":"Your site was successfully created. Check your email for the activation mail."};
/* ]]> */
</script>
<script type='text/javascript' defer="defer" src='https://themify.me/demo/themes/pinboard/wp-content/themes/pinboard/js/themify.script.js?ver=4.9.1'></script>
<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/comment-reply.min.js?ver=4.9.1'></script>
<script type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-includes/js/wp-embed.min.js?ver=4.9.1'></script>
<script async="async" type='text/javascript' src='https://themify.me/demo/themes/pinboard/wp-content/plugins/akismet/_inc/form.js?ver=4.0.2'></script>
<!-- wp_footer -->

</body>
</html>
