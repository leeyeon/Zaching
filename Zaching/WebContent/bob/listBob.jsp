<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<style>
	
		.overlay {
			left: 0;
			top: 0;
			height: 65px;
			background-color: rgba(0,0,0, 0.6);
		}
	
	</style>

	<script type="text/javascript">
	
		$(function() {
			
			
			$('div > img').on("click", function(){
				var index = $("div > img").index(this);
				
				var bobId = $($("input[name=bobId]")[index]).val();
				var category = $($("input[name=category]")[index]).val();
				//alert(index+"//"+bobId+"//"+category);
				$(self.location).attr("href","/bob/getBob?category="+category+"&bobId="+bobId);
			});
			
			var pageInfo = 1;
			var totalCount = ${resultPage.totalCount};
			var pageSize = ${search.pageSize};
			
			function dataLoading() {
				
				//$("#loader").show();
				
				pageInfo ++;

				$.ajax({
					url : "/bob/rest/listBob",
					method : "POST",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({
						currentPage : pageInfo,
						category : B03
					}),
					dataType : "json",
					success : function(serverData) {
						$(serverData.list).each(function(index,data) {
							
							alert(index);
							
							//$("#list").append(html);
						})
						
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
				});
				
				//$("#loader").hide();
			}
			
		});
	
	</script>

</head>
<body>

	<div class="row">
		<c:if test="${empty list}">
			목록이 없습니다. <br>
			방만들기를 통해 친구를 만들어보세요.
		</c:if>
		
		<c:if test="${search.category eq 'B01' }">
			<c:forEach var="bob" items="${list}">
			  <input type="hidden" name="bobId" value="${bob.bobId}">
			  <input type="hidden" name="category" value="${bob.category}">
			  <div class="col-sm-6 col-md-4 text-center">
			    <div class="thumbnail">
			      <div style="position:absolute; font-weight: bold; font-size: 22px; top:20px; right: 40px;">1/5 명</div>
			      <img src = "../resources/upload_files/images/${bob.image}"
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" style="cursor: pointer;">
			      
			      <div class="user_thumnail" style="background: url(../resources/images/sample_bob_background.jpg) center center no-repeat;"></div>
			      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
			      	<div style="font-size:20px; font-weight: bold;">${bob.title}</div>
			      	<hr>
			        <p>${bob.locationName} <br>
			        	<c:if test="${!empty bob.appointmentTime}">
				        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd hh:mm"/>
							<fmt:formatDate value="${Date}" pattern="yyyy년 MM월 dd일 hh시 mm분"/>
			        	</c:if>
			        	<c:if test="${empty bob.appointmentTime}">날짜 미정</c:if>
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
			  <div class="col-sm-6 col-md-4 text-center">
			    <div class="thumbnail">
			      <img src = "../resources/upload_files/images/${bob.image}"
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" style="cursor: pointer;">
			      
			      <div class="user_thumnail" style="background: url(../resources/images/sample_bob_background.jpg) center center no-repeat;"></div>
			      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
			      	<div style="font-size:20px; font-weight: bold;">${bob.title}</div>
			        <hr>
			        <p>${bob.locationName}<br>
			        	<c:if test="${!empty bob.appointmentTime}">
				        	<fmt:parseDate value="${bob.appointmentTime}" var="Date" pattern="yyyy-MM-dd hh:mm"/>
							<fmt:formatDate value="${Date}" pattern="yyyy년 MM월 dd일 hh시 mm분"/>
			        	</c:if>
			        	<c:if test="${empty bob.appointmentTime}">날짜 미정</c:if>
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
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" style="cursor: pointer;">
				  <div class="caption text-center" style="font-size: 20px; font-weight: bold; padding-top: 30px;">
			      	${bob.title}
			      </div>
			      <hr>
			      <h4 style="padding:10px; font-weight: bold;">참여하고 있는 친구 (${fn:length(bob.participantList)}명)</h4>
			      <div>
			      	<c:forEach var="participant" items="${bob.participantList}">
						<img class="thumnail" src = "../resources/upload_files/images/${participant.participantProfile}" 
							onerror="this.src='../resources/images/sample_bob_background.jpg'"/>
						${participant.participantName}
					</c:forEach>
				  </div>
			    </div>
			  </div>
			</c:forEach>
		</c:if>
		
	</div>

</body>
</html>