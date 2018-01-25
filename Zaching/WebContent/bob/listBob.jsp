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
			top:0;
			left:0;
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
			
			$('.list-group-item:contains("우리지금만나")').on("click", function() {
				$(self.location).attr("href","/bob/addBob?category=B01");
			});
			
			$('.list-group-item:contains("당장만나")').on("click", function() {
				$(self.location).attr("href","/bob/addBob?category=B02");
			});
			
			$('.list-group-item:contains("주기적으로만나")').on("click", function() {
				$(self.location).attr("href","/bob/addBob?category=B03");
			});
			
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
			<ul class="nav nav-tabs" style="padding: 5px 5px 0 5px;">
				<li class="active"><a href="#1" data-toggle="tab">우리지금만나</a></li>
				<li><a href="#2" data-toggle="tab">당장만나</a>
				</li>
				<li><a href="#3" data-toggle="tab">주기적으로만나</a>
				</li>

				<li class="pull-right" style="padding-top:2px;">
						<input type="text" name="searchKeyword" class="form-control" placeholder="검색 내용을 입력하세요." 
	      					style="width: 360px; height:45px;"/></li>
	      		<li class="pull-right" style="padding-top:5px;"><a href="#" style="select-bob">내 주소로 검색하기</a></li>
			</ul>
			
			<!-- Tab 끝 -->
					
			<!-- 데이터 들어갈 것들,,, -->
			<!-- 우리지금만나 -->
			<div class="tab-content" style="padding:20px; background: #f5f5f5;">
				<div class="tab-pane active" id="1">
					<div class="row">
						<c:forEach var="i" begin="0" end="6" step="1">
						  <div class="col-sm-6 col-md-4 text-center">
						    <div class="thumbnail">
						      <div style="position:absolute; font-weight: bold; font-size: 22px; top:20px; right: 40px;">1/5 명</div>
						      
						      <img src="../resources/images/sample_bob_background.jpg" style="cursor: pointer;">
						      
						      <div class="user_thumnail" style="background: url(../resources/images/sample_bob_background.jpg) center center no-repeat;">
						      	<div style="position:relative; top:-60px; font-size:25px;">제목</div>				      	
						      </div>
						      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
						        <p>위치, 날짜</p>
						      </div>
						    </div>
						  </div>
						  
						</c:forEach>
					</div>
				</div>
				
			<!-- 우리지금만나 끝 -->
			<!-- 당장만나 시작 -->	
				<div class="tab-pane" id="2">
					<div class="row">
						<c:forEach var="i" begin="0" end="6" step="1">
						  <div class="col-sm-6 col-md-4 text-center">
						    <div class="thumbnail">
						      <img src="../resources/images/sample_bob_background.jpg" style="cursor: pointer;">
						      
						      <div class="user_thumnail" style="background: url(../resources/images/sample_bob_background.jpg) center center no-repeat;">
						      	<div style="position:relative; top:-60px; font-size:25px;">제목</div>
						      </div>
						      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
						        <p>위치, 날짜</p>
						      </div>
						    </div>
						  </div>
						  
						</c:forEach>
					</div>
					
				</div>
				
			<!-- 당장만나 끝 -->
			<!-- 주기적으로만나 시작 -->
				<div class="tab-pane" id="3">
					<div class="row">
						<c:forEach var="i" begin="0" end="6" step="1">
						  <div class="col-sm-6 col-md-4">
						    <div class="thumbnail" >
						      <img src="../resources/images/sample_bob_background.jpg" style="cursor: pointer;">
						      <div class="text-center" style="position:relative; top:-100px; font-size:25px;">제목</div>
						      
						      <h4 style="padding:10px; font-weight: bold;">참여하고 있는 친구 (3명)</h4>
						      <div>
						      	<c:forEach var="i" begin="0" end="6" step="1">
									<c:if test="${i != 0 && i%3 == 0}" ><br></c:if>
									<img class="thumnail" src="../resources/images/sample_bob_background.jpg"/>
									
								</c:forEach>
							  </div>
						    </div>
						  </div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 주기적으로만나 끝 -->

			<!-- 데이터 끝... -->	
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
			  <a href="#" class="list-group-item" style="background: #5F4B8B; color: #FFFFFF;">
			    카테고리선택
			  </a>
			  <a href="#" class="list-group-item">우리지금만나</a>
			  <a href="#" class="list-group-item">당장만나</a>
			  <a href="#" class="list-group-item">주기적으로만나</a>
			</div>
	  	</div>
	  </div>
	</div>
	
	<!--  방만들기 버튼 끝 -->
</body>
</html>