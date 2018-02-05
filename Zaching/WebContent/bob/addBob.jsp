<%@page import="com.zaching.service.domain.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>addBob</title>
    
    <jsp:include page="../resources/layout/sub_toolbar.jsp"/>
    <link rel="stylesheet" href="../resources/css/bob.css">
    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	
	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-ko_KR.min.js"></script>
	        
	<jsp:include page="../resources/javascript/fileUploadCDN.jsp"/>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

	<link rel="stylesheet" href="../resources/css/bootstrap-datetimepicker.min.css">
	<script src="../resources/javascript/bootstrap-datetimepicker.min.js"></script>
	<script src="../resources/javascript/bootstrap-datetimepicker.ko.js"></script> 

	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  	
	<script type='text/javascript'>

	$(document).on('DOMMouseScroll mousewheel', '.bootstrap-select .dropdown-menu',
		function (ev) {
		    $(this).scrollTop($(this).scrollTop()-ev.originalEvent.wheelDelta);
		    ev.stopPropagation();
		    ev.preventDefault();
	});
	
	function fcnAddBob() {

		var category = $("input[name=category]");
		var title = $("input[name=title]");
		var limitNum = $("select[name=limitNum]");
		var content = $("#summernote");
		var imageCheck = $("input[name=imageCheck]");
		var uploadFile = $("input[name=uploadFile]");
		var appointmentTime = $("input[name=appointmentTime]");
		var locationName = $("input[name=locationName]");
		var feeDate = $("input[name=feeDate]");
		var fee = $("input[name=fee]");

		if(title.val() == "") {
			title.focus();
			makeToast("Ÿ��Ʋ�� �Է����ּ���.");
			return false;
		}
		
		if(content.val() == "") {
			$("body > div.container > form > div > div:nth-child(6) > div > div > div.note-editing-area > div.note-editable").focus();
			makeToast("������ �Է����ּ���.");
			return false;
		}
		
		if(imageCheck.is(":checked") == true) {
			uploadFile.val("");
		} else {
			uploadFile.focus();
			makeToast("��ǥ������ �������ּ���.");
			return false;
		}
		
		if(category.val() == "B01" ) {
			if(limitNum.val() == ""){
				limitNum.focus();
				makeToast("�����ο����� �������ּ���.");
				return false;
			}
			if(appointmentTime.val() == "") {
				if (confirm("��� ��¥�� �������� �����̳���? \n ��¥ �̼��� �� ������û�� ���� �� �����ϴ�.") == true){
					
			   	}else{
			   	    return false;
			   	}
			}
		}

		if(category.val() == "B01" ||  category.val() == "B02") {
			if(locationName.val() == "") {
				locationName.focus();
				makeToast("��ġ�� �������ּ���.");
				return false;
			}
		}
		
		if(category.val() == "B03") {
			alert($("input[name=category]").val());
			if(fee.val() == "") {
				fee.focus();
				makeToast("ȸ�� �������ּ���.");
				return false;
			} else if(fee.val() < 0 || fee.val()>10000) {
				makeToast("ȸ��� 0���� 10,000������ �����մϴ�.");
			}
			
			if(feeDate.val() == "") {
				feeDate.focus();
				makeToast("ȸ�� �������� �������ּ���.");
				return false;
			} else {
				alert(feeDate.val().subString);
			}

		}
		

		//$("form").attr("method", "POST").attr("action", "/bob/addBob").submit();

	}
	
	$(function() {
		
		function parallax(){
   		    var scrolled = $(window).scrollTop();
   		    $('.bg').css('height', (530-scrolled) + 'px');
   		}
   	
   		$(window).scroll(function(e){
   		    parallax();
   		});

		$('input[name=addBob]').on('click', function(){
			fcnAddBob();
		});
		
		$(".button:contains('���')").on("click", function() {
			$("form")[0].reset();
		});
		
		
		var textCountLimit = 30;
		
		$("input[name='title']").keyup(function (e){
	          var content = $(this).val();
	          var textLength = $(this).val().length;
	          
	          // $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	          if (textLength > textCountLimit) {
	              $(this).val($(this).val().substr(0, textCountLimit));
	          } else {
	          }
	    });
		/*
	    $("input[name='title']").keyup();
	    
	    $("input[name='title']").on({
	    	"focusin":function(){
	    		$('#titleDuplicateCheck').show();
	    	},
	    	"focusout":function(){
	    		$('#titleDuplicateCheck').hide();
	    	}
	    });
	    */
	    
	    $("input[name='title']").on("keyup", function() {
	    	if(!$(this).val()) {
	    		$('#titleDuplicateCheck').show();
	    	} else {
	    		$('#titleDuplicateCheck').hide();
	    	}
	    });
	    
	    <c:if test="${category ne 'B03'}">
	    
		    $("input[name='locationName']").on("keyup", function() {
		    	if(!$(this).val()) {
		    		$('#locationDuplicateCheck').show();
		    	} else {
		    		$('#locationDuplicateCheck').hide();
		    	}
		    });
		    
		    $(function() {
		    	
		    	$( "input[name='locationName']" ).on("click" , function() {
		    		daum.postcode.load(function(){
		    	        new daum.Postcode({
		    	            oncomplete: function(data) {
		    	            	
	    	                    jQuery("input[name='locationName']").val(data.address);
	    	                    var geocoder = new daum.maps.services.Geocoder();
	    	                	geocoder.addressSearch($("input[name='locationName']").val(), function(result, status) {
	    	                	     if (status === daum.maps.services.Status.OK) {
	    	                	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	    	                	        var marker = new daum.maps.Marker({
	    	                	            map: map,
	    	                	            position: coords
	    	                	        });
	    	                	        map.setCenter(coords);
	    	                	        
	    	                	        console.log(coords.getLat());
	    	                	        console.log(coords.getLng());
	    	                	        
	    	                	        $("input[name=latitude]").val(coords.getLat());
	    	                	        $("input[name=longitude]").val(coords.getLng());
	    	                	    } 
	    	                	});
		    	            }
		    	        }).open();
		    	    });
		    	});
		    	
		    });
	
		    var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
		        contentNode = document.createElement('div');
		     
		    var mapContainer = document.getElementById('map'), 
		        mapOption = {
		            center: new daum.maps.LatLng(37.566826, 126.9786567), 
		            level: 5 
		        };  
		    var map = new daum.maps.Map(mapContainer, mapOption); 
	
	    </c:if>

		$( "#sortable1, #sortable2" ).sortable({
			cursor: "move",
		    connectWith: "ul",
		    dropOnEmpty: true
		}).disableSelection();
	    
	    $("div.file-caption.form-control.kv-fileinput-caption > input").attr("placeholder", "������ �������ּ���.");

	    $("input[name=imageCheck]").on('click', function() {
	    	//alert("1");
	    	if($("#input-b1").is(":disabled")) {
	    		//alert("2");
	    		$("#input-b1").prop('disabled', false);
	    		$("div.file-caption.form-control.kv-fileinput-caption > input").attr("placeholder", "������ �������ּ���.");
	    		$("div.file-caption.form-control.kv-fileinput-caption").css('background','');
	    	} else {
	    		//alert("3");
	    		$("#input-b1").prop('disabled', true);
	    		$("div.file-caption.form-control.kv-fileinput-caption > input").attr("placeholder", "�⺻ ���ȭ���� �����ϼ̽��ϴ�.");
	    		$("div.file-caption.form-control.kv-fileinput-caption").css('background','#ccc');
	    	}
	    });
	    
	    var todayDate = new Date().getDate();
	   // alert(todayDate + ":" + new Date(new Date().setDate(todayDate + 30)).getDate());
	    
	    $('.form_datetime').datetimepicker({
	        language:  'ko',
	        weekStart: 1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			forceParse: 0,
	        showMeridian: true,
	        startDate: new Date()
	    });
		
	    /* surmmernote*/
	    
	    $('#summernote').summernote({ 
			placeholder: '�̹� ��ģ�� ���ӿ� ���Ͽ� �������ּ���.',
			callbacks: { // �ݹ��� ���
                      // �̹����� ���ε��� ��� �̺�Ʈ�� �߻�
			    onImageUpload: function(files, editor, welEditable) {
			    	console.log("editor: "+editor);
				    sendFile(files[0], this);
				}
			},
	        tabsize: 2,
	        height: 500,
			lang: 'ko-KR'
		});
	    
	    
	});

	function sendFile(file, editor) {
           // ���� ������ ���� ������
           $("input:hidden[name='uploadFile']").val(JSON.stringify(file.name));
 		
			var form = new FormData();
			form.append("uploadFile", file);
			$.ajax({ 
			url: "/bob/rest/addSummernoteImage", 
			data: form, 
			dataType: 'json', 
			processData: false, 
			contentType: false, 
			type: 'POST',
 	        success : function(data, status) { // ó���� ������ ���
                   // �����Ϳ� �̹��� ���
                   console.log(status);
                   console.log(data);
                   console.log(data.url);
                   
 	        	$('#summernote').summernote('editor.insertImage', data.url);
 	        	 var image = $('<img>').attr('src', '' + data.url); // �����Ϳ� img �±׷� ����
 	            $('#summernote').summernote("insertNode", image[0]); // 
 	           
 	        }
 	    });
 	}
	
	function makeToast(title) {
		$('#toastMessage').text(title).fadeIn(400).delay(3000).fadeOut(400);
	}
	
  </script>
 
    
