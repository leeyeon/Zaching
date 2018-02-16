<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="vo1" value="a" scope="session" />

 <html>
 <head>
 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 </head>
 <body>

 </body>
 </html>
 <script type="text/javascript">
 
 $(function() {

 
 window.addEventListener('load', function () {
	  // At first, let's check if we have permission for notification
	  // If not, let's ask for it
	  if (Notification && Notification.permission !== "granted") {
	    Notification.requestPermission(function (status) {
	      if (Notification.permission !== status) {
	        Notification.permission = status;
	      }
	    });
	  }
		
	  <c:if test="${vo1 eq 'a'}">
	  	alert("뀨");
	  </c:if>
	  
	  
	
	    // If the user agreed to get notified
	    if (Notification && Notification.permission === "granted") {
	    	var n = new Notification('알림 도착쓰', { 
				body: '새로운 알림이 도착했어요!',
				icon: '/resources/images/profile_test.png'
			}); 
	    	
	    	
	    }
	     else if (Notification && Notification.permission !== "denied") {
	      Notification.requestPermission(function (status) {
	        if (Notification.permission !== status) {
	          Notification.permission = status;
	        }

	        // If the user said okay
	        if (status === "granted") {
	          var n = new Notification("000");
	        }

	        // Otherwise, we can fallback to a regular modal alert
	        else {
	          alert("111");
	        }
	      });
	    }

	    // If the user refuse to get notified
	    else {
	      // We can fallback to a regular modal alert
	      alert("222");
	    }
	  });
 });
 </script>