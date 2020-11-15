<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>소동물 소개</title>
    <!-- 초기화 -->
    <!-- 종이 스타일 -->
    <link rel="stylesheet" href="css/info_style.css">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/jquery.masonry.min.js"></script>
    <script src="js/jquery.imagesloaded.min.js"></script>
    <!--  <link rel="stylesheet" href="js/jquery.lightbox-0.5.css"/>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="js/jquery.lightbox-0.5.js"></script>--> 
    <script>
		$(document).ready(function () {
			$('.outer-menu-item').hover(function () {
				$(this).find('.inner-menu').show();
			}, function () {
				$(this).find('.inner-menu').hide();
			});
		});
	</script>
    <script>
       
        // 페이지
        $(document).ready(function () {
            // 이미지 로드 확인
            $('#main-section').imagesLoaded(function () {
                // jQuery Masonry 플러그인 적용
                $('#main-section').masonry({
                    itemSelector: '.paper',
                    columnWidth: 230,
                    isAnimated: true
                });
            });
});


        // 라이트 박스
        $(document).ready(function () {
            function showLightBox() {
                // 라이트박스를 보이게 합니다.
                $('#darken-background').show();
                $('#darken-background').css('top', $(window).scrollTop());
                // 스크롤을 못하게 합니다.
                $('body').css('overflow', 'hidden');
            }

            function hideLightBox() {
                // 라이트박스를 안 보이게 합니다.
                $('#darken-background').hide();

                // 스크롤을 하게 합니다.
                $('body').css('overflow', '');
            }

            // 라이트박스 제거 이벤트
            $('#darken-background').click(function () {
                hideLightBox();
            });

              // 클릭 이벤트 연결
            $('.1').click(function () {
                showLightBox();
            });

            // 라이트박스 제거 이벤트 보조
            $('#lightbox').click(function (event) {
                event.stopPropagation()
            });
        }); 
        $(document).ready(function () {
            function showLightBox() {
                // 라이트박스를 보이게 합니다.
                $('#darken-background2').show();
                $('#darken-background2').css('top', $(window).scrollTop());
                // 스크롤을 못하게 합니다.
                $('body').css('overflow', 'hidden');
            }

            function hideLightBox() {
                // 라이트박스를 안 보이게 합니다.
                $('#darken-background2').hide();

                // 스크롤을 하게 합니다.
                $('body').css('overflow', '');
            }

            // 라이트박스 제거 이벤트
            $('#darken-background2').click(function () {
                hideLightBox();
            });

              // 클릭 이벤트 연결
            $('.2').click(function () {
                showLightBox();
            });

            // 라이트박스 제거 이벤트 보조
            $('#lightbox2').click(function (event) {
                event.stopPropagation()
            });
        }); 
        $(document).ready(function () {
            function showLightBox() {
                // 라이트박스를 보이게 합니다.
                $('#darken-background3').show();
                $('#darken-background3').css('top', $(window).scrollTop());
                // 스크롤을 못하게 합니다.
                $('body').css('overflow', 'hidden');
            }

            function hideLightBox() {
                // 라이트박스를 안 보이게 합니다.
                $('#darken-background3').hide();

                // 스크롤을 하게 합니다.
                $('body').css('overflow', '');
            }

            // 라이트박스 제거 이벤트
            $('#darken-background3').click(function () {
                hideLightBox();
            });

              // 클릭 이벤트 연결
            $('.3').click(function () {
                showLightBox();
            });

            // 라이트박스 제거 이벤트 보조
            $('#lightbox3').click(function (event) {
                event.stopPropagation()
            });
        }); 
        $(document).ready(function () {
            function showLightBox() {
                // 라이트박스를 보이게 합니다.
                $('#darken-background4').show();
                $('#darken-background4').css('top', $(window).scrollTop());
                // 스크롤을 못하게 합니다.
                $('body').css('overflow', 'hidden');
            }

            function hideLightBox() {
                // 라이트박스를 안 보이게 합니다.
                $('#darken-background4').hide();

                // 스크롤을 하게 합니다.
                $('body').css('overflow', '');
            }

            // 라이트박스 제거 이벤트
            $('#darken-background4').click(function () {
                hideLightBox();
            });

              // 클릭 이벤트 연결
            $('.4').click(function () {
                showLightBox();
            });

            // 라이트박스 제거 이벤트 보조
            $('#lightbox4').click(function (event) {
                event.stopPropagation()
            });
        }); 
        $(document).ready(function () {
            function showLightBox() {
                // 라이트박스를 보이게 합니다.
                $('#darken-background5').show();
                $('#darken-background5').css('top', $(window).scrollTop());
                // 스크롤을 못하게 합니다.
                $('body').css('overflow', 'hidden');
            }

            function hideLightBox() {
                // 라이트박스를 안 보이게 합니다.
                $('#darken-background5').hide();

                // 스크롤을 하게 합니다.
                $('body').css('overflow', '');
            }

            // 라이트박스 제거 이벤트
            $('#darken-background5').click(function () {
                hideLightBox();
            });

              // 클릭 이벤트 연결
            $('.5').click(function () {
                showLightBox();
            });

            // 라이트박스 제거 이벤트 보조
            $('#lightbox5').click(function (event) {
                event.stopPropagation()
            });
        }); 
        
     
    </script>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String) session.getAttribute("userID");
	}
