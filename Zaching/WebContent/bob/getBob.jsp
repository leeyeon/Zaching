<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<title>밥친구(우리지금만나)</title>
	
	<style>
        
       	body {
       		padding-top: 50px;
       		padding-bottom: 50px;
       		background: #f5f5f5;
       	}
       	
       	.bg {
			background: url('../resources/upload_files/images/download.jpg') no-repeat center center;
			position: fixed;
			width: 100%;
			height: 500px;
			background-size: cover;
			top:0;
			left:0;
			z-index: -1;
		}
		
		.jumbotron {
		    margin-bottom: 0px;
		    margin-top: -2px;
		    height: 500px;
		    background: transparent;
		}
		
		.jumbotron .textStyle {
			color: white;
		    text-shadow: black 0.3em 0.3em 0.3em;
		    backgroud-color: #000000;
		    padding: 10px;
		}
		
		.overlay {
			left: 0;
			top: 0;
			height: 65px;
			background-color: rgba(0,0,0, 0.6);
			overflow-x: hidden;
		}
		
		.blog-sidebar .textBold, .textBold {
			font-weight: bold;
			font-size: 20px;
		}
		
		body > div.container > div > div.col-sm-3.col-sm-offset-1.blog-sidebar, .custumRow {
			-webkit-box-shadow: 0px 0px 6px 4px rgba(237,237,237,1);
			-moz-box-shadow: 0px 0px 6px 4px rgba(237,237,237,1);
			box-shadow: 0px 0px 6px 4px rgba(237,237,237,1);
			background: #FFFFFF;
			padding:10px;
		}
		
       	.btn-bob {
       		background: #5F4B8B; 
       		border: none; 
       		display: inline-block;
       		color: rgb(255, 255, 255); 
       		font-size: 18px; 
       		font-weight: bold;
       		text-align: center;
       		height: 70px;
			line-height: 70px;
       		width: 100%;
       		text-decoration: none;
       	}
       	
       	.select-bob {
       		background: rgba(237,237,237,1); 
       		border: none; 
       		display: inline-block;
       		color: #000000;
       		font-size: 18px; 
       		font-weight: bold;
       		text-align: center;
       		height: 70px;
			line-height: 70px;
       		text-decoration: none;
       		border: 2px solid #FFFFFF;
       		cursor: pointer;
       	}
       	
        .select-bob:hover, .select-bob.active{
		    background: #5F4B8B;
		    color: #FFFFFF;
		}
       	
       	.col-sm-3.col-sm-offset-1.blog-sidebar img {
       		cursor: pointer;
       	}
       	
       	
       	body > div.jumbotron > div > div.row > .col-xs-1 {
       		border: 1px solid #FFFFFF;
			border-radius: 40px;
			-moz-border-radius: 40px;
			-khtml-border-radius: 40px;
			-webkit-border-radius: 40px;
			 background: #FFFFFF;
			 width: 70px;
			 height: 70px;
			 line-height: 70px;
			 font-size: 17px;
			 font-weight: bold;
			 float:right;
			 margin-right: 10px;
			 cursor: pointer;
       	}
       	
       	.modal {
		     text-align: center;
		}
		 
		@media screen and (min-width: 768px) { 
		        .modal:before {
		                display: inline-block;
		                vertical-align: middle;
		                content: " ";
		                height: 100%;
		        }
		}
		 
		.modal-dialog {
	        display: inline-block;
	        text-align: left;
	        vertical-align: middle;
	        overflow-y: initial !important
		}

		.modal-body{
		    height: 250px;
		    overflow-x: auto;
		}
       	
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>
    <script type="text/javascript">
    
	$(function() {
		
		var jumboHeight = $('.jumbotron').outerHeight();
		function parallax(){
		    var scrolled = $(window).scrollTop();
		    $('.bg').css('height', (jumboHeight-scrolled) + 'px');
		}
	
		$(window).scroll(function(e){
		    parallax();
		});
	   
		$('.select-bob').on('click', function(){
			$('.active').removeClass('active');
			$(this).addClass('active');
		});
	 	
	 	$('.comment').on('click', function(){
	 		alert('댓글달기');
	 	});
	 	
	 	$('.col-xs-1:contains("신고")').on('click', function() {
	 		alert('신고');
	 	});
	 	
	 	$('.col-xs-1:contains("수정")').on('click', function() {
			//alert('수정');
			$(self.location).attr("href","/bob/updateBob?category=${category}&bobId=${bob.bobId}");
		});
	 	
	 	$('.btn-ico:contains("초대하기")').on('click', function() {
			alert('초대하기');
		});
	 	
	 	$('.deleteComment').on('click', function() {
	 		alert();
	 	});
	 	
	 	/* 결제 */
	 	
	 	$('button:contains("마감하기")').on('click', function() {
	 		alert("참여제한 status E 로 update");
	 	});
	 	
	 	$('button:contains("회비")').on('click', function() {
	 		alert("회비 냅니다아아앙");
	 	});
	 	
	 	$('.btn-ico:contains("참여하기")').on('click', function() {

			$.ajax({
				url : "/bob/rest/enterBob",
				method : "POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
					"userId" : ${user.userId},
					"bobId" : ${bob.bobId},
					"category" : '${param.category}'
				}),
				async : false,
				dataType : "json",
				success : function(serverData) {
					console.log(serverData);
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
			$('#enterBob').modal('hide');

	 	});
	 	
	 	/* 맵!!! */
	 	
	 	<c:if test="${!empty bob.longitude}">
	 	
			 // 이미지 지도에 표시할 마커입니다
			 // 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
			 var markers = 
			    
			     {
			         position: new daum.maps.LatLng(${bob.latitude}, ${bob.longitude}), 
			         text: '${bob.locationName}' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
			     };
		
			 var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
			     staticMapOption = { 
			         center: new daum.maps.LatLng(${bob.latitude}, ${bob.longitude}), // 이미지 지도의 중심좌표
			         level: 3, // 이미지 지도의 확대 레벨
			         marker: markers // 이미지 지도에 표시할 마커 
			     };    
		
			 // 이미지 지도를 생성합니다
			 var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
	 	
		</c:if>
	
	});

    </script>
    
</head>
<body>

	<div class="bg"></div>
	<div class="jumbotron">
		
	<div class="container" align="center">
		<div class="row" >
			<div class="col-xs-1">신고</div>
			<c:if test="${user.userId eq bob.writtenUserId}">
				<div class="col-xs-1">수정</div>
			</c:if>
		</div>
		
		  <div class="textStyle" style="padding-top: 150px;">
		  	<div class="overlay"><h2>${bob.title}</h2></div>
		  </div>
		  <c:if test="${category ne 'B03'}">
			  <div class="textStyle">
			  	<div class="overlay"><h3>${bob.locationName}</h3></div>
			  </div>
		  </c:if>
		</div>
	</div>
	
	<div class="container" style="font-size: 17px;">

      <div class="row">

        <div class="col-sm-8 blog-main custumRow">

          <div class="blog-post" style="min-height:350px">
            ${bob.content}
            
            <c:if test="${!empty bob.longitude}">
            	<hr>
	            <div class="text-center textBold" style="font-size: 35px;">약속장소<br/></div>            
	            <div id="staticMap" style="height:350px;"></div>
            </c:if>          
          </div><!-- /.blog-post -->

        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar" style="padding-bottom: 0px;">
        	<div style="padding:8px;">
				<div class="row">
					<div class="col-xs-8 textBold" align="left" style="padding-right: 0px; padding-top:3px;">
						<c:if test="${category ne 'B03'}">
							현재 참여한 자췽러
						</c:if>
						<c:if test="${category eq 'B03'}">
							참여한 친구들
						</c:if>
					</div>
					<div class="col-xs-4 textBold" align="right" style="font-size: 25px;">
						<c:if test="${category ne 'B03'}">
							${fn:length(participant)} / ${bob.limitNum}
						</c:if>
						<c:if test="${category eq 'B03'}">
							<button class="btn btn-default btn-ico" data-toggle="modal" data-target="#myModal">친구초대</button>
						</c:if>
					</div>
					
				</div>
				<div class="row" style="padding: 10px; top:-30px;  padding-top:-50px;">
					<div class="col-xs-12" align="left" style="margin-top:20px;">
						<!-- 왕관 이미지 -->
						<div style="position: relative; z-index: 2; top:-15px; left:-1px;">
							<img src="/resources/images/sample_crown.png" width="60px" height="60px"/>
						</div>
						<div style="position: relative; z-index: 1; top:-35px;">
							<img width="60px" height="60px"
							style=" border: 2px solid #5F4B8B;
									border-radius: 40px;
									-moz-border-radius: 40px;
									-khtml-border-radius: 40px;
									-webkit-border-radius: 40px;
									 box-shadow: 3px 3px 3px rgba(237,237,237,1)"
							src="/resources/upload_files/images/sample_profile.png" />&nbsp;&nbsp;&nbsp;${bob.writtenUserName}
						</div>
					</div>
					
					<c:forEach var="participant" items="${participant}">
						<c:if test="${participant.userId ne bob.writtenUserId}">
							<div class="col-xs-4" align="left" style="margin-top:20px; padding-right:15px;">
								<img width="55px" height="55px"
									style=" border: 2px solid #5F4B8B;
											border-radius: 40px;
											-moz-border-radius: 40px;
											-khtml-border-radius: 40px;
											-webkit-border-radius: 40px;
											 box-shadow: 3px 3px 3px rgba(237,237,237,1)"
									src = "../resources/upload_files/images/${participant.participantProfile}"
					      			onerror="this.src='../resources/upload_files/images/sample_profile.png'" />
					      			${participant.participantName}
							</div>
						</c:if>						
					</c:forEach>
				</div>
				<hr>
				
				<c:if test="${category ne 'B03'}">
					<div class="row" style="padding: 5px;">
						<button class="btn-bob" data-toggle="modal" data-target="#enterBob">
							<c:if test="${user.userId ne bob.writtenUserId}">
								<c:if test="${category eq 'B01'}">약속비 1000원으로 참여하기</c:if>
								<c:if test="${category eq 'B02'}">번개 참여하기</c:if>
							</c:if>
							<c:if test="${user.userId eq bob.writtenUserId}">마감하기</c:if>
						</button>
					</div>
				</c:if>
				
				<c:if test="${category eq 'B03'}">
					<div class="row" style="padding: 5px;">
						<div class="col-xs-9" style="padding: 5px;">
							<button type="submit" class="btn-bob" >회비 내기</button>
						</div>
						<div class="col-xs-3" style="padding: 5px;">
							<button type="submit" class="btn-bob" >설정</button>
						</div>
					</div>
				</c:if>
				
			</div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->
      
      
      <div class="row custumRow" style="margin-top:20px; padding-top:30px;">
      	<div class="text-center textBold" style="font-size: 35px;">친구들과 대화를 나누세요 :)</div>
        <hr>
        <c:if test="${empty comments}">
        	<div class="text-center" style="padding: 10px;">
        		등록된 댓글이 없습니다 T.T <br>첫번째 댓글을 달아보세요!
        	</div>
        </c:if>
      	<c:forEach var="comment" items="${comments}">
      		<input type="hidden" name="commentId" value="${comment.commentId}" />
      		<div class="row comment" style="margin: 5px;">
	      		<div class="col-sm-2">
					${comment.userName}
				</div>
				<div class="col-sm-7">
					${comment.content}
				</div>
				<div class="col-sm-3" style="font-size: 13px; text-align: end;">
					<div style="padding-right: 50px;">
						<fmt:parseDate value="${comment.createdDate}" var="Date" pattern="yyyy-MM-dd hh:mm"/>
						<fmt:formatDate value="${Date}" pattern="yyyy-MM-dd일 a hh:mm"/>
					</div>
					<div class="deleteComment" style="position: relative; right: 10px; top:-10px; text-align: end;">
						X
					</div>
				</div>
			</div>
			
			<c:if test="${i!=3}">
				<hr>
			</c:if>
      	</c:forEach>
      
      	<div class="row" style="padding:15px 5px 5px 5px;">
      		<div class="col-xs-9">
      			<input type="text" class="form-control" placeholder="댓글을 입력해주세요."/>       		
      		</div>
      		<div class="col-xs-3">
				<button type="submit" class="form-control">등록</button>
			</div>
      	</div>

      
      </div>
      
      <div class="row custumRow" style="margin-top:20px;">
      
      	여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>
      	여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>여기는 후기<br/>
      
      </div>


      <!-- 회비 div 시작 -->

	  <c:if test="${category eq 'B03'}">
	      <div class="row custumRow" style="margin-top:20px; padding-top: 30px;">
		    <div class="text-center textBold" style="font-size: 35px;">회비 장부</div>
	      	<hr>
	      	
	      	<div class="row" style="padding: 10px;">
	      		<div class="col-xs-4 select-bob">두달전</div>
	      		<div class="col-xs-4 select-bob">저번달</div>
	      		<div class="col-xs-4 select-bob active">이번달</div>
	      	</div>
	      	
	      	<div class="row text-center textBold" style="padding-top:25px; padding-botton:30px;">
	      		이 달의 회비는 <fmt:formatNumber type="currency" value="${bob.fee}" pattern="###,###" />원입니다.
	      	</div>
	      	
	      	<hr>
	
	      	<div class="row" style="padding: 0 20px 0 20px;">
	   			<c:forEach var="i" begin="0" end="4" step="1">
	   				
					<div class="col-xs-4" align="left" style="margin-top:20px; padding-right:15px;">
						<img width="55px" height="55px"
						style=" border: 2px solid #5F4B8B;
								border-radius: 40px;
								-moz-border-radius: 40px;
								-khtml-border-radius: 40px;
								-webkit-border-radius: 40px;
								 box-shadow: 3px 3px 3px rgba(237,237,237,1)"
						src="/resources/upload_files/images/sample_profile.png" />
						&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;
						<c:if test="${i%3 == 0}">
							<img width="55px" height="55px" src="/resources/images/checkmark.png" />
						</c:if>
					</div>
				</c:forEach>
			</div>
	      	
	      	<hr>
	      	
	      	<div class="row" align="right" style="margin-right:5px;">
	      		<button type="submit" class="btn-bob" style="width: 210px; height: 60px; line-height:60px;">엑셀 다운로드</button>
	      	</div>
	      </div>
      
      </c:if>
      <!-- /회비 div 끝 -->

    </div><!-- /.container -->

	<!-- Modal --> 
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
               <div class="modal-content"> 
                    <div class="modal-header"> 
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                             <h4 class="modal-title" style="text-align: center;" id="myModalLabel">내 친구 초대</h4> 
                     </div> 
                     <div class="modal-body" align="center">
	                    <c:forEach var="i" begin="0" end="6" step="1">
	                        <div class="row" style="padding: 5px 10px 5px 10px;">
	                            <div class="input-group">
							      <span class="input-group-addon">
							        <input type="checkbox" aria-label="...">
							      </span>
							      <input type="text" class="form-control" style="width:400px;" value="친구이름">
							      <br>
							    </div>
					    	</div>
					    </c:forEach>
                    </div>
                    <div align="center" class="modal-footer" style="text-align: center;">
                    	<button class="btn btn-default btn-ico" >초대하기</button>
                    </div>
               </div> 
        </div> 
	</div>
	
	<!-- Modal --> 
	<div class="modal fade" id="enterBob" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
               <div class="modal-content"> 
                    <div class="modal-header"> 
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                             <h4 class="modal-title" style="text-align: center;" id="myModalLabel">참여하기</h4> 
                     </div> 
                     <div class="modal-body" align="center">
	                    약속일 일주일 이내에는 약속 취소를 할 수 없습니다.<br>
	                    정말로 참여하시겠어요?
                    </div>
                    <div align="center" class="modal-footer" style="text-align: center;">
                    	<button class="btn btn-default btn-ico" >참여하기</button>
                    </div>
               </div> 
        </div> 
	</div>

</body>
</html>