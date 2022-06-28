<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ceo.jsp</title>
<link href="../css/styles.css" rel="stylesheet" />
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
            <div style="float: right; margin-right: 25px"><a href="../../kesuser/login.do" style="padding-right: 10px; color: white;" class="text-decoration-none">로그인</a></div>
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
        <a class="nav-link active" href="ceo.jsp">인사말</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="location.jsp" style="color:black">오시는 길</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container">
	
    <div class="justify-content-center">
        <div class="">
            <div class="text-center">
            	 <div class="justify-content-center">
					<div class="title_box"><h3><img src="../images/tit_sub01.gif" alt="협회장 인사말"></h3></div>
					<hr />
				</div>  
            </div>
        </div>
    </div>
	<div style="border:0px solid red;">
		
  
<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="898" style="text-align: justify; width: 673.35pt; border-collapse: collapse;margin:0 auto;">
 <tbody><tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
  height:138.6pt">
  <td width="520" valign="top" style="width:389.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:138.6pt">
  <p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-family: 굴림; border: 1pt none windowtext; padding: 0cm;"><br></span></p><p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-family: 굴림; border: 1pt none windowtext; padding: 0cm;">안녕하십니까<span lang="EN-US">,&nbsp;</span>한국<span lang="EN-US">e</span>스포츠협회 입니다<span lang="EN-US">.</span></span><span lang="EN-US" style="font-family: 굴림;"><br>
  <br>
  <span style="border:none windowtext 1.0pt;mso-border-alt:none windowtext 0cm;
  padding:0cm">1999</span></span><span style="font-family: 굴림; border: 1pt none windowtext; padding: 0cm;">년 프로게이머 코리아
  오픈<span lang="EN-US">(PKO)&nbsp;</span>부터 시작된 한국의<span lang="EN-US">&nbsp;e</span>스포츠
  역사가 어느덧<span lang="EN-US">&nbsp;2020</span>년 이면<span lang="EN-US">&nbsp;21</span>년이
  됩니다<span lang="EN-US">.</span></span><span lang="EN-US" style="font-family: 굴림;"><br>
  <br>
  </span><span style="font-family: 굴림; border: 1pt none windowtext; padding: 0cm;">한국<span lang="EN-US">e</span>스포츠협회는 긴 역사와 더불어
  끊임 없는 변화와 시도로 글로벌<span lang="EN-US">&nbsp;e</span>스포츠 종주국으로서의 역할을 해나가고 있습니다<span lang="EN-US">.&nbsp;</span>협회는 변화하는 글로벌<span lang="EN-US">&nbsp;e</span>스포츠 환경에 맞는
  국내 프로와 아마추어의 체계적 시스템 정착<span lang="EN-US">, e</span>스포츠 팬들을 위한 서비스 창출을 위해 노력해왔습니다<span lang="EN-US">.</span></span><span lang="EN-US" style="font-size:12.0pt;
  font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><o:p></o:p></span></p>
  <p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span lang="EN-US" style="font-size:12.0pt;font-family:
  굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt">&nbsp;</span></p>
  <p class="MsoNormal" style="margin-top:5.25pt;margin-right:0cm;margin-bottom:
  5.25pt;margin-left:0cm;line-height:normal;mso-pagination:widow-orphan;
  text-autospace:ideograph-numeric ideograph-other;word-break:keep-all"><span style="font-family: 굴림;">한국의<span lang="EN-US">&nbsp;e</span>스포츠 선수들은 리그
  오브 레전드 월드 챔피언십<span lang="EN-US">&nbsp;5</span>년 연속 우승<span lang="EN-US">,&nbsp;</span>스타크래프트<span lang="EN-US">&nbsp;II&nbsp;</span>월드 챔피언십 시리즈<span lang="EN-US">&nbsp;6</span>년 연속
  우승<span lang="EN-US">, IeSF&nbsp;</span>월드 챔피언십<span lang="EN-US">&nbsp;8</span>회
  종합 우승 등 다양한 종목의 국제대회에서 최고의 성적으로 전세계를 휩쓸며 한국의<span lang="EN-US">&nbsp;e</span>스포츠가
  전세계 최고임을 입증해 주었습니다<span lang="EN-US">.<o:p></o:p></span></span></p>
  <p class="MsoNormal" style="margin-top:5.25pt;margin-right:0cm;margin-bottom:
  5.25pt;margin-left:0cm;line-height:normal;mso-pagination:widow-orphan;
  text-autospace:ideograph-numeric ideograph-other;word-break:keep-all"><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt">&nbsp;</span></p>
  <p class="MsoNormal" style="margin-top:5.25pt;margin-right:0cm;margin-bottom:
  5.25pt;margin-left:0cm;line-height:normal;mso-pagination:widow-orphan;
  text-autospace:ideograph-numeric ideograph-other;word-break:keep-all"><span style="font-family: 굴림;">협회는 이러한 한국의<span lang="EN-US">&nbsp;e</span>스포츠가
  한 단계 더 도약할 수 있도록<span lang="EN-US">&nbsp;2020</span>년에는<span lang="EN-US">&nbsp;e</span>스포츠
  시설과 대통령배 아마추어<span lang="EN-US">&nbsp;e</span>스포츠 대회<span lang="EN-US">(KeG)</span>를
  통해 체계적인 아마추어 시스템을 정착<span lang="EN-US">,&nbsp;</span>더 많은 국내 아마추어 선수들이 활동할 수 있도록
  준비하겠습니다<span lang="EN-US">.</span></span><span lang="EN-US" style="font-size:
  12.0pt;font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><o:p></o:p></span></p>
  <p class="MsoNormal" style="margin-top:5.25pt;margin-right:0cm;margin-bottom:
  5.25pt;margin-left:0cm;line-height:normal;mso-pagination:widow-orphan;
  text-autospace:ideograph-numeric ideograph-other;word-break:keep-all"><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt">&nbsp;</span></p>
  <p class="MsoNormal" style="margin-top:5.25pt;margin-right:0cm;margin-bottom:
  5.25pt;margin-left:0cm;line-height:normal;mso-pagination:widow-orphan;
  text-autospace:ideograph-numeric ideograph-other;word-break:keep-all"><span style="font-family: 굴림;">또한 프로 부분에서는<span lang="EN-US">&nbsp;5</span>년
  연속 한국 선수들이 세계 최강임을 입증한<span lang="EN-US">&nbsp;LoL&nbsp;</span>챔피언스 코리아의 성공적 운영을
  통해 한국의<span lang="EN-US">&nbsp;e</span>스포츠 선수들이 전세계 최강의 기량을 유지할 수 있도록 지원을 아끼지 않겠습니다<span lang="EN-US">.</span></span><span lang="EN-US" style="font-size:12.0pt;
  font-family:굴림;mso-bidi-font-family:굴림;mso-font-kerning:0pt"><o:p></o:p></span></p>
  <p class="MsoNormal" style="margin-top:5.25pt;margin-right:0cm;margin-bottom:
  5.25pt;margin-left:0cm;line-height:normal;mso-pagination:widow-orphan;
  text-autospace:ideograph-numeric ideograph-other;word-break:keep-all"><span lang="EN-US" style="font-size:12.0pt;font-family:굴림;mso-bidi-font-family:굴림;
  mso-font-kerning:0pt">&nbsp;</span></p>
  <p class="MsoNormal" style="margin-top:5.25pt;margin-right:0cm;margin-bottom:
  5.25pt;margin-left:0cm;line-height:normal;mso-pagination:widow-orphan;
  text-autospace:ideograph-numeric ideograph-other;word-break:keep-all"><span style="font-family: 굴림;">협회는<span lang="EN-US">&nbsp;2018</span>년 자카르타
  팔렘방 아시안게임의 시범 종목으로 출전하는<span lang="EN-US">&nbsp;e</span>스포츠에<span lang="EN-US">&nbsp;6</span>개
  종목<span lang="EN-US">&nbsp;18</span>명의 선수와 감독을 선발했으며<span lang="EN-US">,&nbsp;</span>스타크래프트<span lang="EN-US">&nbsp;II&nbsp;</span>금메달과 리그 오브 레전드 은메달을 차지하게 되었습니다<span lang="EN-US">.</span></span></p>
  </td>
  <td width="400" valign="top" style="width:10.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:250pt">
  <p class="MsoNormal" style="margin-bottom:10.0pt;line-height:normal;mso-pagination:
  widow-orphan;text-autospace:ideograph-numeric ideograph-other;word-break:
  keep-all">
  <div style="text-align: center;">
  <img src="../images/Kespa.jpg" id="edit_img[]" style="width:400px; height:100%; margin: auto 0;">
  </div>
  <br></p>
  </td>
 </tr>
