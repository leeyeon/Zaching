<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
		<meta http-equiv="Content-Script-Type" content="text/javascript"/>
		<meta http-equiv="Content-Style-Type" content="text/css"/>
		<meta http-equiv="Pragma" content="No-Cache"/>
		<meta http-equiv="Expires" content="now"/>
		<meta property="og:locale" content="ko_KR" >
<meta property="og:type" content="website" >
<meta property="og:title" content="&#45348;&#51060;&#48260;&#49660;&#54609; &#48177;&#54868;&#51216;&#50952;&#46020;" >
<meta property="og:description" content="&#51648;&#44552;, &#48177;&#54868;&#51216; &#46356;&#49828;&#54540;&#47112;&#51060; &#49345;&#54408; &#44536;&#45824;&#47196;" >
<meta property="og:image" content="https://ssl.pstatic.net/static.checkout/stylewindow/m/img/icon/department/snippet_image.png" >
<meta name="twitter:card" content="summary" >
<meta name="twitter:title" content="&#45348;&#51060;&#48260;&#49660;&#54609; &#48177;&#54868;&#51216;&#50952;&#46020;" >
<meta name="twitter:description" content="&#51648;&#44552;, &#48177;&#54868;&#51216; &#46356;&#49828;&#54540;&#47112;&#51060; &#49345;&#54408; &#44536;&#45824;&#47196;" >
<meta name="twitter:image" content="https://ssl.pstatic.net/static.checkout/stylewindow/m/img/icon/department/snippet_image.png" >


		<link class="favicon" rel="shortcut icon" href="WebContent/resources/images/bird-of-cute-rounded-rectangular-shape.ico" type="image/x-icon"/>

        <title></title>

<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/global/css/global.css">
<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/global/css/rename.css">
<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/css/common.css">

