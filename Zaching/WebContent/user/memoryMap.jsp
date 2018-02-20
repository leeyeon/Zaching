<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
<!--   jQuery , Bootstrap CDN  -->
	<meta name="author" content="pixelhint.com">
	<meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
	<jsp:include page="/resources/layout/sub_toolbar.jsp"/>


<!-- Bootstrap Dropdown Hover JS -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<style>

		

/* 템플릿적용 */
.hero {
			background: url('../resources/images/memoryMAP.jpg') no-repeat bottom center;
			background-size: cover;
			background-repeat: no-repeat, no-repeat;
			background-position: center center; height:700px;
		}
		
#map{
    margin-left: 10px;
    margin-top: 100px;
    padding-bottom: 100px;
    
}



.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>

</head>

<body>

	<section class="hero">
		<section class="caption">
				<h2 class="caption">Memory Map</h2>
		</section>
	</section><!--  end hero section  -->


<div  class="page-body" id="map" style="width:70%; height:350px;" align="center"></div>
<input type="hidden" value="${user.userId}" name="userId" id="userId"/>
<input type="hidden"  name="locationX" value=""/>
<input type="hidden" name="locationY" value="" />



<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=clusterer"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(36.566826, 126.9786567), // 지도의 중심좌표
    level: 15// 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var clusterer = new daum.maps.MarkerClusterer({
	
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 5,
    calculator: [3, 5, 10, 20],
    styles: [{ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
        width : '20px', height : '20px',
        background: 'rgba(255, 178, 217, .8)',
        borderRadius: '15px',
        color: '#000',
        textAlign: 'center',
        fontWeight: 'bold',
        lineHeight: '31px',
     },
    {
        width : '30px', height : '30px',
        background: 'rgba(243, 97, 166, .8)',
        borderRadius: '20px',
        color: '#000',
        textAlign: 'center',
        fontWeight: 'bold',
        lineHeight: '41px'
    },
    {
        width : '40px', height : '40px',
        background: 'rgba(241, 95, 95, .8)',
        borderRadius: '25px',
        color: '#000',
        textAlign: 'center',
        fontWeight: 'bold',
        lineHeight: '51px'
    },
    {
        width : '50px', height : '50px',
        background: 'rgba(204, 61, 61, .8)',
        borderRadius: '30px',
        color: '#000',
        textAlign: 'center',
        fontWeight: 'bold',
        lineHeight: '61px'
    }
]



    
});


var userId = "${sessionScope.user.userId}"; //"3";

$(function() {	
	
	$.ajax({
				url : "/user/rest/memoryMap/"+userId,
				method : "GET" ,
				dataType : "json",										
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},success : function(jsonData , status) {
				       		var markers = $(jsonData.positions).map(function(i, position) {
				        	var imageSrc = jsonData.positions[i].imgsrc, // 마커이미지의 주소입니다    
				            imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
				            imageOprion = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 
				            //마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
								
				            console.log(imageSrc); 
				        	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOprion);
				        	
				        	console.log(markerImage);
				        	
				            return new daum.maps.Marker({
				            	position : new daum.maps.LatLng(position.lat, position.lng),
				                image : markerImage // 마커 이미지 
				            });

				        // 클러스터러에 마커들을 추가합니다
				        
				    });
				        clusterer.addMarkers(markers);
				        
					}
			
			});	
		});


</script>




</body>
</html>