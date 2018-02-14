<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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

       	
    </style>
    
    <script type="text/javascript">
    
  		$(function() {
  			
  			$("html, body").animate({ scrollTop: 0 }, "slow"); 
  			
  			var titleText = moment().format('M')+" �� ����Ʈ ����";
  			
  			//alert($("option:selected").text());

  			if($("div.container > div > div:nth-child(2) > div > div > select > option:selected").text() != '�Ⱓ����') {					
  				//alert("??");
  				titleText = $("div.container > div > div:nth-child(2) > div > div > select > option:selected").text()+"�� ����Ʈ ����";
  			}
  			
  			$("body > div.container > div > div:nth-child(1) > div").text(titleText);
			
			$('#chargePoint > img').on('click', function(){
  				//$("form").attr("method", "POST").attr("action", "/payment/kakaoPay").submit();
  				var userId = $("input[name=userId]").val();
  				var point = $("input[name=point]").val();
  				
  				if(point == null || point == '') {
  					alert("������ �ݾ��� �Է����ּ���.");
  				}
  				else if(point<1000 || point>100000) {
  					alert("1,000������ 100,000������ ������ �����մϴ�.");
  				} else {
  					var windowW = 400;  // â�� ���� ����
  	  		        var windowH = 500;  // â�� ���� ����
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

			$('li:contains("��ȯ��û")').on('click', function() {
				$("#exchargePoint").modal("show");
			});
			
			$('li:contains("����")').on('click', function() {
				<c:if test="${empty user.accessToken}">
					$(self.location).attr("href","/payment/kakaoLoginRequest");
				</c:if>
				<c:if test="${!empty user.accessToken}">
					$("#chargePoint").modal("show");
				</c:if>
			});
			
			
			$("li:contains('���ϸ��� ��ȯ')").on('click', function() {
				if(${totalMileage} < 1000) {
					alert("���ϸ��� ��ȯ�� �Ұ����մϴ�.");
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
			
			$("input[name=exchargePoint]").on('keyup', function() {
				$(this).val($(this).val().replace(/[^0-9]/g,""));
				
				if($(this).val().charAt(0) == 0) {
					$(this).val("");
				}
				
			});
			
			$("input[name=exchargePoint]").on({'focusout': function() {
				if($(this).val() == "") {
					$("#pointCheck").show();
					$("#pointCheck").text("* 5,000 Point �̻� ����� �����մϴ�.");
				}
				
				if($(this).val() > ${user.totalPoint}) {
					$(this).val(${user.totalPoint});
					$("#pointCheck").show();
					$(this).css("background", "#ff8c8c");
					$("#pointCheck").text("* ������ ��� Point ������ ����� �����մϴ�.");
				}
				
				if($(this).val() < 5000) {
					$("#pointCheck").show();
					$(this).css("background", "#ff8c8c");
					$("#pointCheck").text("* 5,000 Point �̻� ����� �����մϴ�.");
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
<input type="hidden" name="userId" value="${sessionScope.user.userId}" />

	<section class="hero" style="background-image: url('../resources/images/igor-ovsyannykov-494256.jpg');
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center; height:700px; ">
		<div class="img-cover"></div>
		<section class="caption" style="padding-top: 70px;">
			<h2 class="caption">My Point</h2>
		</section>
	</section>
	
	<section class="search" style="background: #000000;">
		<div class="wrapper">
			<form id="searchForm">
				<div id="search" class="text-center" style="position: absolute; background: none; color:#FFF; left: 5%;">
					<h1 style="font-size:20px;">${user.name}���� �ܿ� ����Ʈ : <fmt:formatNumber type="currency" value="${totalPoint}" pattern="###,###" /> Point</h1>
					<h4>( ���ϸ��� : <fmt:formatNumber type="currency" value="${totalMileage}" pattern="###,###" />�� )</h4>
				</div>
				<a href="#" class="advanced_search_icon" id="advanced_search_btn"></a>
			</form>
		</div>
		
		<div class="advanced_search" style="z-index: 50;">
			<div class="wrapper">
				<span class="arrow"></span>
            	<ul class="nav nav-tabs nav-justified" style="border: none;">
					<li class="active" ><a>���ϸ��� ��ȯ</a></li>
					<li><a>����</a></li>
					<li><a>��ȯ��û</a></li>
				</ul>
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->
	
	<div class="container" style="padding-top: 50px;">

		<div class="row" style="border:1px solid #000; background-color:#FFF; padding-top:15px;">
		
			 <div class="row">
	        	<div class="col-xs-12 text-center" style="font-size:20px; font-weight:bold; padding:20px;">
				</div>
	        </div>

	        <div class="row" align="right">
	        	<div class="col-xs-12" style="padding-right:30px;">
					<select name="term" class="selectpicker">
					  <option value="" selected disabled hidden>�Ⱓ����</option>
					  <option value="0" ${param.searchCondition eq 0? "selected":""}>������</option>
					  <option value="1" ${param.searchCondition eq 1? "selected":""}>�Ѵ�</option>
					  <option value="2" ${param.searchCondition eq 2? "selected":""}>6����</option>
					</select>
										
				</div>
	        </div>
	        
	        <div class="row text-center" style="padding-top:15px; margin: 10px;">

	        	<div class="row">
		        	<div class="col-xs-4">
		        		�ŷ���
		        	</div>
		        	<div class="col-xs-4">
		        		����
		        	</div>
		        	<div class="col-xs-4">
		        		����/��� ����Ʈ
		        	</div>
		        </div>
		        	
		        <hr style="border: 1px solid #bababa;">
		       
	        	<jsp:include page="./listPayment.jsp" />
	        	
	        </div>
        
        </div>


    </div><!-- /.container -->
	
	<!-- Modal -->
	<div class="modal fade" id="chargePoint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title text-center" id="myModalLabel"><b>����Ʈ ����</b></h4>
	        <hr>
	      </div>
		      <div class="modal-body text-center"> 
		      	������ ����Ʈ�� �Է����ּ���. <br>
		      	������ 1�� �� 1,000������ 10,0000������ �����մϴ�.
			      <form style="padding-top: 50px;">
					<input type="text" placeholder="������ ����Ʈ�� �Է��ϼ���" name="point" style="width: 400px; height:40px;">
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
	        <h4 class="modal-title text-center" id="myModalLabel"><b>���ϸ��� ��ȯ</b></h4>
	        <hr>
	      </div>
		      <div class="modal-body text-center">  
				����Ʈ�� ��ȯ�� ���ϸ����� �Է����ּ���. <br>
				5,000�� �̻���� 1,000�� �� 1000����Ʈ�� ��ȯ�˴ϴ�.
			      <form>
					<input type="text" placeholder="���ϸ����� �Է����ּ���." name="point" style="width: 200px; height:40px; margin-top: 60px; margin-left: 30px;">
					/ <fmt:formatNumber type="currency" value="${totalMileage}" pattern="###,###" />��
				</form>
		      </div>
		      <div class="modal-footer">
		      <div class="search-container text-center" align="center" style="margin: 0 auto;">
		      	 <button class="btn btn-primary" type="submit">���ϸ��� ��ȯ�ϱ�</button>
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
	        <h4 class="modal-title text-center" id="myModalLabel"><b>����Ʈ ��ȯ ��û</b></h4>
	        <hr>
	      </div>
		      <div class="modal-body text-center" style="height: 500px;">
			      <form name="exchargePointForm" style="padding-top: 20px;">
					<input type="text" placeholder="��ȯ���� ����Ʈ�� �Է��ϼ���." name="exchargePoint" 
							style="width: 200px; height:40px; margin-left: 30px;">
					/ <fmt:formatNumber type="currency" value="${totalMileage}" pattern="###,###" /> Point
					
					<div id="pointCheck" class="text-center" style="padding: 10px 10px 20px 0; color:red; display: none;">
						* 5,000 Point �̻� ����� �����մϴ�.
					</div>
				</form>

				    <div class="input-group">
				      <span class="input-group-addon">
				        <input type="radio" name="account" checked>
				      </span>
				      <div class="form-control">�������»��</div>
				    </div><!-- /input-group -->
				    <div class="input-group" id="newAccount">
				      <span class="input-group-addon">
				        <input type="radio" name="account">
				      </span>
				      <div class="form-control">���ο���»��</div>
				      
				    </div><!-- /input-group -->
		      		
				    <form id="accountForm"  style="display: none;">
				    	����� ���������� �Է����ּ���.
						<div class="row" style="padding-top:40px;">
							<label for="name" class="col-xs-4 control-label">
									�̸�
							</label>
							<div class="col-xs-7">
								<input type="text" class="form-control" name="name" value="${user.realName}" />
							</div>
						</div>
						
						<div class="row" style="padding-top:20px;">
							<label for="name" class="col-xs-4 control-label">
									�����
							</label>
							<div class="col-xs-7">
								${bank}
								<select name="limitNum" class="selectpicker show-tick" title="���� �ο���"  >
						    	  <c:forEach var="i" begin="2" end="20" step="1">
						    	  	<option >${i}</option>
						    	  </c:forEach>
								</select>
							</div>
						</div>
						
						<div class="row" style="padding-top:20px;">
							<label for="name" class="col-xs-4 control-label">
									�������+���ڸ� (ex) 9402082
							</label>
							<div class="col-xs-7">
								<input type="text" class="form-control" name="accountHolderinfo" value=""/>
							</div>
						</div>
						
						<div class="row" style="padding-top:20px;">
							<label for="name" class="col-xs-4 control-label">
									���¹�ȣ
							</label>
							<div class="col-xs-7">
								<input type="text" class="form-control" name="accountNum" value="${user.accountNumber}" />
							</div>
						</div>
					</form>
		      </div>
		      <div class="modal-footer">
		      <div class="search-container text-center" align="center" style="margin: 0 auto;">
		      	 <button class="btn btn-primary" type="submit">��ȯ ��û�ϱ�</button>
		      </div>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>