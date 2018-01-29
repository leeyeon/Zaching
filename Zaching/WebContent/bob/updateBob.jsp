<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>updateBob</title>
        
        <jsp:include page="../resources/layout/sub_toolbar.jsp"/>

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
        
        	body {
        		padding-top: 50px;
        	}
        
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
			<h3 class="text-info" style="color: #4d4d4d; font-weight: bold;">[${categoryName}] �� �����ϱ�</h3>
		</div>
    
		<form class="form-horizontal" enctype="multipart/form-data">
		    <div class="form-group">
		    	<input type="hidden" name="writtenUserId" value="9" />
		    	<input type="hidden" name="category" value="${param.category}" />
		    
		    	<div class="row">
		    		<div class="col-xs-2 btn-bob" >����</div>
	            	<div class="col-xs-10" align="center">
	            		<input type="text" name="title" class="form-control" placeholder="����" style="font-size: 16px;"/>
	            	</div>
		    	</div>
		    	<div class="row text-center" style="padding:5px;">
		    		<span class="col-sm-12" style="color: red;" >���ڼ��� 20�ڷ� ���ѵ˴ϴ�.</span>
		    	</div>
		    	
		    	<c:if test="${categoryName eq '�츮���ݸ���'}">
			    	<div class="row">
			    		<div class="col-xs-2 btn-bob" align="center">
			    			�����ο���
			    		</div>
		            	<div class="col-xs-10" align="center" >
					    	<select name="limitNum" class="selectpicker show-tick" title="���� �ο���">
					    	  <c:forEach var="i" begin="2" end="20" step="1">
					    	  	<option >${i}</option>
					    	  </c:forEach>
							</select>
		            	</div>
			    	</div>
			    	<div class="row text-right">
			    		<span class="col-sm-12" style="color: red; text-align: right;" >* �ο����� 20�� �����Դϴ�.</span>
			    	</div>
		    	</c:if>
		    	
	            <div class="row">
	            	<div class="col-xs-12">
	                	<textarea name="content" id="ckeditor"></textarea> 
	                </div>
	            </div>
	            
	            <div class="row">
	            	<div class="col-xs-2 btn-bob">��ǥ���� ����</div>
	            	<div class="col-xs-10" align="center" style="padding-top: 7px;">
	            		<input id="input-b1" name="uploadFile" type="file" class="file">
	            	</div>
		    	</div>
	            		    	
		    	<div class="row" style="margin-top: 5px;">
		    		<div class="col-xs-2 btn-bob">��ġ</div>
	            	<div class="col-xs-10" align="center">
	            		<input type="text" name="locationName" class="form-control" placeholder="��ġ" style="font-size: 16px;"/>
	            	</div>
		    	</div>
		    	
		    	<div class="row">
		    		<div class="col-xs-2 btn-bob">��¥</div>
	            	<div class="col-xs-10" align="center">
	            		<input type="date" name="appointmentTime" class="form-control" placeholder="��¥" style="font-size: 16px;"/>
	            	</div>
		    	</div>
				
	            <div class="row" align="center">
	                <button type="submit" class="btn-bob" style="margin: 10px;" >�� �����</button>
	                <button type="reset" class="btn-bob" style="background: #ededed; color: #4d4d4d; margin: 10px;">���</button>
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

