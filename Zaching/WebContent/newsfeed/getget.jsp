<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
function handler(){
	var temptr = $('<tr class="classname"><td> appending</td></tr>');
	$(this).after(temptr);
	temptr.click(handler);
}

$(document).ready(function(){
	$("tr.classname").click(function(){
		var temptr = $('<tr class="classname"><td> appended row </td></tr>');
		$(this).after(temptr);
		temptr.click(handler);
	});
});
</script>
</head>

<body>
<table border="1" cellspacing="0">
<tbody>
<tr class="classname"><td> 1 </td></tr>
<tr class="classname"><td> 2 </td></tr>
<tr class="classname"><td> 3 </td></tr>
<tr class="classname"><td> 4 </td></tr>
</tbody>
</table>
</body>
</html>