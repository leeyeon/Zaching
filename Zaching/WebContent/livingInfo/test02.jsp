<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<meta charset="utf-8">

<title>알림</title>

 

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

 

<style type='text/css'>

body {

    font-size: 14px;

}

.ui-dialog .ui-dialog-title .ui-icon {

    float: left;

    margin-right: 4px;

}

</style>

 

<script type="text/javascript">         

$(function() {

 

var dialog = $("#dialog").dialog({

    modal: true,

    closeOnEscape: false,

    title: '알림',

    buttons: {

        OK: function() {

          $( this ).dialog( "close" );

        }

    },    

    open: function (event, ui) {

        //$(this).parent().children().children('.ui-dialog-titlebar-close').hide();

    },

    close: function () {

        alert("Dialog Closed!");

    }

     

});

 

var interval = setInterval(function () {

    var timer = $('span#time').html();

    timer = timer.split(':');

    var minutes = parseInt(timer[0], 10);

    var seconds = parseInt(timer[1], 10);

    seconds -= 1;

    if (minutes < 0) return clearInterval(interval);

    if (minutes < 10 && minutes.length != 2) minutes = '0' + minutes;

    if (seconds < 0 && minutes != 0) {

        minutes -= 1;

        seconds = 59;

    } else if (seconds < 10 && length.seconds != 2) 

        seconds = '0' + seconds;

         

    $('span#time').html(minutes + ':' + seconds);

 

    if (minutes == 0 && seconds == 0) {

        clearInterval(interval);

        $(dialog).dialog("close");

    }

}, 1000);

});                

</script>

</head>

<body> 

<div id="dialog" title="Basic dialog">

    <p>This is the default dialog which is useful for displaying information. 

    The dialog window can be moved, resized and countdown timer with the title icon.</p> 

    <span id="time">00:05</span>

</div>

</body>

</html>  
