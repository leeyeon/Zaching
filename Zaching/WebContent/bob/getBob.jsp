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
	
	<link rel="stylesheet" href="../resources/css/getBob.css">
	    
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
    	 	
    	 	$('button:contains("���")').on('click', function(){
    	 		alert('��۴ޱ�');
    	 	});
    	 	
    	 	$('.col-xs-1:contains("�Ű�")').on('click', function() {
    	 		alert('�Ű�');
    	 	});
    	 	
    	 	$('.col-xs-1:contains("����")').on('click', function() {
    			//alert('����');
    			$(self.location).attr("href","/bob/updateBob?category=${category}&bobId=${bob.bobId}");
    		});
    	 	
    	 	$('.btn-ico:contains("�ʴ��ϱ�")').on('click', function() {
    			alert('�ʴ��ϱ�');
    		});
    	 	
    	 	$('.deleteComment').on('click', function() {
    	 		alert();
    	 	});
    	 	
    	 	/* ��� */

    	 	$(":text[name='inputComment']").on("keydown", function(e) {

    			if(e.keyCode == 13) {
    				alert($(this).val());
    				$.ajax({
    					url : "/bob/rest/addComment",
    					method : "POST",
    					contentType : "application/json; charset=UTF-8",
    					data : JSON.stringify({
    						"userId" : <c:out value="${user.userId}" escapeXml="false" />,
    						"roomId" : <c:out value="${bob.bobId}" escapeXml="false" />,
    						"category" : '<c:out value="${param.category}" escapeXml="false" />',
    						"content" : $(this).val()
    					}),
    					async : false,
    					dataType : "json",
    					success : function(serverData) {
    						console.log(serverData.comment);
    						
    					},
    					error:function(request,status,error){
    					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    					}
    					
    				});
    			} else {
    				
    			}
    		});
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
    				dataType : "json",
    				success : function(serverData) {
    					console.log(serverData.response);
    					if(serverData.response == 'success') {
    						location.reload();
    					} else {
    						alert("�쿨");
    					}
    				},
    				error:function(request,status,error){
    				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    				}
    			});
    	 		
    	 		$('#cancleBob').modal('hide');
    	 	});
    	 	
    	 	$('button:contains("�����ϱ�")').on('click', function() {
    	 		alert("�������� status E �� update");
    	 	});
    	 	
    	 	$('.btn-ico:contains("�����ϱ�")').on('click', function() {

    			$.ajax({
    				url : "/bob/rest/enterBob",
    				method : "POST",
    				contentType : "application/json; charset=UTF-8",
    				data : JSON.stringify({
    					"userId" : <c:out value="${user.userId}" escapeXml="false" />,
    					"bobId" : <c:out value="${bob.bobId}" escapeXml="false" />,
    					"category" : 'B00'
    				}),
    				async : false,
    				dataType : "json",
    				success : function(serverData) {
    					console.log(serverData.response);
    					if(serverData.response == 'success') {
    						location.reload();
    					} else {
    						alert("����Ʈ �����ϼ���~~");
    						alert("������ �̵�");
    					}
    				},
    				error:function(request,status,error){
    				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    				}
    				
    			});
    			
    			$('#enterBob').modal('hide');

    	 	});

    		
    		$('button:contains("����")').on('click', function(){
    			if($('.list-group').css('visibility') =='visible') {
    				$('.list-group').css('visibility','hidden');
    			} else {
    				$('.list-group').css('visibility','visible');
    				
    			}
    		});
    		
    	 	
    	 	$('button:contains("ȸ�� ����")').on('click', function() {
    	 		alert("ȸ�� ���ϴپƾƾ�");
    	 		
    	 		$.ajax({
    				url : "/bob/rest/payFeebob",
    				method : "POST",
    				contentType : "application/json; charset=UTF-8",
    				data : JSON.stringify({
    					"userId" : <c:out value="${user.userId}" escapeXml="false" />,
    					"participantId" : $("input[name='participantId']").val(),
    					"fee" : <c:out value="${bob.fee}" escapeXml="false" />
    				}),
    				async : false,
    				dataType : "json",
    				success : function(serverData) {
    					console.log(serverData.response);
    					if(serverData.response == 'success') {
    						location.reload();
    					} else {
    						alert("����Ʈ �����ϼ���~~");
    						alert("������ �̵�");
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
    		
    	 	
    	 	/* ��!!! */

    	 	<c:if test="${!empty bob.longitude}">
    	 	
    			 // �̹��� ������ ǥ���� ��Ŀ�Դϴ�
    			 // �̹��� ������ ǥ���� ��Ŀ�� �Ʒ��� ���� �迭�� �־��ָ� �������� ��Ŀ�� ǥ���� �� �ֽ��ϴ� 
    			 var markers = 
    			    
    			     {
    			         position: new daum.maps.LatLng(<c:out value="${bob.latitude}" escapeXml="false" />,
    			        		 <c:out value="${bob.longitude}" escapeXml="false" />), 
    			         text: '<c:out value="${bob.locationName}" escapeXml="false" />' // text �ɼ��� �����ϸ� ��Ŀ ���� �ؽ�Ʈ�� �Բ� ǥ���� �� �ֽ��ϴ�     
    			     };
    		
    			 var staticMapContainer  = document.getElementById('staticMap'), // �̹��� ������ ǥ���� div  
    			     staticMapOption = { 
    			         center: new daum.maps.LatLng(<c:out value="${bob.latitude}" escapeXml="false" />,
    			        		 <c:out value="${bob.longitude}" escapeXml="false" />), // �̹��� ������ �߽���ǥ
    			         level: 2, // �̹��� ������ Ȯ�� ����
    			         marker: markers // �̹��� ������ ǥ���� ��Ŀ 
    			     };    
    		
    			 // �̹��� ������ �����մϴ�
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
				<div class="col-xs-1">�Ű�</div>
				<c:if test="${user.userId eq bob.writtenUserId}">
					<div class="col-xs-1">����</div>
				</c:if>
			</div>
			
			<div class="textStyle text-center" style="padding-top: 210px;">
				<div class="overlay"><h1 style="font-weight: bold;">${bob.title}</h1>
					<c:if test="${category ne 'B03'}">
						<h3>
							<c:if test="${category eq 'B01'}">
								<c:if test="${!empty bob.appointmentTime}">
						        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
									<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� (E) HH�� mm��"/>
					        	</c:if>
					        	<c:if test="${empty bob.appointmentTime}">��¥ ����</c:if>
							</c:if>
							<c:if test="${category eq 'B02'}">����</c:if>
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
	            <div class="text-center textBold" style="font-size: 35px;">������<br/></div>            
	            <div id="staticMap" style="height:350px;"></div>
            </c:if>          
          </div><!-- /.blog-post -->

        </div><!-- /.blog-main -->
        
        <!-- /////////////////////  �츮���ݸ���/���常�� Participant /////////////////////  -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar" style="padding-bottom: 0px;">
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
							<button class="btn btn-default btn-ico" data-toggle="modal" data-target="#myModal" style="">ģ���ʴ�</button>
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
							<img width="60px" height="60px"
							style=" border-radius: 40px;
									-moz-border-radius: 40px;
									-khtml-border-radius: 40px;
									-webkit-border-radius: 40px;
									 box-shadow: 1px #cccccc;"
							src = "../resources/upload_files/images/${bob.writtenUserProfile}"
							onerror="this.src='../resources/images/user-icon.png'" />&nbsp;&nbsp;&nbsp;${bob.writtenUserName}
						</div>
					</div>
					
					<c:forEach var="participant" items="${participant}">
						<c:if test="${participant.userId eq user.userId}">
							<input type="hidden" name="participantId" value="${participant.participantId}" />
							<input type="hidden" name="isAutoFee" value="${participant.isAutoFee}" />
							<c:set var="isAutoFee" value="${participant.isAutoFee}" />
							<c:set var="paidFee" value="${participant.paidFee}"/>
						</c:if>
						<c:if test="${!participant.isWriter}">
							<div class="col-xs-4 text-center" align="left" style="margin-top:20px; padding-right:15px;">
								<img width="55px" height="55px"
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
				
			<!-- ///////////////////// �츮���ݸ���/���常�� Participant �� ///////////////////// -->
			
			<!-- ///////////////////// �ֱ������� ���� Participant & ȸ�� /////////////////////  -->
				
				<c:if test="${param.category ne 'B03'}">
					<div class="row" style="padding: 5px;">
						<button class="btn-bob">
							<c:set var="flag" value="true"/>
							<c:if test="${user.userId ne bob.writtenUserId}">
								<c:forEach var="participant" items="${participant}">
									<c:if test="${user.userId eq participant.userId}">����ϱ�
										<c:set var="flag" value="false" />
									</c:if>
								</c:forEach>
								<c:if test="${param.category eq 'B01' && flag}">��Ӻ� 1000������ �����ϱ�</c:if>
								<c:if test="${param.category eq 'B02' && flag}">���� �����ϱ�</c:if>
							</c:if>
							<c:if test="${user.userId eq bob.writtenUserId}">�����ϱ�</c:if>
						</button>
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
      
      <div class="row custumRow" style="margin-top:20px; padding-top:30px;">
      	<div class="text-center textBold" style="font-size: 20px;">ģ����� ��ȭ�� �������� :)</div>
        <hr>
        <c:if test="${empty comments}">
        	<div class="text-center" style="padding: 10px;">
        		��ϵ� ����� �����ϴ� T.T <br>ù��° ����� �޾ƺ�����!
        	</div>
        </c:if>
      	<c:forEach var="comment" items="${comments}">
      		<input type="hidden" name="commentId" value="${comment.commentId}" />
      		<div class="row comment" style="margin: 5px;">
	      		<div class="col-sm-2">
					<img width="60px" height="60px"
					style=" border-radius: 40px;
							-moz-border-radius: 40px;
							-khtml-border-radius: 40px;
							-webkit-border-radius: 40px;
							 box-shadow: 1px #cccccc;"
					src = "../resources/upload_files/images/${comment.userImage}"
					onerror="this.src='../resources/images/user-icon.png'" />
					${comment.userName}
				</div>
				<div class="col-sm-7">
					${comment.content}
				</div>
				<div class="col-sm-3" style="font-size: 13px; text-align: end;">
					<div style="padding-right: 50px;">
						<fmt:parseDate value="${comment.createdDate}" var="Date" pattern="yyyy-MM-dd hh:mm"/>
						<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� a hh:mm"/>
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
      			<input type="text" name="inputComment" class="form-control" placeholder="����� �Է����ּ���."/>       		
      		</div>
      		<div class="col-xs-3">
				<button type="submit" class="form-control">���</button>
			</div>
      	</div>

      </div>
      
      <!-- ///////////////////////////////// ��� �� /////////////////////////////////  -->
      
      <!-- ///////////////////////////////// �ı� ���� /////////////////////////////////  -->
      
      <c:if test="${param.category ne 'B03'}">
	      <div class="row custumRow" style="margin-top:20px;">
		      <div class="row">
		      	<div class="col-xs-9">
			      	<input type="text" class="form-control" style="width: 100%; height: 150px;"></input>
		      	</div>
		      	<div class="col-xs-3">
		      		<button type="submit" class="form-control">�ı� �ø���</button>
		      	</div>      	
	      	</div>
	
	      	<c:forEach var="i" begin="0" end="6" step="1">
	      		<div class="row">
	      			<div class="col-xs-12 text-center">�ı��ı�</div>
	      		</div>
	      	</c:forEach>
	      </div>
      
      </c:if>
      
	<!-- ///////////////////////////////// �ı� �� /////////////////////////////////  -->

      <!-- ȸ�� div ���� -->

	  <c:if test="${param.category eq 'B03'}">
	      <div class="row custumRow" style="margin-top:20px; padding-top: 30px;">
		    <div class="text-center textBold" style="font-size: 35px;">ȸ�� ���</div>
	      	<hr>
	      	
	      	<div class="row" style="padding: 10px;">
	      		<div class="col-xs-4 select-bob">�δ���</div>
	      		<div class="col-xs-4 select-bob">������</div>
	      		<div class="col-xs-4 select-bob active">�̹���</div>
	      	</div>
	      	
	      	<div class="row text-center textBold" style="padding-top:25px; padding-botton:30px;">
	      		�� ���� ȸ��� <fmt:formatNumber type="currency" value="${bob.fee}" pattern="###,###" />���Դϴ�.
	      	</div>
	      	
	      	<hr>
	
	      	<div class="row" style="padding: 0 20px 0 20px;">
	   			<c:forEach var="participant" items="${participant}">
	   				
					<div class="col-xs-4" align="left" style="margin-top:20px; padding-right:15px;">
						<img src = "../resources/upload_files/images/${participant.participantProfile}"
			      			onerror="this.src='../resources/images/user-icon.png'"
			      			width="55px" height="55px"
							style=" border-radius: 40px;
									-moz-border-radius: 40px;
									-khtml-border-radius: 40px;
									-webkit-border-radius: 40px;
									 box-shadow: 1px #cccccc;" />
						&nbsp;&nbsp;&nbsp;${participant.participantName}&nbsp;&nbsp;&nbsp;
						<c:if test="${participant.paidFee != 0}">
							<img width="55px" height="55px" src="/resources/images/checkmark.png" />
						</c:if>
					</div>
				</c:forEach>
			</div>
	      	
	      	<hr>
	      	
	      	<div class="row" align="right" style="margin-right:5px;">
	      		<button type="submit" class="btn-bob" style="width: 210px; height: 60px; line-height:60px;">���� �ٿ�ε�</button>
	      	</div>
	      </div>
      
      </c:if>
      <!-- /ȸ�� div �� -->

    </div><!-- /.container -->








	<!-- Modal --> 
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
               <div class="modal-content"> 
                    <div class="modal-header"> 
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                             <h4 class="modal-title" style="text-align: center;" id="myModalLabel">�� ģ�� �ʴ�</h4> 
                     </div> 
                     <div class="modal-body" align="center">
	                    <c:forEach var="i" begin="0" end="6" step="1">
	                        <div class="row" style="padding: 5px 10px 5px 10px;">
	                            <div class="input-group">
							      <span class="input-group-addon">
							        <input type="checkbox" aria-label="...">
							      </span>
							      <input type="text" class="form-control" style="width:400px;" value="ģ���̸�">
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
                    <div class="modal-header"> 
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                             <h4 class="modal-title" style="text-align: center;" id="myModalLabel">�����ϱ�</h4> 
                     </div> 
                     <div class="modal-body" align="center">
	                    ����� ������ �̳����� ��� ��Ҹ� �� �� �����ϴ�.<br>
	                    ������ �����Ͻðھ��?
                    </div>
                    <div align="center" class="modal-footer" style="text-align: center;">
                    	<button class="btn btn-default btn-ico" >�����ϱ�</button>
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
                    		<c:if test="${appointmentTime < (now - 7)}"><button class="btn btn-default btn-ico" >����ϱ�</button></c:if>
                    		<c:if test="${appointmentTime > (now - 7)}">����� �� �����T.T</c:if>
	                    </c:if>
                    </div>
               </div> 
        </div> 
	</div>

</body>
</html>