<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp"></a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	               <ul class="nav navbar-nav">
	                <li><a href="#">지역별 전월세 정보</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav">
	                <li><a href="#">주변편의시설검색</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav">
	                <li><a href="#">국내여행정보</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav">
	                <li><a href="#">이번달공채정보</a></li>
	            </ul>
	             
	            
		</div>
	    
	</div>
</div>
 	
   	
   	
   	<script type="text/javascript">
	
		
		 $(function() {
			 $("a:contains('판매상품등록')").on("click" , function() {
					self.location = "/product/addProductView.jsp"
					
				}); 
			 
			 $("a:contains('구매이력조회')").on("click" , function() {
					self.location = "/purchase/listPurchase"
					
				}); 
			 
			 $("a:contains('판매상품관리')").on("click" , function() {
					self.location = "/product/listProduct?menu=manage"
	
				}); 
			 
			 $("a:contains('상 품 검 색')").on("click" , function() {
				 
					self.location = "/product/listProduct?menu=search"
	
				}); 
		 });
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
						 
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	</script>  