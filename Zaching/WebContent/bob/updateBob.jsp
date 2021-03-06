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
	
	   
<style>
	    
	body {
	    padding-top: 100px;
	}
	    
	.btn-bob {
		background: #5F4B8B; 
		border: none; 
		color: rgb(255, 255, 255); 
		font-size: 15px; 
		font-weight: bold;
		text-align: center;
		height: 50px;
		line-height: 50px;
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
	
	#addBob > div > div:nth-child(2) > div.col-xs-10 > div {
		width:100%;
		padding-top: 7px;
	}
	
	.datepicker {
		width: 100%;
	}
	
	body > div.container > form > div > div:nth-child(10) > div > div.datepicker_inner_container > div.datepicker_calendar {
		width: 50%;
	}
	
	body > div.container > form > div > div:nth-child(10) > div > div.datepicker_inner_container > div.datepicker_calendar > table {
		width: 50%;
	}
	
	body > div.container > form > div > div:nth-child(10) > div > div.datepicker_inner_container > div.datepicker_timelist {
		width: 50%;
	}
	
	/* 친구목록 */
	
	#sortable1, #sortable2 { 
		list-style-type: none; 
		margin: 0; 
		padding: 0; 
		margin-bottom: 10px;
		overflow-y: auto;
    	overflow-x: hidden;
	}
	
  	.ui-state-default { 
  		margin: 5px; 
  		padding: 10px;
  		z-index: 100;
  	}
}
     
