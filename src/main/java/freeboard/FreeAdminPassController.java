package freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;
import utils.JSFunction;

public class FreeAdminPassController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/admin/adminfreepass.jsp").forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		
		FreeBoardDAO dao = new FreeBoardDAO();
		FreeBoardDTO dto = dao.selectView(idx);
		int result = dao.deletePost(idx);
		dao.close();
		
		if(result ==1) {
			//앞에서 얻어온 DTO에서 파일명을 확인한다.
			String saveFileName = dto.getSfile();
			//첨부된 파일을 삭제한다.
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
		}
		JSFunction.alertLocation(resp, "삭제되었습니다.", "../freeboard/adminfreelist.do");
	}
}
