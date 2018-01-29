<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		
		.bg {
			background: url('../resources/images/sample_bob_background.jpg') no-repeat center center;
			position: fixed;
			width: 100%;
			height: 100%;
			background-size: cover;
			top: 0;
			left: 0;
			z-index: -1;
		}
		
		.jumbotron {
		    margin-bottom: 0px;
		    padding-top: 100px;
		    height: 350px;
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
       	}
       	
       	.dialog-add-bob {
       		background: #ccc;
       		position: relative; 
       		z-index:1;
       		width: 200px;
       		left: -100px;
       		top: -230px;
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
	
	</style>
	
	<script type="text/javascript">
    
		$(function(){
			
			$('.btn-add-bob').on('click', function(){
				if($('.list-group').css('visibility') =='visible') {
					$('.list-group').css('visibility','hidden');
				} else {
					$('.list-group').css('visibility','visible');
					
				}
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
			
			/* 리스트 불러오기 */
			
			$('.list-group-item:contains("우리지금만나")').on("click", function() {
				$(self.location).attr("href","/bob/addBob?category=B01");
			});
			
			$('.list-group-item:contains("당장만나")').on("click", function() {
				$(self.location).attr("href","/bob/addBob?category=B02");
			});
			
			$('.list-group-item:contains("주기적으로만나")').on("click", function() {
				$(self.location).attr("href","/bob/addBob?category=B03");
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

			    $.get(loadurl, function(data) {
			        $(targ).html(data);
			    });

			    $this.tab('show');
			    return false;
			});
			/* tab Event End */
			
		});		

    </script>
	
</head>
	
	
<body>

	<div class="bg"></div>
	<div class="jumbotron">
		<h1 class="text-center">밥친구 찾기</h1>
	</div>

	<div class="container" style="font-size: 17px;"> 
		<form class="form-horizontal" id="mainBob">
		<div class="form-group">
			<!-- Tab 시작 -->
		<div id="exTab2" style="padding:0;">
			<ul class="nav nav-tabs tabs-up">
				<li class="active" ><a href="/bob/listBob?category=B01" data-target="#B01" data-toggle="tabajax">우리지금만나</a></li>
				<li><a href="/bob/listBob?category=B02" data-target="#B02" data-toggle="tabajax">당장만나</a>
				</li>
				<li><a href="/bob/listBob?category=B03" data-target="#B03"  data-toggle="tabajax">주기적으로만나</a>
				</li>

				<li class="pull-right">
					<input type="text" name="searchKeyword" class="form-control" placeholder="검색 내용을 입력하세요." 
      					style="width: 360px; height:45px;"/>
	      		</li>
	      		<li class="pull-right"><a href="/bob/listBob?category=B04" data-target="#B04"  data-toggle="tabajax" style="select-bob">내 주소로 검색하기</a></li>
			</ul>
			
			<!-- Tab 끝 -->
					
			<!-- 데이터 들어갈 것들,,, -->
			<div class="tab-content" style="padding:20px; background: #f5f5f5;">
				<div class="tab-pane active" id="B01"> </div>
				<div class="tab-pane" id="B02"> </div>
				<div class="tab-pane" id="B03"> </div>
				<div class="tab-pane" id="B04"> </div>
				<!-- 데이터 끝... -->	
				</div>
			</div>
		</div>
		</form>

	</div>

	<!-- 방만들기 버튼 시작 -->
	
   	<div id="footer" align="right">
   	  <div class="container">
	  	<div class="btn-add-bob text-center">방 만들기</div>
	  	<div class="dialog-add-bob text-center">
	  		<div class="list-group" style="float: right; visibility: hidden;">
			  <a class="list-group-item" style="background: #5F4B8B; color: #FFFFFF;"> 카테고리선택 </a>
			  <a class="list-group-item" style="cursor: pointer;">우리지금만나</a>
			  <a class="list-group-item" style="cursor: pointer;">당장만나</a>
			  <a class="list-group-item" style="cursor: pointer;">주기적으로만나</a>
			</div>
	  	</div>
	  </div>
	</div>
	
	<!--  방만들기 버튼 끝 -->
</body>
</html>