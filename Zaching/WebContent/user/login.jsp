<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
            margin-top: 10px;
        }
        
       .jumbotron h1 {
    		color: #5F4B8B;
		} 
		
		.jumbotron label{
			color: #5F4B8B;
		}
		.jumbotron{
			background-color: rgba(228, 200, 226, 1);
		}
		
		.btn-login {
              background: #5F4B8B; 
              border: none; 
              display: inline-block; 
              cursor: pointer; 
              color:rgba(255, 255, 255, 1); 
        }  
		.kakao{
			
			background-color: #b64b56;
		}
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	 
	$( function() {
		
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#userId").focus();
		
		//==>"Login"  Event ����
		$("button").on("click" , function() {

			var id=$("input:text").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID �� �Է����� �����̽��ϴ�.');
				$("input:text").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('�н����带 �Է����� �����̽��ϴ�.');
				$("input:password").focus();
				return;
			}
			
			////////////////////////////////////////////////// �߰� , ����� �κ� ////////////////////////////////////////////////////////////
			$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			/* $.ajax( 
					{
						url : "/user/json/login",
						method : "POST" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							userId : id,
							password : pw
						}),
						success : function(JSONData , status) {

							//Debug...
							console.log("JSONData : \n "+JSONData);
							console.log(status);
							console.log( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
							console.log(JSONData != null);
							
							//alert(status);
							//alert("JSONData : \n"+JSONData);
							//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
							//alert( JSONData != null );
							
							if( JSONData != null ){
								//[���1]
							//	$(window.parent.document.location).attr("href","/index.jsp");
								
								//[���2]
							//	window.parent.document.location.reload();
								
								//[���3]
								$(window.parent.frames["topFrame"].document.location).attr("href","/layout/top.jsp");
								$(window.parent.frames["leftFrame"].document.location).attr("href","/layout/left.jsp");
								$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId="+JSONData.userId);
								
								//==> ��� 1 , 2 , 3 ��� ����
							}
						}
				});  */				
		});
	});
	
	
	//============= ȸ��������ȭ���̵� =============
	$( function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#']").on("click" , function() {
			self.location = "/user/addUser"
		});
		
		//kakao�α��� ��ư
		$("#kakaologin").on("click", function() {
			self.location = "https://kauth.kakao.com/oauth/authorize?client_id=dfe2041581c23da0c4e9c8aefb3c28a1&redirect_uri=http://127.0.0.1:8080/kakaologin&response_type=code";
		});
		
		//�н����� ã��
		$("buttond.btn.btn-password").on("click" , function() {
			popWin 
			= window.open("/user/findPassword.jsp",
										"popWin", 
										"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
										"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		});
		
	});

  
	</script>		
	
</head>

<body>
	 
	
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">JungEun's SHOP</a>
   		</div>
   	</div>

	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
			
	   	 	
	 	 	<div class="col-md-6">
	 	 
				<div class="jumbotron">	

		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>
						
			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-login">�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-login" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
						    </div>
						     <div class="col-sm-offset-7 col-sm-6 text-center">
						     <button type="button" class="btn btn-password">�н�����ã��</button>
							</div>     
					  </div>
						
					<div class="col-sm-offset-3 col-sm-7 text-center">
						<img id="kakaologin" src="../user/kakao_login_btn_medium.png" class="img">
					  </div>
						
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>