<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	
	<title>포인트충전</title>
	
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
		  max-width: 500px;
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
		    height: 180px;
		    overflow: auto;
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

       	
    </style>
    
    <script type="text/javascript">
    
  		$(function() {
			//$('.btn-bob:contains("충전")').on('click', function() {
			//	$(self.location).attr("href","/payment/chargePoint");
			//});
			
			$('.btn-bob:contains("반환신청")').on('click', function() {
				$(self.location).attr("href","/payment/exchargePoint");
			});
			
			$('#exchargePoint > img').on('click', function(){
  				//$("form").attr("method", "POST").attr("action", "/payment/kakaoPay").submit();
  				var userId = $("input[name=userId]").val();
  				var point = $("input[name=point]").val();
  				
  				if(point == null || point == '') {
  					alert("충전할 금액을 입력해주세요.");
  				}
  				else if(point<1000 || point>100000) {
  					alert("1,000원부터 100,000원까지 충전이 가능합니다.");
  				} else {
  					var windowW = 400;  // 창의 가로 길이
  	  		        var windowH = 500;  // 창의 세로 길이
  	  		        var left = Math.ceil((window.screen.width - windowW)/2);
  	  		        var top = Math.ceil((window.screen.height - windowH)/2);

  					window.open("/payment/kakaoPay?userId="+userId+"&point="+point, 'popup', 
  							"l top="+top+", left="+left+", height="+windowH+", width="+windowW);
  					opener.location.reload(true);
  				    self.close();
  				}
  			});
		});

    </script>
    
</head>
<body>

		
	<div class="container" align="center">
		
		<div class="page-header" style="padding-top: 20px;">
		  <h1 style="font-weight: bold;">내 포인트 조회</h1>
		</div>
		
		<div class="row text-center" style="padding-top:50px;">
			<h3>${user.name}님의 잔여 포인트 : ${totalPoint} Point</h3><br>
			<h4>( 마일리지 : ${totalMileage}점 )</h4>
		</div>
		
		<div class="row" style="padding-top:50px;">
			
            <button class="btn-bob" style="margin: 10px;">마일리지 전환</button>
            <button class="btn-bob" style="margin: 10px;"
            		data-toggle="modal" data-target="#myModal">충전</button>
            <button class="btn-bob" style="margin: 10px;">반환신청</button>
            
        </div>
        
        <div class="row" style="border: 1px solid #000">
        	<c:forEach var="payment" items="${payment}">
	        	<div class="row">
	        		${payment.paymentCode} / ${payment.point}
	        	</div>
        	</c:forEach>
        </div>


    </div><!-- /.container -->
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title text-center" id="myModalLabel"><b>포인트 충전</b></h4>
	        <hr>
	      </div>
		      <div class="modal-body">  
			      <form>
					<input type="hidden" name="userId" value="${sessionScope.user.userId}" />
					<input type="text" placeholder="충전할 포인트를 입력하세요" name="point" style="width: 400px; height:40px; margin-top: 60px; margin-left: 30px;">
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