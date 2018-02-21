<%@ page contentType="text/html;charset=UTF-8" %>

<html class="no-js" lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title></title>
  <meta name="viewport" content="width=1430, initial-scale=1">

  <link rel='dns-prefetch' href='//s.w.org' />
<link rel="alternate" type="application/rss+xml" title="DW Timeline &raquo; Feed" href="http://demo.designwall.com/dw-timeline/feed/" />
<link rel="alternate" type="application/rss+xml" title="DW Timeline &raquo; Comments Feed" href="http://demo.designwall.com/dw-timeline/comments/feed/" />
<link rel="alternate" type="application/rss+xml" title="DW Timeline &raquo; About Comments Feed" href="http://demo.designwall.com/dw-timeline/about/feed/" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel='stylesheet' id='dwqa-style-css'  href='http://demo.designwall.com/dw-timeline/wp-content/plugins/dw-question-answer/templates/assets/css/style.css?ver=180720161352' type='text/css' media='all' />
<link rel='stylesheet' id='dwqa-rtl-css'  href='http://demo.designwall.com/dw-timeline/wp-content/plugins/dw-question-answer/templates/assets/css/rtl.css?ver=180720161352' type='text/css' media='all' />
<link rel='stylesheet' id='dw_timeline_main-css'  href='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/css/main.css?ver=6c39f42987ae297a5a21e2bb35bf3402' type='text/css' media='all' />
<link rel='stylesheet' id='dw_timeline_style-css'  href='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/style.css?ver=c1a58eb4baaf24c3771085df3d54ff8d' type='text/css' media='all' />
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/js/vendor/modernizr-2.7.0.min.js'></script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/js/vendor/nivo-lightbox.min.js'></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel='https://api.w.org/' href='http://demo.designwall.com/dw-timeline/wp-json/' />
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://demo.designwall.com/dw-timeline/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://demo.designwall.com/dw-timeline/wp-includes/wlwmanifest.xml" /> 
<meta name="generator" content="WordPress 4.7.9" />
<link rel="canonical" href="http://demo.designwall.com/dw-timeline/about/" />
<link rel='shortlink' href='http://demo.designwall.com/dw-timeline/?p=60' />
<link rel="alternate" type="application/json+oembed" href="http://demo.designwall.com/dw-timeline/wp-json/oembed/1.0/embed?url=http%3A%2F%2Fdemo.designwall.com%2Fdw-timeline%2Fabout%2F" />
<link rel="alternate" type="text/xml+oembed" href="http://demo.designwall.com/dw-timeline/wp-json/oembed/1.0/embed?url=http%3A%2F%2Fdemo.designwall.com%2Fdw-timeline%2Fabout%2F&#038;format=xml" />
<link rel="stylesheet" type="text/css" href="../resources/css/newsfeedStyle.css" />
<jsp:include page="/resources/layout/toolbar.jsp"/>

		<script type="text/javascript">
		
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.2.1\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.2.1\/svg\/","svgExt":".svg","source":{"concatemoji":"http:\/\/demo.designwall.com\/dw-timeline\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.7.9"}};
			!function(a,b,c){function d(a){var b,c,d,e,f=String.fromCharCode;if(!k||!k.fillText)return!1;switch(k.clearRect(0,0,j.width,j.height),k.textBaseline="top",k.font="600 32px Arial",a){case"flag":return k.fillText(f(55356,56826,55356,56819),0,0),!(j.toDataURL().length<3e3)&&(k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,57331,65039,8205,55356,57096),0,0),b=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,57331,55356,57096),0,0),c=j.toDataURL(),b!==c);case"emoji4":return k.fillText(f(55357,56425,55356,57341,8205,55357,56507),0,0),d=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55357,56425,55356,57341,55357,56507),0,0),e=j.toDataURL(),d!==e}return!1}function e(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g,h,i,j=b.createElement("canvas"),k=j.getContext&&j.getContext("2d");for(i=Array("flag","emoji4"),c.supports={everything:!0,everythingExceptFlag:!0},h=0;h<i.length;h++)c.supports[i[h]]=d(i[h]),c.supports.everything=c.supports.everything&&c.supports[i[h]],"flag"!==i[h]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[i[h]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
			$(function(){
				$('.submit').on('click', function(){
		   	 		fnc_addComment();
		   	 	});
				$("#countLikey").on('click', function(){
					fnc_addLikey();
					//$("#respond >kkkkkkkkk div.likeit-wrap > a").effect( "bounce", {times:3}, 300 );
					
				});
			
				
				function fnc_addLikey(){
					var finalLikey = $("input[name='countLikey']").val();
					//$(".likeit").effect("bounce", {times:3}, 300);
					
					$.ajax({
						url : "/newsfeed/json/updateLikey/"+${user.userId}+"/0",
						method : "POST",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify({
							"newsfeedId" : <c:out value="${newsfeed.newsfeedId}" escapeXml="false" />,
							"countLikey" : finalLikey
						}),
						async : false,
						dataType : "json",
						success : function(serverData){
							$("#countLikey > ins").text(serverData);
							$(".likeit-wrap .likeit")
								.css("color","#E26F6A")
								.css("text-decoration", "none");
							$(".like-text::after").css("content", "\e802");
							//$("#countLikey > ins").css("color","#E26F6A");
						}
					});
				}
				
				function fnc_addComment() {
					var count = $('#count');
		   	 		$.ajax({
						url : "/comment/rest/addComment",
						method : "POST",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify({
							"userId" : <c:out value="${user.userId}" escapeXml="false" />,
							"roomId" : <c:out value="${newsfeed.newsfeedId}" escapeXml="false" />,
							"category" : 'N01',
							"content" : $("textarea").val()
						}),
						async : false,
						dataType : "json",
						success : function(serverData) {
							
							var comment = serverData.comment;
							console.log(comment);
							
							var displayValue = '<tr>'+
		   					'<td valign="top"><div class="thumb2"><img alt="" src="../resources/images/'+comment.userImage+'" width="20" height="20"></div></td>'+
		   					'<td></td>'+
		   					'<td></td>'+
		   					'<td width=1000><p class="arrow_box"style="font-size: 10pt; padding: 5px;"><strong style="font-size: 13pt; line-height: 100%;">'+comment.userName+'</strong>'+
		   					'<br/><br/>&nbsp;'+comment.content+'</p></td>'+
		   				'</tr>'+
		   				'<tr></tr>';
		   				$('#table').append(displayValue);
		   				$('#count').innerHTML = count+1;
		   				$("#comment").text("");
							
							//$("#listComment").load("/bob/listCommment?category=${param.category}&bobId=${param.bobId}");
							//$(":text[name='inputComment']").val("");
						},
						error:function(request,status,error){
						    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
						
					});
		   	 	}
			})
			
			
			
		</script>
		<style type="text/css">
		
		@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
		
		*{
		font-family: 'Jeju Gothic', serif;
		}
			body{
				padding-top: 110px;
				background: rgba(239, 239, 239, 0.62);			
			}
			
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
			
			.arrow_box {
				position: relative;
				background: #fff;
				
			}
			
			.arrow_box:after {
				border-color: rgba(174, 231, 242, 0);
				border-right-color: #aee7f2;
				border-width: 0px;
				margin-top: -0px;
			}
			.arrow_box:before {
				border-color: rgba(162, 159, 189, 0);
				border-right-color: #a29fbd;
				border-width: 3px;
				margin-top: -3px;
			}
    
		        .banner.cover:before {
		      background:       background-image: -webkit-linear-gradient(-45deg, , #d38313);
		      background-image: linear-gradient(-45deg, , #d38313);
		    }
		        
		        .banner hgroup:after {
		      background-color: #f25f48;
		    }
		    .banner #get-started {
		      color: #f25f48; 
		    }
		    
		    .thumb{
		    	display: block;
		    	overflow: hidden;
		    	height: 50px;
		    	width: 50px;
		    }
		    
		    .thumb img{
		    	display: block;
		    	min-width: 100%;
		    	min-height: 100%;
		    	-ms-interpolation-mode: bicubic;
		    }
		    
		    
		    .thumb2{
		    	display: block;
		    	overflow: hidden;
		    	height: 35px;
		    	width: 35px;
		    }
		    
		    .thumb2 img{
		    	display: block;
		    	min-width: 100%;
		    	min-height: 100%;
		    	-ms-interpolation-mode: bicubic;
		    }
		    
		    #respond > div.likeit-wrap {
			    font-size: large;
			    margin-top: 0;
			}
			
			#respond {
			    border-top: none;
			}
			
			#countLikey{
				cursor: pointer;
			}
			
			@-webkit-keyframes bounce {
			    0%, 20%, 50%, 80%, 100% {-webkit-transform: translateY(0);}
			    40% {-webkit-transform: translateY(-30px) }
			    60% {-webkit-transform: translateY(-20px);}
			} 
			@keyframes bounce {
			    0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
			    40% {transform: translateY(-30px);}
			    60% {transform: translateY(-20px);}
			} 
			
			.bounce {
			    -webkit-animation-duration: 1s;
			    animation-duration: 1s;
			    -webkit-animation-name: bounce;
			    animation-name: bounce;
			}
			
			body > nav > div > div.navbar-header > a > div > img{
				height: 40px;
			}
			
			.profile-img {
				border-radius: 50%;
			} 
			
			td, th {
    padding: 1;
}

			body > div.wrap.container > div{
				   border: 2px solid #9e9dad9c;
			}
			
			
	    </style>    
      
</head>
<body class="page-template-default page page-id-60">
    
<header>
  
</header>
  <div class="wrap container" role="document" >
    <div class="content row" style="background-color:#fff;">
      <main class="main col-sm-8 col-sm-offset-2" role="main">
        <article class="post-60 page type-page status-publish hentry dwtl normal">
  <div class="page-header">
  <div class="thumb" style="float: left;">
   <img src="../resources/images/${roomUser.profileImage}" height='50' width='100' align="left"/></div>
   <div style="font-size: 12pt; line-height: 200%;">${roomUser.name}</div>&nbsp;${newsfeed.regDate}
</div>
	<br/><br/>
	<c:if test="${!empty newsfeed.fileName}"><a href="../resources/upload_files/images/${newsfeed.fileName}"><img src="../resources/upload_files/images/${newsfeed.fileName}" width="100%"></a></c:if>
	<br/><br/>
    <p style="font-size: 20pt;">${newsfeed.content}</p>
    <br/>
	<div id="respond">
	<p style="font-size: 20pt">
	<div class="likeit-wrap" id="item">
	<div class="likeit" data-postid="4" id="countLikey">
		<span class="like-text">Like</span>
		<ins class="like-count">${newsfeed.countLikey}</ins>
	</div>
	<span class="newliker">Thanks!</span>
	<span class="isliker">You've already liked this</span>
</div></p>

<div class="social-share msss4 sharrre">
            <div class="twitter-share sharrre">
            <a onclick="window.open('//twitter.com/intent/tweet?url=http%3A%2F%2Flocalhost%3A8080%2Fnewsfeed%2FgetNewsfeed%3FnewsfeedId%3D122;','twitter','toolbar=0, status=0, width=650, height=360')" title="Twitter" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
            <div class="facebook-share sharrre">
            <a onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A8080%2Fnewsfeed%2FgetNewsfeed%3FnewsfeedId%3D122&#038;','facebook','toolbar=0, status=0, width=900, height=500')" title="Facebook" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
            <div class="pinterest-share sharrre">
            <a onclick="window.open('//pinterest.com/pin/create/button/?url=http%3A%2F%2Flocalhost%3A8080%2Fnewsfeed%2FgetNewsfeed%3FnewsfeedId%3D122;media=http%3A%2F%2Flocalhost%3A8080%2Fresources%2Fupload%5Ffile%2Fimages%2Fvoice14.jpg','pinterest','toolbar=no,width=700,height=300')" title="Pinterest" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
            <div class="googleplus-share sharrre">
            <a onclick="window.open('//plus.google.com/share?hl=en-US&#038;url=http%3A%2F%2Flocalhost%3A8080%2Fnewsfeed%2FgetNewsfeed%3FnewsfeedId%3D122','googlePlus','toolbar=0, status=0, width=900, height=500')" title="Google+" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
            <div class="linkedin-share sharrre">
            <a onclick="window.open('//www.linkedin.com/cws/share?url=http%3A%2F%2Flocalhost%3A8080%2Fnewsfeed%2FgetNewsfeed%3FnewsfeedId%3D122&#038;token=&#038;isFramed=true','linkedin','toolbar=no,width=550,height=550')" title="LinkedIn" rel="nofollow" href="javascript:void(0);" class="share"></a>
        </div>
    </div>
		<h3 id="reply-title" class="comment-reply-title"> 
		<small>Leave a Reply
		</small>
		<div class="thumb2" style="float: left;">
		<c:if test="${!empty user.profileImage }">
													<img alt="" src="../resources/images/${user.profileImage}"  height='25' width='25' align='left'>
													</c:if>
													<c:if test="${empty comment.userImage }">
													<img alt="" src="../resources/images/profile_default.png"  height='25' width='25' align='left'>
													</c:if>
   		</div><br/><p style="font-size: 10pt">&nbsp;${user.name}</p></h3>		
			<div id="commentform" class="comment-form">
				 
				<div class="form-group"><label for="comment">Comment</label>
					<textarea placeholder="Write your comment" name="comment" id="comment" class="form-control" rows="5" aria-required="true"></textarea>
				</div>
				<p class="form-submit">
				<input name="submit" type="submit" id="submit" class="submit" value="Post Comment" /> 
				<input type='hidden' name='comment_post_ID' value='60' id='comment_post_ID' />
				<input type='hidden' name='comment_parent' id='comment_parent' value='0' />
				<input type='hidden' name='countLikey' value='${newsfeed.countLikey}'/>
				</p>
		</div>
	<br/><br/>
				<table border="0" id="table">
					<c:set var="i" value="0"/>
						<c:forEach var="comment" items="${list}">
						<c:set var="i" value="${ i+1 }" />						
							<tr>
			   					<td valign="top" style="border-bottom-width:2px; border-color:#000;"><div class="thumb2" >
			   					<c:if test="${!empty comment.userImage }">
													<img alt="" src="../resources/images/${comment.userImage}" width='35' height='35'>
													</c:if>
													<c:if test="${empty comment.userImage }">
													<img alt="" src="../resources/images/profile_default.png" width='35' height='35'>
													</c:if>
			   					
			   					
			   					</div></td>
			   					<td></td>
			   					<td></td>
			   					<td width=1000><p class="arrow_box" style="font-size: 10pt; padding: 5px;"><strong style="font-size: 13pt; line-height: 100%;">${comment.userName}</strong>
			   					
			   					<br/><br/>&nbsp;${comment.content}</p></td>
			   					
			   				</tr>
			   				<tr></tr>
			   				
		   				</c:forEach>
				</table>
				<hr/>
				
		</div><!-- #respond -->
	</article>
      </main>
    </div>
  </div>
  <script>
  
</script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/js/vendor/jquery.infinitescroll.min.js?ver=4.7.9'></script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/js/vendor/bootstrap-3.0.3.min.js?ver=4.7.9'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var dwtl = {"template_directory_uri":"http:\/\/demo.designwall.com\/dw-timeline\/wp-content\/themes\/dw-timeline"};
var infinitescroll = {"page":"page","the_end":"the end"};
/* ]]> */
</script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-content/themes/dw-timeline/assets/js/scripts.js?ver=4.7.9'></script>
<script type='text/javascript' src='http://demo.designwall.com/dw-timeline/wp-includes/js/wp-embed.min.js?ver=4.7.9'></script>

</body>
</html>