<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/css/popup.css">
<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/css/plugin/magnific-popup.css">

		<link class="skin" rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/css/department.css">

	</head>
	
	<body style="overflow-y:scroll;">



	<!-- header -->
	
			<div id="lnb_bar" class="co_lnb">
				<h2 class="blind">메인 메뉴</h2>
				<!-- [D] 좌우버튼 노출시 class="g_rolling" 추가 -->
 				<div class="g_menu_area">
					<ul id="gnb_menu_layer" class="co_menu">
						<li menu-code="HOME" ext-mode="Y" class="co_lnb_home">
							<a href="http://pc.shopping2.naver.com/home/p/index.nhn" class="N=a:LNB.home"><em><span>홈</span></em></a><!--N=a:LNB.home-->
						</li>
						<li menu-code="DEPT" ext-mode="N" class="co_lnb_depart">
							<a href="/department/home" class="N=a:LNB.wdep on"><em><span>백화점윈도</span></em></a><!--N=a:LNB.wdep-->
						</li>
						<li menu-code="OULT" ext-mode="N" class="co_lnb_oulet">
							<a href="/outlet/home" class="N=a:LNB.wout "><em><span>아울렛윈도</span></em></a><!--N=a:LNB.wout-->
						</li>
						<li menu-code="STWD" ext-mode="N" class="co_lnb_style">
                            <a href="/style/style/home" class="N=a:LNB.wstl "><em><span>스타일윈도</span></em></a><!--N=a:LNB.wstl-->
                            <ul class="co_lnb_sub">
                                <li menu-code="STRO" ext-mode="N" prnt-menu-code="STWD" class="co_sub_roadshop"><a href="/style/style/home" class="N=a:LNB.roadshop "><span>로드샵</span></a></li>
                                <li menu-code="STFB" ext-mode="N" prnt-menu-code="STWD" class="co_sub_brandshop"><a href="/style/fashionbrand/list/contents" class="N=a:LNB.brand "><span>브랜드관</span></a><i class="co_sub_new">new</i></li>
                            </ul>
                        </li>
						<li menu-code="DSWD" ext-mode="N" class="co_lnb_designer">
							<a href="/designer/home" class="N=a:LNB.designerwindow "><em><span>디자이너윈도</span></em></a>
						</li>
						<li menu-code="BTWD" ext-mode="N" class="co_lnb_beauty">
							<a href="/beauty/home" class="N=a:LNB.beautywindow "><em><span>뷰티윈도</span></em></a><!--N=a:LNB.beautywindow-->
						</li>
						<li menu-code="LVWD" ext-mode="N" class="co_lnb_living">
							<a href="/living/home" class="N=a:LNB.wliving "><em><span>리빙윈도</span></em></a><!--N=a:LNB.wliving--><!-- [D] 선택시 class="on" 추가 -->
						</li>
						<li menu-code="FRWD" ext-mode="N" class="co_lnb_fresh">
							<a href="/fresh/home" class="N=a:LNB.wfresh "><em><span>푸드윈도</span></em></a><!--N=a:LNB.wfresh-->
							<ul class="co_lnb_sub">
								<li menu-code="DRTF" ext-mode="N" prnt-menu-code="FRWD" class="co_sub_producer"><a href="/fresh/directfarm/home" class="N=a:LNB.wsanji "><span>산지직송</span></a><!--N=a:LNB.wsanji--></li>
								<li menu-code="LCFD" ext-mode="N" prnt-menu-code="FRWD" class="co_sub_region"><a href="/fresh/localfood/home" class="N=a:LNB.wlocal "><span>지역명물</span></a><!--N=a:LNB.wlocal--></li>
								<li menu-code="TDAC" ext-mode="N" prnt-menu-code="FRWD" class="co_sub_alcohol"><a href="/fresh/traditionalalcohol/home" class="N=a:LNB.walcohol "><span>전통주</span></a><i class="co_sub_new">new</i></li>
								<li menu-code="HMML" ext-mode="N" prnt-menu-code="FRWD" class="co_sub_cooking"><a href="/fresh/homemeal/home" class="N=a:LNB.whomemeal "><span>쿠킹박스</span></a><i class="co_sub_new">new</i></li>
								<li menu-code="CNVN" ext-mode="N" prnt-menu-code="FRWD" class="co_sub_convenience"><a href="/fresh/cvs/home" class="N=a:LNB.wcvs "><span>편의점</span></a><!--N=a:LNB.wcvs--></li>
							</ul>
						</li>
						<li menu-code="KSWD" ext-mode="N" class="co_lnb_kids">
							<a href="/kids/home" class="N=a:LNB.wkids "><em><span>키즈윈도</span></em></a><!--N=a:LNB.wkids-->
						</li>
                        <li menu-code="PEWD" ext-mode="N" class="co_lnb_pet">
                            <a href="/pet/home" class="N=a:LNB.pet "><em><span>펫윈도</span></em><i class="co_lnb_beta">Beta</i></a><!--N=a:LNB.pet-->
                        </li>
						<li menu-code="PLWD" ext-mode="N" class="co_lnb_play">
							<a href="/play/home" class="N=a:LNB.wplay "><em><span>플레이윈도</span></em></a><!--N=a:LNB.wplay-->
						</li>
						<li menu-code="ATWD" ext-mode="N" class="co_lnb_art">
							<a href="/art/home" class="N=a:LNB.wart "><em><span>아트윈도</span></em></a>
						</li>
						<li menu-code="HOTD" ext-mode="Y" class="co_lnb_hotdeal">
							<span class="co_lnb_bar">|</span>
							<a href="http://pc.shopping2.naver.com/hotdeal/p/index.nhn" class="N=a:LNB.hotdeal"><em><span>핫딜</span></em></a><!--N=a:LNB.hotdeal-->
							<ul class="co_lnb_sub">
								<li menu-code="SCBT" ext-mode="Y" prnt-menu-code="HOTD" class="co_sub_social"><a href="http://pc.shopping2.naver.com/hotdeal/p/luckto/index.nhn" class="N=a:LNB.socialbest"><span>소셜베스트</span></a><!--N=a:LNB.socialbest--></li>
								<li menu-code="LKTD" ext-mode="Y" prnt-menu-code="HOTD" class="co_sub_lucky"><a href="http://pc.shopping2.naver.com/hotdeal/p/social/index.nhn" class="N=a:LNB.luckytoday"><span>럭키투데이</span></a><!--N=a:LNB.luckytoday--></li>
							</ul>
						</li>
						<li menu-code="FOWD" ext-mode="N" class="g_lnb_foreign">
							<a href="/foreign/home" class="N=a:LNB.globalwindow "><em><span>해외직구</span></em></a><!--N=a:LNB.globalwindow-->
						</li>
						<li menu-code="TMSP" ext-mode="Y" class="co_lnb_theme">
							<a href="http://pc.shopping2.naver.com/plan2/p/index.nhn" class="N=a:LNB.theme"><em><span>기획전</span></em></a><!--N=a:LNB.theme-->
						</li>
					</ul>
					
					<a href="#" role="button" class="g_btn_prev"><em><span>왼쪽으로 이동</span></em></a>
					<a href="#" role="button" class="g_btn_next"><em><span>오른쪽으로 이동</span></em></a>
				</div>
                <a href="#" class="co_insrh_open">검색영역 보기</a>
				<div class="co_insrh_area">
					<div class="co_insrh">
						<fieldset>
							<legend>서비스 내 검색</legend>
							<input type="text" class="co_insrh_input" title="검색어 입력" value="백화점윈도 검색">
							<a href="#" class="co_insrh_btn N=a:LNB.windowsearch">검색</a><!--N=a:LNB.windowsearch-->
						</fieldset>
					</div>
					<input type="hidden" id="defaultVal" name="defaultVal" value="백화점윈도 검색">
					<a href="#" class="co_insrh_close">검색영역 닫기</a>
				</div>
			</div>
			<span class="g_lnb_mask"></span>
		
		<div id="content" class="department department">