%>
	<div id="page-wrapper">
		<header id="main-header">
			<hgroup>
				<span><h1 class="master-title">소동물 관련 서비스&#160;&#160;&#160;&#160;&#160;&#160;&#160;</h1><br>
				<%
					if(userID == null){
				%>
				<a href="login.jsp"><button class="login-button" type="button" style="float:right;"><img src="images/login.png" width="90" height="35"></button></a>
				<%
					}else{
				%>
				<a href="logoutAction.jsp"><button class="logout-button" type="button" style="float:right;"><img src="images/logout.png" width="90" height="35"></button></a>
				<%
					}
				%>
				<a href="index.jsp"><img class="master-title" src="images/pontopet.png"></a><br><br></span>
			</hgroup>
		</header>
		<nav id="main-navigation">
			<div class="pull-left">
				<ul class="outer-menu">
					<li class="outer-menu-item">
						<span class="menu-title"> <a href= "index.jsp" style="color:black"> Home </a></span>
						<li class="outer-menu-item">
							<span class="menu-title">About US</span>
							<ul class="inner-menu">
								<li class="inner-menu-item"> <a href= "#"> Our team</a>
								</li>
							</ul>
						</li>
						<li class="outer-menu-item">
							<span class="menu-title">Our Services</span>
							<ul class="inner-menu">
								<li class="inner-menu-item"> <a href= "information.jsp"> 소동물 소개</a> </li>
								<li class="inner-menu-item"> <a href= "hospital.jsp"> 동물병원 안내</a> </li>
								<li class="inner-menu-item"> <a href= "matching.jsp"> 임시보호 매칭</a> </li>
							</ul>
						</li>
						<li class="outer-menu-item">
							<span class="menu-title"> <a href= "bbs.jsp" style="color:black"> Community </a> </span>
						</li>
					</ul>
				</div>
				<div class="pull-right">
					<div class="search-bar">
						<form>
							<input type="text" class="input-search">
							<input type="submit" class="input-search-submit" value= "검색">
						</form>
					</div>
				</div>
			</nav>
    <!-- 본문 영역 -->
    <div id="content">
    <section id="main-section">
	<div id="des">소동물 소개</div>
         <div class="paper"><div class="1">
            <div class="paper-holder">
                <a><img width="190" height="176" src="images/a1.PNG" /></a>
            </div>
            <p class="paper-description">고슴도치</p>
            <div class="paper-content">
                <a class="paper-link" href="#"><img src="http://placekitten.com/30/30" /></a>
                <p class="paper-text">고슴도치는 다양한 환경에서 서식한다. 지렁이와 절지동물부터 새의 알과 뱀까지 다양한 동물을 주식으로 먹으며 수박, 오이...</p>
            </div></div>
        </div>
         <div class="paper"><div class="2">
            <div class="paper-holder">
                <a><img width="190" height="176" src="images/a2.PNG" /></a>
            </div>
            <p class="paper-description">기니피그</p>
            <div class="paper-content">
                <a class="paper-link" href="#"><img src="http://placekitten.com/30/30" /></a>
                <p class="paper-text">수컷은 분만 전후로 암컷을 보호하고 자신이 교미하려 노력한다. 무리를 지어 살기 좋아하는 사회적인 동물이며 5~10마리가 모여 살며....</p>
            </div></div>
        </div>
        <div class="paper"><div class="3">
            <div class="paper-holder">
                <a><img width="190" height="176" src="images/a3.PNG" /></a>
            </div>
            <p class="paper-description">앵무새</p>
            <div class="paper-content">
                <a class="paper-link" href="#"><img src="http://placekitten.com/30/30" /></a>
                <p class="paper-text">조류 앵무목의 한 과. 앵무아과·잉꼬아과·진홍잉꼬아과가 포함된다. 학자에 따라서는 7아과로 분류하기도 하며 전세계에 약 320종이 ...</p>
            </div></div>
        </div>

         <div class="paper"><div class="4">
            <div class="paper-holder">
                <a><img width="190" height="176" src="images/a4.PNG" /></a>
            </div>
            <p class="paper-description">토끼</p>
            <div class="paper-content">
                <a class="paper-link" href="#"><img src="http://placekitten.com/30/30" /></a>
                <p class="paper-text">토끼목 토끼과 동물의 총칭. 토끼목 토끼과에 속하는 동물의 총칭으로 중치류 라고도 한다. 아프리카·아메리카·아시아·유럽에 분포하며 종류가 많다...</p>
            </div></div>
        </div>

         <div class="paper"><div class="5">
            <div class="paper-holder">
                <a><img width="190" height="176" src="images/a5.PNG" /></a>
            </div>
            <p class="paper-description">햄스터</p>
            <div class="paper-content">
                <a class="paper-link" href="#"><img src="http://placekitten.com/30/30" /></a>
                <p class="paper-text">쥐목 비단털쥐과의 포유류. 몸길이 12∼15cm, 꼬리길이 1.5∼2.5cm, 몸무게 130∼180g이다. 비단털쥐과의 포유류의 통칭이다...</p>
            </div></div>
        </div>


    </section>
    <!-- 라이트박스 -->
    <div id="darken-background">
        <div id="lightbox">
            <div class="user-information">
                <a class="user-information-image" href="#">
                    <img width="70" height="70"src="images/a1.PNG" />
                </a>
                <div class="user-information-text">
                    <h3>고슴도치</h3>
                    <p>고슴도치는 다양한 환경에서 서식한다. 지렁이와 절지동물부터 새의 알과 뱀까지 다양한 동물을 주식으로 먹으며 수박, 오이, 참외 등 과실도 즐겨 먹는다.</p>
                </div>
            </div>
            <hr class="lightbox-splitter" />
            <img width="600" height="750" src="images/hedgehog.png" />
        </div>
    </div>
    <!-- 라이트박스 -->
    <div id="darken-background2">
        <div id="lightbox2">
            <div class="user-information">
                <a class="user-information-image" href="#">
                    <img width="70" height="70"src="images/a2.PNG" />
                </a>
                <div class="user-information-text">
                    <h3>기니피그</h3>
                    <p>수컷은 분만 전후로 암컷을 보호하고 자신이 교미하려 노력한다. 무리를 지어 살기 좋아하는 사회적인 동물이며 5~10마리가 모여 살며, 수명은 5~15년이다.</p>
                </div>
            </div>
            <hr class="lightbox-splitter" />
            <img width="600" height="550" src="images/guineapig.png" />
        </div>
    </div>
     <!-- 라이트박스 -->
    <div id="darken-background3">
        <div id="lightbox3">
            <div class="user-information">
                <a class="user-information-image" href="#">
                    <img width="70" height="70"src="images/a3.PNG" />
                </a>
                <div class="user-information-text">
                    <h3>앵무새</h3>
                    <p>조류 앵무목의 한 과. 앵무아과·잉꼬아과·진홍잉꼬아과가 포함된다. 학자에 따라서는 7아과로 분류하기도 하며 전세계에 약 320종이 있다.</p>
                </div>
            </div>
            <hr class="lightbox-splitter" />
            <img width="600" height="700" src="images/parrot.png" />
        </div>
    </div>
    <!-- 라이트박스 -->
    <div id="darken-background4">
        <div id="lightbox4">
            <div class="user-information">
                <a class="user-information-image" href="#">
                    <img width="70" height="70"src="images/a4.PNG" />
                </a>
                <div class="user-information-text">
                    <h3>토끼</h3>
                    <p>토끼목 토끼과 동물의 총칭. 토끼목 토끼과에 속하는 동물의 총칭으로 중치류(重齒類)라고도 한다. 아프리카·아메리카·아시아·유럽에 분포하며 종류가 많다.</p>
                </div>
            </div>
            <hr class="lightbox-splitter" />
            <img width="600" height="400" src="images/rabbit.png" />
        </div>
    </div>
    <!-- 라이트박스 -->
    <div id="darken-background5">
        <div id="lightbox5">
            <div class="user-information">
                <a class="user-information-image" href="#">
                    <img width="70" height="70" src="images/a4.PNG" />
                </a>
                <div class="user-information-text">
                    <h3>햄스터</h3>
                    <p>쥐목 비단털쥐과의 포유류. 몸길이 12∼15cm, 꼬리길이 1.5∼2.5cm, 몸무게 130∼180g이다. 비단털쥐과의 포유류의 통칭이다. 골든(시리안) 햄스터가 가장 대중적이다.</p>
                </div>
            </div>
            <hr class="lightbox-splitter" />
            <img width="600" height="750" src="images/hamster.png" />
        </div>
    </div>
    <aside id="main-aside">
					<div class="aside-list">
						<h3> 카테고리</h3>
						<ul>
							<li> <a href= "information.jsp" style="color:black"> 소동물 소개</a> </li>
							<li> <a href= "hospital.jsp" style="color:black"> 동물병원 안내</a> </li>
							<li> <a href= "matching.jsp" style="color:black"> 임시보호 매칭</a> </li>
							<li> <a href= "bbs.jsp" style="color:black"> Community</a> </li>
						</ul>
					</div>
					<div class="aside-list">
						<h3> 최근 글</h3>
						<ul>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
						</ul>
					</div>
				</aside>
				</div>
			<footer id="main-footer">
				<p align="center">Created By ConSeQ </p>
			</footer>
			</div>			
</body>
</html>