<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>mainBob</title>
	
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	<link rel="stylesheet" type="text/css" href="../resources/css/bob.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
	
	<style>
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);		
		
		* {
			font-family: 'Nanum Gothic', serif;
		}
	
		body {
			padding-bottom: 50px;
		}
		
		.cover {
			background-color: #000;
			position: fixed;
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			z-index: 1500;
			opacity: 0.5;
			visibility: hidden;
		}
		
		.bg {
			position: fixed;
			width: 100%;
			height: 100%;
			background-size: cover;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.3;
		}
		
		.select-bob {
       		background: rgba(237,237,237,1); 
       		border: none; 
       		display: inline-block;
       		color: #000000;
       		font-size: 18px; 
       		font-weight: bold;
       		text-align: center;
       		height: 50px;
			line-height: 50px;
       		text-decoration: none;
       		border: 1px solid #FFFFFF;
       		cursor: pointer;
       		padding: 0 10px 0 10px;
       	}
       	
       	.img-cover{
	         position: absolute;
	         height: 100%;
	         width: 100%;
	         background-color: rgba(0, 0, 0, 0.3);                                                                 
	         z-index:1;
     	 }
      
		#footer {
		   position:fixed;
		   left:0px;
		   bottom:-150px;
		   width:100%;
		}
		
		.btn-add-bob {
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
       	
       	.dialog-add-bob {
       		background: #ccc;
       		position: relative;
       		width: 200px;
       		left: -80px;
       		top: -200px;
       		box-shadow: 0 5px 15px -5px #666;
       	}
       	
		.user_thumnail {
		    position: absolute;
		    display: inline-block;
		    border-radius: 50%;
		    width: 90px;
		    height: 90px;
		    top: 220px;
		    left: 38%;
		}
		
		.thumnail {
		    border-radius: 50%;
		    width: 70px;
		    height: 70px;
		    margin: 5px;
		    overflow: hidden;
		}
		
		#exTab2 > ul > li> a {
		    line-height: 50px;
		    color: #000;
		    font-size: 15px;
		    font-weight: bold;
		    border: none;
		}
		
		.listings ul li img {
		    border-top: 1px solid #cccccc;
		    border-left: 1px solid #cccccc;
		    border-right: 1px solid #cccccc;
		}
		
		#exTab2 > ul > li> a:hover {
			background-color: #f2dede;
		}
		
		#exTab2 > ul > li.active > a {
			background-color: #f2dede;
			cursor: pointer;
		}
		
		@media only screen and (min-device-width : 320px) and (max-device-width : 480px) {
			#bobTitle {
				max-width: 100%;
			}
			
			body > div.jumbotron.text-center > form > div > div {
				max-width: 100%;
			}
		}
		
		.hero {
			background: url('../resources/images/202991-OZ1TED-507.jpg') no-repeat bottom center;
		}
		

		.nav a{
font-family: 'Hanna', serif;"
}

		.listings ul li .property_details {
			background: #fff;
		    border-bottom: 1px solid #cccccc;
		    border-left: 1px solid #cccccc;
		    border-right: 1px solid #cccccc;
	    }
			
	</style>
	
	<script type="text/javascript">
    
		$(function(){
			
			$("html, body").animate({ scrollTop: 0 }, "slow");
			
			$(document).on('click','.btn-add-bob', function(){
				if($('.list-group').css('visibility') =='visible') {
					$('.list-group').css('visibility','hidden');
					$('.cover').css('visibility','hidden');
				} else {
					$('.list-group').css('visibility','visible');
					$('.cover').css('visibility','visible');
					
				}
			});
			
			$('.cover').on('click', function() {
				$('.list-group').css('visibility','hidden');
				$('.cover').css('visibility','hidden');
			});
			
			// 검색했을 때 tooltip

			$(":text[name='searchKeyword']").on("keydown", function(e) {

				if(e.keyCode == 13) {
					//$(self.location).attr("href","/bob/listBob?category=B05");
					
					var $form = $("#searchForm");
					
					var posting = $.post("/bob/listBob",{
								category: "B05",
								searchKeyword : $(":text[name='searchKeyword']").val()});
					
					posting.done(function(data) {

						$("#B05").html(data);
						
						$("#mainBob > .tab-content").html(data);

						/* css 색 변경하기 */
						$('#exTab2 a').css('color', '#000');
						$('#exTab2 a').css('background', '#ede8f7');						
						$($('a:contains("검색")')[1]).css('color', '#000').css('background', '#FFF')
					});
					
					return false;
					
				} else {
					/*
					$(this).autocomplete({
						source: function(request, response) {
						$.ajax({
							url : "/product/json/listProductName",
							method : "POST",
							data : {
								prodName : request.term
							},
							dataType : "json",
							success : function(serverData) {
								response(serverData);
							}
						});
						},
						minLength : 2
					});
					*/
				}
			});
			
			/* addBob */
			
			$('.list-group-item').on("click", function() {
				<c:if test="${!empty user && (fn:trim(user.role) eq '2')}"> 
					$(self.location).attr("href","/bob/addBob?category="+($(this).attr("id")).substring(4));
				</c:if>
				<c:if test="${!empty user && (fn:trim(user.role) eq '1')}"> 
					alert("본인인증 이후에 밥친구 서비스를 모두 이용하실 수 있습니다.");
				</c:if>
				<c:if test="${empty user}">
					alert("로그인을 해주세요.");
					$('.list-group').css('visibility','hidden');
					$('.cover').css('visibility','hidden');
					$('#loginModal').modal('toggle');
				</c:if>
			});

			
			/* tab Event Start */
		    $.get($($('[data-toggle="tabajax"]')[0]).attr('href'), function(data) {
		        $("#mainBob > .tab-content").html(data);
		    });

		    $($('[data-toggle="tabajax"]')[0]).tab('show');
			
			$('[data-toggle="tabajax"]').click(function(e) {
			    var $this = $(this),
			        loadurl = $this.attr('href'),
			        targ = $this.attr('data-target');
			    
			    $(":text[name='searchKeyword']").val("");

			    if('${user}' == '' && (targ == "#B03" || targ == "#B04")) {
					alert("로그인 후 사용하실 수 있습니다. \n"
							+"간편회원가입을 통해서 쉽고 간편하게 자췽 서비스를 이용하실 수 있습니다.");
					$('#loginModal').modal('toggle');
					//$(self.location).attr("href","/user/addUser");
				} else {
					
					if(targ == "#B04") {
						if(navigator.geolocation) {
							navigator.geolocation.getCurrentPosition(function(position) {
				                    var lat = position.coords.latitude;
				                    var lng = position.coords.longitude;

				                    var location ={
				                    		"lat" : lat,
				                    		"lng" : lng
				                    };
				                    
				                    //alert(lat +"/"+lng);
								}
							)
						};
					}
					
					if(targ == "#B05") {
						
						var posting = $.post("/bob/listBob",{
									category: "B05",
									searchKeyword : $(":text[name='searchKeyword']").val()});
						
						posting.done(function(data) {
							$("#mainBob > .tab-content").html(data);
						});
						
						$this.tab('show');

					} else {
					    $.get(loadurl, function(data) {
					    	$("#mainBob > .tab-content").html(data);
					    });
					    
					    $this.tab('show');
					}
				}

			    return false;
			});
			
			/*  Advanced search form & Icon  */
			$('#advanced_search_btn').on("click", function(e){
				e.preventDefault();

				var ads_box =$('.advanced_search');
				
				if(!ads_box.hasClass('advanced_displayed')){

					$(this).addClass('active');
					ads_box.stop().fadeIn(200).addClass('advanced_displayed');

				}else{

					$(this).removeClass('active');
					ads_box.stop().fadeOut(200).removeClass('advanced_displayed');

				}

			});
			
			/*
			$(document).on('change','#loader', function () {
				$('footer').show();
			});
			*/

		});		

    </script>
	
