<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
	function validateForm(form){
		if(form.userid.value ==""){
			alert("아이디를 입력하세요");
			from.userid.focus();
			return false;
		}
		if(form.title.value ==""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if(form.content.value ==""){
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
		/* if(form.pass.value ==""){
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}	 */
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
<form name="writeFrm" method="post" enctype="multipart/form-data"
	action="../freeboard/freeedit.do" onsubmit="return validateForm(this);">
<!-- 게시물 수정을 위해 일련번호와 기존 파일명을 hidden박스에 추가한다 -->
 <input type="hidden" name="idx" value="${dto.idx }" />
<!-- 기존의 원본파일명 -->
<input type="hidden" name="prevOfile" value="${dto.ofile }" />
<!-- 저장된 파일명 -->
<input type="hidden" name="prevSfile" value="${dto.sfile }" />

검증된패스워드 : ${pass }
<table class="table table-bordered table-dark" id="dataTable" width="100%" cellspacing="0">
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="userid" style="width:150px;" value="${dto.userid }"/>
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" style="width:90%;" value="${dto.title }"/>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width: 90%; height: 100px;">${dto.content }</textarea>
		</td>
	</tr>
	<tr>
		<td>첨부 파일</td>
		<td>
			<!-- input태그의 type속성이 file타입인 경우에는 value속성은
			의미가 없다. value는 단순히 String(문자열)이므로 이 부분은
			DB에서 처리해야 한다. 해당 <input>태그는 선택한 파일을
			서버로 전송하는 역할을 한다. -->
			<input type="file" name="ofile" />
		</td>
	</tr>
	<!-- 패스워드 검증을 마친후 수정페이지로 진입하였으므로 비밀번호
	입력창은 화면에서 제거한다. -->
	<!-- <tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pass" style="width:100px"/>
		</td>
	</tr> -->
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