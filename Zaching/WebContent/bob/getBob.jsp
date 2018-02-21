<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<link rel="stylesheet" href="../resources/css/bob.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/bob.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/css/bobCss/preloader.css">
    <link rel="stylesheet" href="../resources/css/bobCss/style.css">
    <link rel="stylesheet" href="../resources/css/bobCss/responsive.css">
    <link rel="stylesheet" href="../resources/css/bobCss/animate.css">
    <link rel="stylesheet" href="../resources/css/bobCss/simple-line-icons.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Antic|Raleway:300">
    
    
	
	<style>
		body {
		    line-height: 2;
		}
		.overlay h2, .overlay h4 {
	    	color: #FFFFFF;
	    }
	    
	    #testimonials > div.sectionhead.wow.bounceInUp.animated > hr{
	    	display: inline-block;
	    }
	    
	    #testimonials > div.sectionhead.wow.bounceInUp.animated > h3, h4{
	    	color: black;
	    }
	    
	    #testimonials > div.row > div > div.quote > h5{
	    	color: black;
	    }
	    
	    #testimonials > div.row > div > div.quote{
	    	padding-right: 20px;
	    }

	    .nav a{
font-family: 'Hanna', serif;"
}

	    
	    .fullscreen_popup__close {
		    position: absolute;
		    top: 15px;
		    right: 20px;
		    width: 25px;
		    height: 25px;
		    padding: 15px;
		    cursor: pointer;
		}
	    
	    .circle-close-button {
		    vertical-align: middle;
		    background-image: url(../resources/images/stylenanda.png);
		    background-repeat: no-repeat;
		    width: 25px;
		    height: 25px;
		    background-position: -37px -61px;
		}

	</style>

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
   	   
   		// ȸ���� �޺��� ������
   		$('.select-bob').on('click', function(){
   			$('.active').removeClass('active');
   			$(this).addClass('active');
   			$("#listFee").load("/bob/listFee?bobId=${param.bobId}&monthFee="+$(this).attr("id").substring(4));
   		});
   	 	
   	 	$('.col-xs-1:contains("����")').on('click', function() {
   			$(self.location).attr("href","/bob/updateBob?category=${category}&bobId=${bob.bobId}");
   		});

   		$("input:checkbox[name=inviteFriend]").change(function(){
   	        $("#checkFriend").text($("input:checkbox[name=inviteFriend]:checked").length);
   	    });
   	 	
   	 	$('.btn-ico:contains("�ʴ��ϱ�")').on('click', function() {
   			//alert('�ʴ��ϱ�');
   			var lists = [];
			$("input[name='inviteFriend']:checked").each(function(i){   //jQuery�� for�� ���鼭 check �Ȱ� �迭�� ��´�
				lists.push($(this).val());
			});
			
   			$.ajax({
   				url : "/bob/rest/inviteBob",
   				method : "POST",
   				contentType : "application/json; charset=UTF-8",
   				data : JSON.stringify({
   					"bobId" : <c:out value="${bob.bobId}" escapeXml="false" />,
   					"list" : lists
   				}),
   				async : false,
   				dataType : "json",
   				success : function(serverData) {
   					
   					if(serverData.response == "success") {
						alert("ģ���� ���������� �ʴ��Ͽ����ϴ�.");
						location.reload();
					} else {
						alert("ģ���� �ʴ����� ���Ͽ����ϴ�. \n �ٽ� �õ����ּ���.");
					}
   					
   					location.reload();
   				},
   				error:function(request,status,error){
   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   				
   			});
   		});
   	 	
   	 	$('.btn-bob:contains("���� �ٿ�ε�")').on('click', function() {
   	 		//alert("${bob.bobId}");
   	 		$("#excelForm").attr("method", "POST").attr("action", "/bob/excelFee").submit();
		});
   	 	
   		$(document).on('click','#ListParticipant .userProfile', function() {
	 		var participantUserId = $($("input[name=getUserTimeLine]")[$('#ListParticipant .userProfile').index(this)]).val();
	 		$(self.location).attr("href","/user/getTimeLine?userId="+participantUserId);
	 	});
   	 	
   	 	/*///////////////////////////// �ı� ���� /////////////////////////////*/
   	 	
   		$('button:contains("�ı� �ø���")').on('click', function(){
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
					"content" : $(":text[name='inputReview']").val(),
					"image" : '<c:out value="${bob.image}" escapeXml="false" />'
				}),
				async : false,
				dataType : "json",
				success : function(serverData) {
					
					if(serverData.response == "success") {
						alert("�ıⰡ ������ ��ϵǾ����ϴ�.");
						location.reload();
					} else {
						alert("�ıⰡ ��ϵ��� �ʾҽ��ϴ�. \n �ٽ� �õ����ּ���.");
					}

				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});
	 	}
   	 	
   	 	/*///////////////////////////// �ı� �� /////////////////////////////*/
   	 	
   	 	/*///////////////////////////// ��� ���� /////////////////////////////*/
   	 	
   	 	$('button:contains("���")').on('click', function(){
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

   	 	$(document).on('click', '.deleteComment > img', function() {
	   	 	if (confirm("����� �����Ͻðھ��?") == true){
	   	 		var index = $('.deleteComment > img').index(this);
	   	 		var commentId = $($('input[name=commentId]')[index]).val();
	   	 		//alert(index+":"+commentId);
		   	 	$.ajax({
	   				url : "/comment/rest/deleteComment",
	   				method : "POST",
	   				contentType : "application/json; charset=UTF-8",
	   				data : JSON.stringify({
	   					"commentId" : commentId
	   				}),
	   				async : false,
	   				success : function(serverData) {
	   					location.reload();
	   				},
	   				error:function(request,status,error){
	   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   				}
	   			});
		   	 	
		   	}else{
		   		return ;
		   	}
   	 	});
   	 	
   	 	$('div .row .text-center:contains("�� ����")').on("click", function() {
   	 		$("#listComment").load("/bob/listCommment?category=${param.category}&bobId=${param.bobId}&currentPage=${commentPage.currentPage+1}");
   	 	});
   	 	
   	 	$(document).on('click','#listComment .col-sm-2 > img', function() {
	 		var commentUserId = $($("input[name=commentUserId]")[$('#listComment img').index(this)]).val();
	 		$(self.location).attr("href","/user/getTimeLine?userId="+commentUserId);
	 	});
   	 	
   	 	/*///////////////////////////// ��� �� /////////////////////////////*/
   	 	
   		$('body > div.container > div:nth-child(2) > div.row > div.col-xs-3 > button').on("click", function() {
   			//alert($(this).attr('href'));
   		});
   	 	
   	 	/* ���� modal toggle */
   	 	$('button:contains("�����ϱ�")').on('click',function() {
   	 		$('#enterBob').modal('toggle');
   	 	});
   	 	
   	 	$('button:contains("����ϱ�")').on('click',function() {
   	 		$('#cancleBob').modal('toggle');
   	 	});
   	 	
   	 	/* ���� ajax ó��*/
   	 	
   	 	$('.btn-bob:contains("����ϱ�")').on('click',function() {
   	 		$('#cancleBob').modal('show');
   	 	});
   	 	
   	 	$('.btn-ico:contains("����ϱ�")').on('click',function() {
   	 		
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
   	 	
   	 	$('button:contains("�����ϱ�")').on('click', function() {
   	 		//console.log("${bob.bobId}");
   	 		//Ȯ��
	   	 	if (confirm("������ ��û�� �����Ͻðھ��? \n���� ��, �����ڸ� �� �̻� ���� �� �� �����ϴ�.") == true){
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
		   	//���
		   	}else{
		   	    return;
		   	}
   	 	});
   	 	
   	 	$('.btn-ico:contains("�����ϱ�")').on('click', function() {

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
   						alert("����Ʈ�� �����մϴ�. ����Ʈ�� �������ּ���.");
   						$(self.location).attr("href","/payment/mainPayment");
   					}
   				},
   				error:function(request,status,error){
   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   				
   			});
   			
   			$('#enterBob').modal('hide');

   	 	});

   		
   		$('button:contains("����")').on('hover', function(){
   			if($('.list-group').css('visibility') =='visible') {
   				$('.list-group').css('visibility','hidden');
   			} else {
   				$('.list-group').css('visibility','visible');
   			}
   		});
   		
   	 	
   	 	$('button:contains("ȸ�� ����")').on('click', function() {
   	 		
   	 		alert("${user.userId} / "+ $("input[name='participantId']").val() + "${bob.fee} / ${bob.bobId}");
   	 		
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
   						alert("����Ʈ �����ϼ���~~");
   						$(self.location).attr("href","/payment/mainPayment");
   					}
   				},
   				error:function(request,status,error){
   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   				
   			});
   	 	});
   		
   		$('a:contains("�ڵ����� ȸ�񳻱�")').on('click', function() {
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
   						alert("ȸ��� �����޺��� �ڵ����� ��ݵ˴ϴ�. \n ȸ�񳯿� ����Ʈ�� ���� �� �������� �����ϼž� �մϴ�.");											
   					} else {
   						alert("ȸ�� �ڵ����ΰ� �����Ǿ����ϴ�.");
   					}
   					location.reload();
   				},
   				error:function(request,status,error){
   				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   				
   			});

   		});
   		
   		$("#report").on('click',function(){
   			
   			alert($("#reportText").val().length);
   			
   			if($("#reportText").val().length < 10) {
   				alert("�Ű� ������ 10�� �̻� �Է����ּ���.");
   				return false;
   			}
   			
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
   		        	alert("�Ű� �Ϸ�Ǿ����ϴ�. \n ���� Ȯ�� �� ��ġ�� ���ϵ��� �ϰڽ��ϴ�. \n �����մϴ�.");
   		        }
   			});
   			
   		});
   		
   	 	
   	 	/* ��!!! */

   	 	<c:if test="${!empty bob.longitude}">
   	 	
   			 // �̹��� ������ ǥ���� ��Ŀ�Դϴ�
   			 // �̹��� ������ ǥ���� ��Ŀ�� �Ʒ��� ���� �迭�� �־��ָ� �������� ��Ŀ�� ǥ���� �� �ֽ��ϴ� 
   			 var markers = {
   			         position: new daum.maps.LatLng(<c:out value="${bob.latitude}" escapeXml="false" />,
   			        		 <c:out value="${bob.longitude}" escapeXml="false" />), 
   			         text: '<c:out value="${bob.locationName}" escapeXml="false" />' // text �ɼ��� �����ϸ� ��Ŀ ���� �ؽ�Ʈ�� �Բ� ǥ���� �� �ֽ��ϴ�     
   			     };
   		
   			 var staticMapContainer  = document.getElementById('staticMap'), // �̹��� ������ ǥ���� div  
   			     staticMapOption = { 
   			         center: new daum.maps.LatLng(<c:out value="${bob.latitude}" escapeXml="false" />,
   			        		 <c:out value="${bob.longitude}" escapeXml="false" />), // �̹��� ������ �߽���ǥ
   			         level: 2, // �̹��� ������ Ȯ�� ����
   			     };    
   		
   			 // �̹��� ������ �����մϴ�
   			var map = new daum.maps.Map(staticMapContainer, staticMapOption);
   			 
   			var marker = new daum.maps.Marker({
   				map: map,
   			    position: new daum.maps.LatLng(<c:out value="${bob.latitude}" escapeXml="false" />,
		        		 <c:out value="${bob.longitude}" escapeXml="false" />),
		        title : '<c:out value="${bob.locationName}" escapeXml="false" />'
   			});
   			
   	 	
   		</c:if>

   	});

