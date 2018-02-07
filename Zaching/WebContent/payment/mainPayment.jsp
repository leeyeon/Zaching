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
	
	<title>포인트충전</title>
	
	<style>
        
       	body {
       		padding-top: 50px;
       		padding-bottom: 50px;
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
		
		.active {
			display: block;
		}
		
		.listCondition {
			cursor: pointer;
			padding: 10px;
			background: #ccc;
			font-size: 17px;
			margin-top: 30px;
			border: 1px solid #FFF;
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
			
			$(".listPayment").on('click', function() {
				var listIndex = $(".listPayment").index(this);
				var target = $($(".listExplain")[listIndex]);
				
				$(".listExplain").each(function(index, element) {
					if(index == listIndex && $(this).css("display") == "none") {
						target.show();
					} else {
						$(this).hide();
					}
					
				});				
			});
			
			$('.btn-bob:contains("충전")').on('click', function() {
				<c:if test="${empty user.accessToken}">
					$(self.location).attr("href","/payment/kakaoLoginRequest");
				</c:if>
				<c:if test="${!empty user.accessToken}">
					$("#exchargePoint").modal("show");
				</c:if>
			});
			
			
			$(".btn-bob:contains('마일리지 전환')").on('click', function() {
				if(${totalMileage} < 1000) {
					alert("마일리지 전환이 불가능합니다.");
				} else {
					$('#exchargeMileage').modal('toggle');
				}
			});

		});

    </script>
    
</head>
<body style="background:#fffafa;">

		
	<div class="container" align="center">
		
		<div class="page-header" style="padding-top: 20px;">
		  <h1 style="font-weight: bold;">내 포인트 조회</h1>
		</div>
		
		<div class="row text-center" style="padding-top:50px;">
			<p style="font-size:20px;">${user.name}님의 잔여 포인트 : <fmt:formatNumber type="currency" value="${totalPoint}" pattern="###,###" /> Point</p>
			<h4>( 마일리지 : <fmt:formatNumber type="currency" value="${totalMileage}" pattern="###,###" />점 )</h4>
		</div>
		
		<div class="row" style="padding-top:50px;">
			
            <button class="btn-bob" style="margin: 10px;" >마일리지 전환</button>
            <button class="btn-bob" style="margin: 10px;" data-toggle="modal">충전</button>
            <button class="btn-bob" style="margin: 10px;">반환신청</button>
            
        </div>
        
        <div class="row">
        	<div class="listCondition col-xs-4">
        		일주일
        	</div>
        	<div class="listCondition col-xs-4">
        		한달
        	</div>
        	<div class="listCondition col-xs-4">
        		6개월
        	</div>
        	
        	<hr style="border: 2px solid #bababa; margin: 0;">
        </div>

        
        <div class="row" style="padding-top:15px; background:#f2f2f2">
        	<div class="row">
	        	<div class="col-xs-4">
	        		거래일
	        	</div>
	        	<div class="col-xs-4">
	        		내역
	        	</div>
	        	<div class="col-xs-4">
	        		적립/사용 포인트
	        	</div>
	        </div>
	        	
	        <hr style="border: 1px solid #bababa;">
	       
        	<c:forEach var="payment" items="${payment}">
	        	<div class="row listPayment">
	        		<div class="col-xs-4">
		        		<fmt:parseDate value="${payment.createdDate}" var="Date" pattern="yyyy-MM-dd HH:mm"/>
	      				<fmt:formatDate value="${Date}" pattern="yyyy.MM.dd"/>
		        	</div>
		        	<div class="col-xs-4">
		        		<c:if test="${payment.paymentCode eq 'P01'}">포인트 충전</c:if>
		        		<c:if test="${payment.paymentCode eq 'P02'}">포인트 사용</c:if>
		        		<c:if test="${payment.paymentCode eq 'P03'}">포인트 반환 신청</c:if>
		        		<c:if test="${payment.paymentCode eq 'P04'}">포인트 반환 완료</c:if>
		        		<c:if test="${payment.paymentCode eq 'P05'}">포인트 반환 신청 취소</c:if>
		        		<c:if test="${payment.paymentCode eq 'P06'}">포인트 사용 취소</c:if>
		        	</div>
		        	<div class="col-xs-4">
		        		<c:if test="${payment.paymentCode eq 'P01' || payment.paymentCode eq 'P05' || payment.paymentCode eq 'P06'}">+</c:if>
		        		<c:if test="${payment.paymentCode eq 'P02' || payment.paymentCode eq 'P03' || payment.paymentCode eq 'P04'}">-</c:if>
		        		<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /> p
		        	</div>
	        	</div>
	        	
	        	<div class="row text-left listExplain" style="background: #ccc; margin:10px; padding: 15px 10px 10px 10px; display: none;">
	        		<p>거래일시 : ${payment.createdDate}</p>
	        		<p>적립/포인트 : 
	        			<span style="font-weight: bold;"> 
			        		<c:if test="${payment.paymentCode eq 'P02' || payment.paymentCode eq 'P03' || payment.paymentCode eq 'P04'}">-</c:if>
		        			<fmt:formatNumber type="currency" value="${payment.point}" pattern="###,###" /> p
	        			</span></p>
		        	<p>내역 : 
		        		<c:set var="content" value="${fn:split(payment.content,':')}" />

		        		<c:if test="${fn:indexOf(payment.content, 'B03') != -1}">
		        			주기적으로 만나 <a href="/bob/getBob?category=B03&bobId=${content[1]}">'${content[2]}'</a> 에 회비 포인트 지출
		        		</c:if>
		        		<c:if test="${fn:indexOf(payment.content, 'B03') == -1}">
		        			${content[2]}
		        		</c:if>
		        	</p>
	        	</div>
	        	<hr>
        	</c:forEach>
        </div>


    </div><!-- /.container -->
	
	<!-- Modal -->
	<div class="modal fade" id="exchargePoint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title text-center" id="myModalLabel"><b>포인트 충전</b></h4>
	        <hr>
	      </div>
		      <div class="modal-body text-center"> 
		      	충전할 포인트를 입력해주세요. <br>
		      	충전은 1번 당 1,000원부터 10,0000원까지 가능합니다.
			      <form>
					<input type="hidden" name="userId" value="${sessionScope.user.userId}" />
					<input type="text" placeholder="충전할 포인트를 입력하세요" name="point" style="width: 400px; height:40px; margin-top: 40px;">
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
	
	<!-- Modal -->
	<div class="modal fade" id="exchargeMileage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title text-center" id="myModalLabel"><b>마일리지 전환</b></h4>
	        <hr>
	      </div>
		      <div class="modal-body text-center">  
				포인트로 전환할 마일리지를 입력해주세요. <br>
				5,000점 이상부터 1,000점 당 1000포인트로 전환됩니다.
			      <form>
					<input type="hidden" name="userId" value="${sessionScope.user.userId}" />
					<input type="text" placeholder="마일리지를 입력해주세요." name="point" style="width: 200px; height:40px; margin-top: 60px; margin-left: 30px;">
					/ <fmt:formatNumber type="currency" value="${totalMileage}" pattern="###,###" />점
				</form>
		      </div>
		      <div class="modal-footer">
		      <div class="search-container text-center" align="center" style="margin: 0 auto;">
		      	 <button class="btn btn-primary" type="submit">마일리지 전환하기</button>
		      </div>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>