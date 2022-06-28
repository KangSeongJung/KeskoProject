package kesuser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		if(commandStr.equals("/login.do")){
			req.getRequestDispatcher("../Keskomain/member/login.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("../admin/index.jsp").forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		String passwd = req.getParameter("passwd");
		
		KESUserDAO dao = new KESUserDAO();
		KESUserDTO dto = dao.Login(userid, passwd);
		String grade = dto.getGrade();
		System.out.println(grade);
		dao.close();
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);		

		if (dto.getId() != null){
			
			HttpSession session = req.getSession();
			session.setAttribute("userid", dto.getId());
			session.setAttribute("pass", dto.getPass());
			
			if(commandStr.equals("/login.do")){
				resp.sendRedirect("../kesuser/login.do");	
			}
			else {
				if(grade.equals("9")) {
					req.setAttribute("grade", "9");
					req.setAttribute("LoginErrMsg2", "접근이 불가능한 아이디입니다.");
					req.getRequestDispatcher("../admin/admin.jsp").forward(req, resp);
				}
				else {
					resp.sendRedirect("../admin/index.jsp");
				}
			}
		}
		
		else {
			//req.setAttribute("LoginErrMsg", "로그인 오류 입니다.");
			if(commandStr.equals("/login.do")) {
				req.setAttribute("LoginErrMsg", "로그인 오류입니다.");
				req.getRequestDispatcher("../Keskomain/member/login.jsp").forward(req, resp);
			}
			else {
				req.setAttribute("LoginErrMsg", "로그인 오류입니다.");
				req.getRequestDispatcher("../admin/admin.jsp").forward(req, resp);
			}
		}
		
		
	}
}

