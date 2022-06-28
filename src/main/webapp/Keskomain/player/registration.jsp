<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 등록</title>
<link rel="stylesheet" href="css/style.css" />
<link href="../css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style type="text/css">
.agree_wrap pre {
    line-height: 1.6em;
    width: 100%;
    color: #666;
    word-break: break-all;
    white-space: pre-wrap;
    white-space: -moz-pre-wrap;
    white-space: -pre-wrap;
    white-space: -o-pre-wrap;	
    word-wrap: break-word;
}
.agree_wrap .box {
    height: 420px;
    padding: 20px;
    overflow-y: auto;
    border: 1px solid #d5d5d5;
}
.agree_wrap {
    width: 100%;
    overflow: hidden;
    word-break: break-all;
}
.contains {
    position: relative;
    margin: 0 auto;
    width: 1000px;
}
.btn_wrap button.btn_black {
    background: #333;
    color: #fff;
}
.btn_wrap {
    margin: 23px auto 0;
    text-align: center;
}
</style>

</head>
<body>
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="#!"><img src="../images/logo.png" alt="그림없음" width=150px/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="../main.jsp">홈화면</a></li>
                    <li class="nav-item"><a class="nav-link" href="../company/ceo.jsp">회사소개</a></li>
                    <li class="nav-item"><a class="nav-link active" href="registration.jsp">선수 등록/신청</a></li>
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
					<img src="../images/tit_1.png" alt="" />
				</div>   
                </div>
            </div>
        </div>
    </div>
</header>
<!-- -->
<div class="contains player_wrppaing">
	<form method="post" name="playerForm" action="../../register/registration2.do" onsubmit="return formCheck();">
	<input type="hidden" name="userid" value="<%= session.getAttribute("userid") %>" />
	<div class="player_title">
		<br />
		<p class="title">선수 등록/신청</p>
		<p class="step"><img src="../images/step_1.jpg" alt=""></p>
	</div>
	<div class="agree_wrap">
		<div class="box">
			<pre>[한국이스포츠협회 개인정보취급방침]

&lt;한국e스포츠협회&gt; ('http://e-sports.or.kr/register/'이하 '선수/지도자 등록')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.
				
&lt;한국e스포츠협회&gt;('선수/지도자 등록') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
 본 방침은부터 2020년 3월 13일부터 시행됩니다.
				
1. 개인정보의 처리 목적 &lt;한국e스포츠협회&gt;('http://e-sports.or.kr/register/'이하 ‘선수/지도자 등록’)은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.
가. 선수/지도자 등록업무처리 및 활동관리 
등록 관리, 대회출전, 소속관리, 신청승인 처리 선수/지도자 관리, 선수/지도자 경력 활동 증명서 발급, 등록현황, 수상 내역, 연수 및 교육사항, 자격 정보, 경기실적 관리 등을 목적으로 개인정보를 처리합니다.
나. 선수/지도자 관리 
실명 확인, 개인 식별, 부정활동 방지, 기록보존 및 관리업무 등을 목적으로 개인정보를 처리합니다.
다. 협회 행정업무에 이용 
협회 공식,공인 프로그램 참가 자격 부여, 국가대표 선발 및 국제대회 출전기회 부여 등을 목적으로 개인정보를 처리합니다.
라. 선수/지도자 지원 및 관련 서비스 제공의 활용
해외 이적 및 국제대회 참가를 위한 선수/지도자비자 취득 추천서 발급 지원, 사이버 대학 입학 장학혜택 자격 부여, 은퇴선수/지도자 진로 및 교육 프로그램 지원, 선수/지도자 등록 현황/통계 제공 등을 목적으로 개인정보를 처리합니다.


2. 개인정보 파일 현황
('http://e-sports.or.kr/register/'이하 '선수/지도자등록')가 개인정보 보호법 제32조에 따라 등록·공개하는 개인정보파일의 처리목적은 다음과 같습니다.

가. 개인정보 파일명 : 선수/지도자 등록
 - 개인정보 항목 : 이름, 사진, 생년월일, 성별, 이메일, 휴대전화번호, 닉네임, 종목, 포지션/종족/주사용, 소속팀, 팀 활동 이력, 대회경력, 수상이력
 - 수집방법 : 홈페이지, 서면양식, 이메일
 - 보유근거 : 선수/지도자 등록
 - 보유기간 : 준영구
('http://e-sports.or.kr/register/'이하 '선수/지도자등록')의 개인정보파일 등록사항 공개는 행정안전부 개인정보보호 종합지원 포털(www.privacy.go.kr) → 개인정보민원 → 개인정보열람등 요구 → 개인정보파일 목록검색 메뉴를 활용해주시기 바랍니다.


