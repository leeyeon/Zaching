<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

</head>
<style>
.modal {
  overflow: inherit;
  overflow-y: inherit;
  text-align: center;
  padding: 0;
}

.modal:before {
  content: '';
  display: inline-block;
  vertical-align: middle;
  margin-right: -4px;
}

.modal-dialog {
  max-width: 500px;
  padding: 0;
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}

.modal-content {

  border: 0;
  border-radius: 0;

}

.modal-header {
  border: 0;
  padding 0;
  position: relative;
}

.modal-header .close {
  margin: 0;
  position: absolute;
  top: -10px;
  right: -10px;
  width: 23px;
  height: 23px;
  border-radius: 23px;
  background-color: #00aeef;
  color: #ffe300;
  font-size: 9px;
  opacity: 1;
  z-index: 10;
}

.modal-content p {
  padding: 0 20px;
}

.modal-body {
  padding: 0 0 10px 0;
    overflow: auto;
}
.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 15px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #5F4B8B;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 15px;
  border: none;
  width: 300px;
  color : #000000;
}

.topnav .search-container button {
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  font-size: 15px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}
</style>
<script type="text/javascript">

$(function(){  
	

	$("#report").on('click',function(){
		
	console.log("신고되었슈");
	
	var reportID = "1";
	var category = "2";
	var userID = "3";
	var text = "후이이잉";
	var reportUserID = "4";
	var roomID = "5";
	//값 각자 알아서 넣어주셈~~
	
	
	$.ajax({
			 
        url : "/admin/rest/addReport",
        method : "POST",
        contentType : "application/json; charset=UTF-8",
        data : JSON.stringify({
        	"reportID" : reportID,
            "category" : category,
            "userID" : userID,
            "text" : text,
            "reportUserID" : reportUserID,
            "roomID" : roomID
        }),
        async : false,
        dataType : "json",
        success : function(serverData) {
        	
        	alert("신고가 완료되었습니다.");
           
        }
        
        
     });
	
	
});

});
</script>


</head>

<body>


<div class="container">

  <div class="row">
    <div class="col-xs-12">
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">각자 버튼 해쥬세요(아니면각자버튼에data-toggle="modal" data-target="#myModal"츄가점)</button>
      </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><b>신고하기</b></h4><label for="exampleTextarea">카테고리/신고대상:</label>
      </div>
      <div class="modal-body">    
      	 <textarea class="form-control" id="exampleTextarea" rows="5"></textarea>
        </div>
      <div class="modal-footer">
       <div class="topnav">
      <div class="search-container">
      	<button type="button" class="btn btn-primary" id="report" data-dismiss="modal" >신고하기</button>
      	 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	</div></div>
       
      </div>
    </div>
  </div>
</div>

</body>
</html>