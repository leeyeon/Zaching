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
	             
	               <ul class="nav navbar-nav">
	                <li><a href="#">������ ������ ����</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav">
	                <li><a href="#">�ֺ����ǽü��˻�</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav">
	                <li><a href="#">������������</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav">
	                <li><a href="#">�̹��ް�ä����</a></li>
	            </ul>
	             
	            
		</div>
	    
	</div>
</div>
 	
   	
   	
   	<script type="text/javascript">
	
		
		 $(function() {
			 $("a:contains('�ǸŻ�ǰ���')").on("click" , function() {
					self.location = "/product/addProductView.jsp"
					
				}); 
			 
			 $("a:contains('�����̷���ȸ')").on("click" , function() {
					self.location = "/purchase/listPurchase"
					
				}); 
			 
			 $("a:contains('�ǸŻ�ǰ����')").on("click" , function() {
					self.location = "/product/listProduct?menu=manage"
	
				}); 
			 
			 $("a:contains('�� ǰ �� ��')").on("click" , function() {
				 
					self.location = "/product/listProduct?menu=search"
	
				}); 
		 });
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
						 
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	</script>  