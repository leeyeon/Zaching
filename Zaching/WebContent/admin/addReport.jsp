<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
<link href="/resources/css/jquery.simple-popup.min.css" rel="stylesheet" type="text/css">
<style>
body { line-height:1.58;}
.container { margin:70px auto;}
#popup1 { display:none; }
</style>
</head>

<body>


<a class="demo-2 btn btn-primary">���� �Ű� ��ư ���� ��������</a>



            <div id="popup1">
                <h2><b>�Ű��ϱ�</b></h2>
                <form>
  
  <div class="form-group">
    <label for="exampleTextarea">�Ű� ����(���� ������ּ���)</label>
    &nbsp;&nbsp;<label for="exampleTextarea">ī�װ�/�Ű���:</label>
    <textarea class="form-control" id="exampleTextarea" rows="5"></textarea>
  </div>
 
  
  <button type="submit" class="btn btn-primary">������</button>
   <button type="" class="btn btn-primary">���</button>
</form>
            </div>
</div>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/javascript/jquery.simple-popup.min.js"></script>
<script>
$(document).ready(function() {
  $("a.demo-1").simplePopup();
  $("a.demo-2").simplePopup({ type: "html", htmlSelector: "#popup1"});
});
</script>

</body>
</html>