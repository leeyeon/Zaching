<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	User user = (User) request.getAttribute("user");
%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/resources/layout/sub_toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->







<style>
body {
	padding-top: 100px;
	
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "GET").attr("action", "/friend/listFriend")
				.submit();
	}


		//프로필 사진 클릭시 타임라인 이동
			$("friend_img").on("click", function() {
				self.location = "/user/getTimeLine?userId=${user.name}";

				//메세지함
				$("#listMessage").on("click", function() {
					self.location = "/message/listMessage";
				})

		});
	
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->

	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<div class="friendlistui">

		<div class="page-header text-info">
			<h3>친구목록조회</h3>
		</div>
			<div class="row">
			<c:forEach var="friend" items="${list}" varStatus="status">
					<div class="col-xs-6 col-md-4">
						<div>
							<c:if test="${!empty friend.profileImage }">
						<button type="button" class="btn btn-default" id="friendImage">
													<a href="/user/getTimeLine?userId=${friend.userId}"><img class="friend_img" style="width: 120px; height: 120px;" alt="" src="../resources/upload_files/images/${friend.profileImage}"></a>
													</button>
													</c:if>
													
													<c:if test="${empty friend.profileImage }">
													<button type="button" class="btn btn-default" id="friendImage">
													<a href="/user/getTimeLine?userId=${friend.userId}"><img class="friend_img" style="width: 120px; height: 120px;" alt="" src="../resources/images/profile_default.png"></a>
													</button>
													</c:if>
						</div>
						<input type="hidden" name="friendId" value="${friend.name}">
						<div class="col-xs-6 col-sm-4 ">${friend.name }</div>
						<div class="col-xs-6 col-sm-4 ">
							<div class="dropdown">
								<span> 친구 </span>
								<div class="dropdown-content">
									<ul>
										<li><a href="#">메세지</a></li>
										<li><a href="#">친구삭제</a></li>
										<li><a href="#">친구차단</a></li>
									</ul>
								</div>
							</div>

						</div>

					</div>
				</c:forEach>
			</div>
		</div>


		<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator.jsp" />
		<!-- PageNavigation End... -->
		<div class="container">
			<div class="page-header text-info">
				<h3>친구 추천</h3>
			</div>
			
			<div class="row">
				<c:forEach var="friend" items="${recommendList}" varStatus="status">

					<div class="col-xs-6 col-md-4">
						<div><c:if test="${!empty friend.profileImage }">
						<button type="button" class="btn btn-default" id="friendImage">
													<a href="/user/getTimeLine?userId=${friend.userId}"><img class="friend_img" style="width: 120px; height: 120px;" alt="" src="../resources/upload_files/images/${friend.profileImage}"></a>
													</button>
													</c:if>
													
													<c:if test="${empty friend.profileImage }">
													<button type="button" class="btn btn-default" id="friendImage">
													<a href="/user/getTimeLine?userId=${friend.userId}"><img class="friend_img" style="width: 120px; height: 120px;" alt="" src="../resources/images/profile_default.png"></a>
													</button>
													</c:if>
													
													
													
						</div>
						<input type="hidden" name="friendId" value="${friend.name}">
						<div class="col-xs-6 col-sm-4 ">${friend.name }</div>
						<div class="col-xs-6 col-sm-4 ">
							<div class="dropdown">
								<span> 친구 </span>
								<div class="dropdown-content">
									<ul>
										<li><a href="#">메세지</a></li>
										<li><a href="#">친구삭제</a></li>
										<li><a href="#">친구차단</a></li>
									</ul>
								</div>
							</div>

						</div>

					</div>
				</c:forEach>
			</div>
		</div>
		
		</div>
		

		




</body>

</html>