3. 개인정보의 처리 및 보유 기간
가. &lt;한국e스포츠협회&gt;('선수/지도자등록')은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.

나. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
① &lt;선수/지도자 등록&gt;
 &lt;선수/지도자 등록&gt;과 관련한 개인정보는 수집.이용에 관한 동의일로부터&lt;준영구&gt;까지 위 이용목적을 위하여 보유.이용됩니다.
 -보유근거 : 선수/지도자 등록
 

4. 개인정보의 제3자 제공에 관한 사항
가. &lt;한국e스포츠협회&gt;('http://e-sports.or.kr/register/'이하 '선수/지도자등록')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
나. &lt;한국e스포츠협회&gt;('http://e-sports.or.kr/register/'이하 ‘선수/지도자등록')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.

① 대한체육회, 시도체육회, 시도종목단체
 - 개인정보를 제공받는 자 : 대한체육회, 시도체육회, 시도종목단체
 - 제공받는 자의 개인정보 이용목적
 1) 선수/지도자 등록업무처리 및 활동관리 : 등록관리, 대회출전, 소속관리, 승인처리, 증명서발급, 등록현황, 수상내역, 경기실적 관리 
 2) 선수/지도자 관리 : 실명확인, 개인식별, 부정활동 방지, 기록보존 및 관리업무 
 3) 체육단체 행정업무에 이용 : 국가대표 및 후보선수/지도자 관리, 전국대회 등 종합대회 및 종목별 결과관리 등 
 4) 선수/지도자지원 및 관련 서비스 제공에의 활용 : 은퇴선수/지도자지원, 국가대표선수/지도자선발 등의 지원 사업에 따른 활용 및 제공, 선수/지도자 활동 파악, 선수/지도자 등록현황/통계
 - 제공받는 자의 보유.이용기간: 준영구

② 일반국민
 - 개인정보를 제공받는 자 : 일반국민
 - 제공받는 자의 개인정보 이용목적
 1) 등록 선수/지도자 이력 조회 
 2) 대회/경기 참가선수/지도자, 경기결과, 경기실적 조회
 - 제공받는 자의 보유.이용기간: 준영구


5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.
 ① 정보주체는 한국e스포츠협회에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.
 ② 제①항에 따른 권리 행사는 한국e스포츠협회에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 한국e스포츠협회은(는) 이에 대해 지체 없이 조치하겠습니다.
 ③ 제②항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
 ④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
 ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
 ⑥ 한국e스포츠협회은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.


6. 처리하는 개인정보의 항목 작성
 ① &lt;한국e스포츠협회&gt; ('http://e-sports.or.kr/register/'이하 '선수/지도자등록') 은(는) 다음의 개인정보 항목을 처리하고 있습니다.

 - 필수항목 : 이름, 사진, 생년월일, 성별, 이메일, 휴대전화번호, 닉네임, 종목, 포지션/종족/주사용, 소속팀
 - 선택항목 : 팀 활동이력, 대회경력, 수상이력

7. 개인정보의 파기&lt;한국e스포츠협회&gt;('선수/지도자등록')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.
-파기절차
 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.
-파기기한
 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.
-파기방법
 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.
종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.


8. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항
한국e스포츠협회 은 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키’를 사용하지 않습니다.


9. 개인정보 보호책임자 작성
 ① 한국e스포츠협회(‘http://e-sports.or.kr/register/’이하 ‘선수/지도자등록)은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

 ▶ 개인정보 보호 담당부서
 부서명 : 사업2팀
 이메일 : register@e-sports.or.kr
 유선번호: 02-737-3710(304)


10. 개인정보 처리방침 변경
 이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.


11. 개인정보의 안전성 확보 조치 &lt;한국e스포츠협회&gt;('선수/지도자등록')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
 가. 개인정보 취급 직원의 최소화 및 교육
 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.
 나. 내부관리계획의 수립 및 시행
 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.

			</pre>
		</div>
	</div>
	<p class="checkbox_wrap"><input type="checkbox" name="agree"><span>이용약관에 동의합니다.</span></p>
	
	<div class="btn_wrap">
		<button type="submit" class="btn btn_black"><span>다음</span></button>
	</div>
	</form>
</div>

<script type="text/javascript">
	function formCheck() {
	    if($('form[name=playerForm]').find('input:checkbox[name=agree]').prop('checked') == false) {
	        alert('이용약관에 동의하지 않으셨습니다.');
	        return false;
	    }
	}
</script>



<br />
<br />
<br />
<br />
<footer class="py-5 bg-dark">
    <div class="container px-5"><p class="m-0 text-center text-white">Copyright &copy; 강성중 KESKO 2022</p></div>
</footer>
</body>
</html>