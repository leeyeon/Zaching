<%@page import="com.zaching.service.domain.Friend"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


        
        <style>

        
        	body {
        		padding-top: 50px;
        	}
        
        
        </style>
        <script type="text/javascript">
        
        
		 </script>
</head>
<body>
<div class="container">
	
		
	
<h3>ģ�����</h3>

<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			     <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${! empty searchCondition.equals && searchCondition.equals==0 ? "selected" : "" }>�̸�</option>
						<option value="0" ${! empty searchCondition.equals && searchCondition.equals==0 ? "selected" : "" }>����</option>
					</select>
				  </div>
			    
				  
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword"></label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				 <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
</form></div></div>
</div>
		    
	
</body>
</html>