</tbody></table>
  <p style="line-height: 1;"><span lang="EN-US" style="font-family: 굴림;">&nbsp;</span><span style="font-family: 굴림;">전세계에서</span><span lang="EN-US" style="font-family: 굴림;">&nbsp;e</span><span style="font-family: 굴림;">스포츠라면 당연히 한국을 먼저 떠올릴 수 있도록</span><span lang="EN-US" style="font-family: 굴림;">,&nbsp;</span><span style="font-family: 굴림;">한국의</span><span lang="EN-US" style="font-family: 굴림;">&nbsp;e</span><span style="font-family: 굴림;">스포츠 문화가 대한민국을 대표하는 글로벌 스포츠 문화가 될 수 있도록 노력하겠습니다</span></p>

  <p class="MsoNormal" style="margin: 5.25pt 0cm; font-size: medium; line-height: 1; word-break: keep-all;"><span style="font-family: 굴림; font-size: 12px;">&nbsp;</span><span style="font-family: 굴림; font-size: 12px;">한국</span><span lang="EN-US" style="font-family: 굴림; font-size: 12px;">&nbsp;e</span><span style="font-family: 굴림; font-size: 12px;">스포츠에 대한 변함없는 사랑을 부탁 드리며 한국</span><span lang="EN-US" style="font-family: 굴림; font-size: 12px;">e</span><span style="font-family: 굴림; font-size: 12px;">스포츠협회 홈페이지를 방문해 주신 모든 분들께 행운이 가득하기를 기원합니다</span><span lang="EN-US" style="font-family: 굴림; font-size: 12px;">.&nbsp;</span><span style="font-family: 굴림; font-size: 12px;">감사합니다</span><span lang="EN-US" style="font-family: 굴림; font-size: 12px;">.</span></p>
  
  <p class="MsoNormal" style="margin: 5.25pt 0cm; font-size: medium; line-height: 1; word-break: keep-all;"><br></p>
    </div>
</div>

</body>
</html>