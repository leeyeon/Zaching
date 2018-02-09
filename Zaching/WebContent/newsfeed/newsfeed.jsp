<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
	<head>
		<title></title>
		
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
		<!----//webfonts---->
		<!-- Global CSS for the page and tiles -->
  		<link rel="stylesheet" href="../resources/css/main.css">
  		<!-- //Global CSS for the page and tiles -->
		<!---start-click-drop-down-menu----->
		<script src="../resources/javascript/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <!----start-dropdown--->
         <script type="text/javascript">
        
         $(function(){
        		var myFileButton = new FileButton("imageswap", "imagesrc"); //new FileButton
 				window.onload = function () { 
 				myFileButton.run(); //
 			} 
        	 
        	 $(".cell").on("click",function(){
        		 var id = $($("input[name='newsfeedId']")[$("li").index(this)-6]).val();
        		 //alert($("li").index(this)-6);
        		 //alert($($("input[name='newsfeedId']")[$("li").index(this)]).val());
        		 //alert($($("input[name='newsfeedId']")[$("li").index(this)-6]).val());
        		 
        		 self.location="/newsfeed/getNewsfeed?newsfeedId="+id;
        	 });
        	 
         });
        	 function addNewsfeed(){
				$("form").attr("method", "POST").attr("action", "/newsfeed/addNewsfeed").submit();
			}
         
			
			
			function fnc_addLikey(newsfeedId){
				//alert(e);
				//alert($(v).text());
				
				//alert($($("li")[$("#likey").index(this)]).val());
				//var finalLikey = $("input[name='countLikey']").val();
				//$(".likeit").effect("bounce", {times:3}, 300);
				//alert(newsfeedId);
				var countLikey= $("#like"+newsfeedId).text();
				alert(countLikey);
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
						$(".likeit-wrap .likeit")
							.css("color","#E26F6A");
						$("#like"+newsfeedId).text(serverData);
						if(countLikey < serverData){
							$("#like"+newsfeedId).css("color","#ff5b4e");
						}
						
						else{
							$("#like"+newsfeedId).css("color","#aaaaaa");
						}
							//.css("text-decoration", "none");
						
					}
				});
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
			
			article, aside, footer, header, hgroup, main, nav, section {
			    display: block;
			}
			
			#main > div > header {
			    background-color: rgb(240, 239, 238);
			}
			
		</style>
	</head>
	<body>
		<!---start-wrap---->
			<!---start-header---->
		<!-- 	<div class="header">
				<div class="wrap">
				<div class="logo">
					<a href="index.jsp"><img src="../resources/images/newsfeedImages/logo.png" title="pinbal" /></a>
				</div>
				<div class="nav-icon">
					 <a href="#" class="right_bt" id="activator"><span> </span> </a>
				</div>
				 <div class="box" id="box">
					 <div class="box_content">        					                         
						<div class="box_content_center">
						 	<div class="form_content">
								<div class="menu_box_list">
									<ul>
										<li><a href="#"><span>home</span></a></li>
										<li><a href="#"><span>About</span></a></li>
										<li><a href="#"><span>Works</span></a></li>
										<li><a href="#"><span>Clients</span></a></li>
										<li><a href="#"><span>Blog</span></a></li>
										<li><a href="contact.jsp"><span>Contact</span></a></li>
										<div class="clear"> </div>
									</ul>
								</div>
								<a class="boxclose" id="boxclose"> <span> </span></a>
							</div>                                  
						</div> 	
					</div> 
				</div>       	  
				<div class="top-searchbar">
					<form>
						<input type="text" /><input type="submit" value="" />
					</form>
				</div>
				<div class="userinfo">
					<div class="user">
						<ul>
							<li><a href="#"><img src="../resources/images/newsfeedImages/user-pic.png" title="user-name" /><span>Ipsum</span></a></li>
						</ul>
					</div>
				</div>
				<div class="clear"> </div>
			</div>
		</div> -->
		<!---//End-header---->
		<!---start-content---->
		
		
		<div class="content">
			<div class="wrap">
			 <div id="main" role="main">
			 <div class="container">
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
			</div>
			 <form name='Form' class="form-vertical" enctype="multipart/form-data" style="padding-left: 30px;">
			<input type="hidden" value="${user.userId}" name="userId" id="userId"/>
			<div class="container">
				<div class="row">
				<table border="1">
					 <tr>
					 <td width="300">
						  <div class="form-group" align="left">
						   <strong style="font-size: 12px">카테고리</strong> <select 	name="categoryCode"	id="categoryCode" class="form-control" 
							style="height: 40px" maxLength="20">
						<option value="N01" selected="selected">자취지식인</option>
						<option value="N02">중고거래</option>
						<option value="N03">밥친구후기</option>
						<option value="N04">꿀팁</option>
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
					
					<td width="250" style="text-align: right; vertical-align: middle;">
						<a href="#" onclick="addNewsfeed();" class="addNewsfeed">등록</a>
					</td>
					</tr> 
					   </table>
					<table border="1">
						<tr>
						<td  style="table-layout:fixed">
							<div class="form-group" style="max-height:1px; hi">
								<input type="file" name="file" imageswap="true" imagesrc="../resources/images/imageButton.PNG"/>
							</div>
						</td>	
					
					  <td width=650 style="vertical-align: top; style="table-layout:fixed">
					  <p style="font-size: 30px; color: #00D1CD;"><i class="glyphicon glyphicon-map-marker" id="iconMarker"></i></p><br>
						   <textarea class="form-control" rows="7" placeholder="상태를 업데이트 하세요." class="span1" cols="40" name="content" id=" content"></textarea>
						      <!--  <input type="text" class="form-control" id="statement" name="statement" placeholder="���� ������Ʈ �ϼ���."> -->
						   
						    </td>
					    </tr>
					</table>
					  
					 
				   </div>
			   </div>

		</form>
		<br>
			      <ul id="tiles">
			        <c:set var="i" value="0"/>
						<c:forEach var="newsfeed" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<li class="cell">
								<input type="hidden" value="${newsfeed.newsfeedId}" name="newsfeedId"/>
								<c:if test="${ !empty newsfeed.fileName }"><img src="../resources/upload_files/images/${newsfeed.fileName}"/></c:if>
								<div class="post-info">
									<div class="post-basic-info">
										<span><a href="#"><label> </label><c:if test="${newsfeed.categoryCode.equals('N01')}">뉴스피드</c:if></a></span>
										<p></p>
										<table border="0">
											<tr>
												<td>
													<div class="thumb"><img alt="" src="../resources/images/${newsfeed.profileImage}"></div>
												</td>
												<td style="vertical-align: middle;">
													<p>${newsfeed.userName}</p>
												</td>
											</tr>
										</table>
										<p style="font-size: 13pt">${newsfeed.content}</p>
										
										<div class="likeit-wrap" id="item" onClick="fnc_addLikey(${newsfeed.newsfeedId})">
											<div class="likeit" data-postid="4" id="countLikey" >
												<span class="like-text">Like</span>
												<ins class="like-count" id="like${newsfeed.newsfeedId}">${newsfeed.countLikey}</ins>
											</div>
											<span class="newliker">Thanks!</span>
											<span class="isliker">You've already liked this</span>
										</div>
										<span class="post-comment">
										<a href="/newsfeed/getNewsfeed?newsfeedId=${newsfeed.newsfeedId}"><c:if test="${newsfeed.countReply == 0 }">No comments</c:if><c:if test="${newsfeed.countReply > 0}">${newsfeed.countReply}</c:if> </a></span>
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
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img1.jpg" width="282" height="118">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img2.jpg" width="282" height="344">
						<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
					</li>
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img3.jpg" width="282" height="210">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img4.jpg" width="282" height="385">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <!----//--->
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img4.jpg" width="282" height="385">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img3.jpg" width="282" height="210">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img2.jpg" width="282" height="344">
						<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
					</li>
					  <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img1.jpg" width="282" height="118">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <!----//--->
			         <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img1.jpg" width="282" height="118">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img2.jpg" width="282" height="344">
						<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
					</li>
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img3.jpg" width="282" height="210">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <li onclick="location.href='single-page.jsp';">
			        	<img src="../resources/images/newsfeedImages/img4.jpg" width="282" height="385">
			        	<div class="post-info">
			        		<div class="post-basic-info">
				        		<h3><a href="#">Animation films</a></h3>
				        		<span><a href="#"><label> </label>Movies</a></span>
				        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
			        		</div>
			        		<div class="post-info-rate-share">
			        			<div class="rateit">
			        				<span> </span>
			        			</div>
			        			<div class="post-share">
			        				<span> </span>
			        			</div>
			        			<div class="clear"> </div>
			        		</div>
			        	</div>
			        </li>
			        <!-- End of grid blocks -->
			      </ul>
			    </div>
			</div>
		</div>
		<!---//End-content---->
		<!----wookmark-scripts---->
		  <script src="../resources/javascript/jquery.imagesloaded.js"></script>
		  <script src="../resources/javascript/jquery.wookmark.js"></script>
		  <script type="text/javascript">
		   var page = 1;
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
								resultPage : page,
								category : "${category}"
							},
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
								
								for(var i=0; i<JSONData.length;i++){
									var displayValue = '<li onclick="location.href=\'/newsfeed/getNewsfeed?newsfeedId='+JSONData[i].newsfeedId+'\';" >'+
									'<img src="../resources/upload_files/images/'+JSONData[i].fileName+'"/>'+
										'<div class="post-info">'+
											'<div class="post-basic-info">'+
												'<span><a href="#"><label> </label>';
												
										if(JSONData[i].categoryCode =='N01') 
											displayValue +='�����ǵ�</a></span>';
											
											displayValue += '<p></p>'+
												'<div class="thumb"><img alt="" src="../resources/images/'+JSONData[i].profileImage+'" style="align: left;">'+JSONData[i].userName+'</div>'+
												'<p style="font-size: 13pt">'+JSONData[i].content+'</p>'+
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
			<p>Design by <a href="#">����</a></p>
		</div>
		<!----//End-footer--->
		<!---//End-wrap---->
	</body>
</html>

