<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
   <title>ListBroadcast</title>
   
   <jsp:include page="../resources/layout/sub_toolbar.jsp"/>
   <meta charset="utf-8">
   <meta name="author" content="pixelhint.com">
   <meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
   <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
   
   
   <link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/responsive.css">
   <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
   
   <style type="text/css">
      .listings ul.properties_list li a #profile{
         width: 40px;
         height: 40px;
         border-radius: 150px;
      }
      
      body > section.listings > div > div > p10{
         cursor: pointer;
      }
      
      #footer {
         position:fixed;
         left:0px;
         bottom:50px;
         width:100%;
      }
      
      
      #ck-button {
          margin:4px;
          background-color:#EFEFEF;
          border-radius:4px;
          border:1px solid #D0D0D0;
          overflow:auto;
          float:left;
      }

      .search_fields label span {
          text-align:center;
          padding:3px 0px;
          display:block;
      }
      .search_fields label input {
          position:absolute;
          top:0px;
      }
      .search_fields input:checked + span {
          background-color:#a2dfe5;
          color:#fff;
      }
          
          .dialog-add-broads {
             background: #ccc;
             position: relative;
             width: 200px;
             left: -80px;
             top: -200px;
             box-shadow: 0 5px 15px -5px #666;
          }
          .btn-add-broads {
             border: 1px solid #FFFFF;
         border-radius: 70px;
         -moz-border-radius: 70px;
         -khtml-border-radius: 70px;
         -webkit-border-radius: 70px;
         background: #5F4B8B;
         width: 80px;
         height: 80px;
         line-height: 80px;
         font-size: 25px;
         float:right;
         margin-right: 20px;
         cursor: pointer;
         color: #FFFFFF;
         box-shadow: 0 5px 15px -5px #666;
          }
          
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	}
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	}
	 
	.filebox input[type="file"] {  
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}
	a:link, a:visited { 
	    color: #00000;
	 }
	  a:link:active, a:visited:active { 
	    color: #00000;
	 }
	 
	.profile-img {
		border-radius: 50%;
	}
	
	.link-style {
	    float: right;
	    /* top: 10px; */
	    position: relative;
	    right: 0;
	    top: 6px;
	}
	
	.button-container {
  display: inline-block;
  margin: 10px 10px;
  cursor: pointer;
  font-weight: 400;
  letter-spacing: 2px;
  height: 45px;
  width: 200px;
  -webkit-perspective: 1000;
  -ms-perspective: 1000;
  perspective: 1000;
}
.button-container .flipper {
  transition: all .5s ease-in-out;
  -webkit-transform-style: preserve-3d;
  -ms-transform-style: preserve-3d;
  transform-style: preserve-3d;
  position: relative;
}
.button-container .button {
  height: 45px;
  width: 160px;
  border-radius: 3px;
  backface-visibility: hidden;
  position: absolute;
  top: 0;
  left: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  -webkit-box-shadow: 1px 2px 4px -1px rgba(60, 60, 60, 0.64);
  box-shadow: 1px 2px 4px -1px rgba(60, 60, 60, 0.64);
}
.button-container .button i.fa {
  color: white;
  font-size: 20px;
  margin: auto;
  text-shadow: .5px 1px 2px #3c3c3c;
}
.button-container .button.front {
  z-index: 10;
}
.button-container .button.back {
  color: white;
  font-size: 15px;
  text-transform: uppercase;
}
/* -------------------------------- 
			Slide
-------------------------------- */
.slider i {
  transition: all .3s ease-in-out;
}
.slider i:before {
  transition: all .3s ease-in-out;
}
.slider i:after {
  font-family: "Lato", sans-serif;
  color: white;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 2px;
  text-shadow: none;
  content: '등록하기';
  position: absolute;
  opacity: 0;
  top: 2.5px;
  transition: all .3s ease-in-out;
}

