<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="pixelhint.com">
	<meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/responsive.css">
	
	
  <link href="/resources/css/nivo-lightbox.css" rel="stylesheet" />
  <link href="/resources/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
  <link href="/resources/css/owl.carousel.css" rel="stylesheet" media="screen" />
  <link href="/resources/css/owl.theme.css" rel="stylesheet" media="screen" />
  <link href="/resources/css/animate.css" rel="stylesheet" />
  <link href="/resources/css/livingStyle.css" rel="stylesheet">

	<script type="text/javascript" src="/resources/javascript/jquery.js"></script>
	<script type="text/javascript" src="/resources/javascript/main.js"></script>
	  <script src="/resources/javascript/chatbot.js"></script>
	  <jsp:include page="../resources/layout/sub_toolbar.jsp"/>
</head>
<style>

#music{
background-image: url('/resources/images/musicbg.png');
background-repeat: repeat;
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
  background-color : #fff;
  color : #fff;
  background : rgba(255,255,255,1);
}

.sticky + .about {
  padding-top: 503px;  
}

 </style>
 <script>
 $(function() {

	 $( "#fixedbtn" ).on("click" , function() {		
		 $( document ).ready(function() {
			    showPopup();
			    function showPopup() { window.open("/livingInfo/getChatbot.jsp", "a", "width=370px, height=470px, left=1000, top=50"); }
			});
		});
});
 
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
	.hero{
		background: url(/resources/images/arno-smit-83025.jpg) no-repeat bottom center;
		background-size: 100% 100%;
		height: 700px;
	}
	.img-cover{
         position: absolute;
         height: 100%;
         width: 100%;
         background-color: rgba(0, 0, 0, 0.3);                                                                 
         z-index:1;
      }
    #navigation2{
    background: #bfd9f2;
    height: 60px;
    z-index: 1000;
    }
    
    #menu > ul{
    	background: #bfd9f2;
    }
    .navbar-custom ul.nav2 {
	text-align: center;
	float: none;
	margin: 0 auto;
}
.navbar-custom ul.nav2 li {
	float: none;
	display: inline-block;
	text-align: center;
}
.navbar-custom ul.nav2 li a {
	font-size: 14px;
	letter-spacing: 1px;
    color: #444;
	text-transform: uppercase;
	font-weight: 700;
}

.navbar-custom .nav2 li a {
    -webkit-transition: background .3s ease-in-out;
    -moz-transition: background .3s ease-in-out;
    transition: background .3s ease-in-out;
}
</style>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
  <!-- Preloader -->
  	<div class="bg"></div>
  <div id="preloader">
    <div id="load"></div>
  </div>

	<section class="hero" id="intro">
		<div class="img-cover"></div>

			<section class="caption">
				<h2 class="caption">Living Information</h2>
				<h3 class="properties">Map - Culture - Job</h3>
			</section>
	</section><!--  end hero section  -->


	<div id="navigation2">
    <nav class="navbar navbar-custom" role="navigation2">
      <div class="container">
        <div class="row">
          <div class="col-md-12">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu"><i class="fa fa-bars"></i> </button>
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
 <!--   <jsp:include page="getMovieInfo.jsp"/> -->  

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
<br/><br/><br/>

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
		<div class="wrapper footer">
	</div>

		<div class="copyrights wrapper">
			Copyright © 2015 <a href="http://pixelhint.com" target="_blank" class="ph_link" title="Download more free Templates">Pixelhint.com</a>. All Rights Reserved.
		</div>
	</footer><!--  end footer  -->
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