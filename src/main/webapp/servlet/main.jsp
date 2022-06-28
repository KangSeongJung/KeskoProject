<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상대경로 사용</h2>
	<img src="../images/bird.jpg" alt="" />
	
	<h2>절대경로 사용1(컨텍스트루트 경로를 하드코딩으로 사용)</h2>
	<p>프로젝트를 변경하거나 배포하면 경로를 수정해야한다.</p>
	<img src="/AdminTest/images/bird.jpg" alt="" />
	
	<h2>절대경로 사용2(메서드를 통해 얻어옴)</h2>
	<p>메서드를 통해 얻어오므로 프로젝트를 변경하더라도 수정할 필요없다.</p>
	<img src="<%=request.getContextPath()%>/images/bird.jpg" alt="" />
</body>
</html>