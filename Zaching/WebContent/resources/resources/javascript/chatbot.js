$(function() {
	 $( "#fixedbtn" ).on("click" , function() {
		 
		 $( document ).ready(function() {
			    
			    showPopup();
			    function showPopup() { window.open("/livingInfo/getChatbot.jsp", "a", "width=350px, height=450px, left=1000, top=50"); }
			});
		});
});