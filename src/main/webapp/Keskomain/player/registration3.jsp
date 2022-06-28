<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 신청 완료</title>
<link rel="stylesheet" href="css/style.css" />
<link href="../css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style type="text/css">
.contains {
    position: relative;
    margin: 0 auto;
    width: 1000px;
}
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
.form_wrap .form_tit {
    color: #333;
    font-size: 18px;
    font-weight: 700;
    padding-bottom: 10px;
}
.form_wrap table {
    width: 100%;
    border-top: 1px solid #333;
}
html * {
    max-height: 999999px;
    font-family: 'Nanum Gothic', sans-serif!important;
}
table {
    table-layout: fixed;
}
.form_wrap table th {
    background: #f8f8f8;
    width: 20%;
}
.form_wrap table th, .form_wrap table td {
    border-bottom: 1px solid #d5d5d5;
    color: #666;
    text-align: left;
    padding: 10px;
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
            <div style="float: right; margin-right: 25px"><a href="Kesko/kesuser/login.do" style="padding-right: 10px; color: white;" class="text-decoration-none">로그인</a></div>
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
<div class="player_title">
		<br />
		<p class="title">선수 등록/신청</p>
		<p class="step"><img src="../images/step_3.JPG" alt=""></p>
		<br />
		<div style="border:0px solid red; text-align: center;">
			<div class="margin:0 auto;" style="margin: 0 auto;">
				<img src="../images/complete.png" alt="" style="margin:0px auto; height: 350px"/>
			</div>
		</div>
	</div>
	
	<div class="btn_wrap" style="vertical-align: center;">
		<a href="../main.jsp" class="btn" style="background-color: #333; color: white; width: 150px; height: 40px; vertical-align: center;"><span>완료</span></a>
	</div>
</div>
<br />
<br />

<footer class="py-5 bg-dark">
    <div class="container px-5"><p class="m-0 text-center text-white">Copyright &copy; 강성중 KESKO 2022</p></div>
</footer>
</body>
</html>