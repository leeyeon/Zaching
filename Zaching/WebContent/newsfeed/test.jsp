$.ajax( 
		{
			url : "/user/rest/memoryMap/"+userId,
			method : "GET" ,
			dataType : "json",										
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},success : function(jsonData , status) {
				console.log(jsonData);
				jsonData = {
						  "positions": [
							    {
							      "lat": 37.27943075229118,
							      "lng": 127.01763998406159,
							      "imgsrc": '../resources/images/profile_test.png'
							    },
							    {
							      "lat": 37.55915668706214,
							      "lng": 126.92536526611102,
							      "imgsrc": '../resources/images/test_2.jpg'
							    }
							    ]}
				alert(jsonData);
				$.get(jsonData, function(data) {
			        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
			        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
			        var markers = $(data.positions).map(function(i, position) {
			            return new daum.maps.Marker({
			            	position : new daum.maps.LatLng(position.lat, position.lng),
			                image : imgsrc // 마커 이미지 
			            });
			        });

			        // 클러스터러에 마커들을 추가합니다
			        clusterer.addMarkers(markers);
			    });
				
				}
		});	