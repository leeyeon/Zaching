<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
</head>
<body>
	<button type="button" id="notification" onclick="defulatShowNotification();">notification</button>
	
	
    <script>
    navigator.serviceWorker.register('/resources/service-worker.js');
    function showNotification(title, message, url, icon) {
      Notification.requestPermission(function(result) {
        if (result === 'granted') {
          navigator.serviceWorker.ready.then(function(registration) {
            registration.showNotification(title, {
              body: message,
              icon: icon,
              vibrate: [200, 100, 200, 100, 200, 100, 200],
              tag: 'vibration-sample',
              data : url
            });
          });
        }
      });
    };
    
    function defulatShowNotification(){
    	showNotification('Vibration Sample', 'test!', 'http://www.naver.com', '../images/touch/chrome-touch-icon-192x192.png');
    }
    </script>
  </body>
</html>
