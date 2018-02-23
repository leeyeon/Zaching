<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	<meta charset="utf-8">
	<meta name="author" content="pixelhint.com">
	<meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
	<script type="text/javascript" src="../resources/javascript/jquery.js"></script>
	<script type="text/javascript" src="../resources/javascript/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="../resources/javascript/FileButton.js"></script>
	

<script>
	$(function() {
		
		$("#search2").on('click',function() {

			var keyword = $("input[name=searchsong]").val();

			$.ajax({
						url : "/voice/rest/searchVoice",
						method : "POST",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify({
							"keyword" : keyword
						}),
						async : false,
						dataType : "json",
						success : function(serverData) {

							var name = "";

							//'<tr><td align="left">'+song.song[i].songName+'</td><td align="left">${user.email}</td></tr>'+
						
							for (var i = 0; i < 50; i++) {
								name = name
										+ '<tr><td align="left"><input type="hidden" id="songIdd" name="songIdd" value="'+serverData.melon.songs.song[i].songId+'" /><input type="hidden" id="name" name="name" value="'+serverData.melon.songs.song[i].artists.artist[0].artistName+'" /><input type="hidden" id="title" name="title" value="'+serverData.melon.songs.song[i].songName+'" />'
										+ serverData.melon.songs.song[i].songName
										+ '</td><td align="left">'
										+ serverData.melon.songs.song[i].artists.artist[0].artistName
										+ '</td></tr>';
							}

							var displayValue = '<div class="list"><table class="table table-hover table-striped"><tr><thead>'
									+ '<td class="th" align="left">노래제목</td><td class="th" align="left">가수명</td></tr><tbody>'
									+ name
									+ '</tbody></table></div>';

							$(".viewlist").html(displayValue);

							$(".viewlist td").click(function() {
												var title = $($("input[name='title']")[$('.viewlist td:nth-child(1)').index(this) - 1]).val();
												var name = $($("input[name='name']")[$('.viewlist td:nth-child(1)').index(this) ]).val();
												var songIdd = $($("input[name='songIdd']")[$('.viewlist td:nth-child(1)').index(this) - 1]).val();
												

												$("input[name='selectsong']").val(title);
												$("input[name='selectsinger']").val(name);
												
												$("input:hidden[name='voicelyrics']").val(songIdd);

												$("input[name='searchsong']").val(title+ " - "+ name);
												$("input[name='ok']").val(title+ " - "+ name);
												});
						}
					});
		});
		
		var myFileButton = new FileButton("imageswap", "imagesrc"); //new FileButton
		window.onload = function () { 
			myFileButton.run(); 
		}
		$("select").change(function() {
			
			if($("select option:selected").val() != 'R02'){
				$(".category1").css("display","none");
			}
			else{
				$(".category1").css("display","block");
			}

			
		});
		
		$("#makeVoiceRoom").on('click', function(){
			addVoice();
		});
		
		function addVoice(){
			var title = document.Form.voiceName.value;
			if (title == null || title.length < 1) {
				alert("방 제목을 입력해 주세요!");
				return;
			}
		
			$("#detailForm").attr("method", "POST").attr("action", "/voice/addVoice").submit();
		}
		
		

		$("#searchsong").on('input', function() {
			if ($("#searchsong").val() == '')
				$("#search2").attr("disabled", true);
			else
				$("#search2").attr("disabled", false);
		});

	});

	
		$(function(){
			
			
			
			var page = ${search.currentPage};
			var pageSize = ${search.pageSize};
			if('${search.searchCondition}' == '')
				var searchCondition = null;
			else
				var searchCondition = '${searchCondition}';
			if('${search.searchKeyword}' == '')
				var searchKeyword = null;
			else
				var searchKeyword = '${searchKeyword}';
			
			
			$("body > section.listings > div > div > p10").on("click", function(){
				fnc_listing();
			});
			
			function fnc_listing(){
				page++;
				
				$.ajax({
					url : "/voice/json/listVoice",
					method : "POST",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({
						"currentPage" : page,
						"pageSize" : pageSize,
						"searchCondition" : searchCondition,
						"searchKeyword" : searchKeyword
					}),
					async : false,
					dataType : "json",
					success : function(serverData){
						var display = '';
						for(var i=0; i<serverData.length; i++){
							display = display + '<li>'+
													'<a href="/voice/getVoice?voiceId='+serverData[i].voiceId+'">';
													if( serverData[i].backgroundImage != null)
														display += '<img src="../resources/images/voiceImages/'+serverData[i].backgroundImage+'" alt="" title="" class="property_img"/>';
													else
														display += '<img src="../resources/images/voiceImages/default.jpg" alt="" title="" class="property_img"/>';
													display = display + '</a>'+
													'<span class="price"><i class="fas fa-play-circle"></i>&nbsp;'+serverData[i].countReply+'</span>'+
													'<div class="property_details">'+
														'<h1>'+
															'<a href="/user/getTimeLine?userId='+serverData[i].userId+'" style="vertical-align: bottom;"><img src="../resources/images/'+serverData[i].profileImage+'" id="profile">&nbsp;'+serverData[i].userName+'</a>'+
														'</h1>'+
														'<h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'+
															'<a href="/voice/getVoice?voiceId='+serverData[i].voiceId+'">'+serverData[i].voiceName+'</a>'+
														'</h1>'+
														'<h2>';
														if(serverData[i].categoryCode == 'R02')
															display += '노래이어부르기&nbsp;';
														if(serverData[i].categoryCode == 'R03')
															display += '글 읽어주기&nbsp;';
														if(serverData[i].categoryCode == 'R04')
															display += 'ASMR&nbsp;';
														if(serverData[i].categoryCode == 'R05')
															display += '알림음 만들기&nbsp;';
														if(serverData[i].categoryCode == 'R06')
															display += '프리토킹&nbsp;';
														display = display + '<span class="property_size">'+serverData[i].voicelyrics+'</span></h2>'+
													'</div>'+
												'</li>';
						}
						$(".properties_list").append(display);
					}
				});
			}
		});
	</script>
	
	<style type="text/css">	
		
