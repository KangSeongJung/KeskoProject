<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?	family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
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
            <table class="table table-bordered table-dark" id="dataTable" width="100%" cellspacing="0">
            	<thead>
                 	<tr>
                        <th width="15%">번호</th>
			            <th width="*">제목</th>
			            <th width="10%">작성자</th>
			            <th width="5%">조회수</th>
			            <th width="15%">작성일</th>
			            <th width="10%">첨부</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
						<c:when test="${empty boardLists }">
						<!-- 리스트 컬렉션에 저장된 게시물이 없을때 출력부분 -->
						    <tr>
						        <td colspan="6" align="center">
						            등록된 게시물이 없습니다^^*
						        </td>
						    </tr>
						</c:when>
						<c:otherwise>
						<!-- 출력할 게시물이 있는경우 실행. 리스트 컬렉션에 저장된 게시물의
						갯수만큼 반복하여 목록을 출력함. -->
							<c:forEach items="${boardLists }" var="row" varStatus="loop">
								<tr align="center">
								    <td>
									<!-- 
										가상번호 계산하기
										=> 게시물갯수 - (((페이지번호-1) * 페이지당 게시물수) + 해당루프의 index)
										참고로 varStatus속성의 index는 0부터 시작한다.
									
										전체게시물의 갯수가 5개일때 
										1페이지 : 5 - (((1-1) * 2) + 0) = 5 
										2페이지 : 5 - (((2-1) * 2) + 0) = 3
									 -->
									${map.totalCount - (((map.pageNum-1) * map.pageSize)+loop.index) }
									</td>
									<td align="left">
                						<a href="../freeboard/freeview.do?idx=${row.idx }">
									 		${row.title }
									 	</a>
									</td>
									<td>${row.userid }</td>
							        <td>${row.visitcount}</td>
							        <td>${row.postdate }</td>
									<td>
									   	<c:if test="${not empty row.ofile}">
											<a href="../freeboard/download.do?ofile=${row.ofile }&sfile=${row.sfile}&idx=${row.idx}">[Down]</a>
										</c:if>
									</td>
			      				</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose> 
                </tbody>
            </table>
      		<table border="1" width="90%">
       			<tr align="center">
		            <td>
						${map.pagingImg }	
		            </td>
            		<td width="100"><button type="button"
                	onclick="location.href='../freeboard/freewrite.do';">글쓰기</button></td>
        		</tr>
    		</table>
        </div>
    </div>
</div>
</body>
</html>