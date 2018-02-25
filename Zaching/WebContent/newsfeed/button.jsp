<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html><html lang='en' class=''>
<head><script src='//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js'></script><script src='//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/andrewwierzba/pen/JorzzV" />

<link rel='stylesheet prefetch' href="https://www.andrewwierzba.com/signature/css/madeBy.css">
<style class="cp-pen-styles">@import url(https://fonts.googleapis.com/css?family=Open+Sans);


.checkBox {
  width: 130px;
  height: 65px;
  margin: 15px auto;
  color: #4274D3;
  font-family: 'Open Sans', sans-serif;
  font-size: 1.15rem;
  line-height: 55px;
  text-transform: uppercase;
  text-align: center;
  position: relative;
  cursor: pointer;
}

svg {
  position: absolute;
  top: 0;
  left: 0;
}
svg rect, svg path, svg polyline {
  fill: none;
  stroke: #4274D3;
  stroke-width: 1;
}

/* Check Box */
.checkBox {
  /* Add Padding Left To Center Text */
}
.checkBox svg {
  /* Presentation Purposes */
  margin-left: -10px;
}
.checkBox svg rect, .checkBox svg polyline {
  fill: none;
  stroke: #4274D3;
  stroke-width: 1;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.checkBox:hover svg rect {
  stroke-width: 2;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.checkBox:hover svg polyline {
  stroke-width: 2;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.checkBox svg .button {
  stroke-dasharray: 400px, 0;
}
.checkBox:hover svg .button {
  stroke-dasharray: 0, 400px;
  stroke-dashoffset: 33px;
}
/* Check Mark Effect */
.box, .checkMark {
  opacity: 0;
}
.checkBox:hover .box {
  -webkit-animation: boxDisplay 0.2s forwards;
  -moz-animation: boxDisplay 0.2s forwards;
  -ms-animation: boxDisplay 0.2s forwards;
  -o-animation: boxDisplay 0.2s forwards;
  animation: boxDisplay 0.2s forwards;
  -webkit-animation-delay: 0.65s;
  -moz-animation-delay: 0.65s;
  -ms-animation-delay: 0.65s;
  -o-animation-delay: 0.65s;
  animation-delay: 0.65s;
}
.checkBox:hover .checkMark {
  -webkit-animation: checkDisplay 0.2s forwards;
  -moz-animation: checkDisplay 0.2s forwards;
  -ms-animation: checkDisplay 0.2s forwards;
  -o-animation: checkDisplay 0.2s forwards;
  animation: checkDisplay 0.2s forwards;
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  -ms-animation-delay: 1s;
  -o-animation-delay: 1s;
  animation-delay: 1s;
}
/* Check Box Display */
@-webkit-keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-moz-keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-ms-keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-o-keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@keyframes boxDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
/* Check Mark Display */
@-webkit-keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-moz-keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-ms-keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@-o-keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}
@keyframes checkDisplay {
  0% { opacity: 0; }
  100% { opacity: 1; }
}</style></head><body>
<div class="checkBox">
  등록
  <svg width="140" height="55" viewBox="0 0 140 65" >
    <rect x="10" class="button" width="128.8" height="63.9"/>
    <rect x="0" y="22.5" class="box" width="20" height="20"/>
    <polyline class="checkMark" points="4.5,32.6 8.7,36.8 16.5,29.1"/>
  </svg>
</div>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body></html>