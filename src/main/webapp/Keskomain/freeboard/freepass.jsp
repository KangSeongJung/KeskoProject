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
		
		if(form.pass.value =="") {
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

<form name="writeFrm" method="post"
	action="../freeboard/freepass.do" onsubmit="return validateForm(this);">
<!-- 
해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은후 request영역에 저장하여
View에서 확인할수 있지만, EL을 이용하면 해당 과정없이 param내장객체로 즉시
값을 받아올 수 있다.

※hidden박스를 사용하는 경우 웹브라우져에서는 숨김처리 되기때문에 값이 제대로
입력되었는지 화면으로 확인할수 없다. 따라서 개발자모드를 사용하거나 type을 디버깅용으로
잠깐 수정한 후 값이 제대로 입력되었는지 반드시 확인해야 한다.
 -->
 <div class="card shadow mb-4">
	<div class="card-header py-3">
    	<h6 class="m-0 font-weight-bold text-primary">자유게시판</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
        
			<input type="hidden" name="idx" value="${param.idx }" />
			<input type="hidden" name="mode" value="${mode }" />
			
			<table class="table table-bordered table-dark" id="dataTable" width="50%" cellspacing="0">
				<tr>
					<td colspan="2" align="center">비밀번호를 입력해주세요.</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pass" style="width:100px"/>
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
        </div>
    </div>
</div>
</form>
</body>
</html>