body {
	padding-top: 130px;
}



body>div.container {
	margin-top: 10px;
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




.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 15px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #5F4B8B;
	color: white;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 17px;
	font-size: 15px;
	border: none;
	width: 300px;
	color: #000000;
}

.topnav .search-container button {
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	font-size: 15px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

.songSelect{
background: #fff;

}


.makevoice{
	text-align: center;
	vertical-align: middle;
	align : center;
}
#detailForm > div > div > div.form-group > div > button{
border-radius: 5px;
background-color: #4379f3e8;;
font-family: 'Hanna', serif;
}
#myModal3 > div > div > div > div > center > div > center > button{
border-radius: 5px;
background-color: #4379f3e8;;
font-family: 'Hanna', serif;
}
.makevoiceroom {

	display:inline-block;
	color:#ffffff;
	font-size:15px;
	height:40px;
	line-height:40px;
	width:100px;
	text-decoration:none;
	text-align:center;

}

.viewlist{
width:100%;}



		.listings ul.properties_list li a #profile{
			width: 40px;
			height: 40px;
			border-radius: 150px;
		}
		
		body > section.listings > div > div > p10{
			cursor: pointer;
		}
		
		#ck-button {
		    margin:4px;
		    background-color:#EFEFEF;
		    border-radius:4px;
		    border:1px solid #D0D0D0;
		    overflow:auto;
		    float:left;
		}

		.search_fields label span {
		    text-align:center;
		    padding:3px 0px;
		    display:block;
		}
		.search_fields label input {
		    position:absolute;
		    top:0px;
		}
		.search_fields input:checked + span {
		    background-color:#a2dfe5;
		    color:#fff;
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
       	#fixedbtn{position:fixed;
			right:100px;
			bottom:50px;
			z-index:1000}

		.viewlist{
			cursor: pointer;
		}
		.hero{
		height: 700px;
		}
		
		.listings ul.properties_list li .price{
		    position: absolute;
		    top: 10px;
		    left: 10px;
		    padding: 15px 20px;
		    background: #ffffff;
		    color: #514d4d;
		    font-family: "lato-bold", Helvetica, Arial, sans-serif;
		    font-size: 16px;
		    font-weight: bold;
		    letter-spacing: 1px;
		
		    border-radius: 2px;
		    -webkit-border-radius: 2px;
		    -moz-border-radius: 2px;
		    -o-border-radius: 2px;
		    text-shadow: none;
		}
		
		.listings{
    padding: 100px 0;
}

