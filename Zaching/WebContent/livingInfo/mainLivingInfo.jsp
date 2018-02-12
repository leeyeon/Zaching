<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
 
  <link href="/resources/css/nivo-lightbox.css" rel="stylesheet" />
  <link href="/resources/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
  <link href="/resources/css/owl.carousel.css" rel="stylesheet" media="screen" />
  <link href="/resources/css/owl.theme.css" rel="stylesheet" media="screen" />
  <link href="/resources/css/animate.css" rel="stylesheet" />
  <link href="/resources/css/livingStyle.css" rel="stylesheet">
  <link href="/resources/color/default.css" rel="stylesheet">
  
<jsp:include page="../resources/layout/sub_toolbar.jsp"/>
  <script src="/resources/javascript/chatbot.js"></script>

</head>
<script>
$(function() {

	 $( "#fixedbtn" ).on("click" , function() {		
		 $( document ).ready(function() {
			    showPopup();
			    function showPopup() { window.open("/livingInfo/getChatbot.jsp", "a", "width=370px, height=470px, left=1000, top=50"); }
			});
		});
});

$('.mainbar-menu').on('click', function(){
	 $('.active').removeClass('active');
	 $(this).addClass('active');
});
	
	
$( ".navbar-brand img" ).on("click" , function() {
	$(self.location).attr("href","/");			
});

$("a:contains('라이브방송')").on("click", function() {
	self.location = "/broadcast/listBroadcast";
});

$("a:contains('보이스리플')").on("click", function() {
	self.location = "/voice/listVoice";
});

$( "a:contains('밥친구')" ).on("click" , function() {
	$(self.location).attr("href","/bob/mainBob");			
});

$("a:contains('생활정보')").on("click", function() {
	self.location = "/livingInfo/mainLivingInfo";
});

$("a:contains('회원가입')").on("click", function() {
	self.location = "/user/addUser";
});

$("a:contains('로그아웃')").on("click", function() {
	self.location = "/user/logout";
});

$( "#profile" ).on("click" , function() {
	self.location = "/user/getTimeLine?userId=${sessionScope.user.userId}";			
});


</script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);		
		
		* {
			font-family: 'Nanum Gothic', serif;
		}
#music{
background-image: url('/resources/images/musicbg.png');
background-repeat: repeat;
}

.bg {
			background: url('../resources/images/simple2.png') no-repeat center center;
			position: fixed;
			width: 100%;
			height: 100%;
			background-size: cover;
			top: 0;
			left: 0;
			z-index: -1;
			opacity: 0.3;
		}
		
body{
background: rgba(255,255,255,1);
padding-top: 100px;
}
#fixedbtn{position:fixed;
			right:50px;
			bottom:50px;
			z-index:1000}
#pageFrame{
background: rgba(255,255,255,1);
}
			

