<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<link rel="stylesheet" href="../resources/css/bob.css">

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>
    <script type="text/javascript">
    
	
    $(function() {

    	/*
    	$(window).bind("pageshow", function(event) {
    	    if (event.originalEvent.persisted) {
    	        document.location.reload();
    	    }
    	});
    	*/
   		
    	$("html, body").animate({ scrollTop: 0 }, "slow"); 

   		//$(this).scrollTop(0);

   		var jumboHeight = $('.jumbotron').outerHeight();
   		function parallax(){
   		    var scrolled = $(window).scrollTop();
   		    $('.bg').css('height', (jumboHeight-scrolled) + 'px');
   		}
   	
   		$(window).scroll(function(e){
   		    parallax();
   		});
   	   
   		// 회비목록 달별로 보여줌
   		$('.select-bob').on('click', function(){
   			$('.active').removeClass('active');
   			$(this).addClass('active');
   			$("#listFee").load("/bob/listFee?bobId=${param.bobId}&monthFee="+$(this).attr("id").substring(4));
   		});
   	 	
   	 	$('.col-xs-1:contains("수정")').on('click', function() {
   			//alert('수정');
   			$(self.location).attr("href","/bob/updateBob?category=${category}&bobId=${bob.bobId}");
   		});
   	 	
   	 	$('.btn-ico:contains("초대하기")').on('click', function() {
   			alert('초대하기');
   		});
   	 	
   	 	$('.btn-bob:contains("엑셀 다운로드")').on('click', function() {
   	 		//alert("${bob.bobId}");
   	 		$("#excelForm").attr("method", "POST").attr("action", "/bob/excelFee").submit();
		});
   	 	
   		$(document).on('click','#ListParticipant .userProfile', function() {
	 		var participantUserId = $($("input[name=getUserTimeLine]")[$('#ListParticipant .userProfile').index(this)]).val();
	 		alert(participantUserId);
	 		$(self.location).attr("href","/user/getTimeLine?userId="+participantUserId);
	 	});
   	 	
   	 	/*///////////////////////////// 후기 시작 /////////////////////////////*/
   	 	
   		$('button:contains("후기 올리기")').on('click', function(){
   	 		fuc_addReview();
	 	});
   	 	
   	 	$(':text[name="inputReview"]').on("keydown", function(e) {
   	 		if(e.keyCode == 13) {
	   	 		fuc_addReview();
			}
   	 	});
   	 	
   	 	function fuc_addReview() {
	 		$.ajax({
				url : "/bob/rest/addReview",
				method : "POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
					"userId" : <c:out value="${user.userId}" escapeXml="false" />,
					"bobId" : <c:out value="${bob.bobId}" escapeXml="false" />,
					"content" : $(":text[name='inputReview']").val()
				}),
				async : false,
				dataType : "json",
				success : function(serverData) {
					
					if(serverData.response == "success") {
						alert("후기가 무사히 등록되었습니다.");
						location.reload();
					} else {
						alert("후기가 등록되지 않았습니다. \n 다시 시도해주세요.");
					}

				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});
	 	}
   	 	
   	 	/*///////////////////////////// 후기 끝 /////////////////////////////*/
   	 	
   	 	/*///////////////////////////// 댓글 시작 /////////////////////////////*/
   	 	
   	 	$('button:contains("등록")').on('click', function(){
   	 		fuc_addComment();
   	 	});

   	 	$(":text[name='inputComment']").on("keydown", function(e) {
   			if(e.keyCode == 13) {
   				fuc_addComment();
   			}
   		});
   	 	
   	 	function fuc_addComment() {
   	 		$.ajax({
				url : "/comment/rest/addComment",
				method : "POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
					"userId" : <c:out value="${user.userId}" escapeXml="false" />,
					"roomId" : <c:out value="${bob.bobId}" escapeXml="false" />,
					"category" : 'B00',
					"content" : $(":text[name='inputComment']").val()
				}),
				async : false,
				dataType : "json",
				success : function(serverData) {
					
					var comment = serverData.comment;
					
					console.log(comment);

					$("#listComment").load("/bob/listCommment?category=${param.category}&bobId=${param.bobId}&currentPage=${commentPage.currentPage}");
					$(":text[name='inputComment']").val("");
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});
   	 	}

   	 	$('.deleteComment').on('click', function() {
   	 		alert();
   	 	});
   	 	
   	 	$('div .row .text-center:contains("더 보기")').on("click", function() {
   	 		$("#listComment").load("/bob/listCommment?category=${param.category}&bobId=${param.bobId}&currentPage=${commentPage.currentPage+1}");
   	 	});
   	 	
   	 	$(document).on('click','#listComment img', function() {
	 		var commentUserId = $($("input[name=commentUserId]")[$('#listComment img').index(this)]).val();
	 		$(self.location).attr("href","/user/getTimeLine?userId="+commentUserId);
	 	});
   	 	
   	 	/*///////////////////////////// 댓글 끝 /////////////////////////////*/
   	 	
   		$('body > div.container > div:nth-child(2) > div.row > div.col-xs-3 > button').on("click", function() {
   			//alert($(this).attr('href'));
   		});
   	 	
   	 	/* 결제 modal toggle */
   	 	$('button:contains("참여하기")').on('click',function() {
   	 		$('#enterBob').modal('toggle');
   	 	});
   	 	
   	 	$('button:contains("취소하기")').on('click',function() {
   	 		$('#cancleBob').modal('toggle');
   	 	});
   	 	
   	 	/* 결제 ajax 처리*/
   	 	
   	 	$('.btn-bob:contains("취소하기")').on('click',function() {
   	 		$('#cancleBob').modal('show');
   	 	});
   	 	
   	 	$('.btn-ico:contains("취소하기")').on('click',function() {
   	 		
   	 		$.ajax({
   				url : "/bob/rest/cancleBob",
   				method : "POST",
   				contentType : "application/json; charset=UTF-8",
   				data : JSON.stringify({
   					"userId" : <c:out value="${user.userId}" escapeXml="false" />,
   					"bobId" : <c:out value="${bob.bobId}" escapeXml="false" />,
   					"category" : '${param.category}'
   				}),
   				async : false,
   				success : function(serverData) {
   					console.log(serverData.response);
   					if(serverData.response == 'success') {
   						location.reload();
   					} else {
   						alert("error");
   					}
   				},
   				error:function(request,status,error){
   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   			});
   	 		
   	 		$('#cancleBob').modal('hide');
   	 	});
   	 	
   	 	$('button:contains("마감하기")').on('click', function() {
   	 		console.log("${bob.bobId}");
   	 		//확인
	   	 	if (confirm("참여자 신청을 마감하시겠어요? \n마감 시, 참여자를 더 이상 받으 실 수 없습니다.") == true){
		   	 	$.ajax({
	   				url : "/bob/rest/blockBob",
	   				method : "POST",
	   				contentType : "application/json; charset=UTF-8",
	   				data : JSON.stringify({
	   					"bobId" : <c:out value="${bob.bobId}" escapeXml="false" />
	   				}),
	   				async : false,
	   				success : function(serverData) {
	   					location.reload();
	   				},
	   				error:function(request,status,error){
	   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   				}
	   			});
		   	//취소
		   	}else{
		   	    return;
		   	}
   	 	});
   	 	
   	 	$('.btn-ico:contains("참여하기")').on('click', function() {

   			$.ajax({
   				url : "/bob/rest/enterBob",
   				method : "POST",
   				contentType : "application/json; charset=UTF-8",
   				data : JSON.stringify({
   					"userId" : <c:out value="${user.userId}" escapeXml="false" />,
   					"bobId" : <c:out value="${bob.bobId}" escapeXml="false" />,
   					"category" : '<c:out value="${param.category}" escapeXml="false" />'
   				}),
   				async : false,
   				dataType : "json",
   				success : function(serverData) {
   					console.log(serverData.response);
   					if(serverData.response == 'success') {
   						location.reload();
   					} else {
   						alert("포인트가 부족합니다. 포인트를 충전해주세요.");
   						$(self.location).attr("href","/payment/mainPayment");
   					}
   				},
   				error:function(request,status,error){
   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   				
   			});
   			
   			$('#enterBob').modal('hide');

   	 	});

   		
   		$('button:contains("설정")').on('hover', function(){
   			if($('.list-group').css('visibility') =='visible') {
   				$('.list-group').css('visibility','hidden');
   			} else {
   				$('.list-group').css('visibility','visible');
   			}
   		});
   		
   	 	
   	 	$('button:contains("회비 내기")').on('click', function() {
   	 		alert("회비 냅니다아아앙");
   	 		
   	 		$.ajax({
   				url : "/bob/rest/payFeebob",
   				method : "POST",
   				contentType : "application/json; charset=UTF-8",
   				data : JSON.stringify({
   					"userId" : <c:out value="${user.userId}" escapeXml="false" />,
   					"participantId" : $("input[name='participantId']").val(),
   					"fee" : <c:out value="${bob.fee}" escapeXml="false" />,
   					"bobId" : <c:out value="${bob.bobId}" escapeXml="false" />
   				}),
   				async : false,
   				dataType : "json",
   				success : function(serverData) {
   					console.log(serverData.response);
   					if(serverData.response == 'success') {
   						location.reload();
   					} else {
   						alert("포인트 충전하세요~~");
   						$(self.location).attr("href","/payment/mainPayment");
   					}
   				},
   				error:function(request,status,error){
   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   				
   			});
   	 	});
   		
   		$('a:contains("자동으로 회비내기")').on('click', function() {
   			//alert($("input[name='participantId']").val() +"&&"+$("input[name='isAutoFee']").val());

   			$.ajax({
   				url : "/bob/rest/setFeebob",
   				method : "POST",
   				contentType : "application/json; charset=UTF-8",
   				data : JSON.stringify({
   					"participantId" : $("input[name='participantId']").val(),
   					"isAutoFee" : $("input[name='isAutoFee']").val()
   				}),
   				async : false,
   				dataType : "json",
   				success : function(serverData) {
   					console.log(serverData.isAutoFee);
   					if(serverData.isAutoFee == 'Y') {
   						alert("회비는 다음달부터 자동으로 출금됩니다. \n 회비날에 포인트가 없을 시 수동으로 납부하셔야 합니다.");											
   					} else {
   						alert("회비 자동납부가 해제되었습니다.");
   					}
   					location.reload();
   				},
   				error:function(request,status,error){
   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   				
   			});

   		});
   		
   		$("#report").on('click',function(){
   			$.ajax({
   					 
   		        url : "/admin/rest/addReport",
   		        method : "POST",
   		        contentType : "application/json; charset=UTF-8",
   		        data : JSON.stringify({
   		            "category" : 2,
   		            "userID" : <c:out value="${user.userId}" escapeXml="false" />,
   		            "text" : $("#reportText").val(),
   		            "roomID" : <c:out value="${bob.bobId}" escapeXml="false" />
   		        }),
   		        async : false,
   		        dataType : "json",
   		        success : function(serverData) {
   		        	alert("신고가 완료되었습니다.");
   		        }
   			})
   		});
   		
   	 	
   	 	/* 맵!!! */

   	 	<c:if test="${!empty bob.longitude}">
   	 	
   			 // 이미지 지도에 표시할 마커입니다
   			 // 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
   			 var markers = 
   			    
   			     {
   			         position: new daum.maps.LatLng(<c:out value="${bob.latitude}" escapeXml="false" />,
   			        		 <c:out value="${bob.longitude}" escapeXml="false" />), 
   			         text: '<c:out value="${bob.locationName}" escapeXml="false" />' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
   			     };
   		
   			 var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
   			     staticMapOption = { 
   			         center: new daum.maps.LatLng(<c:out value="${bob.latitude}" escapeXml="false" />,
   			        		 <c:out value="${bob.longitude}" escapeXml="false" />), // 이미지 지도의 중심좌표
   			         level: 2, // 이미지 지도의 확대 레벨
   			         marker: markers // 이미지 지도에 표시할 마커 
   			     };    
   		
   			 // 이미지 지도를 생성합니다
   			 var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
   	 	
   		</c:if>
   	});

</script>
    
</head>
<body class="getBob">

	<c:set var="frontImage" value="${fn:substring(bob.image, 0, 6)}"/>
	<c:set var="endImage" value="${fn:substring(bob.image, 7, fn:length(bob.image))}"/>
	<div class="bg" style="background-image: url('../resources/upload_files/images/${frontImage}/${endImage}'), url('../resources/upload_files/images/download.jpg') "></div>
	<div class="jumbotron">
		
		<div class="container" align="center">
		
			<div class="row" >
				<div class="col-xs-1" data-toggle="modal" data-target="#addReport">신고</div>
				<c:if test="${user.userId eq bob.writtenUserId}">
					<div class="col-xs-1">수정</div>
				</c:if>
			</div>
			
			<div class="textStyle text-center" style="padding-top: 210px;">
				<div class="overlay"><h1 style="font-weight: bold;">${bob.title}</h1>
					<c:if test="${category ne 'B03'}">
						<h3>
							<c:if test="${category eq 'B01'}">
								<c:if test="${!empty bob.appointmentTime}">
						        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
									<fmt:formatDate value="${Date}" pattern="yyyy년 MM월 dd일 (E) HH시 mm분"/>
					        	</c:if>
					        	<c:if test="${empty bob.appointmentTime}">날짜 미정</c:if>
							</c:if>
							<c:if test="${category eq 'B02'}">오늘</c:if>
							/ ${bob.locationName}
						</h3>
					</c:if>
				</div>
			</div>

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
        
        <!-- /////////////////////  우리지금만나/당장만나 Participant /////////////////////  -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar" id="ListParticipant" style="padding-bottom: 0px;">
        	<div style="padding:8px;">
				<div class="row">
					<div class="col-xs-8 textBold" align="left" style="padding-right: 0px; padding-top:3px;">
						<c:if test="${param.category ne 'B03'}">
							현재 참여한 자췽러
						</c:if>
						<c:if test="${param.category eq 'B03'}">
							참여한 친구들
						</c:if>
					</div>
					<div class="col-xs-4 textBold" align="right" style="font-size: 20px;">
						<c:if test="${param.category eq 'B01'}">
							${fn:length(participant)} / ${bob.limitNum}
						</c:if>
						<c:if test="${param.category eq 'B02'}">
							${fn:length(participant)}명
						</c:if>
						<c:if test="${param.category eq 'B03'}">
							<button class="btn btn-default btn-ico" data-toggle="modal" data-target="#inviteFriend" style="">친구초대</button>
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
							
							<img class="userProfile" width="60px" height="60px"
							style=" border-radius: 40px;
									-moz-border-radius: 40px;
									-khtml-border-radius: 40px;
									-webkit-border-radius: 40px;
									 box-shadow: 1px #cccccc;"
							src = "../resources/upload_files/images/${bob.writtenUserProfile}"
							onerror="this.src='../resources/images/user-icon.png'" />&nbsp;&nbsp;&nbsp;${bob.writtenUserName}
						</div>
					</div>
					
					<input type="hidden" name="getUserTimeLine" value="${bob.writtenUserId}" />
					
					<c:forEach var="participant" items="${participant}">
						
						<c:if test="${participant.userId eq user.userId}">
							<input type="hidden" name="participantId" value="${bob.writtenUserId}" />
							<input type="hidden" name="isAutoFee" value="${participant.isAutoFee}" />
							<c:set var="isAutoFee" value="${participant.isAutoFee}" />
							<c:set var="paidFee" value="${participant.paidFee}"/>
						</c:if>
						<c:if test="${!participant.isWriter}">
							<input type="hidden" name="getUserTimeLine" value="${participant.userId}" />
							<input type="hidden" name="participantId" value="${participant.participantId}" />
							<div class="col-xs-4 text-center" align="left" style="margin-top:20px; padding-right:15px;">
								<img class="userProfile" width="55px" height="55px"
									style=" border-radius: 40px;
											-moz-border-radius: 40px;
											-khtml-border-radius: 40px;
											-webkit-border-radius: 40px;
											 box-shadow: 1px #cccccc;"
									src = "../resources/upload_files/images/${participant.participantProfile}"
					      			onerror="this.src='../resources/images/user-icon.png'" />
					      			${participant.participantName}
							</div>
						</c:if>						
					</c:forEach>
				</div>
				<hr>
				
			<!-- ///////////////////// 우리지금만나/당장만나 Participant 끝 ///////////////////// -->
			
			<!-- ///////////////////// 주기적으로 만나 Participant & 회비 /////////////////////  -->
				
			<jsp:useBean id="today" class="java.util.Date" />
			<fmt:formatDate var="today" value="${today}" pattern="yyyyMMddHHmm"/>
			<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
			<fmt:formatDate value="${Date}" var="appointmentTime" pattern="yyyyMMddHHmm"/>
				
				<c:if test="${param.category ne 'B03'}">
					<div class="row" style="padding: 5px;">
						<c:if test="${bob.status eq 'Y' && appointmentTime>today}">
							<button class="btn-bob">
								<c:if test="${user.userId ne bob.writtenUserId}">
									<c:forEach var="participant" items="${participant}">
										<c:if test="${user.userId eq participant.userId}">취소하기

										</c:if>
									</c:forEach>
									<c:if test="${param.category eq 'B01' && flag}">약속비 1000원으로 참여하기</c:if>
									<c:if test="${param.category eq 'B02' && flag}">번개 참여하기</c:if>
								</c:if>
								<c:if test="${user.userId eq bob.writtenUserId}">마감하기</c:if>
							</button>
						</c:if>
						<c:if test="${bob.status eq 'E' || appointmentTime<=today}">
							<div class="btn-bob" style="background-color: #FFF; color: #000;" >참여자 마감</div>
						</c:if>
					</div>
				</c:if>
				
				<c:if test="${param.category eq 'B03'}">
					<div class="row" style="padding: 5px;">
						<div class="col-xs-9" style="padding: 5px;">
							<c:if test="${isAutoFee eq 'Y'}">
								<div class="btn-bob" style="background-color: #FFF; color: #000;" >회비 자동 납부 중</div>
							</c:if>
							<c:if test="${isAutoFee eq 'N'}">
								<c:if test="${paidFee eq 0 }">
									<button type="submit" class="btn-bob" >회비 내기</button>
								</c:if>
								<c:if test="${paidFee ne 0 }">
									<div class="btn-bob" style="background-color: #FFF; color: #000;" >회비 납부 완료</div>
								</c:if>
							</c:if>
						</div>
						<div class="col-xs-3" style="padding: 5px;">
							<button type="submit" class="btn-bob" >설정</button>
							<div class="dialog-add-bob text-center" style="z-index:10;">
						  		<div class="list-group" style="float: right; position:absolute; visibility: hidden;  box-shadow: 0 5px 15px -5px #666;
						  			cursor: pointer; top: -10px; width: 220px; right: 40px;">
								  <a class="list-group-item" style="">자동으로 회비내기</a>
								</div>
						  	</div>
						</div>
					</div>
				</c:if>
				
				<!-- ///////////////////// 주기적으로 만나 Participant & 회비 끝 /////////////////////  -->
				
			</div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->
      
      <!-- ///////////////////////////////// 댓글 시작 /////////////////////////////////  -->
      <div class="row custumRow" style="margin-top:20px; padding: 50px;">
      	
      	<div class="text-center textBold" style="font-size: 20px;">친구들과 대화를 나누세요 :)</div>
        <hr>
		
		<div class="row" style="padding:0px 5px 30px 5px;">
      		<div class="col-xs-9">
      			<input type="text" name="inputComment" class="form-control"  style="height:45px; font-size: 16px;"
      			placeholder="${!empty sessionScope.user? '댓글을 입력해주세요.':'로그인을 해주세요.'}"/>
      		</div>
      		<div class="col-xs-3">
				<button type="submit" class="form-control" style="background-color: #7a68a6; color: #FFF; height:45px; font-size: 16px;">등록</button>
			</div>
      	</div>
		
		<div id="listComment">
	      <jsp:include page="listComment.jsp" />
      	</div>
      	
      </div>
      
      <!-- ///////////////////////////////// 댓글 끝 /////////////////////////////////  -->
      
      <!-- ///////////////////////////////// 후기 시작 /////////////////////////////////  -->
      
      <c:if test="${param.category ne 'B03'}">
	      <div class="row custumRow" style="margin-top:20px; padding: 50px;">
	      
	      	<div class="text-center textBold" style="font-size: 20px;">
	      		${sessionScope.user.name} 님, 이번 밥친구모임은 어떠셨나요?
	      	</div>
	      	
	      	<hr>
		     <div class="row">
		    	<c:if test="${bob.status eq 'Y'}">
			      	<div class="col-xs-9">
				      	<input type="text" name="inputReview" class="form-control" style="width: 100%; height: 150px; font-size:16px;"></input>
			      	</div>
			      	<div class="col-xs-3">
			      		<button type="submit" class="form-control" style="background-color: #7a68a6; color: #FFF; height:45px; font-size: 16px;">후기 올리기</button>
			      	</div>
		      	</c:if>   	
	      	</div>
			
	      	<c:forEach var="review" items="${review}">
	      		<div class="row">
	      			<div class="col-xs-12 text-center">${review.content} // ${review.categoryCode}</div>
	      		</div>
	      	</c:forEach>
	      </div>
      
      </c:if>
      
	<!-- ///////////////////////////////// 후기 끝 /////////////////////////////////  -->

      <!-- 회비 div 시작 -->

	  <c:if test="${param.category eq 'B03'}">
	      <div class="row custumRow" style="margin-top:20px; padding-top: 30px;">
		    <div class="text-center textBold" style="font-size: 35px;">회비 장부</div>
	      	<hr>
	      	
	      	<div class="row" style="padding: 10px;">
	      		<div class="col-xs-4 select-bob" id="fee-2">두달전</div>
	      		<div class="col-xs-4 select-bob" id="fee-1">저번달</div>
	      		<div class="col-xs-4 select-bob active" id="fee-0">이번달</div>
	      	</div>
	      	
	      	<div class="row text-center textBold" style="padding-top:25px; padding-botton:30px;">
	      		<fmt:parseDate value="${bob.feeDate}" var="Date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	      		<fmt:formatDate var="feeDate" value="${Date}" pattern="d"/><br>
	      		<h1 style="font-size: 20px">회비 내는 날 : 매 월 ${feeDate}일</h1>
	      		
	      		이 달의 회비는 <fmt:formatNumber type="currency" value="${bob.fee}" pattern="###,###" />원입니다.
	      	</div>
	      	
	      	<hr>
	      	
	      	<div id="listFee" class="row" style="padding: 0 20px 0 20px;">
		      <jsp:include page="listFee.jsp" />
	      	</div>

	      	<hr>
	      	
	      	<div class="row" align="right" style="margin-right:5px;">
	      		<form id="excelForm">
	      			<input type="hidden" name="bobId" value="${bob.bobId}" />
	      			<button type="submit" class="btn-bob" style="width: 210px; height: 60px; line-height:60px;">엑셀 다운로드</button>
	      		</form>
	      	</div>
	      </div>
      
      </c:if>
      <!-- /회비 div 끝 -->

    </div><!-- /.container -->



	<!-- Modal --> 
	<div class="modal fade" id="inviteFriend" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
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
	
		<!-- Modal --> 
	<div class="modal fade" id="cancleBob" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
               <div class="modal-content"> 
                    <div class="modal-header"> 
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                             <h4 class="modal-title" style="text-align: center;" id="myModalLabel">참여취소하기</h4> 
                     </div> 
                     <div class="modal-body" align="center">
	                    약속일 일주일 이내에는 약속 취소를 할 수 없습니다.<br>
	                    밥친구와의 약속을 깨시겠어요? T.T
                    </div>
                    <div align="center" class="modal-footer" style="text-align: center;">
                    	<c:if test="${empty bob.appointmentTime}">
	                    	<button class="btn btn-default btn-ico" >취소하기</button>
	                    </c:if>
                    	<c:if test="${!empty bob.appointmentTime}">
                    		<fmt:formatDate var="now" value="${currentTime}"  pattern="yyyyMMdd"/>
							<fmt:formatDate var="appointmentTime" value="${dateFmt}" pattern="yyyyMMdd"/>
                    		<c:if test="${appointmentTime <= (now - 7)}"><button class="btn btn-default btn-ico" >취소하기</button></c:if>
                    		<c:if test="${appointmentTime > (now - 7)}">취소할 수 없어용T.T</c:if>
	                    </c:if>
                    </div>
               </div> 
        </div> 
	</div>

	<div class="modal fade" id="addReport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"><b>신고하기</b></h4><label for="exampleTextarea">카테고리/신고대상:</label>
	      </div>
	      <div class="modal-body">    
	      	 <textarea class="form-control" id="reportText" rows="5"></textarea>
	        </div>
	      <div class="modal-footer">
	       <div class="topnav">
	      <div class="search-container">
	      	<button type="button" class="btn btn-primary" id="report" data-dismiss="modal" >신고하기</button>
	      	 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div></div>
	       
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>