<div class="main_home department">
	
	<div class="home_location">
        <h3 class="location_title department_galleria _categoryContents _11007005" style="display:none;">
            <a class="link text_indent N=a:hom.tab" href="/department/site/11007005">갤러리아</a>
        </h3>
        <h3 class="location_title department_shinsegae _categoryContents _11007006" style="display:none;">
            <a class="link text_indent N=a:hom.tab" href="/department/site/11007006">신세계백화점</a>
        </h3>
        <h3 class="location_title department_hyundai _categoryContents _11007001" style="display:none;">
            <a class="link text_indent N=a:hom.tab" href="/department/site/11007001">현대백화점</a>
        </h3>
        <h3 class="location_title department_ak _categoryContents _11007003" style="display:none;">
            <a class="link text_indent N=a:hom.tab" href="/department/site/11007003">AK플라자</a>
        </h3>
        <h3 class="location_title department_lotte _categoryContents _11007002" style="display:none;">
            <a class="link text_indent N=a:hom.tab" href="/department/site/11007002">롯데백화점</a>
        </h3>
        <h3 class="location_title department_daegu _categoryContents _11007004" style="display:none;">
            <a class="link text_indent N=a:hom.tab" href="/department/site/11007004">대구백화점</a>
        </h3>
        <div class="location_img_mask " id="eg-flick-container">
            <div class="location_img eg-flick-container" >
                <a class="link N=a:hom.tab" href="/department/site/11007005" data-categoryid="11007005">
                    <img  src="../resources/images/sample_bob_background.jpg" width="652" height="326" alt="갤러리아">
                </a>
                <a class="link N=a:hom.tab" href="/department/site/11007006" data-categoryid="11007006">
                    <img  src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/img/spot/department_shinsegae.jpg" width="652" height="326" alt="신세계백화점">
                </a>
                <a class="link N=a:hom.tab" href="/department/site/11007001" data-categoryid="11007001">
                    <img  src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/img/spot/department_hyundai.jpg" width="652" height="326" alt="현대백화점">
                </a>
                <a class="link N=a:hom.tab" href="/department/site/11007003" data-categoryid="11007003">
                    <img  src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/img/spot/department_ak.jpg" width="652" height="326" alt="AK플라자">
                </a>
                <a class="link N=a:hom.tab" href="/department/site/11007002" data-categoryid="11007002">
                    <img  src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/img/spot/department_lotte.jpg" width="652" height="326" alt="롯데백화점">
                </a>
                <a class="link N=a:hom.tab" href="/department/site/11007004" data-categoryid="11007004">
                    <img  src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/img/spot/department_daegu.jpg" width="652" height="326" alt="대구백화점">
                </a>
            </div>
        </div>
<ul class="location_tag clearfix _11007005 _categoryContents" style="display: none">
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_13461" href="/department/list?query=11007005,BN_13461"><i class="bg brand"></i>Zaching</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_15741" href="/department/list?query=11007005,BN_15741"><i class="bg brand"></i>밥친구</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_513" href="/department/list?query=11007005,BN_513"><i class="bg brand"></i>우리지금만나</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_37412" href="/department/list?query=11007005,BN_37412"><i class="bg brand"></i>당장만나</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_222775" href="/department/list?query=11007005,BN_222775"><i class="bg brand"></i>보이스리플</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:11001003" href="/department/list?query=11007005,11001003"><i class="bg category"></i>뉴스피드</a>
                </li>