.next, .prev {
  color: #444;
  position: absolute;
  top: 100px;
  padding: 1em 4em;
  cursor: pointer;
  border-radius: 5px;
  border-top: 1px solid #FFF;
  transition: box-shadow 0.1s, top 0.1s;
}
.next:hover, .prev:hover { color: #000; }
.next:active, .prev:active {
  top: 104px;
}
.next { right: 15em; }
.prev { left: 15em; }

.musicChart{
font-size: 20px;
 text-align: left;
}

.sticky {
  position: fixed;
  top: 100px;
  width: 100%;
  opacity: 0.7;
}

.sticky + .about {
  padding-top: 503px;
}

 </style>
 <script>
 $(function() {
 window.onscroll = function() {myFunction()};

 var header =  document.getElementById("navigation2");
 var sticky = header.offsetTop;

 function myFunction() {
	
   if (window.pageYOffset >= sticky - 95) {
     header.classList.add("sticky");
   } else {
     header.classList.remove("sticky");
   }
 }
 
 });
 </script>
</style>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
  <!-- Preloader -->
  	<div class="bg"></div>
  <div id="preloader">
    <div id="load"></div>
  </div>

  <!-- Section: intro -->
  <section id="intro" class="intro">

    <div class="slogan">
    <img src="/resources/images/livinglogo.png" alt="" />
    </div>
    <div class="page-scroll">
      <a href="#about">
				<i class="fa fa-angle-down fa-5x animated"></i>
			</a>
    </div>
  </section>
  <!-- /Section: intro -->

  <!-- Navigation -->
  <div id="navigation2">
    <nav class="navbar navbar-custom" role="navigation2">
      <div class="container">
        <div class="row">
          <div class="col-md-12">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
                                                <i class="fa fa-bars"></i>
                                                </button>
            </div>
            <br/>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="menu">
              <ul class="nav2 navbar-nav">
                <li class="active"><a href="#intro">HOME</a></li>&nbsp;&nbsp;
                <li><a href="#about">편의시설검색</a></li>&nbsp;&nbsp;
                <li><a href="#gallery">전월세정보</a></li>&nbsp;&nbsp;
                <li><a href="#contact">문화정보</a></li>&nbsp;&nbsp;
                <li><a href="#job">공채정보</a></li>
              </ul>
            </div>
            <!-- /.Navbar-collapse -->

          </div>
        </div>
      </div>
      <!-- /.container -->
    </nav>
  </div>
  <!-- /Navigation -->

 

  


 
   <!-- Section: about -->
  <section id="about" class="home-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2">

          <div class="section-heading text-center">
            <div class="wow bounceInDown" data-wow-delay="0.2s">
              <h2><img src="/resources/images/conmap.png" width="80px"> 편의시설검색</h2>
            </div>
            <p class="wow bounceInUp" data-wow-delay="0.3s">주소 주변의 편의 시설을 검색해보세요!</p>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <p><strong></strong></p>         
          			<jsp:include page="getAroundSearch.jsp"/>
          			
        </div>
      </div>
    </div>
  </section>
  <!-- /Section: about -->
  <br/> <br/> <br/> <br/>
   <!-- Section: gallery -->
  <section id="gallery" class="home-section text-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
          <div class="wow bounceInDown" data-wow-delay="0.4s">
            <div class="section-heading">
              <h2><img src="/resources/images/mortgage.png" width="80px"> 전월세정보</h2>
              <p>지역별(시/동 기준) 평균 월세를 나타냅니다.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

     
     <div class="container">
      <div class="row">
        <div class="col-md-6">
          <p><strong></strong></p>         
          			<jsp:include page="getRentCharge.jsp"/> 
          			
        </div>
      </div>
    </div>
  </section>
  <!-- /Section: services -->
  
  
  

<br/><br/><br/>


  <!-- Section: contact -->
  <section id="contact" class="home-section text-center">
    <div class="heading-contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-offset-2">

            <div class="section-heading">
              <div class="wow bounceInDown" data-wow-delay="0.4s">
                <h2>문화정보</h2>
              </div>
              <p class="wow lightSpeedIn" data-wow-delay="0.3s">영화 인기순위, 베스트 셀러, 현재 멜론 노래 순위입니다.</p>
            </div>

          </div>
        </div>
      </div>
    </div>
    
    <jsp:include page="getBestBook.jsp"/>
   
   
    
     <div class="container">
     <p class="wow bounceInUp" data-wow-delay="0.3s"><img src="/resources/images/open-book.png" width="80px"> &nbsp; <img src="/resources/images/bestseller.png"/></p><br/><br/>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" id="bookchart"> 
    </div>
    <!-- Left and right controls -->
   <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
    
  </div>
</div>



  </section>
  <br/> <br/> <br/>
  <section id="contact" class="home-section text-center">
   <div id="music">
  <h2><img src="/resources/images/cd.png" width="80px"> &nbsp; <img src="/resources/images/musiccharts.png"/></h2><br/><br/>
              <p>현재 멜론 음악 차트 순위입니다. </p><br/><br/>
  <jsp:include page="getMusicChart.jsp"/>
              <center>
    <div class="musicChart">
    </div></center>
  
  </div>
</section>
 <br/> <br/> <br/>

<section id="contact" class="home-section text-center">
<p class="wow bounceInUp" data-wow-delay="0.3s"><img src="/resources/images/moviec.png" width="80px"> &nbsp; <img src="/resources/images/moviechart.png"/></p>
   <!--  <jsp:include page="getMovieInfo.jsp"/> --> 

   <div class="containerr">
  <div class="carouselMovie">
   </div>
</div>
<div class="next"><img src="/resources/images/right-chevron.png" width="50px"></div>
<div class="prev"><img src="/resources/images/left-chevron.png" width="50px"></div>
</section>

<br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/>

<section id="job" class="home-section text-center">
    <div class="heading-contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-offset-2">

            <div class="section-heading">
              <div class="wow bounceInDown" data-wow-delay="0.4s">
                <h2><b>공개 채용 정보</b></h2>
              </div>
              <p class="wow lightSpeedIn" data-wow-delay="0.3s">이번 달 공채 정보 달력입니다.</p>
            </div>

          </div>
        </div>
      </div>
    </div>
    <iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/month" frameborder="0"
width="80%" height="1200px" scrolling="auto"></iframe><div class="container"></div>
</div>
</section>

<footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-12">
        <br/>
        <br/>
          <p>&copy; ZACHING. All Rights Reserved</p>
          <br/>
          <br/>
        </div>
      </div>
    </div>
  </footer>
  

<script  src="/resources/js/index.js"></script>
   
  <script src="/resources/js/jquery.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/jquery.easing.min.js"></script>
  <script src="/resources/js/jquery.sticky.js"></script>
  <script src="/resources/js/jquery.scrollTo.js"></script>
  <script src="/resources/js/stellar.js"></script>
  <script src="/resources/js/wow.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/nivo-lightbox.min.js"></script>
  <!-- Custom Theme JavaScript -->
  <script src="/resources/js/custom.js"></script>
  <script src="/resources/js/contactform.js"></script>
  
	<img src="../resources/images/chat.png" id="fixedbtn">
</body>

</html>
