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
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">편의점행사상품</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">이번달공채달력</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">국내여행정보</a></li>
	            </ul>
	            
	              <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">주변편의시설검색</a></li>
	            </ul>
	  	
                 <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">지역별전월세정보</a></li>
	            </ul>
	            
	  
	             
		</div>  
	    
	</div>
</div>
 	
   	
   	
   	<script type="text/javascript">
	
   
		
		 $(function() {
			 $("a:contains('주변편의시설검색')").on("click" , function() {
					self.location = "/livingInfo/getAroundSearch.jsp"
					
				}); 
			 
			 $("a:contains('지역별전월세정보')").on("click" , function() {
					self.location = "/livingInfo/getRentCharge.jsp"
					
				}); 
			 
			 $("a:contains('편의점행사상품')").on("click" , function() {
				 self.location = "/livingInfo/getEventInfo.jsp"
					
				}); 
			 
			 $("a:contains('이번달공채달력')").on("click" , function() {
				 self.location = "/livingInfo/getJobInfo.jsp"
	
				}); 
			 
			 $("a:contains('국내여행정보')").on("click" , function() {
				 
				 self.location = "/livingInfo/getTravel.jsp"
	
				}); 
		 });
		
		
	</script>  