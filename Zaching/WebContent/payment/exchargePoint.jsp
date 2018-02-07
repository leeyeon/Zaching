<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<style>
        
       	body {
       		padding-top: 50px;
       	}
 
       	.btn-bob {
       		background: #5F4B8B; 
       		border: none; 
       		display: inline-block;
       		color: rgb(255, 255, 255); 
       		font-size: 20px;
       		text-align: center;
       		height: 50px;
			line-height: 50px;
       		width: 200px;
       		text-decoration: none;
       	}

       	
    </style>
    
    <script type="text/javascript">
    
  		$(function() {
			$('body > div.container > div:nth-child(4) > div:nth-child(2) > div').on('click', function(){

				var windowW = 400;  // 창의 가로 길이
 		        var windowH = 500;  // 창의 세로 길이
 		        var left = Math.ceil((window.screen.width - windowW)/2);
 		        var top = Math.ceil((window.screen.height - windowH)/2);
	
				window.open("/", 
						"l top="+top+", left="+left+", height="+windowH+", width="+windowW);
				opener.location.reload(true);
			    self.close();
  			});
  		});

    </script>
    
</head>
<body>

		
	<div class="container" align="center">
		
		<div class="page-header" style="padding-bottom: 30px;">
		  <h1>포인트 반환 신청</h1>
		</div>
		
		
		<div class="row" style="padding-top:50px;">
			<label for="point" class="col-xs-4 control-label">
					충전할 금액
			</label>
			<div class="col-xs-8">
				<div class="input-group">
					<input type="text" class="form-control text-right" aria-describedby="basic-addon2" id="point" name="point" />
					<span class="input-group-addon" id="basic-addon2"> 
					/<fmt:formatNumber type="currency" value="${user.totalPoint}" pattern="###,###" />Point</span>
				</div>
			</div>
		</div>
		
		<div class="row text-right" style="padding: 10px 10px 20px 0; color:red;">
			* 5,000 Point 이상 출금이 가능합니다.
		</div>
		
		<div class="row">
		  <div class="col-xs-6">
		    <div class="input-group">
		      <span class="input-group-addon">
		        <input type="radio" name="account" checked>
		      </span>
		      <div class="form-control">기존계좌사용</div>
		    </div><!-- /input-group -->
		  </div><!-- /.col-lg-6 -->
		  <div class="col-xs-6">
		    <div class="input-group">
		      <span class="input-group-addon">
		        <input type="radio" name="account">
		      </span>
		      <div class="form-control">새로운계좌사용</div>
		    </div><!-- /input-group -->
		  </div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
		
		<div class="row" style="padding-top:50px;">
			<label for="name" class="col-xs-4 control-label">
					이름
			</label>
			<div class="col-xs-8">
				<input type="text" class="form-control" name="name" />
			</div>
		</div>
		
		<div class="row" style="padding-top:50px;">
			<label for="name" class="col-xs-4 control-label">
					은행명
			</label>
			<div class="col-xs-8">
				<input type="text" class="form-control" name="bankName" />
			</div>
		</div>
		
		<div class="row" style="padding-top:50px;">
			<label for="name" class="col-xs-4 control-label">
					계좌번호
			</label>
			<div class="col-xs-8">
				<input type="text" class="form-control" name="account" />
			</div>
		</div>				
		
        <div class="input-group" align="center" style="padding-top:50px;">
            <button type="submit" class="btn-bob" style="margin: 10px;">충전</button>
            <button type="reset" class="btn-bob" style="background: #ededed; color: #4d4d4d; margin: 10px;">취소</button>
        </div>

    </div><!-- /.container -->
</body>
</html>