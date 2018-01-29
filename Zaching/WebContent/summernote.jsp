<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
</head>
<body>
  <div id="summernote"><p>Hello Summernote</p></div>
  <script>
	$(document).ready(function() { 
		$('#summernote').summernote({ 
			placeholder: 'Hello bootstrap 4',
	        tabsize: 2,
	        callbacks: {
		   		onImageUpload: function(image) {
					uploadImage(image[0]);
		   		}
		   },
	        height: 500,
	        width: 800,
			lang: 'ko-KR'
		}); 
	});
	
	function uploadImage(image) {

        var data = new FormData();

        data.append("image", image);

        $.ajax({

            type: "post",

            cache: false,

            contentType:false,

            processData: false,

            dataType :'jsonp',

            url: '/cop/bbs/insertSummberNoteFile.do',

            data: data,

            success: function(data) {

//이미지 경로를 작성하면 됩니다 ^  ^

                var image = $('<img>').attr('src', '/cmm/fms/getImage.do?atchFileId='+data[0].atchFileId+'&fileSn=0');

                $('#nttCn').summernote("insertNode", image[0]);

            },

            error: function(data) {

            	alert('error : ' +data);

            }

        });

    }
  </script>
</body>
</html>