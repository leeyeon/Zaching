<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<title>����Ʈ����</title>
	
	<style>
        
       	body {
       		padding-top: 50px;
       	}
 
       	.btn-bob {
       		background: #5F4B8B; 
       		border: none; 
       		display: inline-block;
       		color: rgb(255, 255, 255); 
       		font-size: 20px; 
       		font-weight: bold;
       		text-align: center;
       		height: 50px;
			line-height: 50px;
       		width: 200px;
       		text-decoration: none;
       	}

       	
    </style>
    
    <script type="text/javascript">
    
  		$(function() {
  			$('button:contains("����")').on('click', function(){
  				$("form").attr("method", "POST").attr("action", "/payment/kakaoPay").submit();
  			});
  		});

    </script>
    
</head>
<body>

	<div class="container" align="center">
		
		<div class="page-header" style="padding: 100px;">
		  <h1>${user.name}�� ����Ʈ ������ �Ϸ�Ǿ����ϴ�.</h1>
		</div>
		
		<form class="form-horizontal" >
			<input type="hidden" name="userId" value="9" />
			<div class="row" style="padding-top:50px;">
				<div class="col-xs-5"><h3>�����Ͻ� �ݾ�</h3></div>
				<div class="col-xs-7">
					${approvedDate} �� ${point} Point �����Ǽ̽��ϴ�.
				</div>
			</div>
		</form>
    </div><!-- /.container -->
</body>
</html>