<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt" %>


<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript" src="../resources/javascript/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="../resources/javascript/moment.js"></script>
	<script type="text/javascript" src="../resources/javascript/moment-ko.js"></script>

	<style>
	
		.overlay {
			left: 0;
			top: 0;
			height: 65px;
			background-color: rgba(0,0,0, 0.6);
		}
		
		.thumbnail-top {
			position:absolute; 
			font-weight: bold; 
			font-size: 22px; 
			top:20px;
			z-index: 1; 
			color:#FFF; 
			text-shadow: 0 0 5px #000;
		}
		
	</style>

	<script type="text/javascript">
	
		$(function() {

			$(document).on("click",'.thumbnail > img', function(){
				if('${user}' != '') {
					var index = $(".thumbnail > img").index(this);	
					var bobId = $($("input[name=bobId]")[index]).val();
					var category = $($("input[name=category]")[index]).val();
					//alert(index+"//"+bobId+"//"+category);
					$(self.location).attr("href","/bob/getBob?category="+category+"&bobId="+bobId);
				} else {
					alert("�α��� �� ����Ͻ� �� �ֽ��ϴ�.\n"
							+ "����ȸ�������� ���ؼ� ���� �����ϰ� ���� ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�.");
					$('#loginModal').modal('toggle');
					//$(self.location).attr("href","/user/addUser");
				}				
			});
			
			$(document).on("click",".user_thumnail", function(){
				if('${user}' != '') {
					var index = $(".user_thumnail").index(this);
					var userId = $($("input[name=writtenUserId]")[index]).val();
					//alert(index+"//"+bobId+"//"+category);
					$(self.location).attr("href","/user/getTimeLine?userId="+userId);
				} else {
					alert("�α��� �Ŀ� ģ���� Ÿ�Ӷ����� ���� �� �ֽ��ϴ�.\n"
							+ "����ȸ�������� ���ؼ� ���� ���񽺸� �̿��غ�����.");
					$('#loginModal').modal('toggle');
					//$(self.location).attr("href","/user/addUser");
				}				
			});
			
			if($(".thumbnail-top").text().indexOf('���� ����') >= 0) {
				$(this).closest("div").closest("div").css({"background":"#000"});
				//alert();
			}
			
			/* ���ѽ�ũ�� */
			$("#loader").hide();

			var pageInfo = ${resultPage.currentPage};
			var totalCount = ${resultPage.totalCount};
			var pageSize = ${resultPage.pageSize};
	
			$(window).on("scroll", function() {
				if($(window).scrollTop() == ($(document).height() - $(window).height())) {
					if(totalCount >= (pageInfo*pageSize)) {
						dataLoading();
					}
				}
			});
			
			
			function dataLoading() {
				
				$("#loader").show();
				
				pageInfo++;
				
				// active �Ǿ� �ִ� category load...
				$.ajax({
					url : "/bob/rest/listBob",
					method : "POST",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({
						currentPage : pageInfo,
						searchKeyword: $(":text[name='searchKeyword']").val(),
						category : $("#exTab2 li.active > a").attr('data-target').substring(1)
					}),
					dataType : "json",
					success : function(serverData) {
						$(serverData.list).each(function(index,data) {
							
							console.log(data);
							var participantList = data.participantList;

							var appointmentTime = moment(data.appointmentTime).format("YYYYMMDDHHmm");
							var today = moment().format("YYYYMMDDHHmm");

							var html = '<input type="hidden" name="bobId" value="'+data.bobId+'">'
							+'<input type="hidden" name="category" value="'+data.category+'">'
							+'<input type="hidden" name="writtenUserId" value="'+data.writtenUserId+'">'
							+'<div class="col-sm-6 col-md-4 text-center">'
							+'<div class="thumbnail"><div class="thumbnail-top" style="left: 40px;">';
							
							if(data.status == 'Y' && (appointmentTime>today || data.appointmentTime == null)) {
								html += "���� ����</div>";
							} else if(data.status == 'E' || (appointmentTime<=today)) {
								html += '���� ����</div>';
							}
							
							if(data.status == 'Y') {
								html += '<div class="thumbnail-top" style="right: 40px;">'+participantList.length+"/"+data.limitNum+'��</div>'
							}
							
							html = html + '<img src = "../resources/upload_files/images/'+data.image+'" onerror="this.src=\'../resources/images/sample_bob_background.jpg\'"'
							+'style="cursor: pointer; width: 100%; height:270px; opacity: 0.8; box-shadow: 0 5px 15px -5px #666;"> <div class="user_thumnail" '
							+'style="background: url(\'../resources/upload_files/images/'+data.writtenUserProfile+'}\'),'
							+'url(\'../resources/images/user-icon.png\') center center no-repeat; background-size: cover; box-shadow: 1px #cccccc;"></div>'
							+'<div class="caption" style="position:relative; top:-20px; font-size: 20px;"><div style="font-size:20px; font-weight: bold;'
							+'text-overflow: ellipsis; overflow: hidden; white-space: nowrap; ">'+data.title+'</div>'
							+'<hr><p style="font-size: 17px;  font-weight: bold;">'+data.locationName+'<br></p>'
							+'<p style="font-size: 16px;">';
							
							if(data.appointmentTime != null) {								
								<c:if test="${empty sessionScope.user}">
									html += moment(data.appointmentTime).format("YYYY�� MM�� DD��");
								</c:if>
								<c:if test="${!empty sessionScope.user}">
									html += moment(data.appointmentTime).format("YYYY�� MM�� DD��")+" "+getInputDayLabel(data.appointmentTime)+" "
										+ moment(data.appointmentTime).format("HH:mm");
									
								</c:if>
							} else if(data.appointmentTime == '' || data.appointmentTime == null) {
								html += "��¥ ����";
							}
							
							html += '</p></div></div></div>';
							
							$('#'+"${search.category}"+' > div').append(html);
							$("#exTab2 > div > div.tab-content").attr('class', 'tab-content');
						})
						
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
				});
				
				$("#loader").hide();
			}
			
		});

		
		function getInputDayLabel(targetDate) { 
			var week = new Array('�Ͽ���', '������', 'ȭ����', '������', '�����', '�ݿ���', '�����'); 
			var today = new Date(targetDate).getDay(); 
			var todayLabel = week[today]; 
			return todayLabel; 
		}
	
	</script>

</head>
<body>

<div class="row">

		<c:if test="${empty list}">
			����� �����ϴ�. <br>
			�ϴ��� �游��⸦ ���� ģ���� ��������.
		</c:if>
	
		<jsp:useBean id="today" class="java.util.Date" />
		<fmt:formatDate var="today" value="${today}" pattern="yyyyMMddHHmm"/>
		
		<c:if test="${search.category eq 'B01'}">
			<c:forEach var="bob" items="${list}" varStatus="status">
			  <input type="hidden" name="bobId" value="${bob.bobId}">
			  <input type="hidden" name="category" value="${bob.category}">
			  <input type="hidden" name="writtenUserId" value="${bob.writtenUserId}">
			  <div class="col-sm-6 col-md-4 text-center">
			    <div class="thumbnail">
			    <div class="thumbnail-top" style="left: 40px;">
			    	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
					<fmt:formatDate value="${Date}" var="appointmentTime" pattern="yyyyMMddHHmm"/>
					<c:if test="${bob.status eq 'Y' && (appointmentTime>today || empty appointmentTime)}">
						���� ����
					</c:if>
					<c:if test="${bob.status eq 'E' || (appointmentTime<=today)}">
						���� ����
					</c:if>
			    </div>
			    <c:if test="${bob.status eq 'Y'}">
					<div class="thumbnail-top" style="right: 40px;">${fn:length(bob.participantList)}/${bob.limitNum} ��</div>
				</c:if>
			      <img src = "../resources/upload_files/images/${bob.image}"
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" 
			      	style="cursor: pointer; width: 100%; height:270px; opacity: 0.8; box-shadow: 0 5px 15px -5px #666;">
			      <div class="user_thumnail" 
			      	style="background: url('../resources/upload_files/images/${bob.writtenUserProfile}'),
			      		url('../resources/images/user-icon.png') center center no-repeat; background-size: cover;
			      			box-shadow: 1px #cccccc;"></div>
			      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
			      	<div style="font-size:20px; font-weight: bold; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${bob.title}</div>
			      	<hr>
			      	<p style="font-size: 17px;  font-weight: bold;">
			        	${bob.locationName}<br>
			        </p>
			        <p style="font-size: 16px;">
			        	<c:if test="${!empty bob.appointmentTime}">
				        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
				        	<c:if test="${empty sessionScope.user}">
				        		<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� E����"/>
				        	</c:if>
				        	<c:if test="${!empty sessionScope.user}">
				        		<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� E���� HH:mm"/>
				        	</c:if>
			        	</c:if>
			        	<c:if test="${empty bob.appointmentTime}">��¥ ����</c:if>
			        </p>
			      </div>
			    </div>
			  </div>
			</c:forEach>
		</c:if>

		<c:if test="${search.category eq 'B02' }">
			<c:forEach var="bob" items="${list}">
			  <input type="hidden" name="bobId" value="${bob.bobId}">
			  <input type="hidden" name="category" value="${bob.category}">
			  <input type="hidden" name="writtenUserId" value="${bob.writtenUserId}">
			  <div class="col-sm-6 col-md-4 text-center">
			    <div class="thumbnail">
			    	<div class="thumbnail-top" style="right: 40px;">${fn:length(bob.participantList)}�� ���� ��</div>
			      <img src = "../resources/upload_files/images/${bob.image}"
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" 
			      	style="cursor: pointer; height:250px; opacity: 0.8; box-shadow: 0 5px 15px -5px #666;">
			      <div class="user_thumnail" 
			      	style="background: url('../resources/upload_files/images/${bob.writtenUserProfile}'),
			      		url('../resources/images/user-icon.png') center center no-repeat; background-size: cover;
			      			box-shadow: 1px #cccccc;"></div>
			      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
			      	<div style="font-size:22px; font-weight: bold;">${bob.title}</div>
			      	<hr>
			      	<p style="font-size: 17px;  font-weight: bold;">
			        	${bob.locationName}<br>
			        </p>
			        <p style="font-size: 16px;">
			        	<c:if test="${!empty bob.appointmentTime}">
				        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
				        	<c:if test="${empty sessionScope.user}">
				        		<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� E����"/>
				        	</c:if>
				        	<c:if test="${!empty sessionScope.user}">
				        		<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� E���� HH:mm"/>
				        	</c:if>
			        	</c:if>
			        	<c:if test="${empty bob.appointmentTime}">��¥ ����</c:if>
			        </p>
			      </div>
			    </div>
			  </div>
			</c:forEach>
		</c:if>
		
		<c:if test="${search.category eq 'B03' }">
			<c:forEach var="bob" items="${list}">
			  <input type="hidden" name="bobId" value="${bob.bobId}">
			  <input type="hidden" name="category" value="${bob.category}">
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <img src = "../resources/upload_files/images/${bob.image}"
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" 
			      	style="cursor: pointer; height:250px; opacity: 0.8; box-shadow: 0 5px 15px -5px #666;">
				  <div class="caption text-center" style="font-size: 20px; font-weight: bold; position: absolute; top: 25%; z-index: 10; width: 100%; margin-left: -20px;">
			      	${bob.title}</div>
			      <hr>
			      <h4 style="padding:10px; font-weight: bold;">�����ϰ� �ִ� ģ�� (${fn:length(bob.participantList)}��)</h4>
			      <div class="row">
			      	<c:forEach var="participant" items="${bob.participantList}">
			      		<div class="col-sm-6 col-md-4 text-center">
							<img class="thumnail" src = "../resources/upload_files/images/${participant.participantProfile}" 
								onerror="this.src='../resources/images/user-icon.png'"/>
							<p style="font-size: 17px;">${participant.participantName}</p>
						</div>
					</c:forEach>
				  </div>
			    </div>
			  </div>
			</c:forEach>
		</c:if>
		
		<c:if test="${search.category eq 'B04' }">
			<c:if test="${!empty user}">
				<c:forEach var="bob" items="${list}">
				  <input type="hidden" name="bobId" value="${bob.bobId}">
				  <input type="hidden" name="category" value="${bob.category}">
				  <div class="col-sm-6 col-md-4 text-center">
				    <div class="thumbnail">
				      <c:if test="${bob.status eq 'Y'}">
						<div class="thumbnail-top" style="right: 40px;">${fn:length(bob.participantList)}/${bob.limitNum} ��</div>
					</c:if>
				      <img src = "../resources/upload_files/images/${bob.image}"
				      	onerror="this.src='../resources/images/sample_bob_background.jpg'" 
				      	style="cursor: pointer; height:250px; opacity: 0.8; box-shadow: 0 5px 15px -5px #666;">
				      <div class="user_thumnail" 
				      	style="background: url('../resources/upload_files/images/${bob.writtenUserProfile}'),
				      	url('../resources/images/user-icon.png') center center no-repeat; background-size: cover;
				      	box-shadow: 1px #cccccc;"></div>
				      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
				      	<div style="font-size:20px; font-weight: bold;">${bob.title}</div>
				      	<hr>
				        <p style="font-size: 17px;  font-weight: bold;">
			        		${bob.locationName}<br>
				        </p>
				        <p style="font-size: 16px;">
				        	<c:if test="${!empty bob.appointmentTime}">
					        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
					        	<c:if test="${empty sessionScope.user}">
					        		<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� E����"/>
					        	</c:if>
					        	<c:if test="${!empty sessionScope.user}">
					        		<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� E���� HH:mm"/>
					        	</c:if>
				        	</c:if>
				        	<c:if test="${empty bob.appointmentTime}">��¥ ����</c:if>
				        </p>
				      </div>
				    </div>
				  </div>
				</c:forEach>
			</c:if>
		</c:if>

		
		<c:if test="${search.category eq 'B05'}">
		
			<div class="col-sm-12 text-center" style="font-size: 25px; font-weight: bold; padding: 40px;">
				�� �˻� ��� : ${fn:length(list)} ��
			</div>

			<c:forEach var="bob" items="${list}" varStatus="status">
			  <input type="hidden" name="bobId" value="${bob.bobId}">
			  <input type="hidden" name="category" value="${bob.category}">
			  <input type="hidden" name="writtenUserId" value="${bob.writtenUserId}">
			  <div class="col-sm-6 col-md-4 text-center">
			    <div class="thumbnail">
			    <div class="thumbnail-top" style="left: 40px;">
			    	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
					<fmt:formatDate value="${Date}" var="appointmentTime" pattern="yyyyMMddHHmm"/>
					<c:if test="${bob.status eq 'Y' && (appointmentTime>today || empty appointmentTime)}">
						���� ����
					</c:if>
					<c:if test="${bob.status eq 'E' || (appointmentTime<=today)}">
						���� ����
					</c:if>
			    </div>
			    <c:if test="${bob.status eq 'Y'}">
					<div class="thumbnail-top" style="right: 40px;">${fn:length(bob.participantList)}/${bob.limitNum} ��</div>
				</c:if>
			      <img src = "../resources/upload_files/images/${bob.image}"
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" 
			      	style="cursor: pointer; width: 100%; height:270px; opacity: 0.8; box-shadow: 0 5px 15px -5px #666;">
			      <div class="user_thumnail" 
			      	style="background: url('../resources/upload_files/images/${bob.writtenUserProfile}'),
			      		url('../resources/images/user-icon.png') center center no-repeat; background-size: cover;
			      			box-shadow: 1px #cccccc;"></div>
			      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
			      	<div style="font-size:20px; font-weight: bold;">${bob.title}</div>
			      	<hr>
			      	<p style="font-size: 17px;  font-weight: bold;">
			        	${bob.locationName}<br>
			        </p>
			        <p style="font-size: 16px;">
			        	<c:if test="${!empty bob.appointmentTime}">
				        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
				        	<c:if test="${empty sessionScope.user}">
				        		<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� E����"/>
				        	</c:if>
				        	<c:if test="${!empty sessionScope.user}">
				        		<fmt:formatDate value="${Date}" pattern="yyyy�� MM�� dd�� E���� HH:mm"/>
				        	</c:if>
			        	</c:if>
			        	<c:if test="${empty bob.appointmentTime}">��¥ ����</c:if>
			        </p>
			      </div>
			    </div>
			  </div>
			</c:forEach>
		</c:if>

</div>

</body>
</html>