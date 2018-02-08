<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko"> 
<head>
<style>
    html, body { 
        margin: 0 !important; 
        padding: 0 !important; 
        overflow: hidden !important; 
        width: 100%; 
    } 
</style>


    <title>16khz Audio Recording using RecordRTC</title> 
</head>
<body>
    <h1>16khz Audio Recording using RecordRTC</h1> 


    <br>
    <button id="btn-start-recording">Start Recording</button> 
    <button id="btn-stop-recording" disabled>Stop Recording</button> 


    <hr>
    <audio controls autoplay></audio> 


<!-- CDN -->
<script src="https://cdn.WebRTC-Experiment.com/RecordRTC.js"></script> 


<script>
var audio = document.querySelector('audio'); 
function captureMicrophone(callback) { 
    navigator.getUserMedia = navigator.getUserMedia || navigator.mozGetUserMedia || navigator.webkitGetUserMedia;
    console.error(navigator.getUserMedia); 
    navigator.getUserMedia({audio: true}, callback, function (error) { 
        alert('Unable to access your microphone.'); 
         console.error(error); 
    }); 
} 


function stopRecordingCallback() { 
    var blob = recorder.getBlob(); 
    audio.src = URL.createObjectURL(blob); 
    audio.play(); 
    recorder.microphone.stop(); 


    createAudioElement(window.URL.createObjectURL(blob)); 
} 


var recorder; // globally accessible 
document.getElementById('btn-start-recording').onclick = function () { 
    this.disabled = true; 
    captureMicrophone(function (microphone) { 
        audio.src = URL.createObjectURL(microphone); 
        audio.play(); 
        recorder = RecordRTC(microphone, { 
            type: 'audio', 
            recorderType: StereoAudioRecorder, 
            numberOfAudioChannels: 1, // or leftChannel:true 
            desiredSampRate: 16000 
        }); 
        recorder.startRecording(); 
        // release microphone on stopRecording
        recorder.microphone = microphone; 
        document.getElementById('btn-stop-recording').disabled = false; 
        }); 
    }; 
    document.getElementById('btn-stop-recording').onclick = function () { 
    this.disabled = true; 
    recorder.stopRecording(stopRecordingCallback); 
    document.getElementById('btn-start-recording').disabled = false; 
}; 




function createAudioElement(blobUrl) { 
    const downloadEl = document.createElement('a'); 
    downloadEl.style = 'display: block'; 
    downloadEl.innerHTML = 'download'; 
    downloadEl.download = 'audio.wav'; 
    downloadEl.href = blobUrl; 
    const audioEl = document.createElement('audio'); 
    audioEl.controls = true; 
    const sourceEl = document.createElement('source'); 
    sourceEl.src = blobUrl; 
    sourceEl.type = 'audio/wav'; 
    audioEl.appendChild(sourceEl); 
    document.body.appendChild(audioEl); 
    document.body.appendChild(downloadEl); 
} 
</script>
</body>
</html>


