package kesboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ViewController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		KESBoardDAO dao = new KESBoardDAO();
		//일련번호를 파라미터로 받음
		String idx =req.getParameter("idx");
		//조회수 증가
		dao.updateVisitCount(idx);
		//게시물 조회
		KESBoardDTO dto = dao.selectView(idx);
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
		if(commandStr.equals("/view.do")){
			req.getRequestDispatcher("/Keskomain/notice/view.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("/admin/adminview.jsp").forward(req, resp);
		}
	}
}

