function success(position) {
	var s = document.querySelector('#status');

	if (s.className == 'success') {
		// not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back
		return;
	}

	s.innerHTML = "found you!";
	/*위치를 찾았을 시 나오는 메시지입니다.*/
	s.className = 'success';

	var mapcanvas = document.createElement('div');
	mapcanvas.id = 'mapcanvas';
	mapcanvas.style.height = '400px';
	//맵을 불러오는 높이를 설정합니다.
	mapcanvas.style.width = '560px';
	//맵을 불러오는 넓이를 설정합니다.

	document.querySelector('article').appendChild(mapcanvas);

	var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	var myOptions = {
		/*지도를 나타낼 시 확대 크기를 설정합니다.*/
		zoom : 15,
		center : latlng,
		mapTypeControl : false,
		navigationControlOptions : {
			style : google.maps.NavigationControlStyle.SMALL
		},
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

	var marker = new google.maps.Marker({
		position : latlng,
		map : map,
		title : "You are here! (at least within a " + position.coords.accuracy + " meter radius)"
	});
}

function error(msg) {
	var s = document.querySelector('#status');
	s.innerHTML = typeof msg == 'string' ? msg : "failed";
	s.className = 'fail';

	// console.log(arguments);
}

// geolocation를 허용하는 경우
if (navigator.geolocation) {
	// 현재 좌표를 획득
	// navigator.geolocation.getcurrentposition(성공 시 Callback, 실패 시 Callback, 옵션);
	navigator.geolocation.getCurrentPosition(success, error);
} else {
	error('not supported');
}