</ul>
    <div class="location_news _11007005 _categoryContents" style="z-index: 2100;display: none;">
        <h4 class="title text_indent">NEWS</h4>
        <ul>
            <li class="news">
                <a class="link clearfix N=a:hom.news" href="/department/site/11007005/news?first=3788">
                    <img class="img" src="../resources/images/temp_logo.png" width="42" height="42" alt="NEWS 이미지">
                    <p class="desc">자췽자췽</p><span class="store">자췽자췽</span>
                </a>
            </li>
            
            <li class="news">
                <a class="link clearfix N=a:hom.news" href="/department/site/11007005/news?first=3787">
                    <img class="img" src="../resources/images/temp_logo.png" width="42" height="42" alt="NEWS 이미지">
                    <p class="desc">지원 - 밥친구 구해요</p><span class="store">낙성대역</span>
                </a>
            </li>
                     </ul>
        <div class="bg"></div>
    </div>
<ul class="location_tag clearfix _11007006 _categoryContents" style="display: none">
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_222458" href="/department/list?query=11007006,BN_222458"><i class="bg brand"></i>마터니티</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_11589" href="/department/list?query=11007006,BN_11589"><i class="bg brand"></i>마리끌레르</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_14119" href="/department/list?query=11007006,BN_14119"><i class="bg brand"></i>캐리스노트</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_208779" href="/department/list?query=11007006,BN_208779"><i class="bg brand"></i>블루독</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_30718" href="/department/list?query=11007006,BN_30718"><i class="bg brand"></i>제임스진</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:11007006002" href="/department/list?query=11007006,11007006002"><i class="bg branch"></i>하남점</a>
                </li>
</ul>
<ul class="location_tag clearfix _11007001 _categoryContents" style="display: none">
                <li class="list ">
                    <a class="link N=a:hom.comt,i:11007001009" href="/department/list?query=11007001,11007001009"><i class="bg branch"></i>신촌점</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_13442" href="/department/list?query=11007001,BN_13442"><i class="bg brand"></i>오즈세컨</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_12632" href="/department/list?query=11007001,BN_12632"><i class="bg brand"></i>스테파넬</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_178271" href="/department/list?query=11007001,BN_178271"><i class="bg brand"></i>듀엘</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_12144" href="/department/list?query=11007001,BN_12144"><i class="bg brand"></i>보브</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_113233" href="/department/list?query=11007001,BN_113233"><i class="bg brand"></i>스톤헨지</a>
                </li>
</ul>
    <div class="location_news _11007001 _categoryContents" style="z-index: 2100;display: none;">
        <h4 class="title text_indent">NEWS</h4>
        <ul>
            <li class="news">
                <a class="link clearfix N=a:hom.news" href="/department/site/11007001/news?first=3738">
                    <img class="img" src="https://shop-phinf.pstatic.net/20180112_254/showindowCommon_1515742606311Eyoyx_JPEG/21064630538761632_-239992761.jpg?type=f72_72" width="42" height="42" alt="NEWS 이미지">
                    <p class="desc">1년에 단 한번! 진도 패밀리 80~50% 세일</p><span class="store">현대백화점 목동점</span>
                </a>
            </li>
            
            <li class="news">
                <a class="link clearfix N=a:hom.news" href="/department/site/11007001/news?first=3784">
                    <img class="img" src="https://shop-phinf.pstatic.net/20180124_296/showindowCommon_1516777996066tbfN9_JPEG/53382926409917831_-1040363244.jpg?type=f72_72" width="42" height="42" alt="NEWS 이미지">
                    <p class="desc">1년에 단 한번! 진도 패밀리 80~50% 세일</p><span class="store">현대백화점 목동점</span>
                </a>
            </li>
                     </ul>
        <div class="bg"></div>
    </div>
<ul class="location_tag clearfix _11007003 _categoryContents" style="display: none">
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_13543" href="/department/list?query=11007003,BN_13543"><i class="bg brand"></i>원더브라</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:11007003002" href="/department/list?query=11007003,11007003002"><i class="bg branch"></i>수원점</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_202451" href="/department/list?query=11007003,BN_202451"><i class="bg brand"></i>레페토</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:AT_11850" href="/department/list?query=11007003,AT_11850"><i class="bg attribute"></i>여아용</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_222231" href="/department/list?query=11007003,BN_222231"><i class="bg brand"></i>모코로코</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_222324" href="/department/list?query=11007003,BN_222324"><i class="bg brand"></i>라탭</a>
                </li>
