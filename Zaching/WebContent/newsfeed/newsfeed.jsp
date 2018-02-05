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
		<script type="text/javascript" src="../resources/javascript/FileButton.js"></script> 
		<script type="text/javascript">
			var myFileButton = new FileButton("imageswap", "imagesrc"); //new FileButton("true 값을 줘야 하는 사용자 설정 attribute name", "꾸며질 이미지 url") 
			window.onload = function () { 
				myFileButton.run(); //문서로딩 후 한꺼번에 바꿈 
			} 
			
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
			});
			
			function addNewsfeed(){
				$("form").attr("method", "POST").attr("action", "/newsfeed/addNewsfeed").submit();
			}
			
			function fnc_addLikey(newsfeedId, text){
				//alert(e);
				//alert($(v).text());
				
				//alert($($("li")[$("#likey").index(this)]).val());
				//var finalLikey = $("input[name='countLikey']").val();
				//$(".likeit").effect("bounce", {times:3}, 300);
				//alert(newsfeedId);
				var countLikey= $(text).text();
				$.ajax({
					url : "/newsfeed/json/updateLikey/"+${user.userId}+"/0",
					method : "POST",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({
						"newsfeedId" : newsfeedId,
						"countLikey" : $(text).text()
					}),
					async : false,
					dataType : "json",
					success : function(serverData){
						$(".likeit-wrap .likeit")
							.css("color","#E26F6A");
						$(".like"+newsfeedId).text(serverData);
						if(countLikey == serverData-1){
							$(".like"+newsfeedId).css("color","#E26F6A");
						}
						
						else{
							$(".like"+newsfeedId).css("color","black");
						}
							//.css("text-decoration", "none");
						//$(".like-text::after").css("content", "\e802");
						//$("#countLikey > ins").css("color","#E26F6A");
					}
				});
			}
			
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
			
			#iconMarker{
        	cursor: pointer;
	        }
	        
	        #imgInput{
	        	cursor: pointer;
	        }
	        
	        .addNewsfeed {
				-moz-box-shadow:inset 0px 1px 0px 0px #dcecfb;
				-webkit-box-shadow:inset 0px 1px 0px 0px #dcecfb;
				box-shadow:inset 0px 1px 0px 0px #dcecfb;
				background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #bddbfa), color-stop(1, #80b5ea) );
				background:-moz-linear-gradient( center top, #bddbfa 5%, #80b5ea 100% );
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bddbfa', endColorstr='#80b5ea');
				background-color:#bddbfa;
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
				border:1px solid #84bbf3;
				display:inline-block;
				color:#ffffff;
				font-family:Arial Black;
				font-size:15px;
				font-weight:bold;
				font-style:normal;
				height:40px;
				line-height:40px;
				width:100px;
				text-decoration:none;
				text-align:center;
				text-shadow:1px 1px 0px #528ecc;
			}
			.addNewsfeed {
				background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #80b5ea), color-stop(1, #bddbfa) );
				background:-moz-linear-gradient( center top, #80b5ea 5%, #bddbfa 100% );
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#80b5ea', endColorstr='#bddbfa');
				background-color:#80b5ea;
			}.addNewsfeed:active {
				position:relative;
				top:1px;
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
			
			<form name='Form' class="form-vertical" enctype="multipart/form-data">
			<input type="hidden" value="${user.userId}" name="userId" id="userId"/>
			<div class="container">
				<div class="row">
					<table border="0">
						<tr>
						<td>
							<div class="form-group">
								<input type="file" name="file" imageswap="true" imagesrc="../resources/images/imageButton.PNG" />
							</div>
							
					
					  <td width=700>
					  <p style="font-size: 30px; color: #00D1CD;"><i class="glyphicon glyphicon-map-marker" id="iconMarker"></i></p>
						    	   <textarea class="form-control" rows="7" placeholder="상태 업데이트 하세요." class="span1" cols="40" name="content" id=" content"></textarea>
						      <!--  <input type="text" class="form-control" id="statement" name="statement" placeholder="상태 업데이트 하세요."> -->
						   
						    </td>
					    </tr>
					</table>
					  
					 <table border="0">
					 <tr>
					 <td width="300">
						  <div class="form-group" align="left">
						   <strong style="font-size: 12px">카테고리</strong> <select 	name="categoryCode"	id="categoryCode" class="form-control" 
							style="height: 40px" maxLength="20">
						<option value="1" selected="selected">자취지식인</option>
						<option value="2">중고거래</option>
						<option value="3">밥친구후기</option>
						<option value="4">꿀팁</option>
					</select>
						  </div>
					</td>
						  
					<td width="300">
						  <div class="form-group">
						    <strong style="font-size: 12px">공개범위</strong> <select 	name="privacyBound"	id="privacyBound" class="form-control" 
							style=" height: 40px" maxLength="20">
						<option value="1" selected="selected">전체공개</option>
						<option value="2">친구공개</option>
						<option value="3">비공개</option>
					</select>
						   </div>
					</td>
					
					<td width="300" style="text-align: right">
						<a href="#" onclick="addNewsfeed();" class="addNewsfeed">등록</a>
					</td>
					</tr> 
					   </table>
				   </div>
			   </div>

		</form>
			<ul class="grid effect-2" id="grid">
			
			<c:set var="i" value="0"/>
				<c:forEach var="newsfeed" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<li>
					<input type="hidden" id="newsfeedId" name="newsfeedId" value="${newsfeed.newsfeedId}"/>
					<p class="author-pic">
					<img alt='' src='../resources/images/${newsfeed.profileImage }' srcset='https://secure.gravatar.com/avatar/cb2e9e4d63e271d04ee4e5753d24586f?s=80&#038;d=mm&#038;r=g 2x' itemprop='image' class='avatar avatar-40 photo' height='40' width='40' align="left"/>
					<span class="post-author">
						<span class="author vcard"><a class="url fn n" href="../resources/images/profile_test.png" rel="author">${newsfeed.userName }</a>
						</span>
						
						<em>&sdot;</em>
					</span>
					
					<time datetime="2012-03-20" class="post-date entry-date updated" align="left">${newsfeed.regDate}</time>
					<i class="glyphicon glyphicon-option-vertical" style="text-align:right"></i></p>
					
					<c:if test="${!empty newsfeed.fileName}"><a href="/newsfeed/getNewsfeed?newsfeedId=${newsfeed.newsfeedId}"><img src="../resources/images/${newsfeed.fileName}"></a></c:if>
					<h3 class="post-title entry-title">${newsfeed.content}</h3><hr style="border:solid 0.5px gray">
					<p class="post-meta entry-meta">
					<span class="post-category">
					<a href="#" rel="category tag" class="like${newsfeed.newsfeedId}" onClick="fnc_addLikey(${newsfeed.newsfeedId}, this)"><i class="glyphicon glyphicon-thumbs-up"></i>${newsfeed.countLikey}</a><a href="/newsfeed/getNewsfeed?newsfeedId=${newsfeed.newsfeedId}"><i class="glyphicon glyphicon-pencil"></i>${newsfeed.countReply }</a></span></p>
					
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
		<!-- <script src="//tympanus.net/codrops/adpacks/demoad.js"></script>-->

		
	</body>
</html>