<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/resources/layout/sub_toolbar.jsp"/>
	<style>
	 @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css); 
		
		*{font-family: 'Jeju Gothic';}
		
		body {
 		
        padding-top : 100px;
        }
        
        .profileImage{
        
        display: table; 
        margin-left: auto; 
        margin-right: auto;
        }
        
        hr {
    		margin-right: 30px;
    		margin-left: 30px;
    		margin-top: 20px;
    		margin-bottom: 20px;
    		border: 0;
    		border-top: 1px solid #eee;
		}
        
        li{list-style: none;}
        
        .bg {
			background: #f2b1d2;/*페이지 배경 컬러  */
			position: fixed;
			width: 100%;
			height: 100%;
			background-size: cover;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.3;
		}
        
        .info{
        background-color: #fff;
        padding-top: 30px;
        }
        #updateUser{
        	color: #fff;
   			background-color: #5f4b8b;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#updateUser" ).on("click" , function() {
					self.location = "/user/updateUser?userId=${user.userId}"
				});
		});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<div class="container">
	<div class="bg"></div>
	<div class="info">
		<div class="page-header" style="text-align: center;border-bottom-width: 1px;padding-bottom: 20px;">
			<c:if test="${user.role eq '1'}">
    		<h3 class="text">추가정보입력</h3>
    		<h5 class="text"> <strong class="text-danger">추가정보</strong>를입력해 주세요.</h5>
    		</c:if>
    		<c:if test="${user.role eq '2'}">
    		<h3 class="text">회원정보조회</h3>
    		<h5 class="text">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
    		</c:if>
	       
	       
	    </div>
		<ul>
		<li class="row" >
	  		<c:if test="${user.profileImage ne null }">
	  		<img alt="" src="../resources/upload_files/images/${user.profileImage }" class="profileImage"
	  			style="max-width: 100%; width: 180px; border-radius: 50%;"></c:if>
	  		<c:if test="${user.profileImage eq null }">
	  		<img alt="" src="../resources/upload_files/images/profile_default.png" class="profileImage"
	  			style="max-width: 100%; width: 180px; border-radius: 50%;"></c:if>
		</li><hr>
		
		
		<li class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</li><hr>
	
		<li class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-4">${user.name}</div>
		</li><hr>
	
		
		<li class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성 별</strong></div>
	  		<c:if test="${user.gender.trim() eq '1' }">&nbsp;남</c:if>
			<c:if test="${user.gender.trim() eq '2' }">&nbsp;여</c:if>
			
		</li><hr>

		<li class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주소</strong></div>
			<div class="col-xs-8 col-md-4">${user.address}</div>
		</li><hr>
		
		
		<li class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>연락처</strong></div>
	  		<div class="col-xs-8 col-md-4" >${ !empty user.phone ? user.phone : ''}</div>
		</li><hr>
	
		
		<li class="row">
	  		<div class="col-xs-4 col-md-2"><strong>생년월일</strong></div>
			<div class="col-xs-8 col-md-4">${ !empty user.birth ? user.birth : ''}</div>
		</li><hr>
		
		<li class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>계좌번호</strong></div>
			<div class="col-xs-8 col-md-4" >${ !empty user.accountNumber ? user.accountNumber : ''}</div>
		</li><hr>
	
		</ul>
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn" id="updateUser">회원정보수정</button>
	  		</div>
		</div>
		
		<br/>
		</div>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>