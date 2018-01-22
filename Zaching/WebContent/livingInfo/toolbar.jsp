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
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">����������ǰ</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">�̹��ް�ä�޷�</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">������������</a></li>
	            </ul>
	            
	              <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">�ֺ����ǽü��˻�</a></li>
	            </ul>
	  	
                 <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">����������������</a></li>
	            </ul>
	            
	  
	             
		</div>  
	    
	</div>
</div>
 	
   	
   	
   	<script type="text/javascript">
	
   
		
		 $(function() {
			 $("a:contains('�ֺ����ǽü��˻�')").on("click" , function() {
					self.location = "/livingInfo/getAroundSearch.jsp"
					
				}); 
			 
			 $("a:contains('����������������')").on("click" , function() {
					self.location = "/livingInfo/getRentCharge.jsp"
					
				}); 
			 
			 $("a:contains('����������ǰ')").on("click" , function() {
				 self.location = "/livingInfo/getEventInfo.jsp"
					
				}); 
			 
			 $("a:contains('�̹��ް�ä�޷�')").on("click" , function() {
				 self.location = "/livingInfo/getJobInfo.jsp"
	
				}); 
			 
			 $("a:contains('������������')").on("click" , function() {
				 
				 self.location = "/livingInfo/getTravel.jsp"
	
				}); 
		 });
		
		
	</script>  