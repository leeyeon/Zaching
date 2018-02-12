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
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	
	<style>
        
       	body {
       		padding-top: 150px;
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
       	
       	     	
       	.modal {
		  overflow: inherit;
		  overflow-y: inherit;
		  text-align: center;
		  padding: 0;
		}
		
		.modal:before {
		  content: '';
		  display: inline-block;
		  height: 100%;
		  vertical-align: middle;
		  margin-right: -4px;
		}
		
		.modal-dialog {
		  max-width: 600px;
		  padding: 0;
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}
		
		.modal-content {
		
		  border: 0;
		  border-radius: 0;
		
		}
		
		.modal-header {
		  border: 0;
		  padding 0;
		  position: relative;
		}
		
		.modal-header .close {
		  margin: 0;
		  position: absolute;
		  top: -10px;
		  right: -10px;
		  width: 23px;
		  height: 23px;
		  border-radius: 23px;
		  background-color: #00aeef;
		  color: #ffe300;
		  font-size: 9px;
		  opacity: 1;
		  z-index: 10;
		}
		
		.modal-content p {
		  padding: 0 20px;
		}
		
		.modal-body {
			padding: 0 0 10px 0;
			height: 300px;
		}
		.topnav a {
		  float: left;
		  display: block;
		  color: black;
		  text-align: center;
		  padding: 14px 16px;
		  text-decoration: none;
		  font-size: 15px;
		}
		
		.topnav a:hover {
		  background-color: #ddd;
		  color: black;
		}
		
		.topnav a.active {
		  background-color: #5F4B8B;
		  color: white;
		}
		
		.topnav .search-container {
		  float: right;
		}
		
		.topnav input[type=text] {
		  padding: 6px;
		  margin-top: 8px;
		  font-size: 15px;
		  border: none;
		  width: 300px;
		  color : #000000;
		}
		
		.topnav .search-container button {
		  padding: 6px 10px;
		  margin-top: 8px;
		  margin-right: 16px;
		  font-size: 15px;
		  border: none;
		  cursor: pointer;
		}
		
		.topnav .search-container button:hover {
		  background: #ccc;
		}
		
		.active {
			display: block;
		}

       	
    </style>
    
    <script type="text/javascript">
    
  		$(function() {
			$('#newAccount').on('click', function(){

				var windowW = 500;  // 창의 가로 길이
 		        var windowH = 800;  // 창의 세로 길이
 		        var left = Math.ceil((window.screen.width - windowW)/2);
 		        var top = Math.ceil((window.screen.height - windowH)/2);
	
				window.open("/payment/newAccount", "popup",
						"l top="+top+", left="+left+", height="+windowH+", width="+windowW
						+"scrollbars=no");
				
				$("#accountForm").attr("target", "popup")
					.attr("method", "POST").attr("action", "/payment/newAccount").submit();
				
				opener.location.reload(true);
			    self.close();
  			});
			
			$("input[name=point]").on('keyup', function() {
				$(this).val($(this).val().replace(/[^0-9]/g,""));
				
				if($(this).val().charAt(0) == 0) {
					$(this).val("");
				}
				
			});
			
			$("input[name=point]").on({'focusout': function() {
				if($(this).val() == "") {
					$("#pointCheck").show();
					$("#pointCheck").text("* 5,000 Point 이상 출금이 가능합니다.");
				}
				
				if($(this).val() > ${user.totalPoint}) {
					$(this).val(${user.totalPoint});
					$("#pointCheck").show();
					$(this).css("background", "#ff8c8c");
					$("#pointCheck").text("* 가지고 계신 Point 까지만 출금이 가능합니다.");
				}
				
				if($(this).val() < 5000) {
					$("#pointCheck").show();
					$(this).css("background", "#ff8c8c");
					$("#pointCheck").text("* 5,000 Point 이상 출금이 가능합니다.");
				}
				},
				'focusin' : function() {
					$(this).css("background", "#FFF");
					$("#pointCheck").hide();

				}
			});
			
  		});

    </script>
    
</head>
<body>

		
	<div class="container" align="center">
		
		<div class="row" style="border: 1px solid #000; padding:10px; background-color: #FFF;">
		
			<div class="page-header" style="padding-bottom: 30px;">
			  <h1 style="font-weight: bold;">포인트 반환 신청</h1>
			</div>
			
			<div class="col-xs-1" data-toggle="modal" data-target="#exchargePoint">신고</div>
		
			<div class="row" style="padding-top:50px;">
				<label for="point" class="col-xs-4 control-label">
						충전할 금액
				</label>
				<div class="col-xs-8">
					<div class="input-group">
						<input type="text" class="form-control text-right" aria-describedby="basic-addon2" id="point" name="point" />
						<span class="input-group-addon" id="basic-addon2" style="background: #FFF;"> 
						<fmt:formatNumber type="currency" value="${user.totalPoint}" pattern="###,###" />Point</span>
					</div>
				</div>
			</div>
			
			<div id="pointCheck" class="row text-right" style="padding: 10px 10px 20px 0; color:red; display: none;">
				* 5,000 Point 이상 출금이 가능합니다.
			</div>
			
			<div class="row" style="padding-top:50px;">
			  <div class="col-xs-6">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <input type="radio" name="account" checked>
			      </span>
			      <div class="form-control">기존계좌사용</div>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			  <div class="col-xs-6">
			    <div class="input-group" id="newAccount">
			      <span class="input-group-addon">
			        <input type="radio" name="account">
			      </span>
			      <div class="form-control">새로운계좌사용</div>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			
			홍길동 / 8801011 / 1234567890123450
			
			<form id="accountForm" >
				<div class="row" style="padding-top:50px;">
					<label for="name" class="col-xs-4 control-label">
							이름
					</label>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="name" value="${user.realName}" />
					</div>
				</div>
				
				<div class="row" style="padding-top:50px;">
					<label for="name" class="col-xs-4 control-label">
							은행명
					</label>
					<div class="col-xs-8">
						은행이름
					</div>
				</div>
				
				<div class="row" style="padding-top:50px;">
					<label for="name" class="col-xs-4 control-label">
							생년월일+한자리 (ex) 9402082
					</label>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="accountHolderinfo" value="0"/>
					</div>
				</div>
				
				<div class="row" style="padding-top:50px;">
					<label for="name" class="col-xs-4 control-label">
							계좌번호
					</label>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="accountNum" value="${user.accountNumber}" />
					</div>
				</div>
			
			</form>				
			</div><!-- /.row -->		
			
	        <div class="input-group" align="center" style="padding-top:50px;">
	            <button type="submit" class="btn-bob" style="margin: 10px;">충전</button>
	            <button type="reset" class="btn-bob" style="background: #ededed; color: #4d4d4d; margin: 10px;">취소</button>
	        </div>
        
        </div>

    </div><!-- /.container -->
    
	<div class="modal fade" id="exchargePoint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title text-center" id="myModalLabel"><b>새로운 계좌 사용</b></h4>
	        <hr>
	      </div>
		      <div class="modal-body text-center"> 
		      		등록할 계좌정보를 입력해주세요.
			    <form id="accountForm" >
					<div class="row" style="padding-top:40px;">
						<label for="name" class="col-xs-4 control-label">
								이름
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" name="name" value="${user.realName}" />
						</div>
					</div>
					
					<div class="row" style="padding-top:20px;">
						<label for="name" class="col-xs-4 control-label">
								은행명
						</label>
						<div class="col-xs-7">
							${bank}
							<select name="limitNum" class="selectpicker show-tick" title="제한 인원수"  >
					    	  <c:forEach var="i" begin="2" end="20" step="1">
					    	  	<option >${i}</option>
					    	  </c:forEach>
							</select>
						</div>
					</div>
					
					<div class="row" style="padding-top:20px;">
						<label for="name" class="col-xs-4 control-label">
								생년월일+한자리 (ex) 9402082
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" name="accountHolderinfo" value=""/>
						</div>
					</div>
					
					<div class="row" style="padding-top:20px;">
						<label for="name" class="col-xs-4 control-label">
								계좌번호
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" name="accountNum" value="${user.accountNumber}" />
						</div>
					</div>
				
				</form>	
		      </div>
		      <div class="modal-footer">
		      <div class="search-container text-center" align="center" style="margin: 0 auto;">
		      	 <a href="#" id="exchargePoint"><img src="../resources/images/payment_icon_yellow_medium.png" ></a>
		      </div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>