</ul>
<ul class="location_tag clearfix _11007002 _categoryContents" style="display: none">
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_188917" href="/department/list?query=11007002,BN_188917"><i class="bg brand"></i>블랙야크키즈</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_224003" href="/department/list?query=11007002,BN_224003"><i class="bg brand"></i>쁘띠엘린</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_37991" href="/department/list?query=11007002,BN_37991"><i class="bg brand"></i>빌레로이앤보흐</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:11007002002" href="/department/list?query=11007002,11007002002"><i class="bg branch"></i>부산본점</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_222325" href="/department/list?query=11007002,BN_222325"><i class="bg brand"></i>인플럭스</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_201577" href="/department/list?query=11007002,BN_201577"><i class="bg brand"></i>비비안웨스트우드앵글로매니아</a>
                </li>
</ul>
<ul class="location_tag clearfix _11007004 _categoryContents" style="display: none">
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_32795" href="/department/list?query=11007004,BN_32795"><i class="bg brand"></i>타미힐피거키즈</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_224599" href="/department/list?query=11007004,BN_224599"><i class="bg brand"></i>멜로디가든</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_822" href="/department/list?query=11007004,BN_822"><i class="bg brand"></i>빈치스벤치</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_33148" href="/department/list?query=11007004,BN_33148"><i class="bg brand"></i>양키캔들</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:BN_27724" href="/department/list?query=11007004,BN_27724"><i class="bg brand"></i>마크제이콥스</a>
                </li>
                <li class="list ">
                    <a class="link N=a:hom.comt,i:11001001" href="/department/list?query=11007004,11001001"><i class="bg category"></i>상의</a>
                </li>
</ul>
    <div class="location_news _11007004 _categoryContents" style="z-index: 2100;display: none;">
        <h4 class="title text_indent">NEWS</h4>
        <ul>
            <li class="news">
                <a class="link clearfix N=a:hom.news" href="/department/site/11007004/news?first=3778">
                    <img class="img" src="https://shop-phinf.pstatic.net/20180122_3/showindowCommon_1516615335677fXUgp_JPEG/53220266030295164_399529484.JPG?type=f72_72" width="42" height="42" alt="NEWS 이미지">
                    <p class="desc">놀다가게 오픈기념! 스폐셜 프로모션</p><span class="store">대구백화점 본점</span>
                </a>
            </li>
            
            <li class="news">
                <a class="link clearfix N=a:hom.news" href="/department/site/11007004/news?first=3780">
                    <img class="img" src="https://shop-phinf.pstatic.net/20180122_240/showindowCommon_15166154078150qwLI_JPEG/53220338169573526_382864167.JPG?type=f72_72" width="42" height="42" alt="NEWS 이미지">
                    <p class="desc">대백 설 선물 큰잔치</p><span class="store">대구백화점 전점</span>
                </a>
            </li>
                     </ul>
        <div class="bg"></div>
    </div>
        <a class="location_btn prev text_indent N=a:hom.page _click(service/home/home.onPrevBanner()) _stopDefault" href="#">이전</a>
        <a class="location_btn next text_indent N=a:hom.page _click(service/home/home.onNextBanner()) _stopDefault" href="#">다음</a>
    </div>
    


    <a class="home_banner_top N=a:hom.event" href="/department/specialEvent/detail/13063">
            <h4 class="title eventhall text_indent">EVENT HALL</h4>
        <p class="desc">편의점 행사 정보</p>
        <img class="common_img_center" src="../resources/images/convenience.jpg" height='161' alt="이쁜 라인이 살아나는 스커트 이미지">
        <div class="bg"></div><!-- ../resources/images/convenience.jpg-->
        <div class="common_border"></div>
    </a>



    <a class="home_banner_bottom N=a:hom.today" href="javascript:void(window.open('../livingInfo/getChatbot.jsp','_blank','width=360,height=450'))">
            <h4 class="title todaysitem text_indent">EVENT HALL</h4>
        <p class="desc">자췽요정에게 물어봐</p>
            <span class="store">챗봇</span>
        <img class="img" src="../resources/images/chat.png" width='120' height='120' alt="매일 사용할 토리버치 토트백 이미지">
        
        <div class="common_border"></div>
    </a>


    <a class="home_banner_side N=a:hom.snews" href="https://swindow.naver.com/department/site/11007006004">
            <h4 class="title brandnews text_indent">EVENT HALL</h4>
        <p class="desc">내 주위 편의시설 보기
