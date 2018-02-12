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
	<script type="text/javascript" src="../resources/javascript/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="../resources/javascript/moment.js"></script>
	<script type="text/javascript" src="../resources/javascript/moment-ko.js"></script>
	
	    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	
	
	<style>
        
       	body {
       		padding-top: 50px;
       		padding-bottom: 50px;
       	}
       	
       	.jumbotron {
		    margin-bottom: 0px;
		    margin-top:50px;
		    padding-top: 150px;
		    height: 550px;
		    background: transparent;
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

		@media only screen and (min-device-width : 320px) and (max-device-width : 480px) {
			#Title {
				max-width: 100%;
			}
		}

       	
    </style>
    
    <script type="text/javascript">
    
  		$(function() {
  			
  			//alert();
  			
  			var titleText = moment().format('M')+" 월 포인트 내역";
  			
  			//alert($("option:selected").text());

  			if($("option:selected").text() != '기간설정') {					
  				//alert("??");
  				titleText = $("option:selected").text()+"간 포인트 내역";
  			}
  			
  			$("body > div.container > div > div:nth-child(1) > div").text(titleText);

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

  					window.open("/payment/kakaoPay?userId="+userId+"&point="+point, '', 
  							"l top="+top+", left="+left+", height="+windowH+", width="+windowW,
  							"resizable=no");
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
			
			$('.selectpicker').on('change', function() {
				$(self.location).attr("href","/payment/mainPayment?searchCondition="+$('option:selected').val());
			});

		});

    </script>
    
</head>
<body style="background:#fffafa;">

	<div class="jumbotron text-center"
			style="background-image: url('../resources/images/340.jpg');
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center;">
		<img id="Title" src="../resources/images/title_point.png"/>
		
		<div class="row text-center" style="padding: 30px; background: rgba(0, 0, 0, 0.7); margin-top: 50px; color: #FFF;">
			<div class="col-xs-12">
				<p style="font-size:20px;">${user.name}님의 잔여 포인트 : <fmt:formatNumber type="currency" value="${totalPoint}" pattern="###,###" /> Point</p>
				<h4>( 마일리지 : <fmt:formatNumber type="currency" value="${totalMileage}" pattern="###,###" />점 )</h4>
			</div>
			
			<div class="col-xs-12">
				<button class="btn-bob" style="margin: 10px;" >마일리지 전환</button>
	            <button class="btn-bob" style="margin: 10px;" data-toggle="modal">충전</button>
	            <button class="btn-bob" style="margin: 10px;">반환신청</button>
	        </div>				
		</div>
		<div class="row text-center"  style="padding-top:50px; padding-bottom:30px;">
				
	           
	            
	    </div>
	</div>

	
	<div class="container" style="padding-top: 50px;">

		<div class="row" style="border:1px solid #000; background-color:#FFF; padding-top:15px;">
		
			 <div class="row">
	        	<div class="col-xs-12 text-center" style="font-size:20px; font-weight:bold; padding:20px;">
				</div>
	        </div>

	        <div class="row" align="right">
	        	<div class="col-xs-12" style="padding-right:30px;">
					<select name="term" class="selectpicker">
					  <option value="" selected disabled hidden>기간설정</option>
					  <option value="0" ${param.searchCondition eq 0? "selected":""}>일주일</option>
					  <option value="1" ${param.searchCondition eq 1? "selected":""}>한달</option>
					  <option value="2" ${param.searchCondition eq 2? "selected":""}>6개월</option>
					</select>
										
				</div>
	        </div>
	        
	        <div class="row text-center" style="padding-top:15px; margin: 10px;">

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
		       
	        	<jsp:include page="./listPayment.jsp" />
	        	
	        </div>
        
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