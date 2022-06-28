package kesuser;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class RegisterController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/member/regist.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		KESUserDTO dto = new KESUserDTO();
		
		dto.setEvent(req.getParameter("game"));
		dto.setKorname(req.getParameter("korname"));
		dto.setEngname(req.getParameter("engname"));
		dto.setId(req.getParameter("id"));
		dto.setPass(req.getParameter("pass1"));
		dto.setDate_birth(req.getParameter("birthday"));
		dto.setGender(req.getParameter("gender"));
		dto.setAddress(req.getParameter("zipcode")+req.getParameter("address1")+req.getParameter("address2"));
		dto.setEmail(req.getParameter("email1")+"@"+req.getParameter("email2"));
		dto.setMobile(req.getParameter("mobile1")+"-"+req.getParameter("mobile2")+"-"+req.getParameter("mobile3"));
		dto.setTel(req.getParameter("tel1")+"-"+req.getParameter("tel2")+"-"+req.getParameter("tel3"));
		
		
		KESUserDAO dao = new KESUserDAO();
		int result = dao.insertWrite(dto);
		//커넥션풀 자원 반납
		dao.close();
		
		//서블릿에서 특정 요청명으로 이동하고 싶을때는 sendRedirect()를 사용하면된다.
		if(result == 1) {
			//insert에 성공하면 리스트로 이동한다.
			resp.sendRedirect("../Keskomain/main.jsp");
		}
		else {
			//insert에 실패하면 작성페이지로 다시 이동한다.
			resp.sendRedirect("../Keskomain/member/regist.jsp");
		}
	}
}