</p>
            <span class="store">영화관/주유소/은행/마트/카페/약국/공공기관</span>
        <img class="img" src="../resources/images/CGV.jpg" width='164' height='165' alt="주위편의시설">
        
        <div class="common_border"></div>
    </a>

</div>
<div class="wrap clearfix">
    <div class="main_category ">
        <h4 class="title text_indent">CATEGORY</h4>
        <div class="category_set">
            <div class="mask clipart department department _snb_menu_area">
                <ul class="category_list _category_tab_content">
                        <li class="list"><a class="link text_indent all" href="/department/list">전체보기</a></li>
                        <li class="list"><a class="link text_indent event N=a:hom.cate" href="/department/specialEvent">특별행사장</a></li>
                        <li class="list"><a class="link text_indent brand N=a:hom.cate" href="/department/list?query=11001016">수입·명품</a></li>
                        <li class="list"><a class="link text_indent top N=a:hom.cate" href="/department/list?query=11001001">상의</a></li>
                        <li class="list"><a class="link text_indent outer N=a:hom.cate" href="/department/list?query=11001002">아우터</a></li>
                        <li class="list"><a class="link text_indent dress N=a:hom.cate" href="/department/list?query=11001003">원피스·세트</a></li>
                        <li class="list"><a class="link text_indent bottom N=a:hom.cate" href="/department/list?query=11001004">하의</a></li>
                        <li class="list"><a class="link text_indent shoes N=a:hom.cate" href="/department/list?query=11001005">신발</a></li>
                        <li class="list"><a class="link text_indent bag N=a:hom.cate" href="/department/list?query=11001006">가방</a></li>
                        <li class="list"><a class="link text_indent acc N=a:hom.cate" href="/department/list?query=11001007">액세서리</a></li>
                        <li class="list"><a class="link text_indent leports N=a:hom.cate" href="/department/list?query=11001015">레포츠</a></li>
                        <li class="list"><a class="link text_indent underwear N=a:hom.cate" href="/department/list?query=11001009">언더웨어</a></li>
                        <li class="list"><a class="link text_indent cosmetics N=a:hom.cate" href="/department/list?query=11001011">화장품</a></li>
                        <li class="list"><a class="link text_indent kids N=a:hom.cate" href="/department/list?query=11001008">유아동</a></li>
                        <li class="list"><a class="link text_indent kitchen N=a:hom.cate" href="/department/list?query=11001012">주방</a></li>
                        <li class="list"><a class="link text_indent living N=a:hom.cate" href="/department/list?query=11001013">침구·생활</a></li>
                        <li class="list"><a class="link text_indent coordi N=a:hom.cate" href="/department/list?query=11001014">코디</a></li>
                </ul>
            </div>
            <a class="category_btn prev text_indent btn_before N=a:hom.catep" href="#" style="display: none;">이전 카테고리 보기</a>
            <a class="category_btn next text_indent btn_next N=a:hom.catep" href="#" style="display: none;"> 다음 카테고리 보기</a>
        </div>
    </div>

<div class="list_title_sorting_navigation ">
	<h3 id="_CATEGORY_TITLE" class="title">전체보기 </h3>
	<ul class="list_sorting clearfix" role="radiogroup" id="sort_list">
		<li class="list" role="radio" aria-checked="true" data-sort="DATE_DSC"><a href="#" class="link N=a:hom.new">최신순</a></li>
		<li class="list" role="radio" aria-checked="false" data-sort="REL_DES"><a href="#" class="link N=a:hom.hot">인기순</a></li>
	</ul>
	
	
</div>
<div id="more_prepend" class="list_loader" style="display:none">
	<img src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/img/preloader.gif" width="32" height="8" alt="로딩중입니다.">
</div>

	<ul id="grid" class="common_list_static NO_TAP_HIGHLIGHT">
	</ul>

<div id="more_append" class="list_loader" style="display:none">
	<img src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/img/preloader.gif" width="32" height="8" alt="로딩중입니다.">
</div>
    <div class="list_error _lst_none" style="display:none">
		<strong class="desc">상품을 불러오지 못했습니다.</strong>
		<p class="info">잠시 후 시도해 주세요.</p>
    </div>
    
