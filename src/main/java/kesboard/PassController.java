package kesboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

public class PassController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/admin/adminpass.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//커넥션풀을 통한 DB연결 및 패스워드 검증
		KESBoardDAO dao = new KESBoardDAO();
		boolean confirmed = dao.confirmPassword(pass, idx);
		dao.close();
		
		if(confirmed) {
			/*
			패스워드 검증에 성공한 경우
				mode가 edit이면 수정페이지로 이동한다.
						delete이면 게시물을 즉시 삭제한다. 
			 */
			if(mode.equals("edit")) {
				/*
				검증이 완료된 패스워드를 session영역에 저장한다.
				sesion영역은 페이지를 이동해도 데이터가 공유되므로 해당 게시물을
				수정완료할때까지는 유지하고, 수정이 완료되면 제거할 것이다.
				여기에서 저장한 패스워드는 수정을 위한 update쿼리문의 where절의 조건으로
				사용된다.
				 */
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("../kesboard/adminedit.do?idx="+idx);
			}
			else if (mode.equals("delete")) {
				//삭제인 경우 커넥션풀을 통해 DB연결
				dao = new KESBoardDAO();
				//기존의 게시물을 얻어온다.
				KESBoardDTO dto = dao.selectView(idx);
				//게시물을 삭제한다.
				int result = dao.deletePost(idx);
				//커넥션풀에 자원 반납
				dao.close();
				//게시물 삭제에 성공한 경우에만 첨부된 파일을 삭제한다.
				if(result ==1) {
					//앞에서 얻어온 DTO에서 파일명을 확인한다.
					String saveFileName = dto.getSfile();
					//첨부된 파일을 삭제한다.
					FileUtil.deleteFile(req, "/Uploads", saveFileName);
				}
				//알림창을 띄운 후 리스트(목록)으로 이동한다. 	
				JSFunction.alertLocation(resp, "삭제되었습니다.", "../kesboard/tables.do");
			}
		}
		else {
			//검증에 실패한 경우 패스워드 입력페이지로 이동한다.
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
	}
}
