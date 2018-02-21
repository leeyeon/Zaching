<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<title>Live input record and playback</title>
  <style type='text/css'>
    ul { list-style: none; }
    #recordingslist audio { display: block; margin-bottom: 10px; }
  </style>
</head>
<body>


  <button onclick="startRecording(this);">record</button>
  <button onclick="stopRecording(this);" disabled>stop</button>
  
  <h2>Recordings</h2>
  <ul id="recordingslist"></ul>
  
  <h2>Log</h2>
  <pre id="log"></pre>

  <script>
  
  function __log(e, data) {
    log.innerHTML += "\n" + e + " " + (data || '');
  }

  var audio_context;
  var recorder;
  var link = 456;

  function startUserMedia(stream) {
    var input = audio_context.createMediaStreamSource(stream);
    __log('Media stream created.');

    // Uncomment if you want the audio to feedback directly
    //input.connect(audio_context.destination);
    //__log('Input connected to audio context destination.');
    
    recorder = new Recorder(input);
    __log('Recorder initialised.');
  }

  function startRecording(button) {
    recorder && recorder.record();
    button.disabled = true;
    button.nextElementSibling.disabled = false;
    __log('Recording...');
  }

  function stopRecording(button) {
    recorder && recorder.stop();
    button.disabled = true;
    button.previousElementSibling.disabled = false;
    __log('Stopped recording.');
    
    // create WAV download link using audio data blob
    createDownloadLink();
    
    recorder.clear();
  }
  
  function blobToFile(theBlob, fileName){
	    //A Blob() is almost a File() - it's just missing the two properties below which we will add
	    theBlob.lastModifiedDate = new Date();
	    theBlob.name = fileName;
	    return theBlob;
	}
	function uploadVoice(){
		alert("fdafaf");
	}
  function createDownloadLink() {
    recorder && recorder.exportWAV(function(blob) {
    	alert(blob);
      var url = URL.createObjectURL(blob);
      var li = document.createElement('li');
      var au = document.createElement('audio');
      var hf = document.createElement('a');
      var uploadButton = document.createElement('input');
      
      uploadButton.type = 'button';
      uploadButton.value = '등록';
      uploadButton.onclick = function(){
       	  
    	  var xhr = new XMLHttpRequest();
    	  xhr.open('POST', '/voice/json/testUpload/32/3/'+hf.download, true);
    	  xhr.onload = function(e){console.log("loaded");};
    	  xhr.onreadystatechange = function(){
    		  console.log("state : "+xhr.readyState);
    	  };
    	  
    	  xhr.upload.onprogress = function(e) {console.log("uploading.....");};
    	  xhr.setRequestHeader("Content-Type", "audio/wav");
    	  xhr.send(blob);
    	  window.location.reload();
      };
      au.controls = true;
      au.src = url;
      hf.href = url;
      hf.download = new Date().toISOString() + '.wav';
      hf.innerHTML = '녹음파일 다운';
      li.appendChild(au);
      li.appendChild(hf);
      li.appendChild(uploadButton);
      recordingslist.appendChild(li);
      
      //alert(hf.download);
      //alert(au.src);
      //alert(hf);
      link=hf.href;
	  //alert(hf.href);
	  alert(hf.download);
	  
	  //var myFile = blobToFile(blob, hf.download);
	 // var myFile = new File(blob, hf.download);
	  //alert(myFile);
	  /*$.ajax({
			url : "/voice/json/testUpload",
			method : "POST" ,
			 contentType : "application/json; charset=UTF-8",
		        async : false,
		        dataType : "json",
		        data : JSON.stringify({
		        	"link" : link,
		        	"fileName" : hf.download,
		        	"blob" : myFile
		        }),
		        success : function(serverData) {
		        	
		        	alert(serverData);
		           
		        }
		});*/
      //self.location="/voice/testUpload?link="+hf+"&fileName="+hf.download;
    });
  }

  window.onload = function init() {
    try {
      // webkit shim
      window.AudioContext = window.AudioContext || window.webkitAudioContext;
      navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia;
      window.URL = window.URL || window.webkitURL;
      
      audio_context = new AudioContext;
      __log('Audio context set up.');
      __log('navigator.getUserMedia ' + (navigator.getUserMedia ? 'available.' : 'not present!'));
    } catch (e) {
      alert('No web audio support in this browser!');
    }
    
    navigator.getUserMedia({audio: true}, startUserMedia, function(e) {
      __log('No live audio input: ' + e);
    });
  };
  </script>

  <script src="../resources/javascript/recorder.js"></script>
  
  <div>
  	<input type="hidden" value="3">
  </div>
</body>
</html>
