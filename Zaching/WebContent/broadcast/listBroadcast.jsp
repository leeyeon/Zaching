<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	
	<script type="text/javascript" src="../resources/javascript/masonry.pkgd.min.js"></script>
	
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	<style>
	  .overlay {
			left: 0;
			top: 0;
			height: 65px;
			background-color: rgba(0,0,0, 0.6);
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {			 
			 
			 $('.thumbnail > img').on("click", function(){
				 alert();
					var index = $(".thumbnail > img").index(this);	
					var broadcaster = $($("input[name=broadcaster]")[index]).val();
					var title = $($("input[name=title]")[index]).val();
					var detail = $($("input[name=detail]")[index]).val();
					//alert(index+"//"+bobId+"//"+category);
					$(self.location).attr("href","http://127.0.0.1:9001?broadcaster="+broadcaster+"&title="+title);
				});
			 
		 });	
		 
	</script>
</head>

<body>	
		<div class="text-center">
	       <h3>자췽 방송</h3>
	    </div>
	    
	    <div class="container">
	    <ul class="nav nav-tabs tabs-up">
	    <li class="pull-right">
			<input type="text" name="searchKeyword" class="form-control" placeholder="검색 내용을 입력하세요." 
      			style="width: 360px; height:45px;"/>
	    </li>
	      		</ul>
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    	<c:forEach var="obj" items="${list}" varStatus="status">
			  <input type="hidden" name ="broadcaster" value ="${obj.broadcaster}">
			  <input type="hidden" name ="title" value ="${obj.title}">
			  <div class="col-sm-6 col-md-4 text-center">
			    <div class="thumbnail">
			      <div style="position:absolute; font-weight: bold; font-size: 22px; top:20px; right: 40px;  z-index: 10;">구현중</div>
			       <img src = "../resources/upload_files/images/${obj.image}"
			      	onerror="this.src='../resources/images/sample_bob_background.jpg'" 
			      	style="cursor: pointer; height:250px; opacity: 0.8; box-shadow: 0 5px 15px -5px #666;"> 
			      <div class="user_thumnail" 
			      	style="background: url('../resources/upload_files/images/${obj.image}'),
			      		url('../resources/images/user-icon.png') center center no-repeat; background-size: cover;
			      			box-shadow: 1px #cccccc;"></div>
			      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
			      	<div style="font-size:20px; font-weight: bold;">${obj.title}</div>
			      	<hr>
			        <p style="text-align:left">[BJ] ${obj.broadcaster}<br>
						&nbsp;&nbsp;&nbsp;${obj.detail} <br>
			        </p>
			      </div>
			    </div>
			  </div>
			</c:forEach>
	    	</div>
	    	
		</div>
</body>

</html>