/*** Horizontal Slide ***/
.button-slide-horizontal .button {
  background-image: linear-gradient(90deg, #ea4c89, #ee9b83);
}
.button-slide-horizontal i {
  position: relative;
  display: inline-block;
  transition: all .3s ease-in-out;
}
.button-slide-horizontal i:before {
  transition: all .3s ease-in-out;
}
.button-slide-horizontal:hover i {
  padding-right: 100px;
}
.button-slide-horizontal:hover i:before {
  opacity: 0;
}
.button-slide-horizontal:hover i:after {
  opacity: 1;
}		
      @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
      #myModal { font-family: 'Jeju Gothic'; }
   }
      
   </style>
   <script type="text/javascript">
      
   
    
    
      $(function() {
         
         $(document).on("click",'body > section.listings > div > ul > li > img', function(){
            var index = $("body > section.listings > div > ul > li > img").index(this);
            var broadcastId = $($("input[name=broadcastId]")[index]).val();
               winOpen();
               
               function winOpen() {
                  window.open("http://192.168.0.31:3000/broadcast?broadcaster="+broadcastId+"&connectUserId="+${sessionScope.user.userId} ,"addBroadcast","width=1450,height=900,toolbar=no")
                 
                  }
         });
         
         
         
         $(document).on("click",".user_thumnail", function(){
            if('${user}' != '') {
               var index = $(".user_thumnail").index(this);
               var broadcastId = $($("input[name=broadcastId]")[index]).val();
               //alert(index+"//"+bobId+"//"+category);
               $(self.location).attr("href","/user/getTimeLine?userId="+broadcastId);
            } else {
               alert("로그인 후에 친구의 타임라인을 들어가실 수 있습니다.\n"
                     + "간편회원가입을 통해서 자췽 서비스를 이용해보세요.");
               $('#loginModal').modal('toggle');
               //$(self.location).attr("href","/user/addUser");
            }            
         });
         
         
         var page = ${resultPage.currentPage};
         var pageSize = ${resultPage.pageSize};
         if('${search.searchCondition}' == '')
            var searchCondition = null;
         else
            var searchCondition = '${searchCondition}';
         if('${search.searchKeyword}' == '')
            var searchKeyword = null;
         else
            var searchKeyword = '${searchKeyword}';
            
         $(document).on('click',"body > section.listings > div > div > p10", function(){
            fnc_listing();
         });
         
         
         function fnc_listing(){
            page++;
            
            $.ajax({
               url : "/broadcast/json/listBroadcast",
               method : "POST",
               contentType : "application/json; charset=UTF-8",
               data : JSON.stringify({
                  "currentPage" : page,
                  "pageSize" : pageSize,
                  "searchCondition" : searchCondition,
                  "searchKeyword" : searchKeyword
               }),
               
               async : false,
               dataType : "json",
               success : function(serverData){
                  /* jquery each
                  $(serverData).each(function(index,data) {
                     data.title;
                  )};
                  */
               var display = '';
            for(var i=0; i<serverData.length; i++){                           
                  display = display + '<li>'+ 
                     '<img src = "../resources/upload_files/images/'+serverData[i].image+'" onerror="this.src=\'../resources/images/broadcast_default.jpg\'" />'+
                     '<input type="hidden" name="broadcastId" value="'+serverData[i].broadcastId+'">'+
                     '<div class="property_details" style="width: 100%" >'+
                        '<div class ="user_thumnail">'+
                        '<h1>'+
                           '<a href="#" style="vertical-align: bottom;"><img src="../resources/images/'+serverData[i].profileImage+'" id="profile" onerror="this.src=\'../resources/images/20160916_190916.jpg\'">&nbsp; [BJ] '+serverData[i].broadcaster+'</a>'+
                        '</h1>'+
                        '</div>'+
                        '<h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'+
                           serverData[i].title+
                        '</h1>'+
                        '<h2><span class="property_size">'+serverData[i].detail+'</span></h2>'+
                     '</div>'+
                  '</li>';
                  }
                  $(".properties_list").append(display);
               }
            });
         }
      });    

      //dialog ajax
      function addBroadcast(){
         
         $("#addBroadcastForm").attr("method", "POST").attr("action", "/broadcast/addBroadcast").submit();
      }
      

      
      var oTbl;
      //Row 추가
      function insRow() {
        oTbl = document.getElementById("addForbidden");
        var oRow = oTbl.insertRow();
        oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
        var oCell = oRow.insertCell();

        //삽입될 Form Tag
        var frmTag = "<input type= text class= text name= forbidden style= font-size: 20px; width: 50%;> ";
        frmTag += "<input type= button value='삭제' onClick='removeRow()' style='cursor:hand'>";
        oCell.innerHTML = frmTag;
      }
      //Row 삭제
      function removeRow() {
        oTbl.deleteRow(oTbl.clickedRowIndex);
      }

      function frmCheck()
      {
        var frm = document.form;
        
        for( var i = 0; i <= frm.elements.length - 1; i++ ){
           if( frm.elements[i].name == "forbidden" )
           {
               if( !frm.elements[i].value ){
                   alert("텍스트박스에 값을 입력하세요!");
                   frm.elements[i].focus();
                   return;
                }
            }
         }
       }
      
      function getThumbnailPrivew(html, $target) {
          if (html.files && html.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                  $target.css('display', '');
                  //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
                  $target.html('<img src="' + e.target.result + '" border="0" alt="" />');
              }
              reader.readAsDataURL(html.files[0]);
          }
      }
   </script>
</head>

