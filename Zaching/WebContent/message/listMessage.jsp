<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


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
        		padding-top: 50px;
        	}
        
        
        </style>
        
</head>
<body>

	<div class="container">
	
	<br>
	<br>
	
<div class="page-header text-info">
	       <h3>硫��몄� 紐⑸�</h3>
	    </div>
	    <div class="row">
	    
	    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��泥�  ${resultPage.totalCount } 嫄댁��, ���� ${resultPage.currentPage}  ���댁�
		    	</p>
		    </div>
		    
		     <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">蹂대�몄�щ��</th>
            <th align="left">硫��몄��댁��</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 硫��몄���蹂� ����">${message.userId}</td>
			  <td align="left">${message.name}</td>
			  <td align="left">${message.content}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${message.userId}"></i>
			  	<input type="hidden" value="${message.userId}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ��硫닿뎄�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<%-- <jsp:include page="../common/pageNavigator_new.jsp"/> --%>
	<!-- PageNavigation End... -->

</body>
</html>

