
<!DOCTYPE html><html lang='en' class=''>
<head>


<style>/* reset */
	
	#ck-button label {
	    float:left;
	    width:4.0em;
	}
	#ck-button label span {
	    text-align:center;
	    padding:3px 0px;
	    display:block;
	}
	#ck-button label input {
	    position:absolute;
	    top:-20px;
	}
	#ck-button input:checked + span {
	    background-color:#aac8e4;
	    color:#fff;
	}



</style>
</head>
<body>


<!--기본(Default)-->
 
<!--변경(Changed)-->
<div>
    <div id="ck-button">
       <label>
          <input type="radio" class="float" name="searchCondition" id="searchCondition" value="1"><span>radio_1</span>
       </label>
    </div>
 
    <div id="ck-button">
       <label>
          <input type="radio" name="searchCondition" id="searchCondition" value="2"><span>radio_2</span>
       </label>
    </div>
 
</div>

</body></html>