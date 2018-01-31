<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>방송하기</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="../javascript/calendar.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
<script type="text/javascript">

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
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "a[href='#' ]" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			 history.go(-1);
		});
	});	


	// 
</script>
</head>

<body>

	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>

	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	
   	<div class="container">

	<h1 class="bg-primary text-center">	
	라이브 방송
	</h1>

	<!-- form Start /////////////////////////////////////-->
	<form name = "detailForm"class="form-horizontal" >
	
	<div class="form-group">
	<label for="title" class="col-sm-offset-1 col-sm-3 control-label">방송 제목 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="title" name="title" placeholder="상품명을 입력하세요">
		       <span id="helpBlock" class="help-block">
		       <strong class="text-danger">제목을 반드시 입력하세요.</strong>
		      </span>
		    </div>
		 </div>
		
	<div class="form-group">    
	<label for="detail" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="detail" name="detail" placeholder="상세정보를 입력하세요">
		      <span id="helpBlock" class="help-block">
		      <strong class="text-danger">상세 정보를 입력하세요.</strong>
		      </span>
		    </div>
		 </div>

	<div class="form-group">    
	<label for="image" class="col-sm-offset-1 col-sm-3 control-label">대표 사진</label>
		    <div class="col-sm-4">
		       <input type="text" class="btn btn-info"  name="fileName">
		      <span id="helpBlock" class="help-block">
		      <strong class="text-danger">대표사진을  등록하세요.</strong>
		      </span>
			</div>
	</div>
	
		
	<div class="form-group">    
	<label for="forbidden" class="col-sm-offset-1 col-sm-3 control-label">금 지 어 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="forbidden" name="forbidden" >
		      <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		 </div>
		 
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등록</button>
			  <a class="btn btn-primary" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>	 
	</form>
	</div>
</body>
</html>