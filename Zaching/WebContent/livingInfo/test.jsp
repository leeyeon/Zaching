<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>������</title>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<!--�̹��� �����̵� �÷����� -->
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.css" type="text/css" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.5.1/fotorama.js"></script>

<script type="text/javascript">
 
    var search = function() {
        
        if($("#q").val() == "") {
            alert("�˻� Ű���带 �Է����ּ���!"); 
            $("#q").focus();
            return false;
        }

        $.ajax({
            url : "http://apis.daum.net/search/image",
            dataType : "jsonp",
            type : "post",
            jsonp : "callback",
            data : {
                apikey : "32005754828998181fe9ce724cdfee2d", //���� API KEY �Է�
                q : $("#q").val(),             // search keyword
                result : "20",                 // result set length
                pageno : $("#pageno").val(),   // pageNo
                output : "json"                // JSONP type format json
            },
            success : function(r){
                var list = r.channel.item;
                var fr = "";
                for(var i in list) {
                    fr += "<a href=\""+ list[i].image +"\">"+
                          "<img src=\""+ list[i].thumbnail +"\"></a>";
                }
                fr = "<div data-nav='thumbs'>" + fr + "</div>";
                $("#fr").html(fr);
                $("#fr div").fotorama({width:720,height:480});
               
                $("#pageno").val(parseInt($("#pageno").val())+1);
 
            }
        });
        return false;
    }
 
    $(function() {
        $("#go").click(search);
        $("#q").bind("change", function(){$("#pageno").val(1);});
        $("#q").bind("keypress", function(event) {
            if (event.which === 13) {
                search();
            }
        })
    });
</script>
 
</head>
<body>

    <form onsubmit="return search()">
        <input id="q" type="text" placeholder="Ű���带 �Է����ּ���!">
        <input id="pageno" type="text" value="1">
        <input id="go" type="button" value="Go">
    </form>
    <hr>
    
    
    <div id="fr">

    </div>  
    
</body>
</html>