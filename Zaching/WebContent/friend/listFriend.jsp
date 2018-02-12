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
	padding-top: 80px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/friend/listFriend")
				.submit();
	}

	$(function() {
		$("td.ct_btn01:contains('검색')").on("click", function() {

			alert($("td.ct_btn01:contains('검색')").html());

			fncGetUserList(1);
		});
		//프로필 사진 클릭시 타임라인 이동
		$(function() {
			$("#btn").on("click", function() {
				self.location = "";

			});
		});
	});
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->

	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		

		<div class="row">
		
		<c:forEach var="friend" items="${list}" varStatus="status">

				<div class="col-md-4">
					<div>
						<button class="btn" id="btn" type="submit">
							<img class="btn-img" style="width: 120px; height: 120px;"
								src="../resources/upload_files/images/${friend.profileImage}">
						</button>
					</div>
					<div class="col-sm-4 ">${friend.name }</div>
					<div class="col-sm-4 ">
						<select name='fruits'>
							<option value='' selected>친구</option>
							<option value='message'>메세지</option>
							<option value='banana'>친구삭제</option>
							<option value='lemon'>친구차단</option>
						</select>
					</div>

				</div>
			</c:forEach>
		</div>
	</div>








</body>

</html>