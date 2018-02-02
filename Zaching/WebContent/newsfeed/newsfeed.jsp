<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>자췽 뉴스피드</title>
		<meta name="description" content="Loading Effects for Grid Items with CSS Animations" />
		<meta name="keywords" content="css animation, loading effect, google plus, grid items, masonry" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />
		<link rel="stylesheet" type="text/css" href="../resources/css/component.css" />
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-7243260-2']);
			_gaq.push(['_trackPageview']);
			(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
				})();
			
			$("#li").on("click", function(){
				var index = $($("input[name='newsfeedId']")[$("#li").index(this)]).val();
				alert(index);
			})
		</script>
		<link rel='dns-prefetch' href='//fonts.googleapis.com' />
		<link rel='dns-prefetch' href='//s.w.org' />
		<script src="../resources/javascript/modernizr.custom.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >	
		
		<style type="text/css">
			body > div:nth-child(8) > div > header > nav {
			    background-color: white;
			}
			
			body > div:nth-child(8) > div > header {
			    background-color: white;
			}
			
		</style>

	</head>
	<body>
		<div class="container">
			<!-- Top Navigation -->
			
			<header>	
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
					<input type="hidden" id="newsfeedId" name="newsfeedId" value="${newsfeed.newsfeedId}"/>
					<p class="author-pic">
					<img alt='' src='../resources/images/profile_test.png' srcset='https://secure.gravatar.com/avatar/cb2e9e4d63e271d04ee4e5753d24586f?s=80&#038;d=mm&#038;r=g 2x' itemprop='image' class='avatar avatar-40 photo' height='40' width='40' align="left"/>
					<span class="post-author">
						<span class="author vcard"><a class="url fn n" href="../resources/images/profile_test.png" rel="author">소간지</a>
						</span>
						
						<em>&sdot;</em>
					</span>
					
					<time datetime="2012-03-20" class="post-date entry-date updated" align="left">${newsfeed.regDate}</time>
					<i class="glyphicon glyphicon-option-vertical" style="text-align:right"></i></p>
					
					<c:if test="${!empty newsfeed.fileName}"><a href="/newsfeed/getNewsfeed?newsfeedId=${newsfeed.newsfeedId}"><img src="../resources/images/${newsfeed.fileName}"></a></c:if>
					<h3 class="post-title entry-title">${newsfeed.content}</h3><hr style="border:solid 0.5px gray">
					<p class="post-meta entry-meta">
					<span class="post-category">
					<a href="https://themify.me/demo/themes/pinboard/category/life/" rel="category tag"><i class="glyphicon glyphicon-thumbs-up"></i>${newsfeed.countLikey}</a><a href="/newsfeed/getNewsfeed?newsfeedId=${newsfeed.newsfeedId}"><i class="glyphicon glyphicon-pencil"></i>${newsfeed.countReply }</a></span></p>
					
					</li>
				</c:forEach>
				
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
		<!-- For the demo ad -->   
		<script src="//tympanus.net/codrops/adpacks/demoad.js"></script>
	</body>
</html>