<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<link rel="stylesheet" type="text/css" href="/css/aroundsearch.css">

    <title>ī�װ��� ��� �˻��ϱ�</title>
   

</head>
<body>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
    //load�Լ��� �̿��Ͽ� core��ũ��Ʈ�� �ε��� �Ϸ�� ��, �����ȣ ���񽺸� �����մϴ�.
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ��Դϴ�.
                // ������ �����Ͽ� �پ��� Ȱ����� Ȯ���� ������.
            }
        }).open();
    });
</script>

<p style="margin-top:-12px">
    <em class="link">
        <a href="../../documentation/#CategoryCode" target="_blank">ī�װ� �ڵ����� ���÷��� ���⸦ Ŭ���ϼ���!</a>
    </em>
</p>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <ul id="category">
        <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            ����
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            ��Ʈ
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            �౹
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            ������
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            ī��
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            ������
        </li>
        
         <li id="PO3" data-order="6"> 
            <span class="category_bg cafe"></span>
            �������
        </li>       
    </ul>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>
<script>
// ��Ŀ�� Ŭ������ �� �ش� ����� �������� ������ Ŀ���ҿ��������Դϴ�
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // Ŀ���� ���������� ������ ������Ʈ �Դϴ� 
    markers = [], // ��Ŀ�� ���� �迭�Դϴ�
    currCategory = ''; // ���� ���õ� ī�װ��� ������ ���� �����Դϴ�
 
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        level: 5 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption); 

// ��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places(map); 

// ������ idle �̺�Ʈ�� ����մϴ�
daum.maps.event.addListener(map, 'idle', searchPlaces);

// Ŀ���� ���������� ������ ��忡 css class�� �߰��մϴ� 
contentNode.className = 'placeinfo_wrap';

// Ŀ���� ���������� ������ ��忡 mousedown, touchstart �̺�Ʈ�� �߻�������
// ���� ��ü�� �̺�Ʈ�� ���޵��� �ʵ��� �̺�Ʈ �ڵ鷯�� daum.maps.event.preventMap �޼ҵ带 ����մϴ� 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// Ŀ���� �������� �������� �����մϴ�
placeOverlay.setContent(contentNode);  

// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
addCategoryClickEvent();

// ������Ʈ�� �̺�Ʈ �ڵ鷯�� ����ϴ� �Լ��Դϴ�
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// ī�װ� �˻��� ��û�ϴ� �Լ��Դϴ�
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // Ŀ���� �������̸� ����ϴ� 
    placeOverlay.setMap(null);

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
        displayPlaces(data);
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // �˻������ ���°�� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���

    } else if (status === daum.maps.services.Status.ERROR) {
        // ������ ���� �˻������ ������ ���� ��� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
        
    }
}

// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayPlaces(places) {

    // ���° ī�װ��� ���õǾ� �ִ��� ���ɴϴ�
    // �� ������ ��������Ʈ �̹��������� ��ġ�� ����ϴµ� ���˴ϴ�
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
            var marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

            // ��Ŀ�� �˻���� �׸��� Ŭ�� ���� ��
            // ��������� ǥ���ϵ��� Ŭ�� �̺�Ʈ�� ����մϴ�
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position, order) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new daum.maps.Size(27, 28),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new daum.maps.Point(46, (order*36)), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new daum.maps.Point(11, 28) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}

// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// Ŭ���� ��Ŀ�� ���� ��� �������� Ŀ���� �������̷� ǥ���ϴ� �Լ��Դϴ�
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(���� : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// ī�װ��� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// Ŭ���� ī�װ����� Ŭ���� ��Ÿ���� �����ϴ� �Լ��Դϴ�
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
</script>
</body>
</html>

