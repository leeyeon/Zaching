<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 80px;
        }
        
        button.btn.btn-emailAuth{
        	background-color: #5f4b8b;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		//============= "�̸��� ����"  Event ���� =============
		$(function () {
			
			$("#emailAuth").on("click", function() {
				fncEmailAuth();
				
			});
		});
			
			
			
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		
		
		///////////////////////////////////////////////////////////////////////
		function fncEmailAuth() {
			var email=$("input[name='email']").val();
			
			if(email == null || email.length <1){
				alert("�̸�����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			
			$("form").attr("method","POST").attr("action","/user/emailAuth").submit();
			alert("email");
			
			
		}
		
		
		////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
		
		<c:if test="${user.role.trim()=='2'}"> <!-- ��ȸ���ϰ�� -->
	       <h3 class=" text-info">����������</h3>
	       <h5 class="text-muted">ȸ������ <strong class="text-danger">��ȸ��</strong>�Դϴ�.</h5>
	    </c:if>
		
		<c:if test="${user.role.trim()=='1'}"> <!-- ��ȸ���ϰ�� -->
	       <h3 class=" text-info">�߰������Է�</h3>
	       <h5 class="text-muted">ȸ������ <strong class="text-danger">��ȸ��</strong>�Դϴ�.</h5>
	    </c:if>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		  
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="email" class="form-control" id="email" name="email" value="${user.email}" placeholder="�ߺ�Ȯ���ϼ���"  >
		       <span id="helpBlock" class="help-block">
		    
		      	<strong class="text-danger" name="userinput">�̸��� �������� ��¿���</strong>
		      </span>
		    </div>
		   
		    	<div class="col-sm-3">
		    		<button type="button" class="btn btn-emailAuth" id="emailAuth">�̸��� ����</button>
		    	</div>
		  </div>
		  
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="�����й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly="readonly">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="address" name="address"  value="${user.address}" placeholder="�����ּ�">
		    </div>
		  </div>
		  
		 
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>