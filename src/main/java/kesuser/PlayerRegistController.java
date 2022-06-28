package kesuser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlayerRegistController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("../Keskomain/player/registration2.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		System.out.println(userid);
		
		KESUserDAO dao = new KESUserDAO();
		KESUserDTO dto = new KESUserDTO();
			dto = dao.selectRegister(userid);
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Keskomain/player/registration2.jsp").forward(req, resp);
	}
}
