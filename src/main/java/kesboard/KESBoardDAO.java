package kesboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class KESBoardDAO extends DBConnPool {
	
	public KESBoardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM kesboard";
		
		if (map.get("searchWord") !=null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		
		catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<KESBoardDTO> selectListPage(Map<String, Object> map){
		List<KESBoardDTO> board = new ArrayList<KESBoardDTO>();
		
		String query = " SELECT * FROM ( "
				+ "    		SELECT Tb.*, ROWNUM rNum FROM ( "
					+ "        SELECT * FROM kesboard ";
		if (map.get("searchWord") !=null) {
			query += " WHERE " + map.get("searchField")
					+ " LIKE '%" + map.get("searchWord") + "%' "; 
		}
		query += " 		ORDER BY idx DESC "
				+ "    	) Tb "
				+ " ) "
				+ " WHERE rNum BETWEEN ? AND ?";
	
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				KESBoardDTO dto = new KESBoardDTO();
				
				//테이블이 변경되었으므로 저장하는 부분은 수정이 필요함....
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setCategory(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setContent(rs.getString(8));
				dto.setRegidate(rs.getDate(9));
				dto.setVisitcount(rs.getInt(10));
				
				
				board.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}
	
	public void updateVisitCount(String idx) {
		String query = "UPDATE kesboard SET visitcount = visitcount+1 WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		}
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public KESBoardDTO selectView(String idx) {
		
		//조회된 레코드를 DTO객체 저장한 후 반환한다.
		KESBoardDTO dto = new KESBoardDTO();
		//인파라미터가 있는 쿼리문 작성
		String query = "SELECT * FROM kesboard WHERE idx=?";
		try {
			//쿼리실행을 위한 객체생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			//조회된 레코드가 있을때 DTO객체에 각 컬럼값을 저장한다.
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setCategory(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setContent(rs.getString(8));
				dto.setRegidate(rs.getDate(9));
				dto.setVisitcount(rs.getInt(10));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql = "SELECT COUNT(*) FROM kesboard WHERE pass=? AND idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			
			/*
			select문에 count()함수를 사용하는 경우 조건(where절)에 만족하는 레코드가
			없을때 0, 만족하는 레코드가 있을때는 1이상의 정수값이 반환된다.
			즉 어떤경우에도 결과값이 있으므로 next() 호출시 if문이 필요하지 않다.
			 */
			rs.next();
			/*
			if(rs.next())
				=> 일반적인 select문을 사용하는 경우에 1개의 레코드만 반환될때 사용한다.
				주로 일련번호를 조건으로 추가하는 경우인데, 만족하는 레코드가 없다면 
				next()를 사용할때 에러가 발생된다. 
			while(rs.next())
				=> select의 결과가 2개 이상일때 사용된다. 주로 게시판의 목록과 같이
				여러개의 레코드가 반환되는 경우에 사용한다.
			*/
			
			//일치하는 결과가 없는 경우 false를 반환한다. 
			if(rs.getInt(1)==0) {
				isCorr = false;
			}
		}
		catch(Exception e) {
			//예외가 발생하면 검증이 안된것이므로 이때도 false를 반환한다.
			isCorr = false;
			e.printStackTrace();
		}
		//검증이 완료되었을때만 true를 반환한다.
		return isCorr;
	}
	
	public int deletePost(String idx) {
		int result = 0;
		try {
			String query = "DELETE FROM kesboard WHERE idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int updatePost(KESBoardDTO dto) {
		int result = 0;
		try {
			//update쿼리문 작성
			String query = "update kesboard set title=?, name=?, content=?, ofile=?, sfile=? where idx=? and pass=? ";

			//동적쿼리문 실행을위해 prepared객체 생성 및 인파라미터 설정
			psmt= con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			
			//쿼리 실행 및 결과 반환(update된 행의 갯수)
			result= psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertWrite(KESBoardDTO dto) {
		int result = 0;
		try {
			/*
			컬럼설명
			ofile : 원본 파일명
			sfile : 서버에 저장된 파일명
			pass : 비회원제 게시판이므로 수정,삭제를 위한 인증에 사용됨
			 */
			String query = "INSERT INTO kesboard ( "
					+ " idx, name, pass, title, content, ofile, sfile, category ) "
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL,?,?,?,?,?,?,?) ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			psmt.setString(7, dto.getCategory());
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
