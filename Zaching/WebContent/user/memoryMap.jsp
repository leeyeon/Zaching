<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Bootstrap Dropdown Hover JS -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
    <style>
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
</head>

<body>
<div id="map" style="width:50%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=clusterer"></script>
<script>

var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
mapOption = { 
    center: new daum.maps.LatLng(36.566826, 126.9786567), // ������ �߽���ǥ
    level: 15// ������ Ȯ�� ����
};

var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

var clusterer = new daum.maps.MarkerClusterer({
	
    map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
    averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
    minLevel: 5,
    calculator: [3, 5, 10, 20],
    styles: [{ // calculator �� ���� �� ���� ����� ��Ÿ���� �����Ѵ�
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


var userId = "3";

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
				        	var imageSrc = jsonData.positions[i].imgsrc, // ��Ŀ�̹����� �ּ��Դϴ�    
				            imageSize = new daum.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
				            imageOprion = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
								
				            console.log(imageSrc); 
				        	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOprion);
				        	
				        	console.log(markerImage);
				        	
				            return new daum.maps.Marker({
				            	position : new daum.maps.LatLng(position.lat, position.lng),
				                image : markerImage // ��Ŀ �̹��� 
				            });

				        // Ŭ�����ͷ��� ��Ŀ���� �߰��մϴ�
				        
				    });
				        clusterer.addMarkers(markers);
				        
					}
			
			});	
		});


</script>
</body>
</html>