</div>

		</div>

	<!-- footer -->
	<a href="#" class="wrap_top">맨위로가기</a>
	<div id="footer" class="g_footer">
		<div class="co_footer">
			<h2 class="blind">하위영역</h2>
			<div class="co_info_site">
				<a href="http://www.naver.com/rules/service.html" target="_blank" class="N=a:fot.agreement">이용약관</a><!--N=a:fot.agreement-->
				<span class="co_bar">|</span>
				<a href="http://www.naver.com/rules/privacy.html" target="_blank" class="N=a:fot.privacy"><strong>개인정보처리방침</strong></a><!--N=a:fot.privacy-->
				<span class="co_bar">|</span>
				<a href="https://search.shopping.naver.com/user/legalbasis.nhn" target="_blank" class="N=a:fot.disclaimer">법적고지</a><!--N=a:fot.disclaimer-->
				<span class="co_bar">|</span>
				<a href="http://join.shopping.naver.com/index.nhn" target="_blank" class="N=a:fot.join">입점안내</a><!--N=a:fot.join-->
				<span class="co_bar">|</span>
				<a href="" target="_blank" onclick="window.open('https://sell.storefarm.naver.com/#/home/about?tipModal=WINDOW_EXPOSURE&tap=style','쇼핑윈도노출안내','width=708px, height=696px, menubar=no, status=no, toolbar=no'); return false;" class="_stopDefault  N=a:fot.shoppingw">쇼핑윈도 노출안내</a><!--N=a:fot.shoppingw-->
				<span class="co_bar">|</span>
				<a href="https://adcenter.shopping.naver.com/member/login/form.nhn" target="_blank" class="N=a:fot.ad">쇼핑파트너존</a><!--N=a:fot.ad-->
				<span class="co_bar">|</span>
				<a href="https://sell.storefarm.naver.com/#/home/about" target="_blank" class="N=a:fot.sfsell">스토어팜센터</a><!--N=a:fot.sfsell-->
				<span class="co_bar">|</span>
				<a href="https://help.pay.naver.com/index.nhn" target="_blank"  class="N=a:fot.help">쇼핑&페이 고객센터</a><!--N=a:fot.help-->
			</div>
			<p class="co_marketing">네이버㈜는 결제정보의 중개서비스 또는 통신판매중개시스템의 제공자로서, 통신판매의 당사자가 아니며 상품의 주문, 배송 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.</p>
			<address class="co_address">
				사업자등록번호 : 220-81-62517
				<span class="co_bar">|</span>
				통신판매업신고번호 : 제2006-경기성남-692호
				<span class="co_bar">|</span>
				대표이사 : 한성숙
				<span class="co_bar">|</span>
				<a href="https://www.ftc.go.kr/www/bizCommList.do?key=232" target="_blank"  class="N=a:fot.rbinformation">사업자등록정보확인</a><!--N=a:fot.rbinformation--><br>
				주소 : 경기도 성남시 분당구 불정로 6 네이버 그린팩토리 13561
				<span class="co_bar">|</span>
				대표전화 : 1588-3819
				<span class="co_bar">|</span>
				팩스 : 033-816-5304
				<span class="co_bar">|</span>
				이메일 : <a href="mailto:helpcustomer@naver.com">helpcustomer@naver.com</a>
			</address>
			<p class="co_copyright"><a href="http://www.naver.com" class="co_logo N=a:fot.naver" target="_blank">NAVER</a><!--N=a:fot.naver-->Copyright &copy; <strong><a href="http://www.navercorp.com/ko/index.nhn" class="N=a:fot.navercorp" target="_blank">NAVER Corp.</a><!--N=a:fot.navercorp--></strong> All Rights Reserved.</p>
		</div>
	</div>
	<a href="#" class="co_view_mobile"><strong>모바일 버전으로 보기</strong></a>	
	<!-- //footer -->
		<!-- javascript 영역 -->


<script type="text/javascript" src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/js/lib/common/require.js" charset="utf-8"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/js/conf/require.conf.js" charset="utf-8"></script>
<script type='text/javascript' >require.config({baseUrl: 'https://ssl.pstatic.net/static.checkout/stylewindow/p/min_20180125015746/js',urlArgs: 20180125015746});</script><script type="text/javascript">


var console = window.console || {log:function(){}};

var nsc = "shoppingw.dep2";
var ccsrv = "cc.naver.com";
var nclk_evt = 3;

