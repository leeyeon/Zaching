<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
        
        </head>
        <body>
        <div class="container">
        </div>
          <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-login btn-lg" 
    data-toggle="modal" data-target="#myModal">메세지 보내기</button>
        
          <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
  
    <div class="modal-dialog modal-center">
    
  <!-- Modal content-->
      <div class="modal-content">
      
      
       
       
              <div class="modal-body">
       	
       	<div class="row email">
          <div class="col-xs-4">
           	<label for="inputlg" style="margin-left: 5px">받는사람</label>
           	
           	<div class="row login">
           <div class="col-sm-3">
   			<input class="form-control input-lg" id="email" type="text" name="email"
   			style="margin-left: 5px">
   			
   			 <div class="row">
           <div class="col-sm-6">
           	<label for="inputlg" style="margin-left: 5px" 
           	style="margin-top: 5px">메세지내용</label>
           </div>
         </div>
   			
   			
   			<textarea class="form-control" rows="8"></textarea>
           	
           	</div></div></div></div></div></div></div></div>
</body>
</html>





















