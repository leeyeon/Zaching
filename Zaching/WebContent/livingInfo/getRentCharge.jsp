<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
    <meta charset="utf-8">
    <title>좌표로 주소를 얻어내기</title>
 <link rel="stylesheet" type="text/css" href="/resources/livingInfo/rentcharge.css"/>
  

</head>
<body>
<input type="hidden" id="money" name="money" value="" />
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
 
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>
<script src="/resources/livingInfo/rentcharge.js"></script>
<script>

daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	
	
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
    	
        if (status === daum.maps.services.Status.OK) {
        	var location = result[0].address.address_name;
        	
        	 $.ajax( 
     				{
     					url : "/livingInfo/rest/rentcharge/"+location ,
     					method : "GET" ,
     					dataType : "text" ,
     					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
     					success : function(data , status) {

     						$("input:hidden[name='money']").val(data);

     					}
     			});
             
        	 var money = $("input:hidden[name='money']").val();
        	var mm = money.split(" ");
        	
        	if(money == 0){
        		mm[0] = "현재 데이터를 불러오는 중입니다...";
        		mm[1] = "현재 데이터를 불러오는 중입니다...";
        		mm[2] = "현재 데이터를 불러오는 중입니다...";
        	}
          	
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            
           
            
            
            var content = '<div class="bAddr">' +
                            '<span class="title">주소정보</span>' + 
                            detailAddr + '<span class="title">월세 : </span>'+ mm[0]+ '<span class="title">보증금 : </span>' + mm[1] +
                            '<span class="title">전세 : </span>' + mm[2] +
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            
        }   
        
 

    });
    
});
    



</script>
</body>
</html>
