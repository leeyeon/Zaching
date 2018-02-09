<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<html>
<head>
	<meta charset="utf-8">
	
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	
	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-ko_KR.min.js"></script>
	        
	<jsp:include page="../resources/javascript/fileUploadCDN.jsp"/>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

	<link rel="stylesheet" href="../resources/css/bootstrap-datetimepicker.min.css">
	<script src="../resources/javascript/bootstrap-datetimepicker.min.js"></script>
	<script src="../resources/javascript/bootstrap-datetimepicker.ko.js"></script> 

	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  	
  	<style>
       body > div.container{
            margin-top: 10px;
        }
        .cover {
			background-color: #000;
			position: fixed;
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			z-index: 1500;
			opacity: 0.5;
			visibility: hidden;
		}
		
		.bg {
			background: url('../resources/images/bg_add_broads.jpg') no-repeat center center;
			position: fixed;
			width: 100%;
			height: 100%;
			background-size: cover;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.3;
		}
		
		.jumbotron {
		    margin-bottom: 0px;
		    margin-top:50px;
		    padding-top: 150px;
		    height: 400px;
		    background: transparent;
		}
		 .btn-broad {
		    background: #585858;
		    border: none;
		    color: rgb(255, 255, 255);
		    font-size: 15px;
		    font-weight: bold;
		    text-align: center;
		    height: 50px;
		    line-height: 50px;
		    text-decoration: none;
		}
    </style>
    
	<script type='text/javascript'>
  
function fncAddBroadcast(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value; 
	
	var name = $("input[name='title']").val();
	var detail = $("input[name='detail']").val();

	if(name == null || name.length<1){
		alert("제목은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상세정보는 반드시 입력하여야 합니다.");
		return;
	}

	//document.detailForm.action='/addProduct.do';
	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
	
	$("form").attr("method","POST").attr("action","/broadcast/addBroadcast").submit();
}
	
	$(function() {
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 fncAddBroadcast();
		});
	});	
	
	$(function() {
		
		
		$('input[name=addBroadcast]').on('click', function(){
			fncAddBroadcast()
		});
		
		$(".button:contains('취소')").on("click", function() {
			$("form")[0].reset();
		});
	});		
	
	function makeToast(title) {
		$('#toastMessage').text(title).fadeIn(400).delay(3000).fadeOut(400);
	}
	
	
</script>
</head>
<body>

	<div class="cover"></div>
	<div class="bg"></div>
			<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="jumbotron text-center" style= "background-image: url('../resources/images/bg_add_broads.jpg');
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center;">
			
	</div>
	
	<div class="container">
	
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data" style="background: #FFF; padding: 40px;">
		    <div class="form-group">
		    	<div class="row">
	            	<div class="col-sm-12 text-center" style="margin: 30px 0 30px 0;" >
	            		<input type="text" name="title" placeholder="제목" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"/>
	            	</div>
		    	</div>
		  	</div>
		  	
		  	<div class="form-group">
		    	<div class="row">
	            	<div class="col-sm-12 text-center" style="margin: 30px 0 30px 0;" >
	            		<input type="text" name="detail" placeholder="상세정보" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"/>
	            	</div>
		    	</div>
		  	</div>  	
		 
		  <div class="row" style="margin: 10px;">
	            	<div class="col-sm-3 btn-broad">대표사진 설정</div>
	            	
	            	<div class="col-sm-9" align="center" >
	            		<input id="input-b1" name="image" type="file" class="file" style="width:80%;"/>
	            	</div>
		 </div>  
		  
		  <div class="row" >
	            	<div class="col-sm-3 btn-broad" >금지어</div>
	            	
	            	<div class="col-sm-9">
	            		<input id="forbidden" name="forbidden" type="text" class="text" style="font-size: 20px; width: 15%; "/>
	            	</div>
		 </div>

		  
		  
		  
		  <div class="row" align="center">
		    <input type="button" name="addBroadcast" class="btn-broad" style="margin: 10px; width:250px;" value="방 만들기" >
	                <button class="btn-broad" style="background: #ededed; color: #4d4d4d; margin: 10px; width:250px;">취소</button>
		   </div> 	  
		</form>
		<!-- form Start /////////////////////////////////////-->		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	<div id="toastMessage" class='toastMessage' style='display:none'>Toast</div>
</body>

</html>