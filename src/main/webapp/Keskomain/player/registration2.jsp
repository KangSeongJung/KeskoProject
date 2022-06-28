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

<script type="text/javascript">
	function formSubmit() {
		if($("input[name='event']").val()==""){
    		alert('종목을 입력하세요')
    		$("input[name='event']").focus();
         	return false; 
    	}
		if($("input[name='korname']").val()==""){
    		alert('종목을 입력하세요')
    		$("input[name='korname']").focus();
         	return false; 
    	}
		if($("input[name='engname']").val()==""){
    		alert('영어이름을 입력하세요')
    		$("input[name='engname']").focus();
         	return false; 
    	}
		if($("input[name='userid']").val()==""){
    		alert('아이디를 입력하세요')
    		$("input[name='userid']").focus();
         	return false; 
    	}
		if($("input[name='birth']").val()==""){
    		alert('생년월일을 입력하세요')
    		$("input[name='birth']").focus();
         	return false; 
    	}
		if($("input[name='gender']").val()==""){
    		alert('성별을 입력하세요')
    		$("input[name='gender']").focus();
         	return false; 
    	}
		if($("input[name='position']").val()==""){
    		alert('직책/포지션을 입력하세요')
    		$("input[name='position']").focus();
         	return false; 
    	}
		if($("input[name='belong']").val()==""){
    		alert('소속을 입력하세요')
    		$("input[name='belong']").focus();
         	return false; 
    	}
		if($("input[name='applicant_name']").val()==""){
    		alert('신청자 이름을 입력하세요')
    		$("input[name='applicant_name']").focus();
         	return false; 
    	}
		if($("input[name='applicant_phone1']").val()==""){
    		alert('신청자 연락처를 입력하세요')
    		$("input[name='applicant_phone1']").focus();
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
                    <li class="nav-item"><a class="nav-link active" href="../Keskomain/player/registration.jsp">선수 등록/신청</a></li>
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
					<img src="../Keskomain/images/tit_1.png" alt="" />
				</div>   
                </div>
            </div>
        </div>
    </div>
</header>
<!-- -->

<div class="contains player_wrppaing">
	<form method="post" name="playForm" action="../Keskomain/player/registration3.jsp" onsubmit="return formSubmit();" enctype="multipart/form-data">
	<div class="player_title">
		<br />
		<p class="title">선수 등록/신청</p>
		<p class="step"><img src="../images/step_2.JPG" alt=""></p>
	</div>
	
	<div class="form_wrap">
		<p class="form_tit">선수/지도자 정보</p>
			<table>
				<tbody>
					<tr>
						<th>종목</th>
						<td>
							<input type="text" name="event" value="${dto.event }"/>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" placeholder="한글이름" name="korname" value="${dto.korname }">
							<input type="text" placeholder="영문이름" name="engname"value="${dto.engname }">
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="userid" value="${dto.id }">
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="text" name="birth" value="${dto.date_birth }" />
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<label for="gender_man">
								<input type="radio" name="gender" id="gender_man" value="man">남
							</label>
							&nbsp;&nbsp;
 							<label for="gender_woman">
								<input type="radio" name="gender" id="woman" value="woman">여 
							</label>
						</td>
					</tr>
					<tr>
						<th>직책/포지션/종목/주사용</th>
						<td>
							<input type="text" name="position">
						</td>
					</tr>
					<tr>
						<th>소속</th>
						<td>
							<input type="text" name="belong">
						</td>
					</tr>
					<tr>
						<th>사진</th>
						<td>
							<input type="file" class="file" name="profile" id="profile">
						</td>
					</tr>
				</tbody>
			</table>

			<p class="form_tit">신청자 정보</p>
			<table>
				<tbody>
					<tr>
						<th>신청자 이름</th>
						<td>
							<input type="text" name="applicant_name" value="${dto.korname }">
						</td>
					</tr>
					<tr>
						<th>신청자 연락처</th>
						<td class="phone">
							<input type="text" name="applicant_phone1" value="${dto.tel }"/>
						</td>
					</tr>
				</tbody>
			</table>
	</div>
	<div class="btn_wrap">	
		<a href="../Keskomain/player/registration.jsp" class="btn"><span>취소</span></a>
		<button type="submit" class="btn btn_black"><span>다음</span></button>
	</div>
	</form>
</div>
<br />
<br />
<br />
<br />


<footer class="py-5 bg-dark">
    <div class="container px-5"><p class="m-0 text-center text-white">Copyright &copy; 강성중 KESKO 2022</p></div>
</footer>
<!-- <select name="applicant_phone1">
								<option value="">-선택-</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<span>-</span>
							<select name="applicant_phone2">
								<option>-선택-</option>
							</select>
							<input type="text" name="applicant_phone2" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							<span>-</span>
							<select name="applicant_phone3">
								<option>-선택-</option>
							</select>
							<input type="text" name="applicant_phone3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -->

</body>
</html>