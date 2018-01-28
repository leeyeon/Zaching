<%@page import="com.zaching.service.domain.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%

	User user = new User();
	user.setUserId(9);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>addBob</title>
    
    <jsp:include page="../resources/layout/sub_toolbar.jsp"/>
    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Make sure the path to CKEditor is correct. -->
    <script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	
	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
	        
	<jsp:include page="../resources/javascript/fileUploadCDN.jsp"/>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
	<script src="../resources/javascript/jquery.simple-dtpicker.js"></script>
	<link href="../resources/css/jquery.simple-dtpicker.css" rel="stylesheet" />

	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	
	   
<style>
	    
	body {
	    padding-top: 50px;
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
}
     
</style>

	<script type='text/javascript'>
	
	function fcnAddBob() {

		var title = $("input[name='title']").val();
		var detail = $("input[name='prodDetail']").val();
		var amount = $("input[name='amount']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if (title == null || name.length < 1) {
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (amount == null || amount.length < 1) {
			alert("상품개수는 반드시 입력하셔야 합니다.");
			return;
		}

		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		$("form").attr("method", "POST").attr("action", "/bob/addBob").submit();
	}
	
	$(function() {
		
		/*
		$("input[type='text']").on('focus', function() {
			$(this).addClass("focus");
		})
		*/

		
		$('button:contains("방 만들기")').on('click', function(){
			fcnAddBob();
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
	    	                	        
	    	                	        var obj = JSON.stringify(coords);
	    	                	        
	    	                	        console.log(obj);
	    	                	        
	    	                	        var obj = JSON.parse(obj);
	    	                	        console.log(obj);
	    	                	        console.log(obj.ib);
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


		$( "ul.droptrue" ).sortable({
		    connectWith: "ul"
		});
		
		$( "ul.dropfalse" ).sortable({
		    connectWith: "ul",
		    dropOnEmpty: false
		});
		
		$( "#sortable1, #sortable2" ).disableSelection();
			    
		});

</script>
 
    
</head>

<body>
    
    <div class="container">

    	<div class="page-header text-center">
			<h3 class="text-info" style="color: #4d4d4d; font-weight: bold;">[${categoryName}] 방만들기</h3>
		</div>
    
		<form class="form-horizontal" enctype="multipart/form-data">
		    <div class="form-group">
		    	<input type="hidden" name="writtenUserId" value="${user.userId}" />
		    	<input type="hidden" name="category" value="${param.category}" />
		    
		    	<div class="row">
		    		<div class="col-sm-2 btn-bob" >제목</div>
	            	<div class="col-sm-10" align="center">
	            		<input type="text" name="title" class="form-control" placeholder="제목" style="font-size: 16px;"/>
	            		<span id="titleDuplicateCheck" class="col-sm-12 text-left" style="color: red; display: none;" >글자수는 30자로 제한됩니다.</span>
	            	</div>
		    	</div>
		    	
		    	<hr/>
		    	
		    	<c:if test="${categoryName eq '우리지금만나'}">
			    	<div class="row">
			    		<div class="col-sm-6 btn-bob" align="center">
			    			제한인원수
			    		</div>
		            	<div class="col-sm-6" align="left" >
					    	<select name="limitNum" class="selectpicker show-tick" title="제한 인원수">
					    	  <c:forEach var="i" begin="2" end="20" step="1">
					    	  	<option >${i}</option>
					    	  </c:forEach>
							</select>
							<span style="color: red;" > * 인원수는 20명 제한입니다.</span>
		            	</div>
			    	</div>

		    	</c:if>
		    	
	            <div class="row">
	            	<div class="col-xs-12" style="margin-bottom:20px;">
	                	<textarea name="content" id="ckeditor"></textarea>
	                	<div id="summernote"><p>Hello Summernote</p></div>
						  <script>
							$(document).ready(function() { 
								$('#summernote').summernote({ 
									placeholder: 'Hello bootstrap 4',
									callbacks: { // 콜백을 사용
				                        // 이미지를 업로드할 경우 이벤트를 발생
									    onImageUpload: function(files, editor, welEditable) {
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
						 		//data = new FormData();
						 	    //data.append("uploadFile", file);
						 	    $.ajax({ // ajax를 통해 파일 업로드 처리
						 	    	url : "/bob/rest/addSummernoteImage",
						 	    	method : "POST",
						 	    	contentType : "application/json; charset=UTF-8",
						 	    	data : JSON.stringify({
						 	    		uploadFile : file
									}),
									dataType : "json",
						 	        cache : false,
						 	        processData : false,
						 	        success : function(data) { // 처리가 성공할 경우
					                    // 에디터에 이미지 출력
						 	        	$(editor).summernote('editor.insertImage', data.url);
						 	        }
						 	    });
						 	}
						  </script>
	                </div>
	            </div>
	            
	            <hr/>
	            
	            <div class="row">
	            	<div class="col-sm-2 btn-bob">대표사진 설정</div>
	            	<div class="col-sm-2 text-center" style="padding-top: 7px;">
	            		<div class="checkbox">
	            			<label><input type="checkbox" name="imageCheck" value="">기본배경화면</label>
	            		</div>
	            	</div>
	            	<div class="col-sm-8" align="center" style="padding-top: 7px;">
	            		<input id="input-b1" name="uploadFile" type="file" class="file" style="width:80%;"/>	            		
	            	</div>
		    	</div>
		    	
		    	<hr/>
		    	
		    	<c:if test="${categoryName ne '주기적으로만나'}">
			    	<div class="row">
			    		<div class="col-sm-6 btn-bob">날짜</div>
		            	<div class="col-sm-6" align="center">
		            		<input type="date" name="appointmentTime" class="form-control" placeholder="날짜" style="font-size: 16px;"/>
		            	</div>
			    	</div>
		            
		            <div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-bottom: 10px; border: 1px solid #5F4B8B;">
		            	<div class="col-xs-12 btn-bob" style="width: 100%; ">위치</div>
	
		            	<div class="col-xs-12" align="center">
		            		<input type="text" name="locationName" class="form-control" style="font-size: 16px; margin-top:10px; margin-bottom:10px;"
		            				placeholder="위치를 지정해주세요" />
		            		<span id="locationDuplicateCheck" class="col-sm-12 text-center" style="color: red; margin-bottom:10px; ">장소를 검색하세요.</span>
		            		<div class="map_wrap">
							    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>
							<script src="/resources/javascript/map.js"></script>	            		
		            	</div>
			    	</div>
		    	</c:if>
		    	
		    	<c:if test="${categoryName eq '주기적으로만나'}">
		            <div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-bottom: 10px; border: 1px solid #5F4B8B;">
		            	<div class="col-xs-12 btn-bob" style="width: 100%; ">초대할 친구</div>
						
						<div class="row" style="padding: 20px;">
						
			            	<div class="col-sm-5" align="center" style="border: 1px solid #5F4B8B; height: 350px;">
			            		<ul id="sortable1" class="droptrue">
			            		 <li class="ui-state-default">Item 3</li>
								  <li class="ui-state-default">Item 4</li>
								  <li class="ui-state-default">Item 5</li>
								</ul>
			            	</div>
			            	
			            	<div class="col-sm-2" align="center">
			            		ㅇㅅㅇ
			            	</div>
			            	
			            	<div class="col-sm-5" align="center" style="border: 1px solid #5F4B8B; height: 350px;">
				            	
								 
								<ul id="sortable2" class="droptrue">
								  <li class="ui-state-default">Can be dropped..</li>
								  <li class="ui-state-default">..on an empty list</li>
								  <li class="ui-state-default">Item 3</li>
								  <li class="ui-state-default">Item 4</li>
								  <li class="ui-state-default">Item 5</li>
								</ul>
			            	</div>
			            	
			            	http://jqueryui.com/sortable/#empty-lists
		            	
		            	</div>
		            	
			    	</div>
		    	</c:if>
				
	            <div class="row" align="center">
	                <button type="submit" class="btn-bob" style="margin: 10px; width:250px;" >방 만들기</button>
	                <button type="reset" class="btn-bob" style="background: #ededed; color: #4d4d4d; margin: 10px; width:250px;">취소</button>
	            </div>
		    </div>
		</form>
	 </div>
	        
    </body>
    
    
    <script>
         // Replace the <textarea id="editor1"> with a CKEditor
         // instance, using default configuration.
         CKEDITOR.replace('ckeditor',{
		      height: 300,
		      filebrowserUploadUrl: '${pageContext.request.contextPath}/test/ckeditorImageUpload'
		  } );
		         
         CKEDITOR.on('dialogDefinition', function( ev ){
             var dialogName = ev.data.name;
             var dialogDefinition = ev.data.definition;
           
             switch (dialogName) {
                 case 'image': //Image Properties dialog
                     //dialogDefinition.removeContents('info');
                     dialogDefinition.removeContents('Link');
                     dialogDefinition.removeContents('advanced');
                     break;
             }
         });
     </script>

	
</html>

