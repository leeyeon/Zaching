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
		
		.user_thumnail {
			background: black;
		}
		
		.wrapper {
   			max-width: 1200px;
   		}
		
		.listings ul.properties_list li{
		    border: 1px solid #f2f1f1;
		}
		
		.listings ul li .property_details {
			width: 100%;
		}
		
		.listings ul li:hover .property_details {
		    border-bottom: 1px solid #f77e7e;
		    border-left: 1px solid #f77e7e;
		    border-right: 1px solid #f77e7e;
		}

		.listings ul li:hover img {
		    border-top: 1px solid #f77e7e;
		    border-left: 1px solid #f77e7e;
		    border-right: 1px solid #f77e7e;
		}
		
	</style>

	<script type="text/javascript">
	
		$(function() {

			$(document).on("click",'.listings .properties_list li > img', function(){
				if('${user}' != '') {
					var index = $(".listings .properties_list li > img").index(this);	
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
							+'<li>'
							+'<img src = "../resources/upload_files/images/'+data.image+'" onerror="this.src=\'../resources/images/sample_bob_background.jpg\'"'
							+'style="cursor: pointer; width: 100%; height:270px; opacity: 0.8;">';
							
							<c:if test="${search.category ne 'B03'}">
								html = html + '<div class="user_thumnail" '
								+'style="background: url(\'../resources/upload_files/images/'+data.writtenUserProfile+'}\'),'
								+'url(\'../resources/images/user-icon.png\') center center no-repeat; background-size: cover; box-shadow: 1px #cccccc;"></div>';
							</c:if>
							
							if(data.status == 'Y' && (appointmentTime>today || data.appointmentTime == null)) {
								html += '<span class="price">���� ����</span>';
							} else if(data.status == 'E' || (appointmentTime<=today)) {
								html += '<span class="price">���� ����</span>';
							}
							
							if(data.status == 'Y') {
								html += '<span class="price" style="left:auto; right:10px;">';
								<c:if test="${search.category eq 'B01'}">
									html += participantList.length+"/"+data.limitNum+" ��";
								</c:if>
								<c:if test="${search.category eq 'B02'}">
									html += participantList.length +"�� ���� ��";
								</c:if>
								html += '</span>';
							}
							
							html = html + '<div class="property_details text-center" style="padding-top: '
								+"${search.category ne 'B03'? '40px':'none'}"
								+'"><h1>'+data.title+'</h1><hr>';
							
							<c:if test="${search.category ne 'B03'}">
								html += '<h2>'+data.locationName+'</h2><h2>';
								if(data.appointmentTime != null) {								
									<c:if test="${empty sessionScope.user}">
										html += moment(data.appointmentTime).format("YYYY�� MM�� DD��");
									</c:if>
									<c:if test="${!empty sessionScope.user}">
										html += moment(data.appointmentTime).format("YYYY�� MM�� DD��")+" "+getInputDayLabel(data.appointmentTime)+" ";
									</c:if>
								} else if(data.appointmentTime == '' || data.appointmentTime == null) {
									html += "��¥ ����";
								}
							</c:if>
							
							html += "</h2>";
							
							<c:if test="${search.category eq 'B03'}">
								html += '<h1 class="text-left">�����ϰ� �ִ� ģ�� ('+participantList.length+'��)</h1><div class="row">';
								
								for(int i=0; i<participantList.length; i++) {
									html += '<div class="col-sm-6 col-md-4 text-center">'
										+'<img class="thumnail" src = "../resources/upload_files/images/'+participantList.get(i).participantProfile+'"'
										+'onerror="this.src=\'../resources/images/user-icon.png\'"/>'
										+'<p style="font-size: 17px;">'+participantList.get(i).participantName+'</p></div>';
								}
							</c:if>
							
							html += '</div></li>';
							
							$("ul.properties_list").append(html);
							$("#exTab2 > div > div.tab-content").attr('class', 'tab-content');
							
						});
						
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

<c:if test="${empty list}">
	����� �����ϴ�. <br>
	�ϴ��� �游��⸦ ���� ģ���� ��������.
</c:if>

<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate var="today" value="${today}" pattern="yyyyMMddHHmm"/>

<c:if test="${search.category eq 'B04'}">
	<div class="text-center" style="padding: 40px;">
			${user.name}���� ��� ��ô� 
			<span style="font-size: 22px; font-weight: bold; ">${user.address}</span> ��ó�� ���� �� 
			<span style="font-size: 22px; font-weight: bold; ">${fn:length(list)}</span> ���� ������ �˻��Ǿ����ϴ�.
	</div>
	
	
</c:if>

<c:if test="${search.category eq 'B05'}">
	<div class="text-center" style="font-size: 25px; font-weight: bold; padding: 40px;">
			�� �˻� ��� : ${fn:length(list)} ��
	</div>
</c:if>
		
<section class="listings">
	<div class="wrapper">
		<ul class="properties_list">
			<c:forEach var="bob" items="${list}" varStatus="status">
			  <input type="hidden" name="bobId" value="${bob.bobId}">
			  <input type="hidden" name="category" value="${bob.category}">
			  <input type="hidden" name="writtenUserId" value="${bob.writtenUserId}">
				<li>
					<img src = "../resources/upload_files/images/${bob.image}"
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" 
			      	style="cursor: pointer; width: 100%; height:270px; opacity: 0.8;">
			      	<c:if test="${search.category ne 'B03'}">
				      	<div class="user_thumnail" 
				      	style="background: url('../resources/upload_files/images/${bob.writtenUserProfile}'),
				      		url('../resources/images/user-icon.png') center center no-repeat; background-size: cover;
				      			box-shadow: 1px #cccccc;"></div>
			      	</c:if>
					<span class="price">
						<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
						<fmt:formatDate value="${Date}" var="appointmentTime" pattern="yyyyMMddHHmm"/>
						<c:if test="${bob.status eq 'Y' && (appointmentTime>today || empty appointmentTime)}">
							���� ����
						</c:if>
						<c:if test="${bob.status eq 'E' || (appointmentTime<=today)}">
							���� ����
						</c:if>
					</span>
					<c:if test="${bob.status eq 'Y'}">
						<span class="price" style="left:auto; right:10px;">
							<c:if test="${search.category eq 'B01'}">
								${fn:length(bob.participantList)}/${bob.limitNum} ��
								
							</c:if>
							<c:if test="${search.category eq 'B02'}">
								${fn:length(bob.participantList)}�� ���� ��
							</c:if>
						</span>
					</c:if>
					
					<div class="property_details text-center" style="padding-top: ${search.category ne 'B03'? '40px':'none'}">
						<h1>${bob.title}</h1><hr>
						<c:if test="${search.category ne 'B03'}">
							<h2>${bob.locationName}</h2>
							<h2>
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
							</h2>
						</c:if>
						<c:if test="${search.category eq 'B03'}">
							<h1 class="text-left">�����ϰ� �ִ� ģ�� (${fn:length(bob.participantList)}��)</h1>
							<div class="row">
					      	<c:forEach var="participant" items="${bob.participantList}">
					      		<div class="col-sm-6 col-md-4 text-center">
									<img class="thumnail" src = "../resources/upload_files/images/${participant.participantProfile}" 
										onerror="this.src='../resources/images/user-icon.png'"/>
									<p style="font-size: 17px;">${participant.participantName}</p>
								</div>
							</c:forEach>
						  </div>
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</section>

</body>
</html>