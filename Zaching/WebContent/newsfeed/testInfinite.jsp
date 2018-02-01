
<!DOCTYPE html><html lang='en' class=''>
<head>
<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/anon/pen/GQRbbB" />


<style class="cp-pen-styles">body {
	margin: 0;
	background-color: #F0F0F0;
	font-family: 'Liberation Sans', Arial, sans-serif;
}

h1 {
	text-align: center;
}

#images {
	margin: 0 auto;
	padding: 0;
	width: 640px;
	list-style-type: none;
}
</style></head><body>
<h1>Infinite Scrolling, Demo 3</h1>

		<ul id="images">
			<li>
				<a href="https://www.pexels.com/photo/mist-misty-fog-foggy-7919/">
					<img src="../resources/images/test_1.jpg" alt="" />
				</a>
			</li>
			<li>
				<a href="https://www.pexels.com/photo/landscape-nature-sunset-trees-479/">
					<img src="../resources/images/test_2.jpg" alt="" />
				</a>
			</li>
			<li>
				<a href="https://www.pexels.com/photo/landscape-sun-trees-path-21008/">
					<img src="../resources/images/test_3.jpg" alt="" />
				</a>
			</li>
			<li>
				<a href="https://www.pexels.com/photo/cold-snow-landscape-nature-1127/">
					<img src="../resources/images/test_4.jpg" alt="" />
				</a>
			</li>
			<li>
				<a href="https://www.pexels.com/photo/coastline-aerial-view-sea-9148/">
					<img src="../resources/images/test_5.jpg" alt="" />
				</a>
			</li>
		</ul>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script >

(function($){

  $.fn.endlessScroll = function(options) {
	
    var defaults = {
      bottomPixels: 50,
      fireOnce: true,
      fireDelay: 150,
      loader: "<br />Loading...<br />",
      data: "",
      insertAfter: "div:last",
      resetCounter: function() { return false; },
      callback: function() { return true; },
      ceaseFire: function() { return false; }
    };

    var options = $.extend({}, defaults, options);

    var firing       = true;
    var fired        = false;
    var fireSequence = 0;

    if (options.ceaseFire.apply(this) === true) {
      firing = false;
    }

    if (firing === true) {
      $(this).scroll(function() {
        if (options.ceaseFire.apply(this) === true) {
          firing = false;
          return; // Scroll will still get called, but nothing will happen
        }

        if (this == document || this == window) {
          var is_scrollable = $(document).height() - $(window).height() <= $(window).scrollTop() + options.bottomPixels;
        } else {
          // calculates the actual height of the scrolling container
          var inner_wrap = $(".endless_scroll_inner_wrap", this);
          if (inner_wrap.length == 0) {
            inner_wrap = $(this).wrapInner("<div class=\"endless_scroll_inner_wrap\" />").find(".endless_scroll_inner_wrap");
          }
          var is_scrollable = inner_wrap.length > 0 &&
            (inner_wrap.height() - $(this).height() <= $(this).scrollTop() + options.bottomPixels);
        }

        if (is_scrollable && (options.fireOnce == false || (options.fireOnce == true && fired != true))) {
          if (options.resetCounter.apply(this) === true) fireSequence = 0;

          fired = true;
          fireSequence++;

          $(options.insertAfter).after("<div id=\"endless_scroll_loader\">" + options.loader + "</div>");

          data = typeof options.data == 'function' ? options.data.apply(this, [fireSequence]) : options.data;

          if (data !== false) {
            $(options.insertAfter).after("<div id=\"endless_scroll_data\">" + data + "</div>");
            $("div#endless_scroll_data").hide().fadeIn();
            $("div#endless_scroll_data").removeAttr("id");

            options.callback.apply(this, [fireSequence]);

            if (options.fireDelay !== false || options.fireDelay !== 0) {
              $("body").after("<div id=\"endless_scroll_marker\"></div>");
              // slight delay for preventing event firing twice
              $("div#endless_scroll_marker").fadeTo(options.fireDelay, 1, function() {
                $(this).remove();
                fired = false;
              });
            }
            else {
              fired = false;
            }
          }

          $("div#endless_scroll_loader").remove();
        }
      });
    }
  };

})(jQuery);


// Script
$(function() {
	
	
	$(document).endlessScroll(
			{
		inflowPixels: 300,
		callback: function() {
      var $img = $('#images li:nth-last-child(5)').clone();
      $('#images').append($img);
		}
	});
});

//# sourceURL=pen.js
</script><script src="//production-assets.codepen.io/assets/editor/live/check-c263eb37bf3a3d49b8311c096168b478f5750c61a1166ea2cc660498870d671f.js"></script>
</body></html>