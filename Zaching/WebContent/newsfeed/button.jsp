
<!DOCTYPE html><html lang='en' class=''>
<head><script src='//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js'></script><script src='//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/kevinfan23/pen/BKbWxP" />

<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css'>
<style class="cp-pen-styles">/*** Import Fonts ***/
@import url(https://fonts.googleapis.com/css?family=Lato:400,300);
/*** Variables ***/
/* -------------------------------- 
Small Window Size and Mobile Style
-------------------------------- */

/* -------------------------------- 
		General Style
-------------------------------- */





/*** General Button Styles ***/
.button-container {
  display: inline-block;
  margin: 10px 10px;
  cursor: pointer;
  font-weight: 400;
  letter-spacing: 2px;
  height: 45px;
  width: 200px;
  -webkit-perspective: 1000;
  -ms-perspective: 1000;
  perspective: 1000;
}
.button-container .flipper {
  transition: all .5s ease-in-out;
  -webkit-transform-style: preserve-3d;
  -ms-transform-style: preserve-3d;
  transform-style: preserve-3d;
  position: relative;
}
.button-container .button {
  height: 45px;
  width: 200px;
  border-radius: 3px;
  backface-visibility: hidden;
  position: absolute;
  top: 0;
  left: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  -webkit-box-shadow: 1px 2px 4px -1px rgba(60, 60, 60, 0.64);
  box-shadow: 1px 2px 4px -1px rgba(60, 60, 60, 0.64);
}
.button-container .button i.fa {
  color: white;
  font-size: 20px;
  margin: auto;
  text-shadow: .5px 1px 2px #3c3c3c;
}
.button-container .button.front {
  z-index: 10;
}
.button-container .button.back {
  color: white;
  font-size: 15px;
  text-transform: uppercase;
}
/* -------------------------------- 
			Slide
-------------------------------- */
.slider i {
  transition: all .3s ease-in-out;
}
.slider i:before {
  transition: all .3s ease-in-out;
}
.slider i:after {
  font-family: "Lato", sans-serif;
  color: white;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 2px;
  text-shadow: none;
  content: 'Dribbble';
  position: absolute;
  opacity: 0;
  top: 2.5px;
  transition: all .3s ease-in-out;
}

/*** Horizontal Slide ***/
.button-slide-horizontal .button {
  background-image: linear-gradient(90deg, #ea4c89, #ee9b83);
}
.button-slide-horizontal i {
  position: relative;
  display: inline-block;
  transition: all .3s ease-in-out;
}
.button-slide-horizontal i:before {
  transition: all .3s ease-in-out;
}
.button-slide-horizontal:hover i {
  padding-right: 100px;
}
.button-slide-horizontal:hover i:before {
  opacity: 0;
}
.button-slide-horizontal:hover i:after {
  opacity: 1;
}

/*** Vertical Slide 
.button-slide-vertical {
  overflow: hidden;
  height: 45px;
}
.button-slide-vertical .button {
  background-image: linear-gradient(90deg, #1c84a6, #3CB371);
  overflow: hidden;
  height: 45px;
}
.button-slide-vertical i {
  position: relative;
  margin: 0 !important;
  top: 10px;
  transition: all .3s ease-in-out;
  opacity: 1;
}
.button-slide-vertical i.back {
  font-family: "Lato", sans-serif;
  color: white;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 2px;
  transform: translateY(30px);
  opacity: 0;
}
.button-slide-vertical:hover i.front {
  transform: translateY(-30px);
  opacity: 0;
}
.button-slide-vertical:hover i.back {
  transform: translateY(-20px);
  opacity: 1;
}***/

</style></head><body>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">	
<body>
	
	
		    <!-- Horizontal Slide -->
			<div class="button-container button-slide-horizontal">
		        <div class="slider slider-horizontal">
		            <div class="button">
		              	<i class="fa fa-dribbble"></i>
		            </div>
		        </div>
	    	</div>
	    
		    <!-- Vertical Slide 
			<div class="button-container button-slide-vertical">
		        <div class="slider-vertical">
		            <div class="button">
		              	<i class="fa fa-medium front"></i>
		              	<i class="back">Medium</i>
		            </div>
		        </div>
	    	</div> -->
	   
	
	
<script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script>


</script>
</body></html>