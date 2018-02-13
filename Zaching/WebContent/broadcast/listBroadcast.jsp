<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
	<title>ListBroadcast</title>
	
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	<meta charset="utf-8">
	<meta name="author" content="pixelhint.com">
	<meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">

	
	
	<style type="text/css">
		.listings ul.properties_list li a #profile{
			width: 40px;
			height: 40px;
			border-radius: 150px;
		}
		
		body > section.listings > div > div > p10{
			cursor: pointer;
		}
		
		#footer {
		   position:fixed;
		   left:0px;
		   bottom:50px;
		   width:100%;
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
       	
       	.dialog-add-broads {
       		background: #ccc;
       		position: relative;
       		width: 200px;
       		left: -80px;
       		top: -200px;
       		box-shadow: 0 5px 15px -5px #666;
       	}
       	.btn-add-broads {
       		border: 1px solid #FFFFF;
			border-radius: 70px;
			-moz-border-radius: 70px;
			-khtml-border-radius: 70px;
			-webkit-border-radius: 70px;
			background: #5F4B8B;
			width: 80px;
			height: 80px;
			line-height: 80px;
			font-size: 25px;
			float:right;
			margin-right: 20px;
			cursor: pointer;
			color: #FFFFFF;
			box-shadow: 0 5px 15px -5px #666;
       	}
	}
		
	</style>
	<script type="text/javascript">
	
		$(function() {
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
					url : "/voice/json/listBroadcast",
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
			
		
		$(function(){
			$(document).on('click','.btn-add-broads', function(){
				alert("ㅎㅇ");
				$(self.location).attr("href","/broadcast,addBroadcast");
			});
		});
		
	</script>
</head>

<body>	
		<div class="cover"></div>
		<div class="bg"></div>
		
		<section class="hero" style="background-image: url('../resources/images/main_broadcast.jpg');
				background-size: cover;
				background-repeat: no-repeat, no-repeat;
				background-position: center center; height:700px; ">
			<div class="img-cover"></div>
			<section class="caption" style="padding-top: 70px;">
				<h2 class="caption">Zaching TV</h2>
			</section>
		</section>
			
	<section class="search" style="background: #000; margin-bottom: 30px;">
		<div class="wrapper">
			<form id="searchForm">
				<input type="text" id="search" name="searchKeyword" placeholder="What are you looking for?"  autocomplete="off" style="background: none;"/>
				<input type="submit" id="submit_search" name="submit_search"/>
			</form>
				<a href="#" class="advanced_search_icon" id="advanced_search_btn"></a>
		</div>
		
		<div class="advanced_search" >
			<div class="wrapper">
				<span class="arrow"></span>
					<div id="exTab2" style="padding:0;">
				</div>
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->
	    
	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
			
				<c:set var="i" value="0"/>
							<c:forEach var="obj" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<input type="hidden" name="writtenUserId" value="${bob.writtenUserId}">
								<li>
									<a href="#">
										<img src = "../resources/upload_files/images/${obj.image}"
								      	onerror="this.src='../resources/images/broadcast_default.jpg'" >
									</a>
									<!-- <span class="price"><i class="fas fa-play-circle"></i>&nbsp;${voice.countReply}</span> -->
									<div class="property_details" style="width: 100%">
										<h1>
											<a href="#" style="vertical-align: bottom;"><img src="../resources/images/${obj.profileImage}" id="profile" onerror="this.src='../resources/images/20160916_190916.jpg'">&nbsp;[BJ]&nbsp;${obj.broadcaster}</a>
										</h1>
										
										<h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
											<a href="#">${obj.title}</a>
										</h1>

									</div>
								</li>
			   				</c:forEach>
			</ul>
			<div class="more_listing">
				<p10 class="more_listing_btn">View More Listings</p10>
			</div>
		</div>
	</section>	<!--  end listing section  -->
	    		<!-- 방만들기 버튼 시작 -->
	
	<div id="footer" align="right" style="z-index: 1500;">
   	  <div class="container">
	  	<div class="btn-add-broads text-center" style="font-size:20px;
	  	background: url('../resources/images/ic_add_circle_black_36px.svg') center center no-repeat; background-size: cover;">
	  	</div>
	  	<div class="dialog-add-broads text-center">

	  	</div>
	  </div>
	</div>
	
	<!--  방만들기 버튼 끝 -->
	    	
</body>
</html>