</script>

</head>
<body class="getBob" data-spy="scroll">

	<c:set var="frontImage" value="${fn:substring(bob.image, 0, 6)}"/>
	<c:set var="endImage" value="${fn:substring(bob.image, 7, fn:length(bob.image))}"/>
	<div class="bg" style="background-image: url('../resources/upload_files/images/${frontImage}/${endImage}'), url('../resources/images/sample_bob_background.jpg') ">
		<div class="img-cover"></div>
	</div>
	<div class="jumbotron">
		<div class="container" align="center">
			<div class="row">
				<div class="col-xs-1" data-toggle="modal" data-target="#addReport">�Ű�</div>
				<c:if test="${user.userId eq bob.writtenUserId}">
					<div class="col-xs-1">����</div>
				</c:if>
			</div>
		</div>
		<div class="textStyle text-center" style="padding-top: 210px;">
			<div class="overlay">
				<h2 style="font-weight: bold; font-size: 50px;">${bob.title}</h2>
				<c:if test="${category ne 'B03'}">
					<h4 style="padding-top: 22px; font-size: 25px;">
						<c:if test="${category eq 'B01'}">
							<c:if test="${!empty bob.appointmentTime}">
					        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
								<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� (E) HH�� mm��"/>
				        	</c:if>
				        	<c:if test="${empty bob.appointmentTime}">��¥ ����</c:if>
						</c:if>
						<c:if test="${category eq 'B02'}">����</c:if>
						/ ${bob.locationName}
					</h4>
				</c:if>
			</div>
		</div>

	</div>
	
	<div class="container" style="font-size: 1em;">

      <div class="row">

        <div class="col-sm-8 blog-main custumRow">

          <div class="blog-post" style="min-height:350px;">
            ${bob.content}
            <c:if test="${!empty bob.longitude}">
            	<hr style="margin-top: 50px;">
	            <div class="text-center textBold" style="font-size: 25px; padding-bottom: 30px;">������<br/></div>            
	            <div id="staticMap" style="height:350px;"></div>
            </c:if>          
          </div><!-- /.blog-post -->

        </div><!-- /.blog-main -->
        
        <!-- /////////////////////  �츮���ݸ���/���常�� Participant /////////////////////  -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar" id="ListParticipant" style="padding-bottom: 0px;">
        	<div style="padding:8px;">
				<div class="row">
					<div class="col-xs-8 textBold" align="left" style="padding-right: 0px; padding-top:3px;">
						<c:if test="${param.category ne 'B03'}">
							���� ������ ����
						</c:if>
						<c:if test="${param.category eq 'B03'}">
							������ ģ����
						</c:if>
					</div>
					<div class="col-xs-4 textBold" align="right" style="font-size: 20px;">
						<c:if test="${param.category eq 'B01'}">
							${fn:length(participant)} / ${bob.limitNum}
						</c:if>
						<c:if test="${param.category eq 'B02'}">
							${fn:length(participant)}��
						</c:if>
						<c:if test="${param.category eq 'B03'}">
							<button class="btn btn-default btn-ico" data-toggle="modal" data-target="#inviteFriend" style="">ģ���ʴ�</button>
						</c:if>
					</div>
					
				</div>
				<div class="row" style="padding: 10px; top:-30px;  padding-top:-50px;">
					<div class="col-xs-12" align="left" style="margin-top:20px;">
						<!-- �հ� �̹��� -->
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
							<input type="hidden" name="participantId" value="${participant.participantId}" />
							<input type="hidden" name="isAutoFee" value="${participant.isAutoFee}" />
							<c:set var="isAutoFee" value="${participant.isAutoFee}" />
							<c:set var="paidFee" value="${participant.paidFee}"/>
						</c:if>
						<c:if test="${!participant.isWriter}">
							<input type="hidden" name="getUserTimeLine" value="${participant.userId}" />
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
					      			<c:if test="${participant.status eq 1}">
										<img src="../resources/images/paper-plane.png" width="30px" style="position: absolute; top: 0; right: 3px;"/>
									</c:if>
							</div>
							
							
						</c:if>						
					</c:forEach>
				</div>
				<hr>
				
			<jsp:useBean id="today" class="java.util.Date" />
			<fmt:formatDate var="today" value="${today}" pattern="yyyyMMddHHmm"/>
			<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
			<fmt:formatDate value="${Date}" var="appointmentTime" pattern="yyyyMMddHHmm"/>
				
				<c:if test="${param.category ne 'B03'}">
					<div class="row" style="padding: 5px;">
						<c:set var="flag" value="true"/>
						<c:if test="${bob.status eq 'Y' && (appointmentTime > today || empty bob.appointmentTime)}">
						
							<button class="btn-bob">
								<c:if test="${user.userId ne bob.writtenUserId}">
									<c:forEach var="participant" items="${participant}">
										<c:if test="${user.userId eq participant.userId}">
											<c:set var="flag" value="false"/>
											����ϱ�
										</c:if>
									</c:forEach>
									<c:if test="${param.category eq 'B01' && flag}">��Ӻ� 1000������ �����ϱ�</c:if>
									<c:if test="${param.category eq 'B02' && flag}">���� �����ϱ�</c:if>
								</c:if>
								<c:if test="${user.userId eq bob.writtenUserId}">�����ϱ�</c:if>
							</button>
						</c:if>
						<c:if test="${bob.status eq 'E' || appointmentTime<=today}">
							<div class="btn-bob" style="background-color: #FFF; color: #000;" >������ ����</div>
						</c:if>
					</div>
				</c:if>
				
				<c:if test="${param.category eq 'B03'}">
					<div class="row" style="padding: 5px;">
						<div class="col-xs-9" style="padding: 5px;">
							<c:if test="${isAutoFee eq 'Y'}">
								<div class="btn-bob" style="background-color: #FFF; color: #000;" >ȸ�� �ڵ� ���� ��</div>
							</c:if>
							<c:if test="${isAutoFee eq 'N'}">
								<c:if test="${paidFee eq 0 }">
									<button type="submit" class="btn-bob" >ȸ�� ����</button>
								</c:if>
								<c:if test="${paidFee ne 0 }">
									<div class="btn-bob" style="background-color: #FFF; color: #000;" >ȸ�� ���� �Ϸ�</div>
								</c:if>
							</c:if>
						</div>
						<div class="col-xs-3" style="padding: 5px;">
							<button type="submit" class="btn-bob" >����</button>
							<div class="dialog-add-bob text-center" style="z-index:10;">
						  		<div class="list-group" style="float: right; position:absolute; visibility: hidden;  box-shadow: 0 5px 15px -5px #666;
						  			cursor: pointer; top: -10px; width: 220px; right: 40px;">
								  <a class="list-group-item" style="">�ڵ����� ȸ�񳻱�</a>
								</div>
						  	</div>
						</div>
					</div>
				</c:if>
				
				<!-- ///////////////////// �ֱ������� ���� Participant & ȸ�� �� /////////////////////  -->
				
			</div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->
      
      <!-- ///////////////////////////////// ��� ���� /////////////////////////////////  -->
      <div class="row custumRow" style="margin-top:20px; padding: 30px 10px 20px 10px;">
      	
      	<div class="text-center textBold" style="font-size: 20px;">ģ����� ��ȭ�� �������� :)</div>
        <hr>
		
		<div class="row" style="padding:0px 5px 30px 5px;">
      		<div class="col-xs-9">
      			<input type="text" name="inputComment" class="form-control"  style="height:45px; font-size: 16px;"
      			placeholder="${!empty sessionScope.user? '����� �Է����ּ���.':'�α����� ���ּ���.'}"/>
      		</div>
      		<div class="col-xs-3">
				<button type="submit" class="form-control" style="background-color: #f77e7e; color: #FFF; height:45px; font-size: 16px;">���</button>
			</div>
      	</div>
		
		<div id="listComment">
	      <jsp:include page="listComment.jsp" />
      	</div>
      	
      </div>
      
      <!-- ///////////////////////////////// ��� �� /////////////////////////////////  -->
      
      <!-- ///////////////////////////////// �ı� ���� /////////////////////////////////  -->
      
      <c:if test="${param.category eq 'B01'}">
	      <div class="row custumRow" style="margin-top:20px; padding: 30px 10px 20px 10px;">
	      
	      	<div class="text-center textBold" style="font-size: 20px;">
	      		${sessionScope.user.name} ��, �̹� ��ģ�������� ��̳���?
	      	</div>
	      	
	      	<hr>
		     <!--  �ı� ��� -->
		     <div class="row">
		    	<c:if test="${bob.status eq 'Y'}">
			      	<div class="col-xs-9">
				      	<input type="text" name="inputReview" class="form-control" style="width: 100%; height: 150px; font-size:16px;"
				      		placeholder="${!empty sessionScope.user? '�ı⸦ �Է����ּ���.':'�α����� ���ּ���.'}"/>
			      	</div>
			      	<div class="col-xs-3">
			      		<button type="submit" class="form-control" style="background-color: #f77e7e; color: #FFF; height:45px; font-size: 16px;">�ı� �ø���</button>
			      	</div>
		      	</c:if>   	
	      	</div>
			<div id="testimonials" class="container">
		        <div class="sectionhead wow bounceInUp" data-wow-duration="2s" style="font-color: black;">
		            <span class="bigicon icon-bubbles"></span>
		            <h3>��ģ�� �ı�</h3>
		            <h4>��ģ�� �ı⸦ �����ּ���!!</h4>
		            <hr class="separetor">
		        </div>
		        <!-- TESTIMONIAL SECTIONHEAD END -->
			
		        <!-- TESTIMONIAL ITEMS START -->
		        <div class="row">
		        <c:forEach var="review" items="${review}">
		            <!-- 1ST TESTIMONIAL ITEM -->
		            <div class="col-md-6 wow bounceIn" data-wow-duration="2s">
		                <div class="clientsphoto">
		                    <a href="/user/getTimeLine?userId=${review.userId}"><img src="../resources/upload_files/images/${review.profileImage}" alt="Dan"></a>
		                </div>
		
		                <div class="quote">
		                    <blockquote>
		                        <p>${review.content}</p>
		                    </blockquote>
		                    <h5>${review.userName}</h5>
		                    <a href="/newsfeed/getNewsfeed?newsfeedId=${review.newsfeedId}"><p>�ڼ��� ����</p></a>
		                </div>
		            </div>
		            <!-- 1ST TESTIMONIAL ITEM END -->
		         </c:forEach>
		
		            
		        </div>
		    </div>
			<c:if test="${empty review}">
				<div class="row">
	      			<div class="col-xs-12 text-center" style="padding:40px 0 20px 0;">��ϵ� �ıⰡ �����ϴ�.</div>
	      		</div>
			</c:if>
	      	
	      </div>
      
      </c:if>
      
	<!-- ///////////////////////////////// �ı� �� /////////////////////////////////  -->

      <!-- ȸ�� div ���� -->

	  <c:if test="${param.category eq 'B03'}">
	      <div class="row custumRow" style="margin-top:20px; padding-top: 30px;">
		    <div class="text-center textBold" style="font-size: 20px;">ȸ�� ���</div>
	      	<hr>
	      	
	      	<div class="row" style="padding: 10px;">
	      		<div class="col-xs-4 select-bob" id="fee-2">�δ���</div>
	      		<div class="col-xs-4 select-bob" id="fee-1">������</div>
	      		<div class="col-xs-4 select-bob active" id="fee-0">�̹���</div>
	      	</div>
	      	
	      	<div class="row text-center textBold" style="padding-top:25px; padding-botton:30px;">
	      		<fmt:parseDate value="${bob.feeDate}" var="Date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	      		<fmt:formatDate var="feeDate" value="${Date}" pattern="d"/><br>
	      		<h1 style="font-size: 17px">ȸ�� ���� �� : �� �� ${feeDate}��</h1>
	      		�� ���� ȸ��� <fmt:formatNumber type="currency" value="${bob.fee}" pattern="###,###" />���Դϴ�.
	      	</div>
	      	
	      	<hr>
	      	
	      	<div id="listFee" class="row" style="padding: 0 20px 0 20px;">
		      <jsp:include page="listFee.jsp" />
	      	</div>

	      	<hr>
	      	
	      	<div class="row" align="right" style="margin-right:5px;">
	      		<form id="excelForm">
	      			<input type="hidden" name="bobId" value="${bob.bobId}" />
	      			<button type="submit" class="btn-bob" style="width: 210px; height: 60px; line-height:60px; font-weight: normal;">���� �ٿ�ε�</button>
	      		</form>
	      	</div>
	      </div>
      
      </c:if>
      <!-- /ȸ�� div �� -->

    </div><!-- /.container -->



	<!-- Modal --> 
	<div class="modal fade" id="inviteFriend" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
               <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                        <h4 class="modal-title" style="text-align: center;" id="myModalLabel">�� ģ�� �ʴ�</h4> 
                     </div>
                     <div class="modal-body" align="center">
                     ������ ģ�� <span id="checkFriend">0</span> / ${fn:length(listFriend)} ��
                     
	                    <c:forEach var="friend" items="${listFriend}" varStatus="status" >
	                        <div class="row" style="padding: 5px 10px 5px 10px;">
	                            <div class="input-group">
							      <input type="checkbox" id="friend${status.index}" name="inviteFriend" value="${friend.friendId}">
							      <label for="friend${status.index}">
							      <img class="userProfile" width="30px" height="30px"
									style=" border-radius: 30px; box-shadow: 1px #cccccc;"
									src = "../resources/upload_files/images/ ${friend.profileImage}"
									onerror="this.src='../resources/images/user-icon.png'" />  ${friend.name}
								</label>
							    <br>
							   </div>
					    	</div>
					    </c:forEach>
                    </div>
                    <div align="center" class="modal-footer" style="text-align: center;">
                    	<button class="btn btn-default btn-ico" >�ʴ��ϱ�</button>
                    </div>
               </div> 
        </div> 
	</div>
	
	<!-- Modal --> 
	<div class="modal fade" id="enterBob" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
               <div class="modal-content">
                     
                     <div class="fullscreen_popup__close" style="top: -38px; right: -19px;">
					    	<div class="circle-close-button" class="close" data-dismiss="modal" aria-hidden="true"></div>
					  	</div>
                     
                     <h4 class="modal-title" style="text-align: center;" id="myModalLabel">�����ϱ�</h4>
                     
                     <div class="modal-body" align="center">
	                    ����� ������ �̳����� ��� ��Ҹ� �� �� �����ϴ�.<br>
	                    ������ �����Ͻðھ��?
                    </div>
                    <div align="center" class="modal-footer" style="text-align: center;">
                    	<button class="btn btn-default btn-ico" >�����ϱ�</button>
                    	<div style="background-image: url('../resources/images/enter_bob.png'); background-repeat: no-repeat;"></div>
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
                        <h4 class="modal-title" style="text-align: center;" id="myModalLabel">��������ϱ�</h4>
                        
                        <div class="fullscreen_popup__close" style="top: 25px;right: 109px;">
					    	<div class="circle-close-button"></div>
					  	</div>
                     </div> 
                     <div class="modal-body" align="center">
	                    ����� ������ �̳����� ��� ��Ҹ� �� �� �����ϴ�.<br>
	                    ��ģ������ ����� ���ðھ��? T.T
                    </div>
                    <div align="center" class="modal-footer" style="text-align: center;">
                    	<c:if test="${empty bob.appointmentTime}">
	                    	<button class="btn btn-default btn-ico" >����ϱ�</button>
	                    </c:if>
                    	<c:if test="${!empty bob.appointmentTime}">
                    		<fmt:formatDate var="now" value="${currentTime}"  pattern="yyyyMMdd"/>
							<fmt:formatDate var="appointmentTime" value="${dateFmt}" pattern="yyyyMMdd"/>
                    		<c:if test="${appointmentTime <= (now - 7)}"><button class="btn btn-default btn-ico" >����ϱ�</button></c:if>
                    		<c:if test="${appointmentTime > (now - 7)}">����� �� �����T.T</c:if>
	                    </c:if>
                    </div>
               </div> 
        </div> 
	</div>

	<div class="modal fade" id="addReport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        	<span aria-hidden="true">&times;</span>
	        </button>      
	        <h4 class="modal-title" id="myModalLabel"><b>�Ű��ϱ�</b></h4>
	        <span>
	        	'${bob.title}' ���� �Ұ����ϰų� Ȯ���� �ʿ��� ��� �Ű� ���ּ���.
	        </span>
	      </div>
	      <div class="modal-body">    
	      	 <textarea id="reportText" rows="5" style="resize: none; height: 210px; width: 100%;padding: 10px;"></textarea>
	        </div>
	      <div class="modal-footer">
	       <div class="topnav">
		      <div class="search-container">
		      	<button type="button" class="btn btn-primary" id="report" data-dismiss="modal" >�Ű��ϱ�</button>
		      </div>
	      </div>
	       
	      </div>
	    </div>
	  </div>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="../resources/javascript/bobJs/jquery.nicescroll.min.js"></script>
    <script src="../resources/javascript/bobJs/jribbble.min.js"></script>
    <script src="../resources/javascript/bobJs/drifolio.js"></script>
    <script src="../resources/javascript/bobJs/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
</body>
</html>