<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <style>
        #content {
            width:350px;
            height:350px;
            background:#ededed;
            padding:10px;
            margin:30px;
}
    </style>
        
    <script>    
        //$(document.ready(function(){ .. });

        $(function(){
            
            $("#dialog").dialog({
                draggable:false, //창 드래그 못하게
                modal:false,
                resizable:false,
                position:{
                    my:"center",
                    at:"right bottom",
                    of:"#content" 
                    }
            })
            
            /*
            my : dialog 의 위치 
            at : 위치할 개체의 위치 
            of : 위치할 개체

            위의 설정은 dialog 창의 가운데 좌표점을 기준으로 #content 개체의
            오른쪽 아래 모서리에 위치하겠다는 설정임.
            */

            //.parent()
            //.position({my:"center",at:"center",of:"#content"}); 
            //부모의 가운데, 창의 기준도 가운데            

    
        });
    </script>

</head>
<body>


<div id="content">
    자바는 썬 마이크로시스템즈에서 개발, <br>
    무료로 제공한 프로그래밍 언어입니다.
    <p>

    <!--다이얼로그 창 내용-->
    <div id="dialog" title="공지사항">
        java 초급<br>
        java 중급<br>
        java 고급<br>
        강좌가 새롭게 업로드되었습니다.
    </div>
    <!--다이얼로그 창 내용-->

</div>

</body>
</html>