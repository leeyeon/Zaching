<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/resources/layout/sub_toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	
            margin-top: 130px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	

	
	//==>"ȸ������" Event ó�� �� ����
	
	$("#checkEmail").focus();
	
	$(function() {
			
		 $( "#signUp" ).on("click" , function() {
				alert("ȸ������ ��ưŬ��");
			 	fncAddUser();
				alert("fncAddUser() �Ϸ�");
			});
		});	
	//�̸������� �˻� �ʿ�!!
		
		function fncAddUser() {
			
			var email = $("#checkEmail").val();
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			var name = $("#userName").val();
			
			
			if(email == null || email.length <1){
				alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <4){
				alert("�н������  3�ڸ� �̻� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw2 == null || pw2.length <4){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw2 ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("#pw2").focus();
				return;
			}
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
			
			
		//==>"���?" Event ó�� �� ����	
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		//�̸��� �ߺ�üũ
			$(function() {
				  $('#checkbtn').on('click', function(){
			        	alert("��ưŬ��!");
			        	fncCheckSingup();
				});
			});
			
		function fncCheckSingup(){
			 var checkEmail = $("#checkEmail").val();
			 alert(checkEmail);
			 
		      
		            $.ajax({
		            	url: "/user/rest/checkSingup",
		            	method:"POST",
						contentType :'application/json',
						data : JSON.stringify({
							"checkEmail" : checkEmail
						
						}),
						async : false,
						dataType : "json",
		                success: function(data){
		                	console.log(data);
		                    if(data == true){
		                    	console.log("������ ��==> "+data);
		                        $('#checkMsg').html('<p style="color:blue">��밡��</p>');
		                    }
		                    else{
		                        $('#checkMsg').html('<p style="color:red">���Ұ���</p>');
		                        $("form")[0].reset();
		                    }
		                }
		            
		            
		            });    //end ajax    
		            //end on    
		    }

	</script>		
    
</head>

<body>

	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		    	<c:if test="${sessionScope.user.snsType  ne null }">
		      		<input type="text" class="form-control" id="checkEmail" name="email" value="${sessionScope.user.email}">
		      		<div id="checkMsg"></div>
		      		<button type="button" id="checkbtn" class="btn btn-default">�ߺ�Ȯ��</button>
		      	</c:if>
		      	
		      	<c:if test="${sessionScope.user.snsType  eq null }">
		      		<input type="text" class="form-control" id="checkEmail" name="email"  >
		      		<div id="checkMsg"></div>
		      		<button type="button" id="checkbtn" class="btn btn-default">�ߺ�Ȯ��</button>
		      	</c:if>
		      
		      
   			
		    
		    </div>
		   
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" name="password" id="pw" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" name="password2" id="pw2"placeholder="��й�ȣ Ȯ��" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="name" id="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="signUp" >�� &nbsp;��</button>
			  <a class="btn btn-primary cancelbtn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>