</head>

<body class="addBob">

	<div class="bg" style="background-image: url('../resources/images/wood_background.jpg')"></div>
    
    <div class="container">
    	<div class="page-header text-center" style="margin: 180px 0 150px 0; border: none;">
			<h3 class="text-info" style="color: #000; font-weight: bold; font-size: 30px;">[${categoryName}] �游���</h3>
		</div>
    
		<form class="form-horizontal" enctype="multipart/form-data">
		    <div class="form-group">
		    	<input type="hidden" name="writtenUserId" value="${user.userId}" />
		    	<input type="hidden" name="category" value="${param.category}" />
		    	<input type="hidden" name="latitude" />
		    	<input type="hidden" name="longitude" />
		    	<div class="row">
	            	<div class="col-sm-12 text-center" style="margin: 30px 0 30px 0;" >
	            		<input type="text" name="title" placeholder="����" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"
	            			title="Please provide your firstname."/>
	            	</div>
		    	</div>

		    	
	            <div class="row">
	            	<div class="col-xs-12">
	                	<textarea  id="summernote" name="content"></textarea>
	                </div>
	            </div>
	            
	            <hr/>
		    	
		    	<c:if test="${categoryName eq '�츮���ݸ���'}">
			    	<div class="row">
			    		<div class="col-sm-6 btn-bob" align="center">
			    			�����ο���
			    		</div>
		            	<div class="col-sm-6" align="left" style="padding-top: 8px;">
					    	<select name="limitNum" class="selectpicker show-tick" title="���� �ο���" >
					    	  <c:forEach var="i" begin="2" end="20" step="1">
					    	  	<option >${i}</option>
					    	  </c:forEach>
							</select>
							<span id="limitNumDuplicateCheck" style="color: red;" > * �ο����� 20�� �����Դϴ�.</span>
		            	</div>
			    	</div>
			    	
			    	<hr/>

		    	</c:if>
	            
	            <div class="row">
	            	<div class="col-sm-2 btn-bob">��ǥ���� ����</div>
	            	<div class="col-sm-2 text-center" style="padding-top: 7px;">
	            		<div class="checkbox">
	            			<label><input type="checkbox" name="imageCheck">�⺻���ȭ��</label>
	            		</div>
	            	</div>
	            	<div class="col-sm-8" align="center" style="padding-top: 7px;">
	            		<input id="input-b1" name="uploadFile" type="file" class="file" style="width:80%;"/>
	            	</div>
		    	</div>
		    	
		    	<hr/>
		    	
		    	<c:if test="${categoryName eq '�츮���ݸ���'}">
			    	<div class="row">
			    		<div class="col-sm-6 btn-bob">��¥</div>
		            	<div class="col-sm-6" align="center" style="padding-top: 8px;">
			                <div class="input-group date form_datetime col-md-5" data-date-format="yyyy-mm-dd P HH:ii" data-link-field="dtp_input1" style="width: 100%;"
			               		data-date-useseconds="false" data-date-pickDate="false">
			                    <input type="text" name="appointmentTime" class="form-control" style="font-size: 16px;" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
			                </div>
		            	</div>
			    	</div>
			    
			    	<hr>
			    </c:if>
			    	
		        <c:if test="${categoryName ne '�ֱ������θ���'}">
		            
		            <div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-bottom: 10px; border: 1px solid #5F4B8B;">
		            	<div class="col-xs-12 btn-bob" style="width: 100%; ">��ġ</div>
	
		            	<div class="col-xs-12" align="center">
		            		<input type="text" name="locationName" class="form-control" style="font-size: 16px; margin-top:10px; margin-bottom:10px;"
		            				placeholder="��ġ�� �������ּ���" />
		            		<div class="map_wrap">
							    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>	            		
		            	</div>
			    	</div>
		    	</c:if>
		    	
		    	<c:if test="${categoryName eq '�ֱ������θ���'}">
		    	
		    		<div class="row">
		            	<div class="col-sm-3 btn-bob">ȸ�� (��)</div>
		            	<div class="col-sm-3 text-center" style="padding-top: 7px;">
		            		<input type="text" class="form-control" name="fee" placeholder="(ex) 20000">
		            	</div>
		            	<div class="col-sm-3 btn-bob">ȸ�� ������</div>
		            	<div class="col-sm-3 text-center" style="padding-top: 7px;">
		            		<input type="date" class="form-control" name="feeDate" style="font-size: 16px;"/>
		            	</div>
			    	</div>
		    		
		    		<hr>
		    			    	
		            <div class="row" style="margin-top: 10px;">
		            	<div class="col-xs-12 btn-bob" style="width: 100%; ">�ʴ��� ģ��</div>
					</div>	

					<div class="row" style="padding: 10px;">

	            		<ul id="sortable1" class="col-sm-5 droptrue" align="center" style="background: #ccc; height: 200px; padding:5px;">
	            		
						</ul>

		            	<div class="col-sm-2" align="center">
		            		<button>����</button><br/>
		            		<button>������</button>
		            	</div>

						<ul id="sortable2" class="col-sm-5 droptrue" align="center" style="background: #ccc; height: 200px; padding: 5px;">
						  <c:forEach var="friend" items="${friend.list}">
							  <li class="ui-state-default">
							  	<div class="draggable_area">
							  		${friend.friendId}
							  	</div></li>
						  </c:forEach>
						</ul>		            	
	            	</div>		            	
			    	
		    	</c:if>
	
	            <div class="row" align="center">
	                <input type="button" name="addBob" class="btn-bob" style="margin: 10px; width:250px;" value="�� �����" >
	                <button class="btn-bob" style="background: #ededed; color: #4d4d4d; margin: 10px; width:250px;">���</button>
	            </div>
		    </div>
		</form>
	 </div>
	 
	 <div id="toastMessage" class='toastMessage' style='display:none'>Toast</div>
	        
    </body>
	
</html>