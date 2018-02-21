<%@page import="com.zaching.service.domain.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
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
  	
  	<script type="text/javascript" src="../resources/javascript/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="../resources/javascript/moment.js"></script>
	<script type="text/javascript" src="../resources/javascript/moment-ko.js"></script>
  	
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
			makeToast("제목을 입력해주세요.");
			return false;
		}
		
		if(content.val() == "") {
			$("body > div.container > form > div > div:nth-child(6) > div > div > div.note-editing-area > div.note-editable").focus();
			makeToast("내용을 입력해주세요.");
			return false;
		}
		
		if(imageCheck.is(":checked") == true) {
			uploadFile.val("");
		} else {
			if(uploadFile.val() ==""){
				uploadFile.focus();
				makeToast("대표사진을 선택해주세요.");
				return false;
			}
		}
		
		if(category.val() == "B01" ) {
			if(limitNum.val() == ""){
				limitNum.focus();
				makeToast("제한인원수를 선택해주세요.");
				return false;
			}
			if(appointmentTime.val() == "") {
				if (confirm("약속 날짜가 정해지지 않으셨나요? \n 날짜 미선택 시 참가신청을 받을 수 없습니다.") == true){
					
			   	}else{
			   	    return false;
			   	}
			}
		}

		if(category.val() == "B01" ||  category.val() == "B02") {
			if(locationName.val() == "") {
				locationName.focus();
				makeToast("위치를 지정해주세요.");
				return false;
			}
		}
		
		if(category.val() == "B03") {
			if(fee.val() == "") {
				fee.focus();
				makeToast("회비를 지정해주세요.");
				return false;
			} else if(fee.val() < 0 || fee.val()>30000) {
				makeToast("회비는 0부터 30,000원까지 가능합니다.");
				return false;
			}
			
			if(feeDate.val() == "") {
				feeDate.focus();
				makeToast("회비 납부일을 지정해주세요.");
				return false;
			} else {
				//alert(feeDate.val().subString);
			}
			
			if($("#sortable1").children().size() <= 1) {
				makeToast("친구를 한 명이상 선택해주세요.");
				return false;
			}

		}
		
		$('#sortable1 input').each(function(index, value) {
			alert($($('#sortable1 input')[index]).val());
			var input = $("<input>") .attr("type", "hidden") .attr("name", "friendId").val($($('#sortable1 input')[index]).val());
			alert(input);
			$("form").append(input);
		})
		
		$("form").attr("method", "POST").attr("action", "/bob/addBob").submit();

	}
	
	$(function() {
		
		function parallax(){
   		    var scrolled = $(window).scrollTop();
   		    $('.bg').css('height', (570-scrolled) + 'px');
   		}
   	
   		$(window).scroll(function(e){
   		    parallax();
   		});

		$('input[name=addBob]').on('click', function(){
			fcnAddBob();
		});
		
		$("input[name=cancle]").on("click", function() {
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
	    
	    $(document).on('click', "#sortable2 > li", function() {
	    	$(this).remove();
	    	$("#sortable1").append('<li class="ui-state-default ui-sortable-handle">'+$(this).html()+'</li>');
	    	
	    	$("#selectedFriend").text($("#sortable1").children().size() - 1);
	    	
	    	$("#defaultFriend").hide();
	    });
	    
	    $(document).on('click', "#sortable1 > li" , function() {

	    	$(this).remove();
	    	$("#sortable2").append('<li class="ui-state-default ui-sortable-handle">'+$(this).html()+'</li>');
	    	$("#defaultFriend").hide();
	    	
	    	$("#selectedFriend").text($("#sortable1").children().size() - 1);
	    	
	    	//alert($("#sortable1").children().size());
	    	if($("#sortable1").children().size() == 1) {
	    		$("#defaultFriend").show();
	    	}
	    });
	    
	    /*
	    $(document).on('draggable', "#sortable1" , function() {
	    	alert();
	    	//alert($("#sortable1").children().size());
	    	if($("#sortable1").children().size() == 1) {
	    		$("#defaultFriend").show();
	    	}
	    });
	    */
	    
	    // 오늘 날짜로 세팅 (B03 -feeDate)
	    var today = moment().format('YYYY-MM-DD');
	    $("input[name=feeDate]").val(today);
	    
	    $('input.searchFriend').on('keydown keyup', function() {

	    	if($(this).val().length >= 1) {
	    		
	    		var element = $("#sortable2 > li > div > span");
	    		
		    	if(element.text().indexOf($(this).val()) > -1) {
		    		
		    		$("#sortable2 > li").hide();
		    		$("#sortable2 > li:contains('"+$(this).val()+"')").show();
			    } else {
			    	$("#sortable2 > li").show();
			    }
	    	} else {
	    		$("#sortable2 > li").show();
	    	}
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
	
	function makeToast(title) {
		$('#toastMessage').text(title).fadeIn(400).delay(3000).fadeOut(400);
	}
	
  </script>
<<<<<<< HEAD
	 <style>
	      @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	      h3 { font-family: 'Nanum Pen Script', cursive; }
	      
	      .nav a{
font-family: 'Hanna', serif;"
}
=======
	<style>
     @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
     h3 { font-family: 'Nanum Pen Script', cursive; }
     
     .searchFriend {
     	    display: inline-block;
	    box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    padding: 2px 30px 2px 8px;
	    line-height: 22px;
	    font-weight: normal;
	    font-size: 15px;
	    letter-spacing: 0;
	    color: #000;
	    vertical-align: middle;
	    background: none; 
	    border: none; 
	    width: 100%; 
	    padding: 5px 5px 5px 30px;
	    
     }
     
    .searchFriend:focus {
         border-color: red;
         outline: none;
    }
	      
	.icon-search {
	    overflow: hidden;
	    background-image: url(../resources/images/sp.png);
	    line-height: 999em;
	    vertical-align: top;
	    color: transparent;
	    width: 20px;
	    height: 20px;
	    display: inline-block;
	    background-position: -362px -159px;
		position: absolute;
		top: 12px;
	    left: 15px;
	}
>>>>>>> refs/remotes/origin/master
	</style>
    
</head>

<body class="addBob">

	<div class="bg" style="background-image: url('../resources/images/wood_background.jpg')"></div>
    
    <div class="container">
    	<div class="page-header text-center" style="margin: 180px 0 140px 0; border: none;">
			<h3 class="text-info" style="color: #fff; font-size: 45px;">[${categoryName}] 방만들기</h3>
		</div>
    
		<form class="form-horizontal" enctype="multipart/form-data" style="background: #FFF; padding: 10px;">
		    <div class="form-group">
		    	<input type="hidden" name="writtenUserId" value="${user.userId}" />
		    	<input type="hidden" name="category" value="${param.category}" />
		    	<input type="hidden" name="latitude" />
		    	<input type="hidden" name="longitude" />
		    	<div class="row">
	            	<div class="col-sm-12 text-center" style="margin: 30px 0 30px 0;" >
	            		<input type="text" name="title" placeholder="제목" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"/>
	            	</div>
		    	</div>

		    	
	            <div class="row">
	            	<div class="col-xs-12">
	                	<textarea  id="summernote" name="content"></textarea>
	                </div>
	            </div>
	            
	            <hr/>
		    	
		    	<c:if test="${categoryName eq '우리지금만나'}">
			    	<div class="row">
			    		<div class="col-sm-6 btn-bob" align="center">
			    			제한인원수
			    		</div>
		            	<div class="col-sm-3 text-center" style="padding-top: 8px; ">
					    	<select name="limitNum" class="selectpicker show-tick" title="제한 인원수"  >
					    	  <c:forEach var="i" begin="2" end="20" step="1">
					    	  	<option >${i}</option>
					    	  </c:forEach>
							</select>
		            	</div>
		            	<div class="col-sm-3 text-center" style="line-height: 50px;">
		            		<span id="limitNumDuplicateCheck" style="color: red;" > * 인원수는 20명 제한입니다.</span>
		            	</div>
			    	</div>
			    	
			    	<hr/>

		    	</c:if>
	            
	            <div class="row">
	            	<div class="col-sm-2 btn-bob">대표사진 설정</div>
	            	<div class="col-sm-2 text-center" style="padding-top: 7px;">
	            		<div class="checkbox">
	            			<label><input type="checkbox" name="imageCheck">기본배경화면</label>
	            		</div>
	            	</div>
	            	<div class="col-sm-8" align="center" style="padding-top: 7px;">
	            		<input id="input-b1" name="uploadFile" type="file" class="file" style="width:80%;"/>
	            	</div>
		    	</div>
		    	
		    	<hr/>
		    	
		    	<c:if test="${categoryName eq '우리지금만나'}">
			    	<div class="row">
			    		<div class="col-sm-6 btn-bob">날짜</div>
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
			    	
		        <c:if test="${categoryName ne '주기적으로만나'}">
		            
		            <div class="row" style="margin-top: 10px; margin-bottom: 10px; padding-bottom: 10px; border: 1px solid #5F4B8B;">
		            	<div class="col-xs-12 btn-bob" style="width: 100%; ">위치</div>
	
		            	<div class="col-xs-12" align="center">
		            		<input type="text" name="locationName" class="form-control" style="font-size: 16px; margin-top:10px; margin-bottom:10px;"
		            				placeholder="위치를 지정해주세요" />
		            		<div class="map_wrap">
							    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
							</div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>	            		
		            	</div>
			    	</div>
		    	</c:if>
		    	
		    	<c:if test="${categoryName eq '주기적으로만나'}">
		    	
		    		<div class="row">
		            	<div class="col-sm-3 btn-bob">회비 (원)</div>
		            	<div class="col-sm-3 text-center" style="padding-top: 7px;">
		            		<input type="text" class="form-control" name="fee" placeholder="(ex) 20000" />
		            	</div>
		            	<div class="col-sm-3 btn-bob">회비 납부일</div>
		            	<div class="col-sm-3 text-center" style="padding-top: 7px;">
		            		<input type="date" class="form-control" name="feeDate" style="font-size: 16px;"/>
		            	</div>
			    	</div>
		    		
		    		<hr>
		    			    	
		            <div class="row" style="margin-top: 10px;">
		            	<div class="col-xs-12 btn-bob" style="width: 100%; height: auto;">
		            		친구 초대 ( <span id="selectedFriend">0</span> 명 / 총 ${fn:length(friend.list)} 명 )
		            	</div>
					</div>	

					<div class="row" style="padding: 10px;">

	            		<ul id="sortable1" class="col-sm-6 droptrue" align="center" style="background: #efefef; height: 300px; padding:5px; border: 1px solid #a7a7a7;">
	            			<li id="defaultFriend" style="margin-top: 125px;">초대할 친구를 선택하거나 드래그해주세요.</li>
						</ul>
						
						<div class="col-sm-6" style="background: #efefef; height: 300px; padding: 5px; border: 1px solid #a7a7a7;">
							<div>
								<span class="icon-search"></span>
								<input type="text" class="searchFriend" placeholder="이름 검색" />
							</div>
							<ul id="sortable2" class="droptrue" align="center" style="height: 250px;">
							  <c:forEach var="friend" items="${friend.list}">
								  <li class="ui-state-default">
								  	<div class="draggable_area">
								  		
								  		<img class="userProfile" width="45px" height="45px"
										style=" border-radius: 40px; box-shadow: 1px #cccccc;"
										src = "../resources/upload_files/images/${friend.profileImage}"
										onerror="this.src='../resources/images/user-icon.png'" />
								  		<input type="hidden" value="${friend.friendId}">
								  		<span class="friendName">${friend.name}</span>
								  	</div></li>
							  </c:forEach>
							</ul>
						</div>	            	
	            	</div>		            	
			    	
		    	</c:if>
	
	            <div class="row" align="center">
	                <input type="button" name="addBob" class="btn-bob" style="margin: 10px; width:250px;" value="방 만들기" >
	                <input type="button" name="cancle" class="btn-bob" style="background: #ededed; color: #4d4d4d; margin: 10px; width:250px;" value="취소">
	            </div>
		    </div>
		</form>
	 </div>
	 
	 <div id="toastMessage" class='toastMessage' style='display:none'>Toast</div>
	        
    </body>
	
</html>