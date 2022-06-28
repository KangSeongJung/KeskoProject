<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
	
<section class="bg-light py-5 border-bottom">
    <div class="container px-5 my-5">
        <div class="text-center mb-5">
			<h2 class="fw-bolder">공지사항</h2>
        </div>
        
        <div class="row gx-5 justify-content-center">
        <!-- Pricing card free-->
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
					<c:forEach items="${boardLists }" var="row" varStatus="loop">
                   		<div class="col-lg-6 col-xl-4">
                       		<div class="card mb-5 mb-xl-0">
                           		<div class="card-body p-5">
                               		<div class="small text-uppercase fw-bold text-muted">[${row.category }]</div>
                           			<ul class="list-unstyled mb-4">
                               			<li class="mb-2 text-muted">
                                   			<i class="bi bi-x"><img src="../Uploads/${row.sfile }" style="max-width: 100%; height: 300px" /></i>
                               			</li>	
                               			<li class="mb-2 text-muted">
                                   			<i class="bi bi-x"></i>
                                   			${row.title }
                               			</li>
                           			</ul>
                               		<div class="d-grid"><a class="btn btn-outline-primary" href="../kesboard/view.do?idx=${row.idx}">바로 가기</a></div>
                           		</div>
                       		</div>
                   		</div>
              		</c:forEach>
				</c:otherwise>
			</c:choose>
			<div class="container px-5 my-5"> 
	        	<div class="text-center mb-5">
	            	${map.pagingImg }
	            </div>
	        </div>
        </div>
    </div>
 </section>
</body>
</html>