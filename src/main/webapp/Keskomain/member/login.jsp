<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.user_input{border:1px solid rgb(75, 75, 75);width:320px;height:27px;padding:10px;font-size:18px;}
input[type=image]{margin-top: 2px;}
</style>
<script>
function loginValdidate(form){
	/* 	
	alert("로그인 폼 유효성 체크를 해주세요");
 	*/
 	if (form.userid.value ==""){
 		alert("아이디를 입력하세요.");
 		form.userid.focus();
 		return false;
 	}
 	
 	if (form.passwd.value ==""){
 		alert("비밀번호를 입력하세요.");
 		form.passwd.focus();
 		return false;
 	}
}
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="#!"><img src="../Keskomain/images/logo.png" alt="그림없음" width=150px/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="../Keskomain/main.jsp">홈화면</a></li>
                <li class="nav-item"><a class="nav-link" href="../Keskomain/company/ceo.jsp">회사소개</a></li>
                <li class="nav-item"><a class="nav-link" href="../Keskomain/player/registration.jsp">선수 등록/신청</a></li>                    
                <li class="nav-item"><a class="nav-link" href="../kesboard/list.do">커뮤니티</a></li>
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
    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    if (session.getAttribute("userid") == null) {
    	//session영역에 저장된 속성값이 없다면 로그아웃 상태이다.
    	//그러므로 로그인 폼이 화면에 출력되어야 한다.
    %>    


    <table border="0" cellpadding="40" cellspacing="0" width="100%">
        <tr>
            <td align="center" valign="middle">
                <table border="0" cellpadding="0" cellspacing="0" width="470">
                    <tr>
                        <td align="center"><img src="../Keskomain/member/images/login_logo.gif" /></td>
                    </tr>
                </table>
            
                <form name="loginFrm" action="../kesuser/login.do" method="post" onsubmit="return loginValdidate(this);">
                <table width="470" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="350">
                            <input type="text" name="userid" placeholder="아이디" class="user_input" />
                        </td>
                        <td width="120" rowspan="3" align="right">
                            <input type="image" src="../Keskomain/member/images/login_bt.gif" />
                        </td>
                    </tr>
                    <tr height="5">
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="passwd" placeholder="****" class="user_input" />
                        </td>
                    </tr>
                </table>
                <div style="margin-top:15px;"></div>
                <div style="margin-top:15px;"></div>
                <table width="470" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left">
                            <a href="../Keskomain/member/regist.jsp"><img src="../Keskomain/member/images/login_member.gif" alt="아직도 회원이 아니세요?" /></a>
                        </td>
                        <td align="right">
                            <a href="#" onClick=""><img src="../Keskomain/member/images/login_idpw.gif" alt="아이디/비밀번호를 잊어버리셨어요?" /></a>
                        </td>
                    </tr>
                </table>
                </form>
    <%
    } else {
    	//session영엑에 저장된 속성값이 있다면 로그인 된 상태이므로
    	//회원정보 및 로그아웃 버튼을 화면에 출력한다.
    %>
        <%= session.getAttribute("userid") %> 회원님, 로그인하셨습니다.<br />
        <a href="../Keskomain/member/logout.jsp">[로그아웃]</a>
    <%
    }
    %>
            </td>
        </tr>



</body>
</html>