</style>

	<script type='text/javascript'>
	
	function fcnUpdateBob() {


		$("form").attr("method", "POST").attr("action", "/bob/updateBob").submit();
	}
	
	$(function() {
		
		function parallax(){
   		    var scrolled = $(window).scrollTop();
   		    $('.bg').css('height', (570-scrolled) + 'px');
   		}
   	
   		$(window).scroll(function(e){
   		    parallax();
   		});
		
		$('button:contains("방 수정하기")').on('click', function(){
			fcnUpdateBob();
		});
		
		$(".button:contains('취소')").on("click", function() {
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
	    $("input[name='title']").keyup();
	    
	    $("input[name='title']").on({
	    	"focusin":function(){
	    		$('#titleDuplicateCheck').show();
	    	},
	    	"focusout":function(){
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
		    
		    var latitude = 37.498164651039694;
		    var longitude = 127.02830790088069;
		    
	    	<c:if test="${!empty bob.longitude}">
	    		latitude = ${bob.latitude};
	    		longitude = ${bob.longitude};
	    	</c:if>
		    
		    var markers = {
		         position: new daum.maps.LatLng(latitude, longitude), 
		         text: '${bob.locationName}'
		     };
	
		    var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
		        contentNode = document.createElement('div');
		     
		    var mapContainer = document.getElementById('map'), 
		        mapOption = {
		            center: new daum.maps.LatLng(latitude, longitude), 
		            level: 2
		        };  
		    var map = new daum.maps.Map(mapContainer, mapOption); 
	
	    </c:if>

		$( "#sortable1, #sortable2" ).sortable({
			cursor: "move",
		    connectWith: "ul",
		    dropOnEmpty: true
		}).disableSelection();
	    
	    $("div.file-caption.form-control.kv-fileinput-caption > input").attr("placeholder", "파일을 선택해주세요.");

	    $("input[name=imageCheck]").on('click', function() {
	    	//alert("1");
	    	if($("#input-b1").is(":disabled")) {
	    		//alert("2");
	    		$("#input-b1").prop('disabled', false);
	    		$("div.file-caption.form-control.kv-fileinput-caption > input").attr("placeholder", "파일을 선택해주세요.");
	    		$("div.file-caption.form-control.kv-fileinput-caption").css('background','');
	    	} else {
	    		//alert("3");
	    		$("#input-b1").prop('disabled', true);
	    		$("div.file-caption.form-control.kv-fileinput-caption > input").attr("placeholder", "기본 배경화면을 선택하셨습니다.");
	    		$("div.file-caption.form-control.kv-fileinput-caption").css('background','#ccc');
	    	}
	    });
	    
	    $('.form_datetime').datetimepicker({
	        language:  'ko',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			forceParse: 0,
	        showMeridian: 1,
	        startDate: new Date()
	    });
		
	    /* surmmernote*/
	    
	    $('#summernote').summernote({ 
			placeholder: '이번 밥친구 모임에 대하여 설명해주세요.',
			callbacks: { // 콜백을 사용
                      // 이미지를 업로드할 경우 이벤트를 발생
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
           // 파일 전송을 위한 폼생성
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
 	        success : function(data, status) { // 처리가 성공할 경우
                   // 에디터에 이미지 출력
                   console.log(status);
                   console.log(data);
                   console.log(data.url);
                   
 	        	$('#summernote').summernote('editor.insertImage', data.url);
 	        	 var image = $('<img>').attr('src', '' + data.url); // 에디터에 img 태그로 저장
 	            $('#summernote').summernote("insertNode", image[0]); // 
 	           
 	        }
 	    });
 	}
  </script>
 
    
</head>

<body class="addBob">

	<div class="bg" style="background-image: url('../resources/images/wood_background.jpg')"></div>
    
    <div class="container">
    	<div class="page-header text-center" style="margin: 180px 0 110px 0; border:none;">
			<h3 class="text-info" style="color: #000; font-weight: bold; font-size: 30px;">[${categoryName}] 방 수정하기</h3>
		</div>
    
		<form class="form-horizontal" enctype="multipart/form-data" style="background: #FFF; padding: 40px;">
		    <div class="form-group">
		    	<input type="hidden" name="writtenUserId" value="${user.userId}" />
		    	<input type="hidden" name="category" value="${param.category}" />
		    	<input type="hidden" name="latitude" value="${bob.latitude}"/>
		    	<input type="hidden" name="longitude" value="${bob.longitude}"/>
		    	<input type="hidden" name="bobId" value="${bob.bobId}" />
		    	<div class="row">
	            	<div class="col-sm-12 text-center" style="margin: 30px 0 30px 0;" >
	            		<input type="text" name="title" placeholder="제목" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"
	            			value="${bob.title}"/>
	            	</div>
		    	</div>

		    	<c:if test="${categoryName eq '우리지금만나'}">
			    	<div class="row">
			    		<div class="col-sm-6 btn-bob" align="center">
			    			제한인원수
			    		</div>
		            	<div class="col-sm-6" align="left" style="padding-top: 8px;">
					    	<select name="limitNum" class="selectpicker show-tick" title="제한 인원수">
					    	  <c:forEach var="i" begin="${bob.limitNum}" end="20" step="1">
					    	  	<option ${bob.limitNum == i? 'selected':''}>${i}</option>
					    	  </c:forEach>
							</select>
							<span style="color: red;"> * 기존 제한 인원수보다 많거나 같아야 합니다.</span>
		            	</div>
			    	</div>
			    	
			    	<hr/>

		    	</c:if>
		    	
	            <div class="row">
	            	<div class="col-xs-12">
	                	<textarea id="summernote" name="content">${bob.content}</textarea>
	                </div>
	            </div>
	            
	            <hr/>
	            
	            <div class="row">
	            	<div class="col-sm-4 btn-bob">대표사진 설정</div>    
	            	<c:if test="${!empty bob.image}">
	            		<div class="col-sm-8 text-center" style="padding-top: 16px; display: -webkit-inline-box; padding-left:50px;">
		            		배경화면이 설정되어 있습니다. 변경하시겠습니까?<button class="form-control" style="width: 80px; margin-left: 30px;">변경</button>
			            </div>
	            	</c:if>      		
		    	</div>
	            <div class="row text-center">
	            	
	            	<c:if test="${empty bob.image}">
		            	<div class="col-sm-2 text-center" style="padding-top: 7px;">
		            		<div class="checkbox">
		            			<label><input type="checkbox" name="imageCheck" >기본배경화면</label>
		            		</div>
			            </div>
		            	<div class="col-sm-10" align="center" style="padding-top: 7px;">
		            		<input id="input-b1" name="uploadFile" type="file" class="file" style="width:80%;"/>
		            	</div>
	            	</c:if>	            		
		    	</div>
		    	
		    	<hr/>
		    	
		    	<c:if test="${categoryName ne '주기적으로만나'}">
			    	<div class="row">
			    		<div class="col-sm-6 btn-bob">날짜</div>
		            	<div class="col-sm-6" align="center" style="padding-top: 8px;">
			                <div class="input-group date form_datetime col-md-5" data-date-format="yyyy-mm-dd p HH:ii" data-link-field="dtp_input1" style="width: 100%;">
			                    <input type="text" name="appointmentTime" class="form-control" style="font-size: 16px;" value="${bob.appointmentTime}" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
			                </div>
		            	</div>
			    	</div>
			    	
			    	<hr>
		            
		            <div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-bottom: 10px; border: 1px solid #5F4B8B;">
		            	<div class="col-xs-12 btn-bob" style="width: 100%; ">위치</div>
	
		            	<div class="col-xs-12" align="center">
		            		<input type="text" name="locationName" class="form-control" style="font-size: 16px; margin-top:10px; margin-bottom:10px;"
		            				placeholder="위치를 지정해주세요" value="${bob.locationName}" />
		            		<span id="locationDuplicateCheck" class="col-sm-12 text-center" style="color: red; margin-bottom:10px; visibility: hidden; ">장소를 검색하세요.</span>
		            		<div class="map_wrap">
							    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>
		            	</div>
			    	</div>
		    	</c:if>
		    	
		    	<hr>
		    	
		    	<c:if test="${categoryName eq '주기적으로만나'}">
		    			    	
		    		<div class="row">
		            	<div class="col-sm-3 btn-bob">수정할 회비 (원)</div>
		            	<div class="col-sm-3 text-center" style="padding-top: 7px;">
		            		<input type="text" class="form-control" name="fee" value="${bob.fee}" placeholder="(ex) 20000">
		            	</div>
		            	<div class="col-sm-3 btn-bob">수정할 회비날짜</div>
		            	<div class="col-sm-3 text-center" style="padding-top: 7px;">
		            		<input type="date" name="feeDate" class="form-control" value="${bob.feeDate}" style="font-size: 16px;"/>
		            	</div>
			    	</div>
			    	
			    	<hr>
		    	
		    	</c:if>
	    		
	    		
		    		
	            <div class="row" align="center">
	                <button type="submit" class="btn-bob" style="margin: 10px; width:250px;">방 수정하기</button>
	                <button type="reset" class="btn-bob" style="background: #ededed; color: #4d4d4d; margin: 10px; width:250px;">취소</button>
	            </div>
	            
	            <hr>
	            
	            <div class="text-center">방 삭제하기</div>
		    </div>
		</form>
	 </div>
	        
    </body>
	
</html>