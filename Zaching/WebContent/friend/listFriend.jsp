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
<link rel="stylesheet" type="text/css" href="../resources/css/friendCss/reset.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/friendCss/main_responsive.css">
    <script type="text/javascript" src="../resources/javascript/friendJs/jquery.js"></script>
    <script type="text/javascript" src="../resources/javascript/friendJs/main.js"></script>

	 <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <!-- Load css styles -->
       <link rel="stylesheet" type="text/css" href="../resources/css/friendCss/bootstrap-responsive.css" />
       <link rel="stylesheet" type="text/css" href="../resources/css/friendCss/style.css" />

<style>
body {
	padding-top: 100px;
	
}
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

* {
	font-family: 'Hanna', serif;
}


body > div.container > section > div > div > div.ficon > a > img{
	width: 81px;
    height: 81px;
    border-radius: 150px
}
.zoom{
	transition: transform .2s;
}

.zoom:hover {
    transform: scale(1.5); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}

.languagepicker {
	background-color: white;
	display: inline-block;
	padding: 0;
	height: 40px;
	overflow: hidden;
	transition: all .3s ease;
	margin: 0 50px 10px 0;
	vertical-align: top;
	float: left;
}

.languagepicker:hover {
	/* don't forget the 1px border */
	height: 81px;
}

.languagepicker a{
	color: #000;
	text-decoration: none;
}

.languagepicker li {
	display: block;
	padding: 0px 20px;
	line-height: 40px;
	border-top: 1px solid #EEE;
}

.languagepicker li:hover{
	background-color: #EEE;
}

.languagepicker a:first-child li {
	border: none;
	background: #181A1C !important;
	color: white;
}

.languagepicker li img {
	margin-right: 5px;
}

.roundborders {
	border-radius: 5px;
}

.large:hover {
	/* 
	don't forget the 1px border!
	The first language is 40px heigh, 
	the others are 41px
	*/
	height: 245px;
}

body > section > section > h3:after {
  content: "";
  display: block;
  width: 100px;
  border-bottom: 1px solid #181A1C;
  
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
		<section class="features" style="padding-bottom:80px;">
			<section class="cta" style="padding-top:0; padding-bottom: 20px; border-bottom:1px solid #181A1C;">
		<div class="title">
                    <h1 style="color: #181A1C;">${user.name}님의 친구들</h1>
                    <!-- Section's title goes here -->
                  
                    <!--Simple description for section goes here. -->
                </div>
		</section>
		<div class="wrapper" style="padding-top: 40px;">
			<c:forEach var="friend" items="${list}" varStatus="status">
				<div class="feature">
					<div class="ficon"><a href="/user/getTimeLine?userId=${friend.userId}">
					<c:if test="${!empty friend.profileImage }">
						<img src="../resources/upload_files/images/${friend.profileImage}" alt="" class="zoom">
					</c:if>
					<c:if test="${empty friend.profileImage }">
						<img src="../resources/images/profile_default.png" alt="" class="zoom">
					</c:if></a>
					</div>
					<div class="details_exp">
						<h3>${friend.name}</h3>
						<p>${friend.createdDate}에 친구가 되었어요.</p>
						<ul class="languagepicker roundborders">
							<a href="#nl"><li>친구</li></a>
							<a href="#nl"><li>친구 끊기</li></a>
						    <a href="#nl"><li>유저 차단</li></a>
						</ul>
											</div>
										</div>
			</c:forEach>
			</div>

	</section><!--  End Features  -->

</div>
	<div class="section primary-section" id="service">
            <div class="container">
                <!-- Start title section -->
                <div class="title">
                    <h1>친구 추천</h1>
                    <!-- Section's title goes here -->
                    <p>혹시 아시는 분이신가요??</p>
                    <!--Simple description for section goes here. -->
                </div>
                
                <div class="row-fluid">
                	<c:forEach var="friend" items="${recommendList}" varStatus="status">
                	
                		<div class="span4" style="margin-left: 0;">
	                        <div class="centered service">
	                            <div class="circle-border zoom-in">
	                            	<a href="/user/getTimeLine?userId=${friend.userId}">
	                            	<c:if test="${!empty friend.profileImage }">
	                                	<img class="img-circle" src="../resources/upload_files/images/${friend.profileImage}" alt="service 1">
	                                </c:if>
	                                <c:if test="${empty friend.profileImage }">
	                                	<img class="img-circle" src="../resources/images/profile_default.png" alt="service 1">
	                                </c:if></a>
	                            </div>
	                            <h3>${friend.name}</h3>
	                            <p>We Create Modern And Clean Theme For Your Business Company.</p>
	                        </div>
	                    </div>
                    
                	</c:forEach>
                    
                </div>
            </div>
        </div>
		




</body>

</html>