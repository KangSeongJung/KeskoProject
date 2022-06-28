package freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FreeViewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FreeBoardDAO dao = new FreeBoardDAO();
		//일련번호를 파라미터로 받음
		String idx =req.getParameter("idx");
		//조회수 증가
		dao.updateVisitCount(idx);
		//게시물 조회
		FreeBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		
		//내용에 대해 줄바꿈 처리를 위해 <br>태그로 변환한다.
		//<textarea>에서 엔터키를 통한 줄바꿈은 \r\n으로 저장된다.
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		//request영역에 DTO를 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
	if(commandStr.equals("/freeview.do")){		
		req.getRequestDispatcher("/Keskomain/freeboard/freeview.jsp").forward(req, resp);
	}
	else {
		req.getRequestDispatcher("/admin/adminfreeview.jsp").forward(req, resp);
	}
	}
}