a {
text-decoration:none;
color:#000;
}

.nav a{
font-family: 'Hanna', serif;"
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
	
	.flex-grid-center {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  margin: 5em 0;
}

.fuller-button {
  color: white;
  background: #333;
  border-radius: 0;
  padding: 1.2em 0;
  letter-spacing: 0.35em;
  font-size: 0.8em;
  -webkit-transition: background-color 0.3s, color 0.3s, -webkit-box-shadow 0.3s;
  transition: background-color 0.3s, color 0.3s, -webkit-box-shadow 0.3s;
  transition: background-color 0.3s, box-shadow 0.3s, color 0.3s;
  transition: background-color 0.3s, box-shadow 0.3s, color 0.3s, -webkit-box-shadow 0.3s;
  margin: 1em;
  cursor: pointer;
}
.fuller-button.blue {
  -webkit-box-shadow: inset 0 0 1em rgba(0, 170, 170, 0.5), 0 0 1em rgba(0, 170, 170, 0.5);
          box-shadow: inset 0 0 1em rgba(0, 170, 170, 0.5), 0 0 1em rgba(0, 170, 170, 0.5);
  border: #0dd solid 2px;
}
.fuller-button.blue:hover {
  background-color: #0dd;
  -webkit-box-shadow: inset 0 0 0 rgba(0, 170, 170, 0.5), 0 0 1.5em rgba(0, 170, 170, 0.7);
          box-shadow: inset 0 0 0 rgba(0, 170, 170, 0.5), 0 0 1.5em rgba(0, 170, 170, 0.7);
}
.fuller-button.red {
  -webkit-box-shadow: inset 0 0 1em rgba(251, 81, 81, 0.4), 0 0 1em rgba(251, 81, 81, 0.4);
          box-shadow: inset 0 0 1em rgba(251, 81, 81, 0.4), 0 0 1em rgba(251, 81, 81, 0.4);
  border: #fb5454 solid 2px;
}
.fuller-button.red:hover {
  background-color: #fb5454;
  -webkit-box-shadow: inset 0 0 0 rgba(251, 81, 81, 0.4), 0 0 1.5em rgba(251, 81, 81, 0.6);
          box-shadow: inset 0 0 0 rgba(251, 81, 81, 0.4), 0 0 1.5em rgba(251, 81, 81, 0.6);
}
.fuller-button.white {
  -webkit-box-shadow: inset 0 0 0.8em rgba(255, 255, 255, 0.3), 0 0 0.8em rgba(255, 255, 255, 0.3);
          box-shadow: inset 0 0 0.8em rgba(255, 255, 255, 0.3), 0 0 0.8em rgba(255, 255, 255, 0.3);
  border: #fff solid 2px;
}
.fuller-button.white:hover {
  color: rgba(0, 0, 0, 0.8);
  background-color: #fff;
  -webkit-box-shadow: inset 0 0 0 rgba(255, 255, 255, 0.3), 0 0 1.2em rgba(255, 255, 255, 0.5);
          box-shadow: inset 0 0 0 rgba(255, 255, 255, 0.3), 0 0 1.2em rgba(255, 255, 255, 0.5);
}

.pure-control-group {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  position: relative;
  padding: 0 1em 2.6em 1em;
}

.pure-form .pure-control-group label {
  text-align: left;
  position: absolute;
  left: 0;
  top: 15%;
  z-index: 0;
  letter-spacing: 0;
  margin: 0 1em;
}

.pure-form .pure-control-group input {
  background: none;
  -webkit-box-shadow: none;
          box-shadow: none;
  padding-left: 0;
  border-radius: 0;
  border: none;
  border-bottom: 2px solid rgba(255, 255, 255, 0.4);
  position: relative;
  z-index: 1;
  color: #fff;
}

.pure-form .pure-control-group input:focus {
  border-bottom: 2px solid white;
}

.pure-form .pure-control-group textarea {
  background: none;
  -webkit-box-shadow: none;
          box-shadow: none;
  border-radius: 0;
  border: none;
  border-left: 2px solid rgba(255, 255, 255, 0.4);
  resize: none;
  height: 8em;
  color: #fff;
}

.pure-form .pure-control-group textarea:focus {
  border-left: 2px solid white;
}

.pure-form .pure-control-group input[type=email]:focus:invalid {
  color: #fff;
}

.pure-form .pure-control-group input[type=email]:invalid {
  color: #fb5454;
}

.pure-form button {
  margin: 0.5em 1em;
}


.checkBox {
  width: 130px;
  height: 65px;
  margin: 15px auto;
  color: #4274D3;
  font-family: 'Open Sans', sans-serif;
  font-size: 1.15rem;
  line-height: 55px;
  text-transform: uppercase;
  text-align: center;
  position: relative;
  cursor: pointer;
}

#makeVoiceRoom svg {
  position: absolute;
  top: 0;
  left: 0;
}
#makeVoiceRoom svg rect, #makeVoiceRoom svg path, #makeVoiceRoom svg polyline {
  fill: none;
  stroke: #4274D3;
  stroke-width: 1;
}