require(['variable'], function(variable){
	variable.set({
		"photoInfraDomains" : ["shop1.phinf.naver.net"]
	});
});

require(['domReady', 'variable', 'evt', 'service/common/layerUtil', 'nclk_evt', 'service/bizAdvisor_evt'], function(domReady, variable, evt){

	//전체페이지 로드시 domReady 이벤트 후 처리할 내용은 여기에
	domReady(function() {
		//[COMNPJT-7224] nclk_evt js로드 순서 앞당김
		nclk_do(); // 이벤트 초기화

		require(['lcslog'], function(){
			lcs_do(null,null);
		});

		evt.init();

		require(['service/common/analysis'], function(module) {
			var analysisData =  {} ;
	
			module.sendAnalysis(analysisData);
		});
		
		require(['service/search/externalSearch'], function(search) {
            search.initialize({
                vertical : "department",
                searchUrl : "https://search.shopping.naver.com/search/all.nhn"
            });
		});
	});
});
require(['domReady'], function(domReady) {
    domReady(function() {
        require(['service/home/home'], function(home) {
            home.intializeComponent({
                categoryId : "11007005"
            });
        });
        
        require(['service/list'], function(module){
			module.setClickCodeArea("hom");
			module.setUrl("/department/list/more/composite");
			module.setRequestParam({"item":{"isOnlyValidation":false,"isValidationSuccess":false,"results":[],"paging":{"current":1,"rowsPerPage":20,"moreCount":false},"dateRange":{"truncateField":5,"fromInclusive":true,"toInclusive":true,"diffDays":0,"valid":false},"vertical":"DEPARTMENT","sortType":"DATE_DSC","naverPayOnly":false,"excludeIds":[],"searchQuery":{"vertical":"DEPARTMENT","query":"DEPARTMENT"},"rowPerPageType":"ROW_CNT_20","onlyValidation":false,"validationSuccess":false,"checkValidation":false,"success":true},"specialEvent":{"paging":{"current":1,"rowsPerPage":1,"moreCount":false},"vertical":"DEPARTMENT","cache":true,"injectItem":false,"totalCount":0,"hasMoreContent":false},"shoppingNews":{"isOnlyValidation":false,"isValidationSuccess":false,"results":[],"paging":{"current":1,"rowsPerPage":1,"moreCount":false},"dateRange":{"truncateField":5,"fromInclusive":true,"toInclusive":true,"diffDays":0,"valid":false},"cacheKeyPaging":",p:1,row:1","cacheKey":"","onlyValidation":false,"validationSuccess":false,"checkValidation":false,"success":true},"edm":{"isOnlyValidation":false,"isValidationSuccess":false,"results":[],"paging":{"current":1,"rowsPerPage":1,"moreCount":false},"dateRange":{"truncateField":5,"fromInclusive":true,"toInclusive":true,"diffDays":0,"valid":false},"cacheKeyPaging":",p:1,row:1","cacheKey":"","onlyValidation":false,"validationSuccess":false,"checkValidation":false,"success":true},"culture":{"isOnlyValidation":false,"isValidationSuccess":false,"results":[],"paging":{"current":1,"rowsPerPage":1,"moreCount":false},"dateRange":{"truncateField":5,"fromInclusive":true,"toInclusive":true,"diffDays":0,"valid":false},"cacheKeyPaging":",p:1,row:1","cacheKey":"","onlyValidation":false,"validationSuccess":false,"checkValidation":false,"success":true},"bestStore":{"paging":{"current":1,"rowsPerPage":1,"moreCount":false},"vertical":"DEPARTMENT"},"storeNews":{"paging":{"current":1,"rowsPerPage":3,"moreCount":false},"vertical":"DEPARTMENT","rowPerPageType":"ROW_CNT_3"},"cache":true,"all":true,"openPetLink":false,"pageCode":"LIST","vertical":"DEPARTMENT","sort":"DATE_DSC","naverPayOnly":false,"ios":false});
			module.init({
				itemSelector : ".item",
				count : 0,
				noListView : "._lst_none"
				});
			module.loadFirstPage();
		});
    });
});
        require(['domReady'], function(){
            require(['layout/snb'], function(snb){
                snb.initialize({isHalfScroll : false});
            });
        });
</script>
	
		
	
        <!--[if lt IE 9]>
		<script src="/static/js/gnb/respond.min.js"></script>
        <![endif]-->
	</body>
</html>