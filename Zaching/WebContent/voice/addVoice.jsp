<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
</head>

<script>
	$(function() {

		
		$("select").change(function() {
			
			if($("select option:selected").val() != '1'){
				$(".category1").css("display","none");
			}
			else{
				$(".category1").css("display","block");
			}

			
		});
		
		$("#search").on('click',function() {

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

											for (var i = 0; i < 50; i++) {
												name = name
														+ '<tr><td align="left"><input type="hidden" id="name" name="name" value="'+serverData.melon.songs.song[i].artists.artist[0].artistName+'" /><input type="hidden" id="title" name="title" value="'+serverData.melon.songs.song[i].songName+'" />'
														+ serverData.melon.songs.song[i].songName
														+ '</td><td align="left">'
														+ serverData.melon.songs.song[i].artists.artist[0].artistName
														+ '</td></tr>';
											}

											var displayValue = '<div class="list"><table class="table table-hover table-striped"><tr><thead>'
													+ '<td class="th" align="left">�뷡����</td><td class="th" align="left">������</td></tr><tbody>'
													+ name
													+ '</tbody></table></div>';

											$(".viewlist").html(displayValue);

											$(".viewlist td")
													.click(
															function() {
																var title = $($("input[name='title']")[$('.viewlist td:nth-child(1)').index(this) - 1]).val();
																var name = $($("input[name='name']")[$('.viewlist td:nth-child(1)').index(this) - 1]).val();

																$("input[name='selectsong']").val(title);
																$("input[name='selectsinger']").val(name);

																$("input[name='ok']").val(title+ " - "+ name);
																});
										}
									});
						});

		$("#searchsong").on('input', function() {
			if ($("#searchsong").val() == '')
				$("#search").attr("disabled", true);
			else
				$("#search").attr("disabled", false);
		});

	});
</script>
<style>
body {
	padding-top: 130px;
}

body>div.container {
	margin-top: 10px;
}

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
	border: 0; padding 0;
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
	color: #000000;
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

.songSelect{
padding-top: 40px;
background: #fff;
padding-bottom: 80px;
}

.songSelectButton{
background: #fff;

}

.makevoice{
	text-align: left;
	vertical-align: middle;
	align : center;
}
</style>
<body>


<div class="container">
<div class="songSelect">
	<form name='Form' class="form-vertical">

		
		
			<div class="row">
				<div class="form-group">
					<br/>
					<div class="col-sm-3 text-center" style="margin: 30px 0 30px 0;">
					<input type='file' name='txtProductFile' size="15"
						style='display: none'> <input type="Text"
						style="display: none" name="txtProductFileName" class='input'
						readOnly> <img width="200" style='cursor: hand' alt="����ã��"
						src="/resources/images/imageButton.PNG" align="absMiddle"
						border="0" onclick="fncProductFile()" id="imgInput">
						</div>
					<div class="col-sm-8 text-center" style="margin: 30px 0 30px 0;">
						<input type="text" name="title" placeholder="�� ������ �Է����ּ���"
							style="font-size: 20px; width: 100%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;" /><br/>
							<div class="form-group" align="left">
						   <strong style="font-size: 15px">ī�װ�</strong> <select 	name="categoryCode"	id="categoryCode" class="form-control" 
							style="height: 40px" maxLength="20">
						<option value="1" selected="selected">�뷡 �̾� �θ���</option>
						<option value="2">�� �о��ֱ�</option>
						<option value="3">ASMR</option>
						<option value="4">������ŷ</option>
						<option value="5">�˸��� �����</option>
					</select>
					<br/>
					<div class="category1">
					<input type="text" name="ok" id="ok" placeholder="���� �뷡�ΰ���?"
							style="font-size: 20px; width: 80%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;" readonly/>
							<button type="button" class="songSelectButton" data-toggle="modal"data-target="#myModal">�뷡 �˻�</button>
						  </div></div>
					</div>
				</div>
			</div>
			<div class="makevoice">
			<center>
		<button type="button" class="makevoiceroom" >�Ϸ�</button>
		</center>
		</div>
	</form>

</div>
</div>

	<div class="col-xs-12">
		
	<!-- 
	<input type="text" placeholder="���õȳ뷡" name="selectsong"id="selectsong" value=""> 
	<input type="text"placeholder="�����̸�" name="selectsinger" id="selectsinger" value="">
	-->	
	</div>







	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<b>�뷡�� �˻��ϼ���!</b>
					</h4>
				</div>
				<div class="modal-body">
					<div class="topnav">
						<div class="search-container">
							<input type="text" placeholder="�����̳� �������� �Է��ϼ���"
								name="searchsong" id="searchsong" value="">
							<button type="button" class="btn btn-primary" id="search">�˻�</button>
							<button type="submit" class="btn btn-primary" data-dismiss="modal" id="select">����</button>
							<br />
							<div class="viewlist"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="topnav">
						<div class="search-container">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>