<body>   
      <div class="cover"></div>
      <div class="bg"></div>
      
      <section class="hero" style="background-image: url('../resources/images/main_broadcast.jpg');
            background-size: cover;
            background-repeat: no-repeat, no-repeat;
            background-position: center center; height:700px; ">
         <div class="img-cover"></div>
         <section class="caption" style="padding-top: 70px;">
            <h2 class="caption">Zaching TV</h2>
         </section>
      </section>
         
   <section class="search" style="background: #000; margin-bottom: 30px;">
      <div class="wrapper">
         <form id="searchForm">
            <input type="text" id="search" name="searchKeyword" placeholder="What are you looking for?"  autocomplete="off" style="background: none;"/>
            <input type="submit" id="submit_search" name="submit_search"/>
         </form>
            <a href="#" class="advanced_search_icon" id="advanced_search_btn"></a>
      </div>
      
      <div class="advanced_search" >
         <div class="wrapper">
            <span class="arrow"></span>
               <div id="exTab2" style="padding:0;">
            </div>
         </div>
      </div><!--  end advanced search section  -->
   </section><!--  end search section  -->
       
   <section class="listings">
      <div class="wrapper">
         <ul class="properties_list">
            <c:forEach var="obj" items="${list}" varStatus="status">
               <input type="hidden" name="broadcastId" value="${obj.broadcastId}">
               <li>
                  <img src = "../resources/upload_files/images/${obj.image}"
                     onerror="this.src='../resources/images/broadcast_default.jpg'" >
                  <!-- <span class="price"><i class="fas fa-play-circle"></i>&nbsp;${voice.countReply}</span> -->
                  <div class="property_details" style="width: 100%">
                     <div class ="user_thumnail">
                     <h1>
                        <a href="#" style="vertical-align: bottom;"><img src="../resources/images/${obj.profileImage}" id="profile" onerror="this.src='../resources/images/20160916_190916.jpg'">&nbsp;[BJ]&nbsp;${obj.broadcaster}</a>
                     </h1>
                     </div>
                     <h1 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
                        ${obj.title}
                     </h1>
                        <h2><span class="property_size">${obj.detail}</span></h2>
                  </div>
               </li>
               </c:forEach>
         </ul>
         <div class="more_listing">
            <p10 class="more_listing_btn">View More Listings</p10>
         </div>
      </div>
   </section>   <!--  end listing section  -->
             
             <!-- 방만들기 버튼 시작 -->
   
   <div id="footer" align="right" style="z-index: 1500; ">
      <c:if test="${user.userId ne null}">
        <div class="container">
        <div class="btn-add-broads text-center" data-toggle="modal" data-target="#myModal" style="font-size:20px;
        background: url('../resources/images/ic_add_circle_black_36px.svg') center center no-repeat; background-size: cover;">
        </div>
     </div>
     </c:if>
   </div>
   <!--  방만들기 버튼 끝 -->

	 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document" style=" width: 500px;" >
		    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><b>방 만들기</b></h4>
        <form id="addBroadcastForm" enctype="multipart/form-data" method="post">
		<input type="hidden" value="${user.userId}" name="userId" id="userId"/>	
		
		<div class="container">
			<div class="row">
				<table border="1">
				  <tr>
					<td width="250">
						<div class="form-group" align="left">
						   <input type="text" name="title" placeholder="제목" style="font-size: 20px; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;" />
						</div>
						<div class="form-group" align="left">
						   <textarea name="detail" placeholder="상세정보" style="font-size: 20px; width: 450px; height: 150px; padding-left: 20px; border: none; border-bottom: 1px solid #eee; rows="7"></textarea>
						</div>
					</td>						  
				  </tr> 
				</table>
				
				<table border="1">
				  <tr>
					<td style="table-layout:fixed" width="220px">
						<div class="filebox">
					        <label for="cma_file">사진 인증샷 업로드</label>
							<input type="file" name="file" id="cma_file" imageswap="true" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))"/>
					        <div id="cma_image" style="width:200px;max-width:200px;display:none;"></div>
					    </div>
					</td>	
					
					<td width="170" style="text-align: right; vertical-align: middle;">

						<div class="button-container button-slide-horizontal" onclick="addBroadcast();">
					        <div class="slider slider-horizontal">
					            <div class="button">
					              	<i class="fa fa-dribbble"></i>
					            </div>
					        </div>
				    	</div>

					</td>					
				  </tr>
				</table>
				</div>
		   </div>
		</form>
	</div>
	</div>
  </div>
</div>

   <!--modal addBroadcast
	 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title caption" id="myModalLabel"><b>Broadcast</b></h4>
      </div>
        <form id="addBroadcastForm" enctype="multipart/form-data" method="post">
       <div> 
          <input type="text" name="title" placeholder="제목" style="font-size: 20px; width: 90%; height: 50px; padding-left: 20px; border: none; border-bottom: 1px solid #eee;"/>
         </div>
      <div >    
          <textarea name="detail" placeholder="상세정보" style="font-size: 20px; width: 90%; height: 150px; padding-left: 20px; border: none; border-bottom: 1px solid #eee; rows="7"></textarea>
        </div>
     <div class="filebox">
        <label for="cma_file">대표 사진</label>
      <input type="file" name="file" id="cma_file" imageswap="true" accept="image/*" capture="camera" onchange="getThumbnailPrivew(this,$('#cma_image'))"/>
        <div id="cma_image" style="width:200px;max-width:200px;display:none;"></div>
    </div>
  
      <div class="modal-footer">
       <div class="topnav">
      <div class="search-container">
         <button type="button" class="btn btn-primary" id="addBroadcast" data-dismiss="modal" >send</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div></div>
       
      </div>
      </form>
    </div>
  </div>
</div>
          -->
          
</body>
</html>