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
	
	
	
	<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	
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
		.modal {
		  overflow: inherit;
		  overflow-y: inherit;
		  text-align: center;
		  padding: 0;
		}
		
		.modal:before {
		  content: '';
		  display: inline-block;
		  vertical-align: middle;
		  margin-right: -4px;
		}
		
		.modal-dialog {
		  max-width: 500px;
		  padding: 0;
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}
		
		.modal-content {
		
		  border: 0;
		  border-radius: 0;
		
		}
		
		.modal-header {
		  border: 0;
		  padding 0;
		  position: relative;
		}
		
		.modal-header .close {
		  margin: 0;
		  position: absolute;
		  top: -10px;
		  right: -10px;
		  width: 23px;
		  height: 23px;
		  border-radius: 23px;
		  background-color: #00aeef;
		  color: #ffe300;
		  font-size: 9px;
		  opacity: 1;
		  z-index: 10;
		}
		
		.modal-content p {
		  padding: 0 20px;
		}
		
		.modal-body {
		  padding: 0 0 10px 0;
		    overflow: auto;
		}
	}
		
	</style>
	<script type="text/javascript">
		
		$(function() {
			
			$(document).on("click",'body > section.listings > div > ul > li > img', function(){
				var index = $("body > section.listings > div > ul > li > img").index(this);
				var broadcastId = $($("input[name=broadcastId]")[index]).val();
				alert("sad");
					$(self.location).attr("href","http://localhost:3000/broadcast?broadcaster="+broadcastId);			
			});
			
			$(document).on("click",".user_thumnail", function(){
				if('${user}' != '') {
					var index = $(".user_thumnail").index(this);
					var broadcastId = $($("input[name=broadcastId]")[index]).val();
					//alert(index+"//"+bobId+"//"+category);
					$(self.location).attr("href","/user/getTimeLine?userId="+broadcastId);
				} else {
					alert("로그인 후에 친구의 타임라인을 들어가실 수 있습니다.\n"
							+ "간편회원가입을 통해서 자췽 서비스를 이용해보세요.");
					$('#loginModal').modal('toggle');
					//$(self.location).attr("href","/user/addUser");
				}				
			});
			
			
			var page = ${resultPage.currentPage};
			var pageSize = ${resultPage.pageSize};
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
					url : "/broadcast/json/listBroadcast",
					method : "POST",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({
						"currentPage" : page,
						"pageSize" : pageSize,
						"searchCondition" : searchCondition,
						"searchKeyword" : searchKeyword
					}),
					processData : false,
		            contentType : false,
					async : false,
					dataType : "json",
					success : function(serverData){
						/* jquery each
						$(serverData).each(function(index,data) {
							data.title;
						)};
						*/
					var display = '';
				for(var i=0; i<serverData.length; i++){									
						display = display + '<li>'+ 
							'<img src = "../resources/upload_files/images/'+serverData[i].image+'" onerror="this.src=\'../resources/images/broadcast_default.jpg\'" />';
							'<div class="property_details" style="width: 100%" >'+
								'<div class ="user_thumnail">'+
								'<h1>'+
									'<a href="#" style="vertical-align: bottom;"><img src="../resources/images/'+serverData[i].profileImage+'" id="profile" onerror="this.src=\'../resources/images/20160916_190916.jpg\'">&nbsp; [BJ] '+serverData[i].broadcaster+'</a>'+
								'</h1>'+
								'</div>'
								'<h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'+
									'<a href="#">'+serverData[i].title+'</a>'+
								'</h1>'+
								'<h2><span class="property_size">${obj.detail}</span></h2>'+
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
			});
		});
		
