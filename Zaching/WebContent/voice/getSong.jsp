
<!DOCTYPE html><html lang='en' class=''>
<head><script src='//production-assets.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/gregh/pen/NdVvbm?limit=all&page=1&q=audio" />
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

<style class="cp-pen-styles">.audio.green-audio-player {
  width: 400px;
  min-width: 300px;
  height: 56px;
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, 0.07);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-left: 24px;
  padding-right: 24px;
  border-radius: 4px;
  user-select: none;
  -webkit-user-select: none;
  background-color: #fff;
}
.audio.green-audio-player .play-pause-btn {
  display: none;
  cursor: pointer;
}
.audio.green-audio-player .spinner {
  width: 18px;
  height: 18px;
  background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/355309/loading.png);
  background-size: cover;
  background-repeat: no-repeat;
  animation: spin 0.4s linear infinite;
}
.audio.green-audio-player .slider {
  flex-grow: 1;
  background-color: #D8D8D8;
  cursor: pointer;
  position: relative;
}
.audio.green-audio-player .slider .progress {
  background-color: #44BFA3;
  border-radius: inherit;
  position: absolute;
  pointer-events: none;
}
.audio.green-audio-player .slider .progress .pin {
  height: 16px;
  width: 16px;
  border-radius: 8px;
  background-color: #44BFA3;
  position: absolute;
  pointer-events: all;
  box-shadow: 0px 1px 1px 0px rgba(0, 0, 0, 0.32);
}
.audio.green-audio-player .controls {
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  line-height: 18px;
  color: #55606E;
  display: flex;
  flex-grow: 1;
  justify-content: space-between;
  align-items: center;
  margin-left: 24px;
  margin-right: 24px;
}
.audio.green-audio-player .controls .slider {
  margin-left: 16px;
  margin-right: 16px;
  border-radius: 2px;
  height: 4px;
}
.audio.green-audio-player .controls .slider .progress {
  width: 0;
  height: 100%;
}
.audio.green-audio-player .controls .slider .progress .pin {
  right: -8px;
  top: -6px;
}
.audio.green-audio-player .controls span {
  cursor: default;
}
.audio.green-audio-player .volume {
  position: relative;
}
.audio.green-audio-player .volume .volume-btn {
  cursor: pointer;
}
.audio.green-audio-player .volume .volume-btn.open path {
  fill: #44BFA3;
}
.audio.green-audio-player .volume .volume-controls {
  width: 30px;
  height: 135px;
  background-color: rgba(0, 0, 0, 0.62);
  border-radius: 7px;
  position: absolute;
  left: -3px;
  bottom: 52px;
  flex-direction: column;
  align-items: center;
  display: flex;
}
.audio.green-audio-player .volume .volume-controls.hidden {
  display: none;
}
.audio.green-audio-player .volume .volume-controls .slider {
  margin-top: 12px;
  margin-bottom: 12px;
  width: 6px;
  border-radius: 3px;
}
.audio.green-audio-player .volume .volume-controls .slider .progress {
  bottom: 0;
  height: 100%;
  width: 6px;
}
.audio.green-audio-player .volume .volume-controls .slider .progress .pin {
  left: -5px;
  top: -8px;
}

svg, img {
  display: block;
}

html, body {
  height: 100%;
}

