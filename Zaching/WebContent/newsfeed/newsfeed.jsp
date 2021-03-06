<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko">
	<head>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >	
		<link rel="stylesheet" type="text/css" href="../resources/css/newsfeedStyle.css" />
		
		
		<link href="../resources/css/style.css" rel='stylesheet' type='text/css' />
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="../resources/images/newsfeedImages/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<link rel="stylesheet" type="text/css" href="../resources/css/default.css" /> 
		<link rel="stylesheet" type="text/css" href="../resources/css/component.css" />
		<script type="text/javascript" src="../resources/javascript/FileButton.js"></script> 
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">	
		<!----//webfonts---->
		<!-- Global CSS for the page and tiles -->
  		<link rel="stylesheet" href="../resources/css/main.css">
  		<!-- //Global CSS for the page and tiles -->
		<!---start-click-drop-down-menu----->
		<script src="../resources/javascript/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <!----start-dropdown--->
        <jsp:include page="/resources/layout/toolbar.jsp"/>
        
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
         <script type="text/javascript">
         
         $(function(){
        	 $(".like-text").on("hover", function(){
        		 $(this).toggleClass('changed');
        	 });
        	 var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
		        contentNode = document.createElement('div');
		     
		    var mapContainer = document.getElementById('map'), 
		        mapOption = {
		            center: new daum.maps.LatLng(37.566826, 126.9786567), 
		            level: 5 
		        };  
		    var map = new daum.maps.Map(mapContainer, mapOption); 
		    
        	 $( "#iconMarker" ).on("click" , function() {
		    		daum.postcode.load(function(){
		    	        new daum.Postcode({
		    	            oncomplete: function(data) {
		    	            	
	    	                    jQuery("#iconMarker").val(data.address);
	    	                    $("input[name=ok]").val(data.address);
	    	                    
	    	                 
	    	                    var geocoder = new daum.maps.services.Geocoder();
	    	                	geocoder.addressSearch($("input[name=ok]").val(), function(result, status) {

	    	                	     if (status === daum.maps.services.Status.OK) {
	    	                	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	    	                	        var marker = new daum.maps.Marker({
	    	                	            map: map,
	    	                	            position: coords
	    	                	        });

	    	                	        
	    	                	        $("input:hidden[name='locationName']").val(data.address);
	    	                	        $("input:hidden[name='locationX']").val(coords.getLat());
	    	                	        $("input:hidden[name='locationY']").val(coords.getLng());
	    	                	      

	    	                	    } 
	    	                	});
		    	            }
		    	        }).open();
		    	    });
		    	});
        	 
        	 
        	 
	
        		var myFileButton = new FileButton("imageswap", "imagesrc"); //new FileButton
 				window.onload = function () { 
 				myFileButton.run(); //
 			} 
        	 

        /*	 $(".cell").on("click",function(){
        		 //alert($($("input[name='newsfeedId']")[$("li").index(this)-6]).val());
        		 var id = $($("input[name='newsfeedId']")[$("li").index(this)-40]).val();
        		 //alert($("li").index(this));
        		 //alert($($("input[name='newsfeedId']")[$("li").index(this)]).val());
        		 //alert($($("input[name='newsfeedId']")[$("li").index(this)-6]).val());
        		 self.location="/newsfeed/getNewsfeed?newsfeedId="+id;
        		 
        	 });*/

	       	 $(document).on("click","#tiles > li > img",function(){
	       		 var id = $($("input[name='newsfeedId']")[$("#tiles > li > img").index(this)]).val();	       		 
	       		 self.location="/newsfeed/getNewsfeed?newsfeedId="+id;
	       	 });

        	 
        	 $(".ufo").on("click", function() {
     			self.location = "/newsfeed/ufo";
     		});
        	 
				
			$("#main > div > header > nav > a:nth-child(1)").on('click', function() {

				
				var condition = $(this).attr("href");
				
				$("#newsfeed").load("/newsfeed/listNewsfeed?searchCondition="+condition);
				
			});
			
        	 
         });
        	 function addNewsfeed(){
        		 
        		 var chk = document.getElementById('cma_file'); 
					
        		　if(!chk.value){ 
        		　　alert('배경이 될 사진을 넣어주세요');
        			return;
        		　} 
        		
        		 
				$("form").attr("method", "POST").attr("action", "/newsfeed/addNewsfeed").submit();
			}
        	 
         
			
			
			function fnc_addLikey(newsfeedId){
				//alert(e);
				//alert($(v).text());
				
				//alert($($("li")[$("#likey").index(this)]).val());
				//var finalLikey = $("input[name='countLikey']").val();
				//$(".likeit").effect("bounce", {times:3}, 300);
				//alert(newsfeedId);
				
				<c:if test="${!empty user.userId}">
				
					var countLikey= $("#like"+newsfeedId).text();
					$.ajax({
						url : "/newsfeed/json/updateLikey/"+${user.userId}+"/0",
						method : "POST",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify({
							"newsfeedId" : newsfeedId,
							"countLikey" : countLikey
						}),
						async : false,
						dataType : "json",
						success : function(serverData){
							
							$("#like"+newsfeedId).text(serverData);
							if(countLikey < serverData){
								//alert($("#item"+newsfeedId+" .like-text:after").css('content'));
								$("#item"+newsfeedId+" .like-text").toggleClass('changed');
								$("#like"+newsfeedId).css("color","#ff5b4e");
								
							}
							
							else{
								$("#like"+newsfeedId).css("color","#aaaaaa");
								$("#item"+newsfeedId+" .like-text").toggleClass('changed02');
							}
								//.css("text-decoration", "none");
							
						}
					});
				
				</c:if>

			}
			
			function getNewsfeed(newsfeedId){
				self.location = '/newsfeed/getNewsfeed?newsfeedId='+newsfeedId;
			}
			
			/*var $ = jQuery.noConflict();
				$(function() {
					$('#activator').click(function(){
						$('#box').animate({'top':'0px'},500);
					});
					$('#boxclose').click(function(){
					$('#box').animate({'top':'-700px'},500);
					});
				});
				$(document).ready(function(){
				//Hide (Collapse) the toggle containers on load
				$(".toggle_container").hide(); 
				//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
				$(".trigger").click(function(){
					$(this).toggleClass("active").next().slideToggle("slow");
						return false; //Prevent the browser jump to the link anchor
				});
									
			});*/
		</script>
        <!----//End-dropdown--->
		<!---//End-click-drop-down-menu----->
		
	<style>

	.like-text.changed:after {
		content: "\e802"; /* fa-heart */
	}
	.like-text.changed02:after {
		content: "\e803"; /* fa-heart */
	}
	.btn-add-bob {
      	border: 1px solid #FFFFF;
		border-radius: 70px;
		-moz-border-radius: 70px;
		-khtml-border-radius: 70px;
		-webkit-border-radius: 70px;
		 background: #bfd9f2;
		 width: 70px;
		 height: 70px;
		 line-height: 100px;
		 font-size: 17px;
		 float:right;
		 margin-right: 20px;
		 cursor: pointer;
		 color: #FFFFFF;
		 box-shadow: 0 5px 15px -5px #666;
    }
	
	.modal {
		overflow: inherit;
		overflow-y: inherit;
		text-align: center;
		padding: 0;
		
	}
	
	.modal:before {
		content: '';
		display: inline-block;
		height: 100%;
		vertical-align: middle;
		margin-right: -4px;
	}
	
	.modal-dialog {
		
		padding: 0;
		display: inline-block;
		text-align: left;
		vertical-align: middle;
	}

	body{
		padding-top: 60px;
	}
     	
	#fixedbtn{
		position:fixed;
		right:100px;
		bottom:50px;
		z-index:1000;
	}
	
	.thumb{
    	display: block;
    	overflow: hidden;
    	height: 35px;
    	width: 35px;
    }
    
    .thumb img{
    	display: block;
    	min-width: 100%;
    	min-height: 100%;
    	-ms-interpolation-mode: bicubic;
    }
	
	article, aside, footer, header, hgroup, main, nav, section {
	    display: block;
	}
			

	#navigation2 {
	    width: 100%;
	    z-index: 1000;
	    padding-top: 40px;
    }

    .navbar-custom ul.nav2 {
		text-align: center;
		float: none;
		margin: 0 auto;
	}
	.navbar-custom ul.nav2 li {
		float: none;
		display: inline-block;
		text-align: center;
	}
	.navbar-custom ul.nav2 li a {
		font-size: 14px;
		letter-spacing: 1px;
	    color: #444;
		text-transform: uppercase;
		font-weight: 700;
	}


	.navbar-custom .nav2 li a {
	    -webkit-transition: background .3s ease-in-out;
	    -moz-transition: background .3s ease-in-out;
	    transition: background .3s ease-in-out;
	}
	
	.sticky {
	  position: fixed;
	  width: 100%;
	  opacity: 0.7;
	}
	
	.sticky + .about {
	  padding-top: 483px;
	}
	#menu{
	background-color: #fff;
    padding-bottom: 20px;
    width: 100%;
	}
	
	#navigation2 > nav{
	background-color: #fff;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	}
	 
	.filebox input[type="file"] {  
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}
	a:link, a:visited { 
	    color: #00000;
	 }
	  a:link:active, a:visited:active { 
	    color: #00000;
	 }
	 
	.profile-img {
		border-radius: 50%;
	}
	
	.link-style {
	    float: right;
	    /* top: 10px; */
	    position: relative;
	    right: 0;
	    top: 6px;
	}
	
	.button-container {
  display: inline-block;
  margin: 10px 10px;
  cursor: pointer;
  font-weight: 400;
  letter-spacing: 2px;
  height: 45px;
  width: 200px;
  -webkit-perspective: 1000;
  -ms-perspective: 1000;
  perspective: 1000;
}
.button-container .flipper {
  transition: all .5s ease-in-out;
  -webkit-transform-style: preserve-3d;
  -ms-transform-style: preserve-3d;
  transform-style: preserve-3d;
  position: relative;
}
.button-container .button {
  height: 45px;
  width: 160px;
  border-radius: 3px;
  backface-visibility: hidden;
  position: absolute;
  top: 0;
  left: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  -webkit-box-shadow: 1px 2px 4px -1px rgba(60, 60, 60, 0.64);
  box-shadow: 1px 2px 4px -1px rgba(60, 60, 60, 0.64);
}
.button-container .button i.fa {
  color: white;
  font-size: 20px;
  margin: auto;
  text-shadow: .5px 1px 2px #3c3c3c;
}
.button-container .button.front {
  z-index: 10;
}
.button-container .button.back {
  color: white;
  font-size: 15px;
  text-transform: uppercase;
}
/* -------------------------------- 
			Slide
-------------------------------- */
.slider i {
  transition: all .3s ease-in-out;
}
.slider i:before {
  transition: all .3s ease-in-out;
}
.slider i:after {
  font-family: "Lato", sans-serif;
  color: white;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 2px;
  text-shadow: none;
  content: '         등록하기';
  position: absolute;
  opacity: 0;
  top: 2.5px;
  transition: all .3s ease-in-out;
}

