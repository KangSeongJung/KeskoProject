<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>오시는 길</title>
<link rel="stylesheet" href="css/style1.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="#!"><img src="../images/logo.png" alt="그림없음" width=150px/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="../main.jsp">홈화면</a></li>
                    <li class="nav-item"><a class="nav-link active" href="./ceo.jsp">회사소개</a></li>
                    <li class="nav-item"><a class="nav-link" href="../player/registration.jsp">선수 등록/신청</a></li>                    
                    <li class="nav-item"><a class="nav-link" href="../../kesboard/list.do">커뮤니티</a></li>
                </ul>
            </div>
        </div>
        <%
    if (session.getAttribute("userid") == null) {
    	//session영역에 저장된 속성값이 없다면 로그아웃 상태이다.
    	//그러므로 로그인 폼이 화면에 출력되어야 한다.
    %>            
            <div style="float: right; margin-right: 25px"><a href="../kesuser/login.do" style="padding-right: 10px; color: white;" class="text-decoration-none">로그인</a></div>
	 <%
    } else {
    	//session영엑에 저장된 속성값이 있다면 로그인 된 상태이므로
    	//회원정보 및 로그아웃 버튼을 화면에 출력한다.
    %>
 	<span style="color: white;"> <%= session.getAttribute("userid") %> 회원님, 로그인하셨습니다.</span><br />
    <a href="../../Keskomain/member/logout.jsp">[로그아웃]</a>
    <%
    }
    %>
    </nav>
<header class="bg-dark py-5">
    <div class="container px-5">
        <div class="row gx-5 justify-content-left">
            <div class="col-lg-6">
                <div class="text-center my-5">
					<div class="tab_menu">
				</div>   
                </div>
            </div>
        </div>
    </div>
</header>
<!-- -->

<nav class="navbar navbar-expand-sm bg-warning navbar-dark">
  <div class="container-fluid justify-content-center">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="ceo.jsp" style="color:black">인사말</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="location.jsp">오시는 길</a>
      </li>
    </ul>
  </div>
</nav> 

<div class="container">
	
    <div class="justify-content-center">
        <div class="">
            <div class="text-center">
            	 <div class="justify-content-center">
					<div class="title_box"><h3><img src="../images/tit_sub03.gif" alt="오시는 길"></h3></div>
					<hr />
				</div>  
            </div>
        </div>
    </div>
	 
	<!-- <div style="border:0px solid red;">
		<div id="map" style="border:0px solid red;width:80%;height:500px;margin:0 auto;"></div>    
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21b86988ae9b70425867ddf063f04e4a"></script>
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
	</script> -->
	<div style="border:0px solid red;">
		<div id="daumRoughmapContainer1656132846791" class="root_daum_roughmap root_daum_roughmap_landing; margin:0 auto;"></div>
	</div>
	<!--
	   2. 설치 스크립트
	   * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
	-->
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
	
	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
	   new daum.roughmap.Lander({
	      "timestamp" : "1656132846791",
	      "key" : "2aqig",
	      "mapWidth" : "640",
	      "mapHeight" : "360"
	   }).render();
	</script>
	
	<div class="cnt_direction clear">
        <div class="direction1">
            <p class="dir_tit" style="font-size: 20px;padding: 10px 5%;background: #0ac6af;color: #fff">
            	대중교통으로 방문하시는 경우</p>
            <div>                                                                              
               <p class="dir_subtit">지하철</p>
               <p>가산디지털단지역 6번출구 나오셔서 좌측횡단보도 건너 좌측으로 10m 가시면 삼거리가 나옵니다. 삼거리에서 우측 방향으로 직진하셔서 사거리 대각선방향에 우리은행 건물 413호입니다.</p>
               <p class="dir_subtit">버스</p>
               <p>21, 571, 652, 금천 05<br>[디지털3단지월드벤쳐센터] 정류장에서 하차</p><p><br></p><p class="dir_subtit">주소</p><p>서울시 금천구 가산디지털2로 123<br>&nbsp;월드메르디앙2차 4층&nbsp; 413호</p>
            </div>
        </div>
            <div class="direction2 on">
	            <p class="dir_tit" style="font-size: 20px;padding: 10px 5%;background: #0ac6af;color: #fff">
					자가용으로 방문하시는 경우</p>
            <div>                                                                                  
                <p> 서부간선도로를 타고 오다가 광명교를 타고 좌회전 후 첫 사거리에서 우회전</p>
                <p> 가리봉5거리에서 철산방향 수출의 다리를 넘어 첫 사거리(한진사거리)에서 우회전</p>
                <p> 남부순환도로 구로IC로 나와 좌회전</p>
            </div>
        </div>
    </div>	
</div>



</body>
</html>