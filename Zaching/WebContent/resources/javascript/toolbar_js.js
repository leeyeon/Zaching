$(function() {
	
	$('.collapse .navbar-collapse').css('visibility','hidden');
	
	$('body > nav > div.container > div > div:nth-child(3)').addClass('active');
	
	$('.mainbar-menu').on('click', function(){
		 $('.active').removeClass('active');
		 $(this).addClass('active');
	})

	$(window).resize(function(){
	     if($( window ).width() > 1200) {
	    	 $('.mainbar').show();
	    	 $('.navbar-brand').css('visibility','hidden');
	    	 $('.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form')
				.css('visibility','hidden');
	     } else {
	    	 $('.mainbar').hide();
	    	 $('.navbar-brand').css('visibility','visible');
	    	 $('.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form')
				.css('visibility','visible');
	     }
	}).resize();

	  $(document).ready(function(){
		$(function () {
			$(window).scroll(function () {
	            // set distance user needs to scroll before we fadeIn navbar
				if ($(this).scrollTop() > 200) {
					$('.mainbar').fadeOut();
					$('.navbar-brand').css('visibility','visible');
					$('.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form')
						.css('visibility','visible');
				} else {
					$('.mainbar').fadeIn();
					 $('.navbar-brand').css('visibility','hidden');
					$('.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form')
					.css('visibility','hidden');
				}
			});

		});

	});
});