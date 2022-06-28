package kesboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;


public class TablesController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		KESBoardDAO dao = new KESBoardDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");	
		
		if (searchWord != null){
			//검색어를 입력한 경우에만 Model로 전달하기 위해 저장함
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		int totalCount = dao.selectCount(map);
		
		ServletContext application = getServletContext();
		
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		
		if (pageTemp !=null && !pageTemp.equals(""))
			pageNum =Integer.parseInt(pageTemp);
		int start = (pageNum -1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);

		List<KESBoardDTO> boardLists = dao.selectListPage(map);
		dao.close();
		
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		String pagingImg ;
		if(commandStr.equals("/tables.do")){
			pagingImg = BoardPage.pagingStr(totalCount, pageSize, 
				blockPage, pageNum, "../kesboard/tables.do");
		}
		else {
			pagingImg = BoardPage.pagingStr(totalCount, pageSize, 
					blockPage, pageNum, "../kesboard/list.do");
		}
		//View로 전달할 데이터를 Map컬렉션에 저장함.
		//페이지번호
		map.put("pagingImg", pagingImg);
		//전체 게시물의 갯수
		map.put("totalCount", totalCount);
		//한페이지당 출력할 게시물의 갯수(설정값)
		map.put("pageSize", pageSize);
		//현재 페이지 번호
		map.put("pageNum", pageNum);
		
		//View로 전달할 객체들을 request영역에 저장한다.
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		if(commandStr.equals("/tables.do")){
			req.getRequestDispatcher("/admin/tables.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("/Keskomain/notice/list.jsp").forward(req, resp);
		}
	}
}
