<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        #icon{
        	cursor: pointer;
        }
        
        #imgInput{
        	cursor: pointer;
        }
    </style>
<script>
// 파일찾기
function fncProductFile()
{
 document.Form.txtProductFile.click();
 document.Form.txtProductFileName.value=document.Form.txtProductFile.value;
}
</script>

<title>Insert title here</title>
</head>
<body>
	
	<form name='Form' class="form-vertical">
		
			<div class="container">
				<div class="row">
					<table border="0">
						<tr>
						<td>
							<div class="form-group">
								<br/>
								<input type='file' name='txtProductFile' size="15" style='display:none'>
								
						   		
							   <input type="Text" style="display:none" name="txtProductFileName" class='input' readOnly>
							   <img width="200" style='cursor:hand' alt="파일찾기" src="/resources/images/imageButton.PNG" align="absMiddle" border="0" onclick="fncProductFile()" id="imgInput">
							</div>
							
					
					  <td width=700>
					  <p style="font-size: 30px; color: #00D1CD;"><i class="glyphicon glyphicon-map-marker" id="icon"></i></p>
						    	   <textarea class="form-control" rows="9" placeholder="상태 업데이트 하세요." class="span1" cols="40"></textarea>
						      <!--  <input type="text" class="form-control" id="statement" name="statement" placeholder="상태 업데이트 하세요."> -->
						   
						    </td>
					    </tr>
					</table>
					  
					 <table border="1">
					 <tr>
					 <td width="300">
						  <div class="form-group" align="left">
						   <strong>카테고리</strong> <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
						  </div>
					</td>
						  
					<td width="300">
						  <div class="form-group">
						    <strong>공개범위</strong> <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
						   </div>
					</td>
					</tr> 
					   </table>
				   </div>
			   </div>

		</form>
		
	
</body>
</html>