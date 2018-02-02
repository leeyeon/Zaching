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

		$(function() {
			$("#image").on("click", function() {
				self.location = "/user/getUser?userId=${user.userId}";

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

		<div class="page-header text-info">
			<h3>친구목록조회</h3>
		</div>

		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>이름</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원ID</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">검색</button>

				</form>
			</div>



			<div class="row">
				<div style="width: 120px; height: 90px; overflow: hidden">
					<a href="#"> <img src="../resources/images/main@2x.png"
						style="width: 120px; height: auto;" alt="image"
						onclick="clickBtn();"></a>
				</div>

				<div class="col-xs-4 col-md-2 ">
					<strong>이 름</strong>
				</div>
				<div class="col-xs-8 col-md-4">"회원이름"${user.name}</div>
			</div>

			<hr />

			<div class="row">
				<div style="width: 120px; height: 90px; overflow: hidden">
					<a href="#"> <img
						src="../resources/images/200505031750520100_1.jpg"
						style="width: 120px; height: auto;" alt="유저이름${user.name}"
						onclick="clickBtn();"></a>
				</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>이름</strong>
				</div>
				<div class="col-xs-8 col-md-4">${user.name}</div>
			</div>

			<hr />

			<div class="row">
				<div style="width: 120px; height: 90px; overflow: hidden">
					<a href="#"> <img
						src="../resources/images/IqvbWykbrkHmV4Kj6xV9c8Di-4qA.png"
						style="width: 120px; height: auto;" alt="유저이름${user.name}"
						onclick="clickBtn();"></a>
				</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>이름</strong>
				</div>
				<div class="col-xs-8 col-md-4"></div>
			</div>

			<hr />

			<div class="row">
				<div style="width: 120px; height: 90px; overflow: hidden">
					<a href="#"> <img
						src="../resources/images/naver_com_20130311_080208.jpg"
						style="width: 120px; height: auto;" alt="유저이름${user.name}"
						onclick="clickBtn();"></a>
				</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>이름</strong>
				</div>
				<div class="col-xs-8 col-md-4">${user.name}</div>
			</div>

			<hr />

		</div>

		<br />

	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>