<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
	<script type="text/javascript" src="../resources/javascript/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="../resources/javascript/moment.js"></script>
	<script type="text/javascript" src="../resources/javascript/moment-ko.js"></script>
	<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
	
	    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	
	
	<style>
        
       	body {
       		padding-top: 50px;
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
		
		.img-cover{
	         position: absolute;
	         height: 100%;
	         width: 100%;
	         background-color: rgba(0, 0, 0, 0.3);                                                                 
	         z-index:1;
     	}
     	
     	.listings ul.properties_list li {
		    border: 1px solid #f2f1f1;
		    color: #000;
		}
		

		section.search > div.advanced_search > div > ul > li > a {
		    color: #000;
		}
		
	@import url('https://fonts.googleapis.com/css?family=Alegreya+Sans');
	.h2 {font-family: 'Alegreya Sans', sans-serif;}
	
	.more_listing_btn {
	    text-decoration: none;
	    padding: 20px 40px;
	    border: 2px solid #bfd9f1;
	    border-radius: 30px;
	    -webkit-border-radius: 30px;
	    -moz-border-radius: 30px;
	    -o-border-radius: 30px;
	    width: 200px;
	    color: #afcbe6;
	    font-size: 18px;
	    font-weight: bold;
	    font-family: "lato-regular", Helvetica, Arial, sans-serif;
	    text-transform: uppercase;
	    letter-spacing: 1px;
	    text-align: center;
	    transition: all .2s linear;
	    -webkit-transition: all .2s linear;
	    -moz-transition: all .2s linear;
	    -o-transition: all .2s linear;
	    background: #FFF;
	}
	
	.state_space {
	    display: block;
	    width: 82px;
	    height: 82px;
	    background: url('../resources/images/sp_state.png') no-repeat ;
	    line-height: 82px;
	    font-size: 18px;
	    text-align: center;
	}
	
	.spot_button.type1 {
		position: relative;
	    top: -11px;
	    left: 5px;
	    display: inline-block;
	    width: 82px;
	    border: 1px solid;
	    font-size: 14px;
	    line-height: 35px;
	    text-align: center;
	    height:35px;
	    text-decoration: none !important;
	    color: #fff;
	}
	
	#search .col-xs-12.col-sm-6.text-center {
	    border-right: 0.5px solid #ccc;
    }
    .search .advanced_search {
    	z-index: 50;
    	top: 120px;
    }    
	
	@media only screen and (max-width: 767px) {
	
		#search .col-xs-12.col-sm-6.text-center {
		    border: none;
	    }
	
		#search .col-xs-12.col-sm-6.text-center a {
		    position: relative;
		    left: 30px;
		    top: 0;
	    }
	
	    #search .col-xs-12.col-sm-4.text-center {
		    position: relative;
		    top: -30px;
		    left: -53px;
	    }
	    
	    .search .advanced_search  {
		    display: block;
	    }
	    
	    .nav.nav-tabs.nav-justified li {
		    width: 50%;
	    	float: left;
	    }
	    
	    #advanced_search_btn {
	    	display: none;
	    }

	}
	       	
    </style>
    
    <script type="text/javascript">

  		$(function() {
  			
  			$("html, body").animate({ scrollTop: 0 }, "slow"); 
  			
  			var titleText = moment().format('M')+" 월 포인트 내역";
  			
  			//alert($("option:selected").text());

  			<c:if test="${param.searchCondition != null}">
  			
	  			if($("div.container > div > div:nth-child(2) > div > div > select > option:selected").text() != '기간설정') {					
	  				//alert($("div.container > div > div:nth-child(2) > div > div > select > option:selected").text());
	  				titleText = $("div.container > div > div:nth-child(2) > div > div > select > option:selected").text()+"간 포인트 내역";
	  			}
	  			
  			</c:if>
  			
  			<c:if test="${kakologin eq 'success'}">
  				$('#chargePoint').modal("show");
  			</c:if>
  			
  			$("body > div.container > div > div:nth-child(1) > div").text(titleText);
			
			$('#chargePoint > img').on('click', function(){
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
			
			$(document).on('click',".listPayment", function() {
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
			
			$("input[name=exchargePoint]").on('keyup', function() {
				$(this).val($(this).val().replace(/[^0-9]/g,""));
				
				if($(this).val().charAt(0) == 0) {
					$(this).val("");
				}
				
			});

			//==================================== 포인트반환 신청 
			
			var exchargePointDiv = $("#exchargePoint input[name=exchargePoint]");
			
			exchargePointDiv.on({'focusout': function() {
				
				if(exchargePointDiv.val() == "") {
					$("#pointCheck").show();
					$("#pointCheck").text("* 5,000 Point 이상 출금이 가능합니다.");
				}
				
				if(exchargePointDiv.val() > ${accountUser.totalPoint}) {
					exchargePointDiv.val(${accountUser.totalPoint});
					$("#pointCheck").show();
					exchargePointDiv.css("background", "#ff8c8c");
					$("#pointCheck").text("* 가지고 계신 Point 까지만 출금이 가능합니다.");
				}
				
				if(exchargePointDiv.val() < 5000) {
					$("#pointCheck").show();
					exchargePointDiv.css("background", "#ff8c8c");
					$("#pointCheck").text("* 5,000 Point 이상 출금이 가능합니다.");
				}
				},
				'focusin' : function() {
					exchargePointDiv.css("background", "#FFF");
					$("#pointCheck").hide();

				}
			});
			
			$('li:contains("반환신청")').on('click', function() {
				<c:if test="${accountUser.totalPoint > 0}">
					if($("input[name=isNewBank]").val() == 'true') {
						$("#registerBank").hide();
						$("#oldBank").show();
						$("input[name=btnisNewBank]").val("새로운 계좌 사용");
					} else {
						$("#registerBank").show();
						$("#oldBank").hide();
						$("input[name=btnisNewBank]").val("기존 계좌 사용");
					}
					
					$("#exchargePoint").modal("show");
					
				</c:if>
				<c:if test="${accountUser.totalPoint == 0}">
					alert("반환할 포인트가 없습니다.");
				</c:if>
			});
			
			$('button:contains("반환 신청하기")').on('click', function() {
				if($('input[name=exchargePoint]').val() != "" && $('input[name=exchargePoint]').val() >= 5000 ) {
					if (confirm($("input[name=exchargePoint]").val()+" Point 반환 신청을 하시겠습니까?") == true){
						
						if($("input[name=isNewBank]").val() == 'true') {
							// 기존계좌사용
							$("#accountForm").attr("target", "popup")
							.attr("method", "POST").attr("action", "/payment/exchargePoint").submit();
							
						} else {
							var windowW = 500;  // 창의 가로 길이
			 		        var windowH = 500;  // 창의 세로 길이
			 		        var left = Math.ceil((window.screen.width - windowW)/2);
			 		        var top = Math.ceil((window.screen.height - windowH)/2);
				
							window.open("/payment/newAccount", "popup",
									"l top="+top+", left="+left+", height="+windowH+", width="+windowW
									+"scrollbars=no");
							
							$("#accountForm").attr("target", "popup")
								.attr("method", "POST").attr("action", "/payment/newAccount").submit();
							
							opener.location.reload(true);
						    self.close();
						}
						
					} else {
						return;
					}
				} else {
					$("#pointCheck").show();
					exchargePointDiv.css("background", "#ff8c8c");
					$("#pointCheck").text("* 출금할 Point를 입력해주세요.");
				}
			})
			
			$(document).on('click',"input[name=btnisNewBank]", function() {
				if($("input[name=isNewBank]").val() == 'true') {
					$("#registerBank").show();
					$("#oldBank").hide();
					$("input[name=isNewBank]").val('false');
					$("input[name=btnisNewBank]").val("기존 계좌 사용");
				} else {
					$("#registerBank").hide();
					$("#oldBank").show();
					$("input[name=isNewBank]").val('true');
					$("input[name=btnisNewBank]").val("새로운 계좌 사용");
				}
			})
			
			
			
			$('a:contains("충전하기")').on('click', function() {
				<c:if test="${empty user.accessToken}">
					$(self.location).attr("href","/payment/kakaoLoginRequest");
				</c:if>
				<c:if test="${!empty user.accessToken}">
					$("#chargePoint").modal("show");
				</c:if>
			});
			
			
			$("li:contains('마일리지 전환')").on('click', function() {
				if(${accountUser.totalMileage} < 1000) {
					alert("마일리지 전환이 불가능합니다.");
				} else {
					$('#exchargeMileage').modal('toggle');
				}
			});
			
			$('.selectpicker').on('change', function() {
				$(self.location).attr("href","/payment/mainPayment?searchCondition="+$('option:selected').val());
			});
			
			/*  Advanced search form & Icon  */
			$('#advanced_search_btn').on("click", function(e){
				e.preventDefault();

				var ads_box =$('.advanced_search');
				
				if(!ads_box.hasClass('advanced_displayed')){

					$(this).addClass('active');
					ads_box.stop().fadeIn(200).addClass('advanced_displayed');

				}else{

					$(this).removeClass('active');
					ads_box.stop().fadeOut(200).removeClass('advanced_displayed');

				}

			});

			//=================== 결제 내역
			
	   	 	$('#listPayment > div.row.text-center:contains("next")').on("click", function() {
	   	 		//alert();
	   	 		$("#listPayment").load("/payment/listPayment?currentPage=${paymentPage.currentPage+1}");
	   	 	});

		});

    </script>
    
</head>
<body >
<input type="hidden" name="userId" value="${sessionScope.user.userId}" />

	<section class="hero" style="background-image: url('../resources/images/igor-ovsyannykov-494256.jpg');
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center; height:400px; ">
		<div class="img-cover"></div>
		<section class="caption" style="padding-top: 70px;">
			<h2 class="caption">My Point</h2>
		</section>
	</section>
	<section class="search" style="background: #000000; height:120px;">
		<div class="wrapper">
			<form id="searchForm">
				<div id="search" class="text-center" style="position: absolute; background: none; color:#FFF; left: 5%; padding-top: 20px;">
					<div class="row">
						<div class="col-xs-12 col-sm-6 text-center">				
							<h1 style="font-size:15px; color:#FFF; font-weight: normal;">
								<span style="margin-right: 120px;">사용가능 포인트</span><br>
								<span style="font-size:20px; font-weight: bold;">
									<fmt:formatNumber type="currency" value="${accountUser.totalPoint}" pattern="###,###" /> Point
								</span>
								<a href="#" class="spot_button type1">충전하기</a>
							</h1>
						</div>
						<div class="col-xs-12 col-sm-4 text-center">
							<h1 style="font-size:15px; color:#FFF; font-weight: normal; padding-top:10px;">
								<span style="margin-right: 30px;">마일리지</span>
								<span style="font-size:20px; font-weight: bold;">
									<fmt:formatNumber type="currency" value="${accountUser.totalMileage}" pattern="###,###" />점
								</span>
							</h1>
						</div>
					</div>
				</div>
				<a href="#" class="advanced_search_icon" id="advanced_search_btn"  style="margin-top: 42px;"></a>
				
			</form>
		</div>
		
		<div class="advanced_search">
			<div class="wrapper">
				<span class="arrow"></span>
            	<ul class="nav nav-tabs nav-justified" style="border: none;">
					<li class="active" ><a>마일리지 전환</a></li>
					<li><a>반환신청</a></li>
				</ul>
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->
	
	<div class="container" style="padding-top: 20px; max-width: 1000px;">

		<div class="row" style="border:0.5px solid #efefef; background-color:#FFF; padding: 20px 5px 5px 5px;">
		
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
		       	
		       	<div id="listPayment">
	        		<jsp:include page="./listPayment.jsp" />
	        	</div>
	        	
	        </div>
        
        </div>


    </div>
    
    <footer style="background: #000000; margin-top: 20px;">
		<div class="copyrights wrapper" style="border-top: 1px solid #6f6f6f; ">
			Copyright @ 2018 <a href="/" class="ph_link" >zaching.com</a>. All Rights Reserved.
		</div>
	</footer>
    
    <!-- /.container -->
	
	<!-- Modal -->
	<div class="modal fade" id="chargePoint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
			    <form style="padding-top: 50px;">
					<input type="text" placeholder="충전할 포인트를 입력하세요" name="point" style="width: 400px; height:40px;">
				</form>
		      </div>
		      <div class="modal-footer">
		      <div class="search-container text-center" align="center" style="margin: 0 auto;">
		      	 <a href="#" id="chargePoint"><img src="../resources/images/payment_icon_yellow_medium.png" ></a>
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
			      <form style="margin-top: 60px;">
					<input type="text" placeholder="마일리지를 입력해주세요." name="point" style="width: 200px; height:40px; margin-left: 30px;"/>
					/ <fmt:formatNumber type="currency" value="${accountUser.totalMileage}" pattern="###,###" />점
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
	
	<div class="modal fade" id="exchargePoint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document" style="max-width: 700px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title text-center" id="myModalLabel"><b>포인트 반환 신청</b></h4>
	        <hr>
	      </div>
		      <div class="modal-body text-center" style="height: 450px;">
				<input type="button" class="btn btn-primary" name="btnisNewBank" value="btn"/>
				<input type="hidden" name="isNewBank" value="true"/>
				
				<form id="accountForm" style="padding-top: 10px; border: solid 1px #ccc; margin: 10px; padding-bottom: 20px;">
				
				<input type="text" placeholder="반환받을 포인트를 입력하세요." name="exchargePoint" style="width: 250px; height:40px; margin-left: 30px; padding-left: 5px;"/>
					/ <fmt:formatNumber type="currency" value="${accountUser.totalPoint}" pattern="###,###" /> Point
					
					<div id="pointCheck" class="text-center" style="padding: 10px 10px 20px 0; color:red; display: none;">
						* 5,000 Point 이상 출금이 가능합니다.
				</div>
				
				<hr>
				
				<div id = "oldBank">
					<div class="row" style="padding-top:40px;">
						<label for="name" class="col-xs-4 control-label">
								은행명
						</label>
						<div class="col-xs-7">
							${accountUser.bankName}
						</div>
					</div>
					<div class="row" style="padding-top:40px;">
						<label for="name" class="col-xs-4 control-label">
								계좌번호
						</label>
						<div class="col-xs-7">
							${accountUser.accountNumber}
						</div>
					</div>
					
				</div>
				
				<div class="row" style="padding-top:40px;">
					<label for="name" class="col-xs-4 control-label">
							예금주
					</label>
					<div class="col-xs-7">
						<input type="text" class="form-control" name="name" value="${accountUser.realName}" />
					</div>
				</div>
				
				<div id="registerBank" >
					<div class="row" style="padding-top:20px;">
						<label for="name" class="col-xs-4 control-label">
								생년월일+한자리 (ex) 9402082
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" name="accountHolderinfo" value=""/>
						</div>
					</div>
					
					<div class="row" style="padding-top:20px;">
						<label for="bankCode" class="col-xs-4 control-label">
								은행명
						</label>
						<div class="col-xs-7">
							<select name="bankCode" class="selectpicker show-tick" title="은행선택"  >
					    	  <c:forEach var="bank" items="${bank}">
					    	  	<option value="${fn:substring(bank,0,3)}"
					    	  		${accountUser.bankName eq fn:substring(bank, 4, fn:length(bank)) ? 'selected="selected"':''}>
										${fn:substring(bank,4, fn:length(bank))}
									</option>
					    	  </c:forEach>
							</select>
						</div>
					</div>
					<div class="row" style="padding-top:20px;">
						<label for="name" class="col-xs-4 control-label">
								계좌번호
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" name="accountNum" value="" />
						</div>
					</div>
				</div>
			  </form>
		      </div>
		      <div class="modal-footer">
		      <div class="search-container text-center" align="center" style="margin: 0 auto;">
		      	 <button class="btn btn-primary" type="submit">반환 신청하기</button>
		      </div>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>