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
			background-color: #D4F4FA;
		}
		.cover {
			background-color: #000;
			position: fixed;
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			z-index: 1500;
			opacity: 0.5;
			visibility: hidden;
		}
		
		.bg {
			position: fixed;
			width: 100%;
			height: 100%;
			background-size: cover;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.3;
		}
		
		.jumbotron {
		    margin-bottom: 0px;
		    padding-top: 150px;
		    height: 500px;
		    background: transparent;
		}
		
		#footer {
		   position:fixed;
		   left:0px;
		   bottom:-10px;
		   width:100%;
				}
		
		.btn-add-broads {
       		border: 1px solid #FFFFF;
			border-radius: 70px;
			-moz-border-radius: 70px;
			-khtml-border-radius: 70px;
			-webkit-border-radius: 70px;
			 background: #585858;
			 width: 100px;
			 height: 100px;
			 line-height: 100px;
			 font-size: 17px;
			 float:right;
			 margin-right: auto;
			 cursor: pointer;
			 color: rgb(255, 255, 255);
			 box-shadow: 0 5px 15px -5px #666;
       	}		
		
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// 
     	$(self.location).attr("href","http://192.168.0.31:3000/broadcast?title="+title);
     	-->
	<script type="text/javascript">
	
		 $(function() {			 
			 
			 $('.thumbnail > img').on("click", function(){
				 alert();
					var index = $(".thumbnail > img").index(this);	
					var broadcaster = $($("input[name=broadcaster]")[index]).val();
					var title = $($("input[name=title]")[index]).val();
					var detail = $($("input[name=detail]")[index]).val();
			
					window.open("http://192.168.0.31:3000/broadcast?title="+title, title, "width=1800, height=950, toolbar=no, location=no, menubar=no, scrollbars=no, resizable=yes")
				});	
		 });
	
		function openWin(){  
		    window.open("http://192.168.0.31:8080/broadcast/addBroadcast.jsp", "broadcast-add", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		}
			
		$(function(){
			 $(document).on('click','.btn-add-broads', function(){
				 alert("방만들러 가즈아~");
				 openWin();
				 //$(self.location).attr("href","/broadcast/addBroadcast");
			 });
		 });
		 
	</script>
</head>

<body>	
		<div class="cover"></div>
		<div class="bg">
			
		</div>
		<div class="jumbotron text-center" style="background-image: url('../resources/images/broadcast-bg.png');
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center;">
			
			<form id="searchForm">
			<div class="row" style="margin: 10px; padding:290px 200px;">
				<div class="col-xs-12">
					<input type="text" class="form-control" name="searchKeyword" placeholder="검색 내용을 입력하세요." 
					style="height:45px; font-size: 16px; padding: 10px; outline:none; border:none;"/>
					
		      	</div>
	      	</div>
      	</form>

		</div>
	    
	    <div class="container">
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    	<c:forEach var="obj" items="${list}" varStatus="status">
			  <input type="hidden" name ="broadcaster" value ="${obj.broadcaster}">
			  <input type="hidden" name ="title" value ="${obj.title}">
			  <div class="col-sm-6 col-md-4 text-center">
			    <div class="thumbnail">
			      <div style="position:absolute; font-weight: bold; font-size: 22px; top:20px; right: 40px;  z-index: 10;"></div>
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
	    	
	    		<!-- 방만들기 버튼 시작 -->
	
		   	<div id="footer" align="right" style="z-index: 1500;">
		   	  <div class="container">
			  	<div class="btn-add-broads text-center">방 만들기</div>
			  	<div class="dialog-add-broads text-center">
			  		
			  	</div>
			  </div>
			</div>
	
	<!--  방만들기 버튼 끝 -->
	    	
		</div>
</body>

</html>