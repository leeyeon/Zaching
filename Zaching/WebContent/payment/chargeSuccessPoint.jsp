<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
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
  			
  			setTimeout(function(){
  				window.opener.location.replace('/payment/mainPayment');
  				window.close();
  			},5000);
  			
  			$('button:contains("Ȯ��")').on('click', function() {
  				window.opener.location.replace('/payment/mainPayment');
  				window.close();
  			});

  		});

    </script>
    
</head>
<body>

	<div class="container" align="center">
		
		<div class="page-header" style="padding: 10px;">
		  <h3>${user.name}</h3>��<br>
		  ����Ʈ ������ �Ϸ�Ǿ����ϴ�.
		</div>
		
		<input type="hidden" name="userId" value="9" />
		<div class="row" style="padding-top:30px;">
			<div class="col-xs-5">�����Ͻ� �ݾ�</div>
			<div class="col-xs-7">
				${point} Point
			</div>
		</div>
		<div class="row" style="padding-top:50px;">
			<div class="col-xs-5">������ ��¥</div>
			<div class="col-xs-7">
				${approvedDate}
			</div>
		</div>
		<div class="row" style="padding-top:50px;">
			<button>Ȯ��</button>
		</div>
    </div><!-- /.container -->
</body>
</html>