body {
  justify-content: center;
  align-items: center;
  background: #F8FFAE;
  background: -webkit-linear-gradient(-65deg, #43C6AC, #F8FFAE);
  background: linear-gradient(-65deg, #43C6AC, #F8FFAE);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

@keyframes spin {
  from {
    transform: rotateZ(0);
  }
  to {
    transform: rotateZ(1turn);
  }
}
</style></head><body>
<div class="audio green-audio-player">
  <div class="loading">
    <div class="spinner"></div>
  </div>
  <div class="play-pause-btn">  
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="24" viewBox="0 0 18 24">
      <path fill="#566574" fill-rule="evenodd" d="M18 12L0 24V0" class="play-pause-icon" id="playPause"/>
    </svg>
  </div>
  
  <div class="controls">
    <span class="current-time">0:00</span>
    <div class="slider" data-direction="horizontal">
      <div class="progress">
        <div class="pin" id="progress-pin" data-method="rewind"></div>
      </div>
    </div>
    <span class="total-time">0:00</span>
  </div>
  
  <div class="volume">
    <div class="volume-btn">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
        <path fill="#566574" fill-rule="evenodd" d="M14.667 0v2.747c3.853 1.146 6.666 4.72 6.666 8.946 0 4.227-2.813 7.787-6.666 8.934v2.76C20 22.173 24 17.4 24 11.693 24 5.987 20 1.213 14.667 0zM18 11.693c0-2.36-1.333-4.386-3.333-5.373v10.707c2-.947 3.333-2.987 3.333-5.334zm-18-4v8h5.333L12 22.36V1.027L5.333 7.693H0z" id="speaker"/>
      </svg>
    </div>
    <div class="volume-controls hidden">
      <div class="slider" data-direction="vertical">
        <div class="progress">
          <div class="pin" id="volume-pin" data-method="changeVolume"></div>
        </div>
      </div>
    </div>
  </div>
  
  <audio crossorigin>
    <source src="../resources/upload_files/record/gift.mp3" type="audio/mpeg">
  </audio>
</div>

<div class="audio green-audio-player">
  <div class="loading">
    <div class="spinner"></div>
  </div>
  <div class="play-pause-btn">  
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="24" viewBox="0 0 18 24">
      <path fill="#566574" fill-rule="evenodd" d="M18 12L0 24V0" class="play-pause-icon" id="playPause"/>
    </svg>
  </div>
  
  <div class="controls">
    <span class="current-time">0:00</span>
    <div class="slider" data-direction="horizontal">
      <div class="progress">
        <div class="pin" id="progress-pin" data-method="rewind"></div>
      </div>
    </div>
    <span class="total-time">0:00</span>
  </div>
  
  <div class="volume">
    <div class="volume-btn">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
        <path fill="#566574" fill-rule="evenodd" d="M14.667 0v2.747c3.853 1.146 6.666 4.72 6.666 8.946 0 4.227-2.813 7.787-6.666 8.934v2.76C20 22.173 24 17.4 24 11.693 24 5.987 20 1.213 14.667 0zM18 11.693c0-2.36-1.333-4.386-3.333-5.373v10.707c2-.947 3.333-2.987 3.333-5.334zm-18-4v8h5.333L12 22.36V1.027L5.333 7.693H0z" id="speaker"/>
      </svg>
    </div>
    <div class="volume-controls hidden">
      <div class="slider" data-direction="vertical">
        <div class="progress">
          <div class="pin" id="volume-pin" data-method="changeVolume"></div>
        </div>
      </div>
    </div>
  </div>
  
  <audio crossorigin>
    <source src="../resources/upload_files/record/Ailee.mp3" type="audio/mpeg">
  </audio>
</div>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script >var audioPlayer = document.querySelector('.green-audio-player');
var playPause = audioPlayer.querySelector('#playPause');
var playpauseBtn = audioPlayer.querySelector('.play-pause-btn');
var loading = audioPlayer.querySelector('.loading');
var progress = audioPlayer.querySelector('.progress');
var sliders = audioPlayer.querySelectorAll('.slider');
var volumeBtn = audioPlayer.querySelector('.volume-btn');
var volumeControls = audioPlayer.querySelector('.volume-controls');
var volumeProgress = volumeControls.querySelector('.slider .progress');
var player = audioPlayer.querySelector('audio');
var currentTime = audioPlayer.querySelector('.current-time');
var totalTime = audioPlayer.querySelector('.total-time');
var speaker = audioPlayer.querySelector('#speaker');

var draggableClasses = ['pin'];
var currentlyDragged = null;

window.addEventListener('mousedown', function (event) {

  if (!isDraggable(event.target)) return false;

  currentlyDragged = event.target;
  var handleMethod = currentlyDragged.dataset.method;

  this.addEventListener('mousemove', window[handleMethod], false);

  window.addEventListener('mouseup', function () {
    currentlyDragged = false;
    window.removeEventListener('mousemove', window[handleMethod], false);
  }, false);
});

playpauseBtn.addEventListener('click', togglePlay);
player.addEventListener('timeupdate', updateProgress);
player.addEventListener('volumechange', updateVolume);
player.addEventListener('loadedmetadata', function () {
  totalTime.textContent = formatTime(player.duration);
});
player.addEventListener('canplay', makePlay);
player.addEventListener('ended', function () {
  playPause.attributes.d.value = "M18 12L0 24V0";
  player.currentTime = 0;
});

volumeBtn.addEventListener('click', function () {
  volumeBtn.classList.toggle('open');
  volumeControls.classList.toggle('hidden');
});

window.addEventListener('resize', directionAware);

sliders.forEach(function (slider) {
  var pin = slider.querySelector('.pin');
  slider.addEventListener('click', window[pin.dataset.method]);
});

directionAware();

function isDraggable(el) {
  var canDrag = false;
  var classes = Array.from(el.classList);
  draggableClasses.forEach(function (draggable) {
    if (classes.indexOf(draggable) !== -1) canDrag = true;
  });
  return canDrag;
}

function inRange(event) {
  var rangeBox = getRangeBox(event);
  var rect = rangeBox.getBoundingClientRect();
  var direction = rangeBox.dataset.direction;
  if (direction == 'horizontal') {
    var min = rangeBox.offsetLeft;
    var max = min + rangeBox.offsetWidth;
    if (event.clientX < min || event.clientX > max) return false;
  } else {
    var min = rect.top;
    var max = min + rangeBox.offsetHeight;
    if (event.clientY < min || event.clientY > max) return false;
  }
  return true;
}

function updateProgress() {
  var current = player.currentTime;
  var percent = current / player.duration * 100;
  progress.style.width = percent + '%';

  currentTime.textContent = formatTime(current);
}

function updateVolume() {
  volumeProgress.style.height = player.volume * 100 + '%';
  if (player.volume >= 0.5) {
    speaker.attributes.d.value = 'M14.667 0v2.747c3.853 1.146 6.666 4.72 6.666 8.946 0 4.227-2.813 7.787-6.666 8.934v2.76C20 22.173 24 17.4 24 11.693 24 5.987 20 1.213 14.667 0zM18 11.693c0-2.36-1.333-4.386-3.333-5.373v10.707c2-.947 3.333-2.987 3.333-5.334zm-18-4v8h5.333L12 22.36V1.027L5.333 7.693H0z';
  } else if (player.volume < 0.5 && player.volume > 0.05) {
    speaker.attributes.d.value = 'M0 7.667v8h5.333L12 22.333V1L5.333 7.667M17.333 11.373C17.333 9.013 16 6.987 14 6v10.707c2-.947 3.333-2.987 3.333-5.334z';
  } else if (player.volume <= 0.05) {
    speaker.attributes.d.value = 'M0 7.667v8h5.333L12 22.333V1L5.333 7.667';
  }
}

function getRangeBox(event) {
  var rangeBox = event.target;
  var el = currentlyDragged;
  if (event.type == 'click' && isDraggable(event.target)) {
    rangeBox = event.target.parentElement.parentElement;
  }
  if (event.type == 'mousemove') {
    rangeBox = el.parentElement.parentElement;
  }
  return rangeBox;
}

function getCoefficient(event) {
  var slider = getRangeBox(event);
  var rect = slider.getBoundingClientRect();
  var K = 0;
  if (slider.dataset.direction == 'horizontal') {

    var offsetX = event.clientX - slider.offsetLeft;
    var width = slider.clientWidth;
    K = offsetX / width;
  } else if (slider.dataset.direction == 'vertical') {

    var height = slider.clientHeight;
    var offsetY = event.clientY - rect.top;
    K = 1 - offsetY / height;
  }
  return K;
}

function rewind(event) {
  if (inRange(event)) {
    player.currentTime = player.duration * getCoefficient(event);
  }
}

function changeVolume(event) {
  if (inRange(event)) {
    player.volume = getCoefficient(event);
  }
}

function formatTime(time) {
  var min = Math.floor(time / 60);
  var sec = Math.floor(time % 60);
  return min + ':' + (sec < 10 ? '0' + sec : sec);
}

function togglePlay() {
  if (player.paused) {
    playPause.attributes.d.value = "M0 0h6v24H0zM12 0h6v24h-6z";
    player.play();
  } else {
    playPause.attributes.d.value = "M18 12L0 24V0";
    player.pause();
  }
}

function makePlay() {
  playpauseBtn.style.display = 'block';
  loading.style.display = 'none';
}

function directionAware() {
  if (window.innerHeight < 250) {
    volumeControls.style.bottom = '-54px';
    volumeControls.style.left = '54px';
  } else if (audioPlayer.offsetTop < 154) {
    volumeControls.style.bottom = '-164px';
    volumeControls.style.left = '-3px';
  } else {
    volumeControls.style.bottom = '52px';
    volumeControls.style.left = '-3px';
  }
}
//# sourceURL=pen.js
</script>
</body></html>