//		function winOpen() {
//			window.open("/broadcast/addBroadcast.jsp","addBroadcast","width=500,height=700,toolbar=no")
//
//			}
		//dialog ajax
	$(function(){  
			
		
			$("#addBroadcast").on('click',function(){
				
				// http://jun7222.tistory.com/312
				var formData = new FormData($("#addBroadcastForm"));
			
				console.log(formData);
				
				console.log("방 만들기");		

				$.ajax({
					type: 'post',
			        url : "/broadcast/json/addBroadcast",
			        method : "POST",
			        data : formData,
			        processData : false,
		            contentType : false,
			        async : false,
			        success : function(serverData) {
			        	if(serverData.result == 'success') {
			        		alert("방 개설 완료");
			        	} else {
			        		alert("안됨");
			        	}
			        	
			        }

			     });

			});
		
		});
		
		var oTbl;
		//Row 추가
		function insRow() {
		  oTbl = document.getElementById("addForbidden");
		  var oRow = oTbl.insertRow();
		  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		  var oCell = oRow.insertCell();

		  //삽입될 Form Tag
		  var frmTag = "<input type= text class= text name= forbidden style= font-size: 20px; width: 50%;> ";
		  frmTag += "<input type= button value='삭제' onClick='removeRow()' style='cursor:hand'>";
		  oCell.innerHTML = frmTag;
		}
		//Row 삭제
		function removeRow() {
		  oTbl.deleteRow(oTbl.clickedRowIndex);
		}

		function frmCheck()
		{
		  var frm = document.form;
		  
		  for( var i = 0; i <= frm.elements.length - 1; i++ ){
		     if( frm.elements[i].name == "forbidden" )
		     {
		         if( !frm.elements[i].value ){
		             alert("텍스트박스에 값을 입력하세요!");
		             frm.elements[i].focus();
		             return;
		          }
		      }
		   }
		 }
		
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
				<c:forEach var="obj" items="${list}" varStatus="status">
					<input type="hidden" name="broadcastId" value="${obj.broadcastId}">
					<li>
						<img src = "../resources/upload_files/images/${obj.image}"
					      onerror="this.src='../resources/images/broadcast_default.jpg'" >
						<!-- <span class="price"><i class="fas fa-play-circle"></i>&nbsp;${voice.countReply}</span> -->
						<div class="property_details" style="width: 100%">
							<div class ="user_thumnail">
							<h1>
								<a href="#" style="vertical-align: bottom;"><img src="../resources/images/${obj.profileImage}" id="profile" onerror="this.src='../resources/images/20160916_190916.jpg'">&nbsp;[BJ]&nbsp;${obj.broadcaster}</a>
							</h1>
							</div>
							<h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
								${obj.title}
							</h1>
								<h2><span class="property_size">${obj.detail}</span></h2>
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
	
	<div id="footer" align="right" style="z-index: 1500; ">
   	  <div class="container">
	  	<div class="btn-add-broads text-center" data-toggle="modal" data-target="#myModal" style="font-size:20px;
	  	background: url('../resources/images/ic_add_circle_black_36px.svg') center center no-repeat; background-size: cover;">
	  	</div>

	  </div>
	</div>
	<!--  방만들기 버튼 끝 -->


	<!--modal addBroadcast-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form id="addBroadcastForm" enctype="multipart/form-data" method="post">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><b>Broadcast</b></h4>
      </div>
       <div > 
       	<input type="text" name="title" placeholder="제목" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"/>
      	</div>
      <div >    
      	 <textarea name="detail" placeholder="상세정보" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee; rows="5"></textarea>
        </div>
      <div >
      		<b>대표사진 설정</b>
        	<input id="input-b1" name="image" type="file" class="file" style="width:80%;"/>
        </div>
      <div >
      		<b>금지어</b>
		      <table id="addForbidden" >
		          <tr></tr>
		      </table>
		           <input name="addButton" type="button" class='btn-broad' style="cursor:hand" onClick="insRow()" value="추가">
		</div>  
      <div class="modal-footer">
       <div class="topnav">
      <div class="search-container">
      	<button type="button" class="btn btn-primary" id="addBroadcast" data-dismiss="modal" >방만들기</button>
      	 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	</div></div>
       
      </div>
      </form>
    </div>
  </div>
</div>


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
	   		<div class="modal-content">
		<form class="form-horizontal" enctype="multipart/form-data" style="background: #FFF; padding: 40px;">
			    <div class="form-group">
			    	<div class="row">
		            	<div class="col-sm-12 text-center" style="margin: 30px 0 30px 0;" >
		            		<input type="text" name="title" placeholder="제목" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"/>
		            	</div>
			    	</div>
			  	</div>
			  	
			  	<div class="form-group">
			    	<div class="row">
		            	<div class="col-sm-12 text-center" style="margin: 30px 0 30px 0;" >
		            		<input type="text" name="detail" placeholder="상세정보" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"/>
		            	</div>
			    	</div>
			  	</div>  	
			 
			  <div class="row" style="margin: 10px;">
		            	<div class="col-sm-3 btn-broad">대표사진 설정</div>
		            	
		            	<div class="col-sm-9" align="center" >
		            		<input id="input-b1" name="image" type="file" class="file" style="width:80%;"/>
		            	</div>
			 </div>  
			  
			  <div class="row" >
		            	<div class="col-sm-3 btn-broad" >금지어</div>
		            	
		            	<div class="col-sm-9">
		            	<table id="addForbidden" >
		            	<tr></tr>
		            	</table>
		            		<input name="addButton" type="button" class='btn-broad' style="cursor:hand" onClick="insRow()" value="추가">
		            	</div>
			 </div>
			 
			  <div class="row" align="center">
			    <input type="button" name="addBroadcast" class="btn-broad" style="margin: 10px; width:250px;" value="방 만들기" >
		                <button class="btn-broad" style="background: #ededed; color: #4d4d4d; margin: 10px; width:250px;">취소</button>
			   </div> 
			</form>
		</div>
	</div>	
</div>
		
 -->
	    	
</body>
</html>