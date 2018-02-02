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

<title>Insert title here</title>
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
  height: 100%;
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
    height: 450px;
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
<script>

$(function(){   
	$("#search").on('click',function(){

		var keyword = $("input[name=searchsong]").val();
		 
		$.ajax({
				 
	       url : "/voice/rest/searchVoice",
	       method : "POST",
	       contentType : "application/json; charset=UTF-8",
	       data : JSON.stringify({
	       	"keyword" : keyword            
	       }),
	       async : false,
	       dataType : "json",
	       success : function(serverData) {
				
		 	var name = "";
		 	
		 	//'<tr><td align="left">'+song.song[i].songName+'</td><td align="left">${user.email}</td></tr>'+
		 	
			 	for(var i=0; i<50; i++){
			 		name = name + '<tr><td align="left"><input type="hidden" id="name" name="name" value="'+serverData.melon.songs.song[i].artists.artist[0].artistName+'" /><input type="hidden" id="title" name="title" value="'+serverData.melon.songs.song[i].songName+'" />'+serverData.melon.songs.song[i].songName+
			 		'</td><td align="left">'+serverData.melon.songs.song[i].artists.artist[0].artistName+'</td></tr>';
			 	}

			 	var displayValue = '<div class="list"><table class="table table-hover table-striped"><tr><thead>'+
			 	'<td class="th" align="left">노래제목</td><td class="th" align="left">가수명</td></tr><tbody>' + name + '</tbody></table></div>';
			 
			 	$(".viewlist").html(displayValue);
			 	
			 	$(".viewlist td").click(function() {
			 		var title = $($("input[name='title']")[$('.viewlist td:nth-child(1)').index(this)-1]).val();
			 		var name = $($("input[name='name']")[$('.viewlist td:nth-child(1)').index(this)-1]).val();
			 		
				 	$("input[name='selectsong']").val(title);
					$("input[name='selectsinger']").val(name);
					
					$("input[name='ok']").val(title+" - "+name);
					
				});			 	
				
	    }
	});
	});
		
	$("#searchsong").on('input',function(){
	 	if($("#searchsong").val()=='')
	 		$("#search").attr("disabled",true);
	 	else
	 		$("#search").attr("disabled",false);
	});
	
	
	
});
</script>
<body>
<div class="container">

  <div class="row">
    <div class="col-xs-12">
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">노래검색하기</button>
      <input type="text" placeholder="선택된노래" name="selectsong" id="selectsong" value="">
	<input type="text" placeholder="가수이름" name="selectsinger" id="selectsinger" value="">
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><b>노래를 검색하세요!</b></h4>
      </div>
      <div class="modal-body">
      <div class="topnav">
      <div class="search-container">
      	<input type="text" placeholder="제목이나 가수명을 입력하세요" name="searchsong" id="searchsong" value="">
        	<button type="button" class="btn btn-primary" id="search">검색</button>
        	<button type="submit" class="btn btn-primary" data-dismiss="modal"id="select">선택</button>
    	<br/>
    	 <div class="viewlist" >

	</div>
    </div>
    </div>
        </div>
      <div class="modal-footer">
       <div class="topnav">
      <div class="search-container">
      	<input type="text" placeholder="선택된노래" name="ok" id="ok" value="" readonly>
      	 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	</div></div>
       
      </div>
    </div>
  </div>
</div>
</body>
</html>