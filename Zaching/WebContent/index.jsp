<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="./resources/layout/toolbar.jsp"/>
	
	<style>
	
		body{
		    padding-top: 50px;
		}
		
		@media (max-width: 1217px) {
		  body {
		    margin-top: 0px;
		  }
	
	</style>

</head>
<body>


	<div class="container">

		<jsp:include page="/newsfeed/newsfeed.jsp" />

	</div>
	
	<!-- Modal -->
  <div  id="loginModal"  class="modal fade"  role="dialog" >
  
  <div class="modal-dialog">
    
  <!-- Modal content-->
      <div class="modal-content">
      
      <!-- Modal Header start-->
       <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <div class="modal-title"><!-- 자췽로고 -->
          <img src="/resources/images/temp_logo.png" class="img-logo" width="50" height="50" ></div> 
       </div> 
       <!-- Modal Header end --> 
       
       
       
       <!-- Modal Body start-->
       <div class="modal-body" align="center">
       	
       	<div class="row">
          <div class="col-xs-4">
           	<label for="inputlg" style="margin-left: 5px">이메일(ID)</label>
          </div>
        </div>
        
        
         <div class="row">
           <div class="col-sm-6">
   			<input type="text" class="form-control input-lg" id="email"  name="email"
				placeholder="이메일을입력하세요"	style="margin-left: 5px"/>
   			
           </div>
         </div>
         
         <div class="row">
           <div class="col-sm-6">
           	<label for="inputlg" style="margin-left: 5px" 
           	style="margin-top: 5px">패스워드(PW)</label>
           </div>
         </div>
       
       
         <div class="row">
           <div class="col-sm-6">
   			 <input class="form-control input-lg" id="password" type="password" name="password"
   				value="" style="margin-left: 5px">
           </div>
		</div>
		
		
		<div class="row">
              <div class="social-login">
   			 	<img src="/resources/images/KakaoTalk_lcon.png" class="img-rounded" width="50" height="50" >
   			 	<img src="/resources/images/facebook_Icon.png" class="img-rounded" width="50" height="50" >
   			 	<img src="/resources/images/Naver_Icon.png"  class="img-rounded" width="50" height="50" />
   			 	<img src="/resources/images/Google_Icon.jpg" class="img-rounded" width="50" height="50" >
             </div>  
        </div>
      </div><!--Modal Body  -->
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      
     </div><!-- Modal content-->
    </div> <!-- Modal dialog -->  
   </div> <!-- Modal Fade  --> 


  
</body>
</html>