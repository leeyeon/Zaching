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

	            <div class="row">
	            	<div class="col-xs-12" style="margin-bottom:20px;">
	                	<textarea name="content" id="ckeditor"></textarea>
	                	<div id="summernote"><p>Hello Summernote</p></div>
						  <script>
							$(document).ready(function() { 
								$('#summernote').summernote({ 
									placeholder: 'Hello bootstrap 4',
									callbacks: { // 콜백을 사용
				                        // 이미지를 업로드할 경우 이벤트를 발생
									    onImageUpload: function(files, editor, welEditable) {
										    sendFile(files[0], this);
										}
									},
							        tabsize: 2,
							        height: 500,
									lang: 'ko-KR'
								}); 
							});
							
							function sendFile(file, editor) {
					            // 파일 전송을 위한 폼생성
						 		//data = new FormData();
						 	    //data.append("uploadFile", file);
						 	    $.ajax({ // ajax를 통해 파일 업로드 처리
						 	    	url : "/bob/rest/addSummernoteImage",
						 	    	method : "POST",
						 	    	contentType : "application/json; charset=UTF-8",
						 	    	data : JSON.stringify({
						 	    		uploadFile : file
									}),
									dataType : "json",
						 	        cache : false,
						 	        processData : false,
						 	        success : function(data) { // 처리가 성공할 경우
					                    // 에디터에 이미지 출력
						 	        	$(editor).summernote('editor.insertImage', data.url);
						 	        }
						 	    });
						 	}
						  </script>
	                </div>
	            </div>