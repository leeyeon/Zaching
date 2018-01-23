<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>A Simple Page with CKEditor</title>
        
        <jsp:include page="../resources/layout/toolbar.jsp"/>

        <!-- Make sure the path to CKEditor is correct. -->
        <script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
        
        <!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
		
		<!-- (Optional) Latest compiled and minified JavaScript translation files -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
		        
        <jsp:include page="../resources/javascript/fileUploadCDN.jsp"/>
        <script type='text/javascript'>

        	$(function() {
        		
        		$("input[type='text']").on('focus', function() {
        			$(this).addClass("focus");
        		})
        		
        		$("#addBob > div > div:nth-child(4) > div > div > div.input-group.file-caption-main > div.input-group-btn > button.btn.btn-default.btn-secondary.fileinput-upload.fileinput-upload-button > span")
        		.css("display", none);
        		
        	})
        
        </script>
        
        <style>
        
        	.btn-bob {
        		background: #5F4B8B; 
        		border: none; 
        		display: inline-block;
        		color: rgb(255, 255, 255); 
        		font-size: 15px; 
        		font-weight: bold;
        		text-align: center;
        		height: 50px;
				line-height: 50px;
        		width: 150px;
        		text-decoration: none;
        	}
        	
        	.row {
        		margin-bottom: 5px;
        	}
        	
			.form-style-1{
			    -webkit-transition: all 0.30s ease-in-out;
			    -moz-transition: all 0.30s ease-in-out;
			    -ms-transition: all 0.30s ease-in-out;
			    -o-transition: all 0.30s ease-in-out;
			    outline: none;
			    box-sizing: border-box;
			    -webkit-box-sizing: border-box;
			    -moz-box-sizing: border-box;
			    width: 100%;
			    height: 50px;
			    background: #fff;
			    margin-bottom: 5px;
			    border: 1px solid #ccc;
			    padding: 10px;
			    color: #555;
			    font: 95% Arial, Helvetica, sans-serif;
			}
			
			.text-info {
			    padding: 20px 0;
			    font-weight: 300;
			    text-align: center;
			    color: #fff;
			    margin: -16px -16px 16px -16px;
			}
			
			.focus {
			    box-shadow: 0 0 5px #43D1AF;
			    padding: 3%;
			    border: 1px solid #43D1AF;
			}
        
        </style>
        
    </head>
    <body>
    
    <div class="container">

    	<div class="page-header text-center">
			<h3 class="text-info" style="color: #4d4d4d; font-weight: bold;">[우리지금만나] 방만들기</h3>
		</div>
    
		<form class="form-horizontal" id="addBob" enctype="multipart/form-data">
		    <div class="form-group">
		    
		    	<div class="row">
		    		<div class="col-sm-2 btn-bob">제목</div>
	            	<div class="col-sm-10" align="center">
	            		<input type="text" class="form-style-1" placeholder="제목" style="font-size: 16px;"/>
	            	</div>
		    	</div>
		    	
		    	<div class="row">
		    		<div class="col-xs-3" align="center">
		    			제한인원수
		    		</div>
	            	<div class="col-xs-4" align="center" >
				    	<select class="selectpicker show-tick" title="제한 인원수">
				    	  <c:forEach var="i" begin="2" end="20" step="1">
				    	  	<option>${i}</option>
				    	  </c:forEach>
						</select>
	            	</div>
	            	<div class="col-sm-3" style="text-align: right;">
		    			<span style="color: red; text-align: right;" >* 인원수는 20명 제한입니다.</span>
		    		</div>
		    	</div>
		    	
	            <div class="row">
	            	<div class="col-xs-12">
	                	<textarea name="ckeditor" id="ckeditor"></textarea> 
	                </div>
	            </div>
	            
	            <div class="row">
	            	<div class="col-xs-10" align="center">
	            		<input id="input-b1" name="input-b1" type="file" class="file">
	            	</div>
		    	</div>
	            		    	
		    	<div class="row" style="margin-top: 5px;">
		    		<div class="col-xs-2 btn-bob">위치</div>
	            	<div class="col-xs-9" align="center">
	            		<input type="text" class="form-style-1" placeholder="위치" style="font-size: 16px;"/>
	            	</div>
		    	</div>
		    	
		    	<div class="row">
		    		<div class="col-xs-2 btn-bob">날짜</div>
	            	<div class="col-xs-9" align="center">
	            		<input type="text" class="form-style-1" placeholder="날짜" style="font-size: 16px;"/>
	            	</div>
		    	</div>
				
	            <div class="row" align="center">
	                <button type="submit" class="btn-bob" style="margin: 10px;">방 만들기</button>
	                <button type="reset" class="btn-bob" style="background: #ededed; color: #4d4d4d; margin: 10px;">취소</button>
	            </div>
		    </div>
		</form>
	 </div>
	        
    </body>
    
    <script>
         // Replace the <textarea id="editor1"> with a CKEditor
         // instance, using default configuration.
         CKEDITOR.replace('ckeditor',{
		      height: 300,
		      filebrowserUploadUrl: '${pageContext.request.contextPath}/test/ckeditorImageUpload'
		  } );
		         
         CKEDITOR.on('dialogDefinition', function( ev ){
             var dialogName = ev.data.name;
             var dialogDefinition = ev.data.definition;
           
             switch (dialogName) {
                 case 'image': //Image Properties dialog
                     //dialogDefinition.removeContents('info');
                     dialogDefinition.removeContents('Link');
                     dialogDefinition.removeContents('advanced');
                     break;
             }
         });

     </script>
</html>