</head>
	
	
<body style="background: #e3e3e3;">

	<div class="cover"></div>
	<div class="bg"></div>

	<section class="hero" style="background-image: url('../resources/images/202991-OZ1TED-507.jpg');
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center; height:700px; ">
		<div class="img-cover"></div>
		<section class="caption" style="padding-top: 70px;">
			<h2 class="caption">Let's eat Together</h2>
		</section>
	</section>
	
	<section class="search" style="background: #f77e7e;">
		<div class="wrapper">
			<form id="searchForm">
				<input type="text" id="search" name="searchKeyword" placeholder="What are you looking for?"  autocomplete="off"
					style="background: none;"/>
				<a href="#" class="advanced_search_icon" id="advanced_search_btn"></a>
			</form>
		</div>
		
		<div class="advanced_search" style="z-index: 50;">
			<div class="wrapper">
				<span class="arrow"></span>
					<div id="exTab2" style="padding:0;">
					<ul class="nav nav-tabs nav-justified" style="border: none;">
						<li class="active" ><a href="/bob/listBob?category=B01" data-target="#B01" data-toggle="tabajax">우리지금만나</a></li>
						<li><a href="/bob/listBob?category=B02" data-target="#B02" data-toggle="tabajax">당장만나</a></li>
						<li><a href="/bob/listBob?category=B03" data-target="#B03"  data-toggle="tabajax">주기적으로만나</a></li>
						<li><a href="/bob/listBob?category=B04" data-target="#B04" 	data-toggle="tabajax">내 주소로 검색하기</a></li>
						<li style="display: none;"><a href="/bob/listBob?category=B05" data-target="#B05"  data-toggle="tabajax">키워드로 검색하기</a></li>
					</ul>
				</div>
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->

	<div class="container" style="font-size: 17px; padding:0;"> 
		
		<div class="form-group" style="margin: auto;">
			<form class="form-horizontal" id="mainBob">
	
					<!-- 데이터 들어갈 것들,,, -->
					<div class="tab-content" style="padding: 3.636363636363636% 0 0 0; overflow: hidden;">
						<c:import url="/bob/listBobd"></c:import>
						
						<!-- 데이터 끝... -->
						    	
			    	<div id="loader" class="text-center">
						<img src = "../resources/images/ajax-loader.gif" width="150px" height="150px"/>
					</div>
				</div>
			</form>
		</div>

	</div>
	
	<footer style="background: #f77e7e;">
		<div class="copyrights wrapper" style="border-top: 1px solid #ffb8b8; ">
			Copyright @ 2018 <a href="/" class="ph_link" >zaching.com</a>. All Rights Reserved.
		</div>
	</footer>

	<!-- 방만들기 버튼 시작 -->
	
   	<div id="footer" align="right" style="z-index: 1500;">
   	  <div class="container">
	  	<div class="btn-add-bob text-center" style="font-size:20px;
	  	background: url('../resources/images/ic_add_circle_black_36px.svg') center center no-repeat; background-size: cover;">
	  	</div>
	  	<div class="dialog-add-bob text-center">
	  		<div class="list-group" style="float: right; visibility: hidden;">
			  <a class="list-group-item" style="background: #f77e7e; color: #FFFFFF;"> 카테고리선택 </a>
			  <a class="list-group-item" style="cursor: pointer;" id="add-B01">우리지금만나</a>
			  <a class="list-group-item" style="cursor: pointer;" id="add-B02">당장만나</a>
			  <a class="list-group-item" style="cursor: pointer;" id="add-B03">주기적으로만나</a>
			</div>
	  	</div>
	  </div>
	</div>
	
	<!--  방만들기 버튼 끝 -->
</body>
</html>