<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<link rel="stylesheet" type="text/css" href="/resources/livingInfo/rentcharge.css"/>
</head>

<body>
<input type="hidden" id="money" name="money" value="" />
	<div class="container">
	<div class="page-header text-info">
<div class="map_wrap">
    <div id="map1" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>
 
</div>
</div>
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
        	
        	
            var detailAddr = !!result[0].road_address ? '<div>���θ��ּ� : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>���� �ּ� : ' + result[0].address.address_name + '</div>';
            
        	if(money == 0){
        		 var content = '<div class="bAddr">' +
                 '<span class="title">�ּ�����</span>' + 
                 detailAddr + '<span class="title">������ ������ �ҷ����� ���Դϴ�..</span>'+
             '</div>';
        	}
        	else{
        		
        		 var content = '<div class="bAddr">' +
                 '<span class="title">�ּ�����</span>' + 
                 detailAddr + '<span class="title">���� : </span>'+ mm[0]+"���� "+'<span class="title">������ : </span>' + mm[1] +"����"+
                 '<span class="title">���� : </span>' + mm[2] +"����"+
             '</div>';
        		
        	}
          
       

            // ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
            infowindow.setContent(content);
            infowindow.open(map, marker);
            
        }   
        
 

    });
    
});
    



</script>

</body>
</html>
