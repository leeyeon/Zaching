<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>La Casa - Real Estate HTML5 Home Page Template</title>
	
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
	
	<script>
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
													'<a href="#">';
													if( serverData[i].backgroundImage != null)
														display += '<img src="../resources/images/voiceImages/'+serverData[i].backgroundImage+'" alt="" title="" class="property_img"/>';
													else
														display += '<img src="../resources/images/voiceImages/default.jpg" alt="" title="" class="property_img"/>';
													display = display + '</a>'+
													'<span class="price"><i class="fas fa-play-circle"></i>&nbsp;'+serverData[i].countReply+'</span>'+
													'<div class="property_details">'+
														'<h1>'+
															'<a href="#" style="vertical-align: bottom;"><img src="../resources/images/'+serverData[i].profileImage+'" id="profile">&nbsp;'+serverData[i].userName+'</a>'+
														'</h1>'+
														'<h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'+
															'<a href="#">'+serverData[i].voiceName+'</a>'+
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
		
		
	</style>
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
									<a href="#">
										<c:if test="${ !empty voice.backgroundImage}"><img src="../resources/images/voiceImages/${voice.backgroundImage}" alt="" title="" class="property_img"/></c:if>
										<c:if test="${ empty voice.backgroundImage}"><img src="../resources/images/voiceImages/default.jpg" alt="" title="" class="property_img"/></c:if>
									</a>
									<span class="price"><i class="fas fa-play-circle"></i>&nbsp;${voice.countReply}</span>
									<div class="property_details">
										<h1>
											<a href="#" style="vertical-align: bottom;"><img src="../resources/images/${voice.profileImage}" id="profile">&nbsp;${voice.userName}</a>
										</h1>
										
										<h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
											<a href="#">${voice.voiceName}</a>
										</h1>
										<h2><c:if test="${voice.categoryCode == 'R06'}">프리토킹&nbsp;</c:if><span class="property_size">${voice.voicelyrics}</span></h2>
									</div>
								</li>
			   				</c:forEach>
			</ul>
			<div class="more_listing">
				<p10 class="more_listing_btn">View More Listings</p10>
			</div>
		</div>
	</section>	<!--  end listing section  -->

	<footer>
		<div class="wrapper footer">
			<ul>
				<li class="links">
					<ul>
						<li><a href="#">About</a></li>
						<li><a href="#">Support</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Policy</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</li>

				<li class="links">
					<ul>
						<li><a href="#">Appartements</a></li>
						<li><a href="#">Houses</a></li>
						<li><a href="#">Villas</a></li>
						<li><a href="#">Mansions</a></li>
						<li><a href="#">...</a></li>
					</ul>
				</li>

				<li class="links">
					<ul>
						<li><a href="#">New York</a></li>
						<li><a href="#">Los Anglos</a></li>
						<li><a href="#">Miami</a></li>
						<li><a href="#">Washington</a></li>
						<li><a href="#">...</a></li>
					</ul>
				</li>

				<li class="about">
					<p>La Casa is real estate minimal html5 website template, designed and coded by pixelhint, tellus varius, dictum erat vel, maximus tellus. Sed vitae auctor ipsum</p>
					<ul>
						<li><a href="http://facebook.com/pixelhint" class="facebook" target="_blank"></a></li>
						<li><a href="http://twitter.com/pixelhint" class="twitter" target="_blank"></a></li>
						<li><a href="http://plus.google.com/+Pixelhint" class="google" target="_blank"></a></li>
						<li><a href="#" class="skype"></a></li>
					</ul>
				</li>
			</ul>
		</div>

		<div class="copyrights wrapper">
			Copyright © 2015 <a href="http://pixelhint.com" target="_blank" class="ph_link" title="Download more free Templates">Pixelhint.com</a>. All Rights Reserved.
		</div>
	</footer><!--  end footer  -->
	
</body>
</html>