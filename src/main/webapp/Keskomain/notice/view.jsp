<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
	        	<a class="nav-link active" href="list.do">공지사항</a>
	      	</li>
	      	<li class="nav-item">
		        <a class="nav-link" href="../freeboard/freelist.do" style="color:black">자유게시판</a>
	      	</li>
	    </ul>
  	</div>	
</nav>     

  <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                	    <tr>
									        <td>번호</td> <td>${dto.idx }</td>
									        <td>작성자</td> <td>${dto.name }</td>
									    </tr>
									    <tr>
									        <td>작성일</td> <td>${dto.regidate }</td>
									        <td>조회수</td> <td>${dto.visitcount }</td>
									    </tr>
									    <tr>
									        <td>제목</td>
									        <td colspan="3">${dto.title }</td>
									    </tr>
									    <tr>
									        <td>내용</td>
									        <td colspan="3" height="100">
									         <c:if test="${not empty dto.ofile }">
									         <div style="text-align: center;">
									        <img src="../Uploads/${dto.sfile }" style="width: 500px"/> 
									        </div> 
									        </c:if> <br />
									        ${dto.content }</td>
									    </tr> 
									    <tr>
									        <td>첨부파일</td>
									        <td>
									        <!-- 
									        첨부된 파일이 있는 경우에는 파일명과 다운로드 링크를 출력한다.
									        다운로드가 완료되면 카운트 하기 위해 idx(일련번호)를 파라미터로 받는다.
									         -->
									        <c:if test="${not empty dto.ofile }">           
									        ${dto.ofile }
									            <a href="../freeboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile}&idx=${dto.idx }">[다운로드]</a>
									            </c:if>  	              
									        </td>
									    </tr> 
									    <tr>
									        <td colspan="4" align="center">
									            <button type="button" onclick="location.href='../kesboard/list.do';">
									                목록 바로가기
									            </button>
									        </td>
									    </tr>    
                                </table>
                            </div>
                        </div>
                    </div>

</body>
</html>