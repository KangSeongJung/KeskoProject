<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String chkVal = request.getParameter("inactiveToday");

//파라미터의 값이 null이 아닌 동시에 1이라면 쿠키를 아래와 같이 생성한다.
if(chkVal != null && chkVal.equals("1")){
	Cookie cookie = new Cookie("PopupClose", "off");
	cookie.setPath(request.getContextPath());
	//유효기간설정(1일:86400초)
	cookie.setMaxAge(60*60*24);
	//응답헤더에 쿠키를 실어 클라이언트로 전송
	response.addCookie(cookie);
	//콜백데이터 출력
	out.println("쿠키 : 하루 동안 열지 않음");
}
%>