/*** Horizontal Slide ***/
.button-slide-horizontal .button {
  background-image: linear-gradient(90deg, #ea4c89, #ee9b83);
}
.button-slide-horizontal i {
  position: relative;
  display: inline-block;
  transition: all .3s ease-in-out;
}
.button-slide-horizontal i:before {
  transition: all .3s ease-in-out;
}
.button-slide-horizontal:hover i {
  padding-right: 100px;
}
.button-slide-horizontal:hover i:before {
  opacity: 0;
}
.button-slide-horizontal:hover i:after {
  opacity: 1;
}
	
	.likeit-wrap .like-text.fa:after {
	content: "\e802"; /* fa-heart-o */
	color: #E26F6A;
	text-indent: 0;
	position: absolute;
	top: 0;
	left: 0;
}
	
	
	
</style>

</head>

<body>

	<div id="navigation2">
	    <nav class="navbar navbar-custom" role="navigation2">
	      <div class="container">
	        <div class="row">
	          <div class="col-md-12">
	            <div class="collapse navbar-collapse" id="menu"><br/>
	              <ul class="nav2 navbar-nav">
	                <li><img src="/resources/images/ufo.png" class="ufo" width="25"></li>
	                <li class="active"><c:if test="${search.searchCondition == 'N06'}"><a class="current-demo" href="/newsfeed/listNewsfeed?searchCondition=N06" style="font-family: 'Hanna', serif;">전체보기</a></c:if>
							<c:if test="${search.searchCondition != 'N06'}"><a href="/newsfeed/listNewsfeed?searchCondition=N06" style="font-family: 'Hanna', serif;">전체보기</a></c:if></li>&nbsp;&nbsp;
	                <li><c:if test="${search.searchCondition == 'N01'}"><a class="current-demo" href="/newsfeed/listNewsfeed?searchCondition=N01" style="font-family: 'Hanna', serif;">재잘재잘</a></c:if>
							<c:if test="${search.searchCondition != 'N01'}"><a href="/newsfeed/listNewsfeed?searchCondition=N01" style="font-family: 'Hanna', serif;">재잘재잘</a></c:if></li>&nbsp;&nbsp;
	                <li><c:if test="${search.searchCondition == 'N10'}"><a class="current-demo" href="/newsfeed/listNewsfeed?searchCondition=N10" style="font-family: 'Hanna', serif;">밥친구 후기</a></c:if>
							<c:if test="${search.searchCondition != 'N10'}"><a href="/newsfeed/listNewsfeed?searchCondition=N10" style="font-family: 'Hanna', serif;">밥친구 후기</a></c:if>
						</li>&nbsp;&nbsp;
	                <li><c:if test="${search.searchCondition == 'N04'}"><a class="current-demo"href="/newsfeed/listNewsfeed?searchCondition=N04" style="font-family: 'Hanna', serif;">꿀팁</a></c:if>
							<c:if test="${search.searchCondition != 'N04'}"><a href="/newsfeed/listNewsfeed?searchCondition=N04" style="font-family: 'Hanna', serif;">꿀팁</a></c:if>
						</li>&nbsp;&nbsp;
	                <li>	<c:if test="${search.searchCondition == 'N02'}"><a class="current-demo" href="/newsfeed/listNewsfeed?searchCondition=N02" style="font-family: 'Hanna', serif;">중고거래</a></c:if>
							<c:if test="${search.searchCondition != 'N02'}"><a href="/newsfeed/listNewsfeed?searchCondition=N02" style="font-family: 'Hanna', serif;">중고거래</a></c:if>
						</li>&nbsp;&nbsp;
					<c:if test="${user != null }"><li><a href="/newsfeed/listNewsfeed?searchKeyword=${user.userId}" style="font-family: 'Hanna', serif;" >친구글만</a></li>&nbsp;&nbsp;</c:if>
	              </ul>
	            </div>
	          </div>
	        </div>
	      </div>
	    </nav>
	 </div>

		
	<div class="content">
		<div class="wrap">
		 <div id="main" role="main">	

			<br>
		      <ul id="tiles">
		        <c:set var="i" value="0"/>
					<c:forEach var="newsfeed" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<li class="cell">
							<input type="hidden" value="${newsfeed.newsfeedId}" name="newsfeedId"/>
							<c:if test="${!fn:contains(newsfeed.categoryCode, 'N10')}">
								<img src="../resources/upload_files/images/${newsfeed.fileName}" style="width: 100%"
								onerror="this.src='../resources/images/sample_bob_background.jpg'" />
							</c:if>
							<c:if test="${fn:contains(newsfeed.categoryCode, 'N10')}">
								<img src="../resources/images/review.jpg" style="width: 100%"/>
							</c:if>
							<div class="post-info">
								<div class="post-basic-info">
									<span><a href="#">

									<label style="margin-bottom: 0"></label>
										<c:if test="${newsfeed.categoryCode.equals('N01')}">재잘재잘</c:if>

										<c:if test="${newsfeed.categoryCode.equals('N02')}">중고거래</c:if>
										<c:if test="${fn:contains(newsfeed.categoryCode, 'N10')}">밥친구 후기</c:if>
										<c:if test="${newsfeed.categoryCode.equals('N04')}">꿀팁</c:if>
									</a>
									
									<c:if test="${fn:contains(newsfeed.categoryCode, 'N10')}">
										<img src="../resources/images/link.png" width="15px" height="15px" class="link-style">
										<input type="hidden" name="getBobId" value="${fn:substring(newsfeed.categoryCode, 4, fn:length(newsfeed.categoryCode))}">
									</c:if>
										
									</span>
									<p></p>
									<table border="0">
										<tr>
											<td>
												<div class="thumb">
												<img src="../resources/upload_files/images/${newsfeed.profileImage}" class="profile-img"
													onerror="this.src='../resources/images/profile_default.png'" />>
												</div>
											</td>
											<td style="vertical-align: top; padding-left: 7px;">
												<input type="hidden" name="newsfeedUserId" value="${newsfeed.userId}" />
												<p><a style="color:#000000;">${newsfeed.userName}</a></p>
											</td>
										</tr>
									</table>
									<p style="font-size: 13pt">${newsfeed.content}</p>
									
									<div class="likeit-wrap" id="item${newsfeed.newsfeedId}" onClick="fnc_addLikey(${newsfeed.newsfeedId})">
										<div class="likeit" data-postid="4" id="countLikey" >
										<c:if test="${!empty sessionScope.user && newsfeed.likeUser eq user.userId}">
											<span class="like-text fa" style="cursor: pointer;">Like</span>
											<ins class="like-count" id="like${newsfeed.newsfeedId}" style="cursor: pointer; color: #ff5b4e">${newsfeed.countLikey}</ins></c:if>
										<c:if test="${!empty sessionScope.user && newsfeed.likeUser ne user.userId}">
											<span class="like-text" style="cursor: pointer;">Like</span>
											<ins class="like-count" id="like${newsfeed.newsfeedId}" style="cursor: pointer;">${newsfeed.countLikey}</ins></c:if>
											
											<c:if test="${empty sessionScope.user}">
											<span class="like-text" style="cursor: pointer;">Like</span>
											<ins class="like-count" style="cursor: pointer;">${newsfeed.countLikey}</ins></c:if>											
										</div>
										<span class="newliker">Thanks!</span>
										<span class="isliker">You've already liked this</span>
									</div>
									<span class="post-comment">
									<a href="/newsfeed/getNewsfeed?newsfeedId=${newsfeed.newsfeedId}">
										<c:if test="${newsfeed.countReply == 0 }">No comments</c:if>
										<c:if test="${newsfeed.countReply > 0}">${newsfeed.countReply}</c:if>
									</a></span>
								</div>
								<!-- <div class="post-info-rate-share">
				        			<div class="rateit">
				        				<span> </span>
				        			</div>
				        			<div class="post-share">
				        				<span> </span>
				        			</div>
				        			<div class="clear"> </div>
				        		</div> -->
								
							</div>
							
						
						</li>
					</c:forEach>
		      </ul>
		    </div>
		</div>
	</div>
	<!---//End-content---->
	
	<!----wookmark-scripts---->
	  <script src="../resources/javascript/jquery.imagesloaded.js"></script>
	  <script src="../resources/javascript/jquery.wookmark.js"></script>
	  <script type="text/javascript">
	  
		 $(function() {
			 window.onscroll = function() {myFunction()};

			 var header =  document.getElementById("navigation2");
			 var sticky = header.offsetTop;

			 function myFunction() {
				
			   if (window.pageYOffset >= sticky - 95) {
			     header.classList.add("sticky");
			   } else {
			     header.classList.remove("sticky");
			   }
			 }
			 

			 $('.mainbar-menu').on('click', function(){
				 $('.active').removeClass('active');
				 $(this).addClass('active');
			});

			
			$(document).on('click', '#tiles table > tbody > tr > td > p > a', function() {
				<c:if test="${empty sessionScope.user}">
					alert("로그인을 해주세요.");
					$("#loginModal").modal('show');
				</c:if>
				
				 <c:if test="${!empty sessionScope.user}">
					var userId = $($('input[name=newsfeedUserId]')[$('#tiles table > tbody > tr > td > p > a').index(this)]).val();
					self.location="/user/getTimeLine?userId="+userId;
				</c:if>
				
			});
			
			
			
			$(document).on('click', '#tiles > li > div > div > span > img', function() {
				<c:if test="${empty sessionScope.user}">
					alert("로그인을 해주세요.");
					$("#loginModal").modal('show');
				</c:if>
				
				<c:if test="${!empty sessionScope.user}">
					var bobId = $($('input[name=getBobId]')[$('#tiles > li > div > div > span > img').index(this)]).val();
					self.location = "/bob/getBob?bobId="+bobId+"&category=B01";
				</c:if>				
			});
			 
		});
		
		/* function들 */
	

		function getThumbnailPrivew(html, $target) {
		    if (html.files && html.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $target.css('display', '');
		            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
		            $target.html('<img src="' + e.target.result + '" border="0" alt="" />');
		        }
		        reader.readAsDataURL(html.files[0]);
		    }
		}
	
	  
	  	var page = ${search.currentPage};
		var pageSize = ${search.pageSize};
		var searchCondition = '${search.searchCondition}';
			

	    (function ($){
	      var $tiles = $('#tiles'),
	          $handler = $('li', $tiles),
	          $main = $('#main'),
	          $window = $(window),
	          $document = $(document),
	          options = {
	            autoResize: true, // This will auto-update the layout when the browser window is resized.
	            container: $main, // Optional, used for some extra CSS styling
	            offset: 20, // Optional, the distance between grid items
	            itemWidth:280 // Optional, the width of a grid item
	          };
	      /**
	       * Reinitializes the wookmark handler after all images have loaded
	       */
	      function applyLayout() {
	        $tiles.imagesLoaded(function() {
	          // Destroy the old handler
	          if ($handler.wookmarkInstance) {
	            $handler.wookmarkInstance.clear();
	          }

	
	          // Create a new layout handler.
	          $handler = $('li', $tiles);
	          $handler.wookmark(options);
	        });
	      }
	      /**
	       * When scrolled all the way to the bottom, add more tiles
	       */
	      function onScroll() {
	        // Check if we're within 100 pixels of the bottom edge of the broser window.
	        var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
	            closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);
	
	        if (closeToBottom) {
	          // Get the first then items from the grid, clone them, and add them to the bottom of the grid
	          //var $items = $('li', $tiles),
	              //$firstTen = $items.slice(0, 10);
	         // $tiles.append($firstTen.clone());
	         	page += 1;
				
				 $.ajax(
						{
						url : "/newsfeed/json/listNewsfeed/",
						method : "POST" ,
						dataType : "json" ,
						data : {
							"resultPage" : page,
							"category" : searchCondition
						},
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								
							for(var i=0; i<JSONData.length;i++){
								
								var displayValue = '<li class="cell" >'+
								'<input type="hidden" value="'+JSONData[i].newsfeedId+'" name="newsfeedId"/>';
									if(JSONData[i].fileName)
										displayValue += '<img src="../resources/upload_files/images/'+JSONData[i].fileName+'" style="width: 100%"/>';
									else
										displayValue += '<img src="../resources/images/sample_bob_background.jpg" style="width: 100%"/>';
									displayValue = displayValue + '<div class="post-info">'+
										'<div class="post-basic-info">'+
											'<span><a href="#"><label style="margin-bottom: 0"> </label>';
											if(JSONData[i].categoryCode == 'N01')
												displayValue += '재잘재잘';
											if(JSONData[i].categoryCode.includes('N10'))
												displayValue += '밥친구 후기';
											if(JSONData[i].categoryCode == 'N02')
												displayValue += '중고거래';
											if(JSONData[i].categoryCode == 'N04')
												displayValue += '꿀팁';
											
											displayValue = displayValue+'</a>';
											
											if(JSONData[i].categoryCode.includes('N10')) {
												displayValue = displayValue + '<img src="../resources/images/link.png" width="15px" height="15px" class="link-style">'
															+'<input type="hidden" name="getBobId" value="'+JSONData[i].categoryCode.substring(4)+'">';
											}
												
											displayValue = displayValue+ '</span><p></p><table border="0"><tr><td><div class="thumb">';
														
														if(!JSONData[i].profileImage){
															displayValue += '<img alt="" src="../resources/images/profile_default.png"></div>';
														}
														else{
															displayValue += '<img alt="" src="../resources/upload_files/images/'+JSONData[i].profileImage+'"></div>';
														}
													displayValue = displayValue+'</td>'+
													'<td style="vertical-align: top; padding-left: 7px;">'+
														'<p><a style="color:#000000;">'+JSONData[i].userName+'</a></p>'+
													'</td>'+
												'</tr>'+
											'</table>'+
											'<p style="font-size: 13pt">'+JSONData[i].content+'</p>'+
											'<div class="likeit-wrap" id="item" onClick="fnc_addLikey('+JSONData[i].newsfeedId+')">'+
												'<div class="likeit" data-postid="4" id="countLikey" >'+
													'<span class="like-text">Like</span>'+
													'<ins class="like-count" id="like'+JSONData[i].newsfeedId+'">'+JSONData[i].countLikey+'</ins>'+
												'</div>'+
												'<span class="newliker">Thanks!</span>'+
												'<span class="isliker">You\'ve already liked this</span>'+
											'</div>'+
											'<span class="post-comment">'+
											'<a href="/newsfeed/getNewsfeed?newsfeedId='+JSONData[i].newsfeedId+'">';
											
														
											if(JSONData[i].countReply == 0)
												displayValue += 'No comments';
											else
												displayValue += JSONData[i].countReply;
											displayValue = displayValue +'</a></span>'+
										'</div>'+
									'</div>'+
								'</li>';
								$tiles.append(displayValue);
							}
							applyLayout();
						}
					});
	          
	        }
	      };
	
	      // Call the layout function for the first time
	      applyLayout();
	
	      // Capture scroll event.
	      $window.bind('scroll.wookmark', onScroll);
	    })(jQuery);
	  </script>
	<!----//wookmark-scripts---->
	
 	<!----start-footer--->
 	<div class="footer">
 	
 	<c:if test="${!empty sessionScope.user}">
		<div id="fixedbtn" align="right" style="z-index: 1500;">
	  		<div class="container">
	  			<div class="btn-add-bob text-center" data-toggle="modal" data-target="#myModal3" style="font-size:20px; 
	  				background: url('../resources/images/ic_add_circle_black_36px.svg') center center no-repeat; background-size: cover;">
	  			</div>
	 	 	</div>
		</div>
	</c:if>
	</div>


	<!----Modal--->
		
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" role="document" style="width: 740px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><b>게시글 작성</b></h4>
        <form name='Form' class="form-vertical" enctype="multipart/form-data" style="padding-left: 30px;">
		<input type="hidden" value="${user.userId}" name="userId" id="userId"/>
		
		<input type="hidden"  name="locationX" value=""/>
		<input type="hidden" name="locationY" value="" />
		<input type="hidden" name="locationName" value="" />	
		<div class="container">
			<div class="row">
				<table border="1">
				  <tr>
					<td width="250">
						<div class="form-group" align="left">
						   <strong style="font-size: 12px">카테고리</strong> 
						   <select name="categoryCode"	id="categoryCode" class="form-control" style="height: 40px" maxLength="20">
								<option value="N01" selected="selected">재잘재잘</option>
								<option value="N02">중고거래</option>
								<option value="N10">밥친구후기</option>
								<option value="N04">꿀팁</option>
							</select>
						</div>
					</td>						  
					<td width="250">
					  <div class="form-group">
					    <strong style="font-size: 12px">공개범위</strong>
					    <select name="privacyBound"	id="privacyBound" class="form-control" style=" height: 40px" maxLength="20">
							<option value="1" selected="selected">전체공개</option>
							<option value="2">친구공개</option>
							<option value="3">비공개</option>
						</select>
					  </div>
					</td>					
					<td width="170" style="text-align: right; vertical-align: middle;">

						<div class="button-container button-slide-horizontal" onclick="addNewsfeed();">
					        <div class="slider slider-horizontal">
					            <div class="button">
					              	<i class="fa fa-dribbble"></i>
					            </div>
					        </div>
				    	</div>

					</td>
				  </tr> 
				</table>
				
				<table border="1">
				  <tr>
					<td style="table-layout:fixed" width="220px">
						<div class="filebox">
					        <label for="cma_file">사진 인증샷 업로드</label>
							<input type="file" name="file" id="cma_file" imageswap="true" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))"/>
					        <div id="cma_image" style="width:200px;max-width:200px;display:none;"></div>
					    </div>
					</td>						
					<td width=450 style="vertical-align: top; style="table-layout:fixed">&nbsp;&nbsp;&nbsp;&nbsp;
					  <p5 style="font-size: 30px; color:#ea4c89; display: flex; padding-top: 10pt">
					  	<i class="glyphicon glyphicon-map-marker" id="iconMarker"></i>
					  	<input type="text" name="ok" id="ok" placeholder="위치를 지정해주세요"
							style="font-size: 16px; width: 80%; height: 30px; padding-left: 20px; border: none;" readonly/>
							<div id="map"overflow:hidden;"></div></p5>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>&nbsp;&nbsp;&nbsp;&nbsp;
								<textarea class="form-control" rows="7" placeholder="상태를 업데이트 하세요." class="span1" cols="40" name="content" id=" content"></textarea>
						   
					</td>
				  </tr>
				</table>
				</div>
		   </div>
		</form>
	</div>
	</div>
  </div>
</div>
      		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	</body>
</html>

