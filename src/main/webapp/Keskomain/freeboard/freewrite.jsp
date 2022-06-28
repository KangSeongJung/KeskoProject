<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
	function validateForm(form){
		if(form.name.value ==""){
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		if(form.title.value ==""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if(form.pass.value ==""){
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
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
                    <li class="nav-item"><a class="nav-link active" href="../kesboard/list.do">커뮤니티</a></li>
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
      			<a href="../Keskomain/member/logout.jsp">[로그아웃]</a>
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
		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="../kesboard/list.do" style="color:black">공지사항</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" href="freelist.do">자유게시판</a>
			</li>
		</ul>
	</div>
</nav>  

<div class="card shadow mb-4">
	<div class="card-header py-3">
    	<h6 class="m-0 font-weight-bold text-primary">자유게시판</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
<h2>글쓰기(Write)</h2>
<form name="writeFrm" method="post" enctype="multipart/form-data"
	action="../freeboard/freewrite.do" onsubmit="return validateForm(this);">
<table class="table table-bordered table-dark" id="dataTable" width="100%" cellspacing="0">
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="userid" style="width:150px;" readonly="readonly" value="<%= session.getAttribute("userid") %>"/>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" style="width:90%;"/>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width: 90%; height: 100px;"></textarea>
		</td>
	</tr>
	<tr>
		<td>첨부 파일</td>
		<td>
			<input type="file" name="ofile" />
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pass" style="width:100px" value="<%= session.getAttribute("pass") %>"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="submit">작성 완료</button>
		<button type="reset">RESET</button>
		<button type="button" onclick="location.href='../freeboard/freelist.do';">
			목록 바로가기
		</button>
		</td>
	</tr>
</table>
</form>
        </div>
    </div>
</div>
</body>
</html>