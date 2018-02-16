<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
</head>
<style>
body {
  margin: 0;
}

img {
  display: block;
}

.foreground {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  z-index: 1;
}

.ufo_section {
  height: 100%;
  background: url(/resources/images/ufo.svg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 40% auto;
  background-attachment: fixed;
}

.comet_section {
  height: 100%;
  background: url(/resources/images/alien_comet.svg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 15% auto;
  background-attachment: fixed;
}

.landing_section {
  height: 100%;
  background: url(/resources/images/alien_landing.svg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 15% auto;
  background-attachment: fixed;
  position: relative;
}

a {
  color: #CAFEFF;
  font-family: sans-serif;
}

footer {
  width: 100%;
  text-align: center;
  position: absolute;
  bottom: 0;
  left: 0;
  z-index: 2;
}
</style>
<body>

  <img class="background" src="/resources/images/background.svg">

  <div class="foreground">
    <div class="ufo_section"></div>
    <div class="spacer_one"></div>
    <div class="comet_section"></div>
    <div class="spacer_two"></div>
    <div class="landing_section">
       </div>
  </div>

  <script>

    $(document).ready(function(){
      set_section_heights();
    });

    $(window).resize(function(){
      set_section_heights();
    });

    function set_section_heights(){

      var doc_height = $(".background").height();

      var section_heights = {
        "ufo_section": 0.25,
        "spacer_one": 0.03,
        "comet_section": 0.36,
        "spacer_two": 0.06,
        "landing_section": 0.298
      }
      
      $.each( section_heights, function( index, value ) {
        $( "." + index ).height( Math.floor(value * doc_height) );
      });

    }

  </script>
  
</body>
</html>