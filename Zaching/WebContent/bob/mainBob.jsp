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
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);		
		
		* {
			font-family: 'Nanum Gothic', serif;
		}
	
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
		    overflow: hidden;
		}
		
		#exTab2 > div > ul > li> a {
			height: 80px;
		    line-height: 50px;
		    color: #000;
		    font-size: 17px;
		    font-weight: bold;
		}
		
		#exTab2 > ul > li .active > a {
			background-color: #FFF;
		}
		
		@media only screen and (min-device-width : 320px) and (max-device-width : 480px) {
			#bobTitle {
				max-width: 100%;
			}
			
			body > div.jumbotron.text-center > form > div > div {
				max-width: 100%;
			}
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
			
			// �˻����� �� tooltip

			$(":text[name='searchKeyword']").on("keydown", function(e) {

				if(e.keyCode == 13) {
					//$(self.location).attr("href","/bob/listBob?category=B05");
					
					var $form = $("#searchForm");
					
					var posting = $.post("/bob/listBob",{
								category: "B05",
								searchKeyword : $(":text[name='searchKeyword']").val()});
					
					posting.done(function(data) {

						$("#B05").html(data);
						
						$($('[data-toggle="tabajax"]')[4]).tab('show');

						$('#exTab2 a').css('color', '#000');
						$('#exTab2 a').css('background', '#ede8f7');						
						$($('a:contains("�˻�")')[1]).css('color', '#000').css('background', '#FFF')
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
					alert("�������� ���Ŀ� ��ģ�� ���񽺸� ��� �̿��Ͻ� �� �ֽ��ϴ�.");
				</c:if>
				<c:if test="${empty user}">
					alert("�α����� ���ּ���.");
					$('.list-group').css('visibility','hidden');
					$('.cover').css('visibility','hidden');
					$('#loginModal').modal('toggle');
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
			    
			    $(":text[name='searchKeyword']").val("");

			    if('${user}' == '' && (targ == "#B03" || targ == "#B04")) {
					alert("�α��� �� ����Ͻ� �� �ֽ��ϴ�. \n"
							+"����ȸ�������� ���ؼ� ���� �����ϰ� ���� ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�.");
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
							$(targ).html(data);
						});
						
						$this.tab('show');

					} else {
					    $.get(loadurl, function(data) {
					        $(targ).html(data);
					    });
					    
					    $this.tab('show');
					}
				}

			    return false;
			});
			/* tab Event End */
			
			$('#exTab2 a').on({
				'mouseover' : function () {
					if(!$(this).parent().hasClass("active")) {
						$(this).css('color', '#FFF');
						$(this).css('background', '#5F4B8B');
					}
				},
				'mouseout' : function () {
					if(!$(this).parent().hasClass("active")) {
						$(this).css('color', '#000');
						$(this).css('background', '#ede8f7');
					}
				}
				
			});

			  $('#exTab2 a').click(function(){   // sBtn�� ���� �ִ�  a ã�� Ŭ�� �ϸ�.
				  $('#exTab2 a').css('color', '#000');
				  $('#exTab2 a').css('background', '#ede8f7');
				  $(this).css('background', '#FFF');
				  $(this).css('color', '#000');
			  })
			

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
		<img id="bobTitle" src="../resources/images/bob_title.png"/>
		<form id="searchForm">
			<div class="row" style="margin: 10px; padding:60px 40px 0 40px;">
				<div class="col-xs-12">
					<input type="text" class="form-control" name="searchKeyword" placeholder="�˻� ������ �Է��ϼ���." 
					style="height:45px; font-size: 16px; padding: 10px; outline:none; border:none;"/>
					
		      	</div>
	      	</div>
      	</form>
	</div>

	<div class="container" style="font-size: 17px;"> 
		
		<div class="form-group">
		<form class="form-horizontal" id="mainBob">
			<!-- Tab ���� -->
			<div id="exTab2" style="padding:0;">
				<div >
					<ul class="nav nav-tabs nav-justified" style="border: none; background: #ede8f7">
						<li class="active" ><a href="/bob/listBob?category=B01" data-target="#B01" data-toggle="tabajax">�츮���ݸ���</a></li>
						<li><a href="/bob/listBob?category=B02" data-target="#B02" data-toggle="tabajax">���常��</a></li>
						<li><a href="/bob/listBob?category=B03" data-target="#B03"  data-toggle="tabajax">�ֱ������θ���</a></li>
						<li><a href="/bob/listBob?category=B04" data-target="#B04"  data-toggle="tabajax">�� �ּҷ� �˻��ϱ�</a></li>
						<li style="display: none;"><a href="/bob/listBob?category=B05" data-target="#B05"  data-toggle="tabajax">Ű����� �˻��ϱ�</a></li>
					</ul>
				</div>
				
				<!-- Tab �� -->
						
				<!-- ������ �� �͵�,,, -->
				<div class="tab-content" style="padding:20px; background: #FFF;overflow: hidden; border-right: 1px solid #ddd; border-left: 1px solid #ddd; border-bottom: 1px solid #ddd;">
					<div class="tab-pane active" id="B01"> </div>
					<div class="tab-pane" id="B02"> </div>
					<div class="tab-pane" id="B03"> </div>
					<div class="tab-pane" id="B04"> </div>
					<div class="tab-pane" id="B05"> </div>
					<!-- ������ ��... -->
					    	
		    	<div id="loader" class="text-center" style="margin: 50px;">
					<img src = "../resources/images/ajax-loader.gif"/>
				</div>
				</div>
			</div>
		</form>
		</div>

	</div>

	<!-- �游��� ��ư ���� -->
	
   	<div id="footer" align="right" style="z-index: 1500;">
   	  <div class="container">
	  	<div class="btn-add-bob text-center">�� �����</div>
	  	<div class="dialog-add-bob text-center">
	  		<div class="list-group" style="float: right; visibility: hidden;">
			  <a class="list-group-item" style="background: #5F4B8B; color: #FFFFFF;"> ī�װ����� </a>
			  <a class="list-group-item" style="cursor: pointer;" id="add-B01">�츮���ݸ���</a>
			  <a class="list-group-item" style="cursor: pointer;" id="add-B02">���常��</a>
			  <a class="list-group-item" style="cursor: pointer;" id="add-B03">�ֱ������θ���</a>
			</div>
	  	</div>
	  </div>
	</div>
	
	<!--  �游��� ��ư �� -->
</body>
</html>