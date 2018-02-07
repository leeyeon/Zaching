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
	
	<style>

	
		body {
			padding-top:50px;
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
			background: url('../resources/images/simple.jpg') no-repeat center center;
			position: fixed;
			width: 100%;
			height: 100%;
			background-size: cover;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.3;
		}
		
		.jumbotron {
		    margin-bottom: 0px;
		    margin-top:50px;
		    padding-top: 150px;
		    height: 400px;
		    background: transparent;
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
			 width: 100px;
			 height: 100px;
			 line-height: 100px;
			 font-size: 17px;
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
       		left: -100px;
       		top: -230px;
       		box-shadow: 0 5px 15px -5px #666;
       	}
       	
		.user_thumnail {
		    position: relative;
		    display: inline-block;
		    border-radius: 50%;
		    top: -50px;
		    width: 100px;
		    height: 100px;
		}
		
		.thumnail {
		    border-radius: 50%;
		    width: 70px;
		    height: 70px;
		    margin: 5px;
		}
		
		#exTab2 > ul > li> a {
			height: 70px;
		    border: 1px solid #ddd;
		    line-height: 45px;
		    border-radius: 15px 15px 0 0;
		    color: #000;
		    font-size: 17px;
		    font-weight: bold;
		    background-color: #eee;
		}
		
		#exTab2 > ul > li .active > a {
			background-color: #FFF;
		}
	
	</style>
	
	<script type="text/javascript">
    
		$(function(){
			
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
					alert();
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
			$('#exTab2 > ul > li > a').on("click", function() {
				//alert($(this).attr('href'));
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
				</c:if>
			});

			
			/* tab Event Start */
		    $.get($($('[data-toggle="tabajax"]')[0]).attr('href'), function(data) {
		        $($($('[data-toggle="tabajax"]')[0]).attr('data-target')).html(data);
		    });

		    $($('[data-toggle="tabajax"]')[0]).tab('show');
			
			$('[data-toggle="tabajax"]').click(function(e) {
			    var $this = $(this),
			        loadurl = $this.attr('href'),
			        targ = $this.attr('data-target');

			    if('${user}' == '' && (targ == "#B03" || targ == "#B04")) {
					alert("로그인 후 사용하실 수 있습니다. \n"
							+"간편회원가입을 통해서 쉽고 간편하게 자췽 서비스를 이용하실 수 있습니다.");
					$('#loginModal').modal('toggle');
					//$(self.location).attr("href","/user/addUser");
				} else {
				    
				    $.get(loadurl, function(data) {
				        $(targ).html(data);
				    });
				    
				    $this.tab('show');
				}

			    return false;
			});
			/* tab Event End */

		});		

    </script>
	
</head>
	
	
<body>

	<div class="cover"></div>
	<div class="bg"></div>
	<div class="jumbotron text-center" style="background-image: url('../resources/images/bob_background.jpg');
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center;">
		<img src="../resources/images/bob_title.png"/>
	</div>

	<div class="container" style="font-size: 17px; margin-top: 10px;"> 
		
		<div class="form-group">
			<form>
				<div class="row" align="right" style="margin: 10px;">
					<input type="text" name="searchKeyword" class="form-control" placeholder="검색 내용을 입력하세요." 
			      					style="height:45px; font-size: 16px;"/>
		      	</div>
	      	</form>
		<form class="form-horizontal" id="mainBob">
			<!-- Tab 시작 -->
			<div id="exTab2" style="padding:0; margin-top: 10px;">
				<ul class="nav nav-tabs nav-justified" style="border: none;">
					<li class="active" ><a href="/bob/listBob?category=B01" data-target="#B01" data-toggle="tabajax">우리지금만나</a></li>
					<li><a href="/bob/listBob?category=B02" data-target="#B02" data-toggle="tabajax">당장만나</a>
					</li>
					<li><a href="/bob/listBob?category=B03" data-target="#B03"  data-toggle="tabajax">주기적으로만나</a>
					</li>
					<li><a href="/bob/listBob?category=B04" data-target="#B04"  data-toggle="tabajax" style="select-bob">내 주소로 검색하기</a></li>
				</ul>
				
				<!-- Tab 끝 -->
						
				<!-- 데이터 들어갈 것들,,, -->
				<div class="tab-content" style="padding:20px; background: #FFF; box-shadow: 0 0 0 1px #ddd; border: 1px solid #ddd;">
					<div class="tab-pane active" id="B01"> </div>
					<div class="tab-pane" id="B02"> </div>
					<div class="tab-pane" id="B03"> </div>
					<div class="tab-pane" id="B04"> </div>
					<!-- 데이터 끝... -->
					    	
		    	<div id="loader" class="text-center" style="margin: 50px;">
					<img src = "../resources/images/ajax-loader.gif"/>
				</div>
				</div>
			</div>
		</form>
		</div>

	</div>

	<!-- 방만들기 버튼 시작 -->
	
   	<div id="footer" align="right" style="z-index: 1500;">
   	  <div class="container">
	  	<div class="btn-add-bob text-center">방 만들기</div>
	  	<div class="dialog-add-bob text-center">
	  		<div class="list-group" style="float: right; visibility: hidden;">
			  <a class="list-group-item" style="background: #5F4B8B; color: #FFFFFF;"> 카테고리선택 </a>
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