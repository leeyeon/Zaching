<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>


<link rel="stylesheet" type="text/css" href="/resources/livingInfo/aroundsearch.css"/>

</head>
<body>
	<div class="container">
	<div class="page-header text-info">
	       
<div class="topnav">
  <div class="search-container">
      <input type="text" placeholder="Search.." name="search" id="selectAddress" value="" readonly>
      <button type="submit" id="selectSearch"><i class="fa fa-search"></i></button>
  </div>
</div>
<!-- <button type="button" class="btn btn-primary" id="���ּҷΰ˻�">���ּҷΰ˻�</button> -->


	    </div>
	    


<div class="map_wrap">
    <div id="map" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>
    <ul id="category">
        <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            ����
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            ��Ʈ
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            �౹
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            ������
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            ī��
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            ������
        </li>
        
         <li id="PO3" data-order="6"> 
            <span class="category_bg cafe"></span>
            �������
        </li>       
    </ul>
</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43d9cc470a001d78424b773481ac24d2&libraries=services"></script>
<script src="/resources/livingInfo/aroundsearchmap.js"></script>



</body>
</html>