/* Check Box */
.checkBox {
  /* Add Padding Left To Center Text */
}
.checkBox svg {
  /* Presentation Purposes */
  margin-left: -3px;
}
.checkBox svg rect, .checkBox svg polyline {
  fill: none;
  stroke: #4274D3;
  stroke-width: 1;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.checkBox:hover svg rect {
  stroke-width: 2;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.checkBox:hover svg polyline {
  stroke-width: 2;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.checkBox svg .button {
  stroke-dasharray: 400px, 0;
}
.checkBox:hover svg .button {
  stroke-dasharray: 0, 400px;
  stroke-dashoffset: 33px;
}
/* Check Mark Effect */
.box, .checkMark {
  opacity: 0;
}
.checkBox:hover .box {
  -webkit-animation: boxDisplay 0.2s forwards;
  -moz-animation: boxDisplay 0.2s forwards;
  -ms-animation: boxDisplay 0.2s forwards;
  -o-animation: boxDisplay 0.2s forwards;
  animation: boxDisplay 0.2s forwards;
  -webkit-animation-delay: 0.65s;
  -moz-animation-delay: 0.65s;
  -ms-animation-delay: 0.65s;
  -o-animation-delay: 0.65s;
  animation-delay: 0.65s;
}
.checkBox:hover .checkMark {
  -webkit-animation: checkDisplay 0.2s forwards;
  -moz-animation: checkDisplay 0.2s forwards;
  -ms-animation: checkDisplay 0.2s forwards;
  -o-animation: checkDisplay 0.2s forwards;
  animation: checkDisplay 0.2s forwards;
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  -ms-animation-delay: 1s;
  -o-animation-delay: 1s;
  animation-delay: 1s;
}
/* Check Box Display */
@-webkit-keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-moz-keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-ms-keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-o-keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
/* Check Mark Display */
@-webkit-keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-moz-keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-ms-keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-o-keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
	
	
	</style>
	
	<script>
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
	</script>
</head>

<body>
	
	<section class="hero">
		

			<section class="caption">
				<h2 class="caption">zaching Radio</h2>
				<h3 class="properties">Appartements - Houses - Mansions</h3>
			</section>
	</section><!--  end hero section  -->



	<section class="search">
		<div class="wrapper">
			<form action="/voice/listVoice" method="post">
				<input type="text" id="search" name="searchKeyword" placeholder="What are you looking for?"  autocomplete="off"/>
				<input type="submit" id="submit_search" name="submit_search"/>
			</form>
			<a href="#" class="advanced_search_icon" id="advanced_search_btn"></a>
		</div>

		<div class="advanced_search">
			<div class="wrapper">
				<span class="arrow"></span>
				<form action="#" method="post">
					<div class="search_fields">
						<label><input type="radio" class="float" name="searchCondition" id="searchCondition" value="1"><span>radio_1</span></label>
						<hr class="field_sep float"/>
						<input type="text" class="float" id="min_price" name="min_price" placeholder="Min. Price"  autocomplete="off">
					</div>
					<div class="search_fields">
						<input type="text" class="float" id="min_price" name="min_price" placeholder="Min. Price"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="max_price" name="max_price" placeholder="Max. price"  autocomplete="off">
					</div>
					<input type="text" id="keywords" name="keywords" placeholder="Keywords"  autocomplete="off">
					<input type="submit" id="submit_search" name="submit_search"/>
				</form>
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->

	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
				<c:set var="i" value="0"/>
							<c:forEach var="voice" items="${list}">
							<c:set var="i" value="${ i+1 }" />
								<li>
									<a href="/voice/getVoice?voiceId=${voice.voiceId}">
										<c:if test="${ !empty voice.backgroundImage}"><img src="../resources/images/voiceImages/${voice.backgroundImage}" alt="" title="" class="property_img"/></c:if>
										<c:if test="${ empty voice.backgroundImage}"><img src="../resources/images/voiceImages/default.jpg" alt="" title="" class="property_img"/></c:if>
									</a>
									<span class="price"><i class="fas fa-play-circle"></i>&nbsp;${voice.countReply}</span>
									<div class="property_details">
										<h1>
											<a href="/user/getTimeLine?userId=${voice.userId}" style="vertical-align: bottom;"><c:if test="${!empty voice.profileImage}"><img src="../resources/images/${voice.profileImage}" id="profile"></c:if>
											<c:if test="${empty voice.profileImage}"><img src="../resources/images/profile_default.png" id="profile"></c:if>&nbsp;${voice.userName}</a>
										</h1>
										
										<h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
											<a href="/voice/getVoice?voiceId=${voice.voiceId}">${voice.voiceName}</a>
										</h1>
										<h2><c:if test="${voice.categoryCode == 'R06'}">프리토킹&nbsp;</c:if></h2>
										<h2><c:if test="${voice.categoryCode == 'R02'}">노래이어부르기&nbsp;</c:if></h2>
										<h2><c:if test="${voice.categoryCode == 'R03'}">글 읽어주기&nbsp;</c:if></h2>
										<h2><c:if test="${voice.categoryCode == 'R04'}">ASMR&nbsp;</c:if></h2>
										<h2><c:if test="${voice.categoryCode == 'R05'}">알림음 만들기&nbsp;</c:if></h2>
									</div>
								</li>
			   				</c:forEach>
			</ul>
			<div class="more_listing">
				<p10 class="more_listing_btn">View More Listings</p10>
			</div>
		</div>
	</section>	<!--  end listing section  -->

<div id="fixedbtn" align="right" style="z-index: 1500;">
<c:if test="${user.userId ne null}">
   	  <div class="container">
	  	<div class="btn-add-bob text-center" data-toggle="modal" data-target="#myModal3" style="font-size:20px; 
	  	background: url('../resources/images/ic_add_circle_black_36px.svg') center center no-repeat; background-size: cover;">
	  	</div>
	  </div></c:if>
	</div>
	<footer>
		<div class="copyrights wrapper">
			Copyright © 2015 <a href="http://pixelhint.com" target="_blank" class="ph_link" title="Download more free Templates">Pixelhint.com</a>. All Rights Reserved.
		</div>
	</footer><!--  end footer  -->
	
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document"  style="width: 600px; ">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><b>방만들기</b></h4>
		<div class="songSelect">
		<center>
			<form name='Form' id="detailForm" class="form-vertical" enctype="multipart/form-data">
			<input type="hidden" name="userId" value="${user.userId}">
			<input type="hidden" name="voicelyrics" value=""> <!-- 노래 가사에 넣으셈 -->
			<div class="row">
				<div class="form-group" >
					<br/><div></div>
							<div class="filebox">
					        <label for="cma_file">배경사진 설정</label>
							<input type="file" name="uploadFile" id="cma_file" imageswap="true" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))"/>
					        <div id="cma_image" style="width:200px;max-width:200px;display:none;"></div>
					    </div>					    
						<input type="text" name=voiceName placeholder="방 제목을 입력해주세요"
							style="font-size: 20px; width: 100%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;" maxlength="30"/><br/>
							<div class="form-group" style="margin-top: 10px;" align="left">
						   <strong style="font-size: 15px">카테고리</strong> <select 	name="categoryCode"	id="categoryCode" class="form-control" 
							style="height: 40px; margin-top:10px;" maxLength="20">
						<option value="R02" selected="selected">노래 이어 부르기</option>
						<option value="R03">글 읽어주기</option>
						<option value="R04">ASMR</option>
						<option value="R05">알림음 만들기</option>
						<option value="R06">프리토킹</option>
					</select>
					<br/>
					<div class="category1" style="vertical-align: -webkit-baseline-middle;">
					<input type="text" name="ok" id="ok" placeholder="무슨 노래인가요?"
							style="font-size: 20px; width: 80%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee; float: left; width:75%" readonly/>
							
							<!-- <button type="button" class="songSelectButton" data-toggle="modal" data-target="#myModal2">노래 검색</button>-->
							<div class="pure-button fuller-button blue" data-toggle="modal" data-target="#myModal2" style="text-align: center; float:left; width:20%">노래검색</div>
							
						  </div></div>
				</div>
		</div>
	</form>
	
      	<div class="checkBox" id="makeVoiceRoom">
		  등&nbsp;록
		  <svg width="140" height="55" viewBox="0 0 140 65">
		    <rect x="10" class="button" width="128.8" height="63.9"/>
		    <rect x="0" y="22.5" class="box" width="20" height="20"/>
		    <polyline class="checkMark" points="4.5,32.6 8.7,36.8 16.5,29.1"/>
		  </svg>
		</div>
	</div>
	</div>
      </div>
      	</div>
      	</div>
      	
      	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" >
			<div class="modal-content">
				<div class="modal-header" style="padding-bottom: 0;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<b>노래를 검색하세요!</b>
					</h4><div class="topnav">
					<div class="search-container">
							<input type="text" placeholder="제목이나 가수명을 입력하세요"
								name="searchsong" id="searchsong" value="" style="float: left; width:58%; font-size:17px;">
							<!-- <button type="button" class="btn btn-primary" id="search2">검색</button>
							<button type="submit" class="btn btn-primary" data-dismiss="modal" id="select">선택</button> -->
							<div class="pure-button fuller-button red" id="search2" style="text-align: center; float: left; width: 17%;">검색</div>
  							<div class="pure-button fuller-button white" data-dismiss="modal" id="select" style="text-align: center; float: left; width: 17%;">선택</div>
							<br />
							
						</div></div>
				</div>
				<div class="modal-body" style="height: 400px;  overflow : auto ;">
					<div class="topnav">
						
						<div class="viewlist" ></div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="topnav">
						<div class="search-container">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
      	
      	
      	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</body>
</html>