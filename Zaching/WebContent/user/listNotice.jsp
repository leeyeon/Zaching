<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">                  
<link rel="stylesheet" href="../resources/css/templatemo-style.css">
<script type="text/javascript">
	function dbClickEvent(category, roomId){
		alert("fdsafa");
	}
	$(function(){
		
		$("section").dblclick(function(){
			
			
			var noticeId = $($("input:hidden[name='noticeId']")[$(this).index()-2]).val();
			
			alert(noticeId);

			$.ajax({
				url : "/notice/rest/noticeUpdate",
				method : "POST",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
					"noticeId" : noticeId
				}),
				async : false,
				dataType : "text",
				success : function(serverData) {
					alert("fdasf");
					
						$($("section")[$(this).index()]).css("background-color", "white");
						
						if(category.charAt(0) == 'B'){
							
							self.location = "/bob/getBob?bobId="+roomId+"&category="+category;
						}
						
						if(category.charAt(0) == 'F'){
							
							self.location = "/user/getTimeLine?userId="+senderId;
						}
						
						if(category.charAt(0) == 'N'){
							
							self.location = "/newsfeed/getNewsfeed?newsfeedId="+roomId;
						}
					},
				error : function(error){
					alert("진슈");
				}
					
				})
			
		})
	})
	
</script>
<style>
	#tm-section-1 > div {
    margin-top: 50px;
    }
    
   .tm-2-col-img-text {
	    padding-bottom: 0;
	    padding-top: 0;
	}
	
	a #profile{
			width: 60px;
			height: 60px;
			border-radius: 150px;
		}
div.col-xs-6.col-sm-12.col-md-12.col-lg-3.col-xl-3.tm-2-col-img{
    width: 15%;
}

h2{
font-size: 20px;
}

.noread{
color:#f00;
}
</style>
</head>
<body>
	<div class="row" >
                <div class="container">
                <br/><br/>
                	<c:set var="i" value="0" />
						<c:forEach var="notice" items="${list}">
							<c:set var="i" value="${ i+1 }" />		
							<c:if test="${notice.status == ''}"><section class="tm-2-col-img-text" ></c:if>
								<c:if test="${notice.status != ''}"><section class="tm-2-col-img-text"></c:if>						
                    			<input type="hidden" name="category" value="${notice.category}">
                    			<input type="hidden" name="roomId" value="${notice.bobId}">
                    			<input type="hidden" name="senderId" value="${notice.senderId}">
                    			<input type="hidden" name="noticeId" value="${notice.noticeId}">
		                        <div class="col-xs-6 col-sm-12 col-md-12 col-lg-3 col-xl-3 tm-2-col-img" style="font-size: 20px;">                                
		                       		<a href="/user/getTimeLine?userId=${notice.senderId}" style="font-size: 20px;"><img src="../resources/upload_files/images/${notice.profileImage}" id="profile"> ${notice.name}</a>
		                        </div>
		
		                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9 col-xl-9 tm-2-col-text">
		                            <h2 class="tm-2-col-text-title"><c:if test="${fn:contains(notice.category, 'B')}">밥친구 추천해요!</c:if>
		                            <c:if test="${fn:contains(notice.category, 'F')}">친구 신청이 왔어요!</c:if>
		                            <c:if test="${fn:contains(notice.category, 'N')}">친구가 새로운 게시글을 올렸어요!</c:if></h2>

		                            <p class="tm-2-col-text-description">
		                                <c:if test="${fn:contains(notice.category, 'B')}">${notice.name} 님과 밥 한 끼 어떠세요? </c:if>
		                            <c:if test="${fn:contains(notice.category, 'F')}">${notice.name} 님으로부터 친구 요청이 들어왔어요. &nbsp;<a href="#">수락</a>&nbsp;<a href="#">거절</a></c:if>
		                            <c:if test="${fn:contains(notice.category, 'N')}">${notice.name} 님이 새로운 게시글을 올렸어요!</c:if> 
		                            </p>
		                            <c:if test="${notice.status == ''}"><section class="noread" >안읽음</c:if>
								<c:if test="${notice.status != ''}"><section class="read">읽음</c:if>						
                    		
		                        </div>
                        
                   			 </section>
						</c:forEach>
                    
                </div>                

            </div>
</body>
</html>