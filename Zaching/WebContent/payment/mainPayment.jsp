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
       		text-align: center;
       		height: 50px;
			line-height: 50px;
       		width: 200px;
       		text-decoration: none;
       	}

       	
    </style>
    
    <script type="text/javascript">
    
  		$(function() {
			$('.btn-bob:contains("����")').on('click', function() {
				$(self.location).attr("href","/payment/chargePoint");
			})
  		});

    </script>
    
</head>
<body>

		
	<div class="container" align="center">
		
		<div class="page-header" style="padding-top: 20px;">
		  <h1 style="font-weight: bold;">�� ����Ʈ ��ȸ</h1>
		</div>
		
		<div class="row text-center" style="padding-top:50px;">
			<h3>OOO���� �ܿ� ����Ʈ : 10,000 Point</h3><br>
			<h4>( ���ϸ��� : 1,000�� )</h4>
		</div>
		
		<div class="row" style="padding-top:50px;">
			
            <button class="btn-bob" style="margin: 10px;">���ϸ��� ��ȯ</button>
            <button class="btn-bob" style="margin: 10px;">����</button>
            <button class="btn-bob" style="margin: 10px;">��ȯ��û</button>
            
        </div>
        
        <div class="row" style="border: 1px solid #000">
        
        </div>

    </div><!-- /.container -->
</body>
</html>