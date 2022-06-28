package kesuser;

import common.DBConnPool;

public class KESUserDAO extends DBConnPool{
	
	public KESUserDAO() {
		super();
	}
	
	public int insertWrite(KESUserDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO kesuser ( "
					+ " event, korname, engname, id, pass, date_birth, gender, address, email, mobile, tel, grade) "
					+ " VALUES ( "
					+ " ?,?,?,?,?,?,?,?,?,?,?,?) ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getEvent());
			psmt.setString(2, dto.getKorname());
			psmt.setString(3, dto.getEngname());
			psmt.setString(4, dto.getId());
			psmt.setString(5, dto.getPass());
			psmt.setString(6, dto.getDate_birth());
			psmt.setString(7, dto.getGender());
			psmt.setString(8, dto.getAddress());
			psmt.setString(9, dto.getEmail());
			psmt.setString(10, dto.getMobile());
			psmt.setString(11, dto.getTel());
			psmt.setString(12, dto.getGrade());
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public KESUserDTO selectRegister(String userid) {
		
		//조회된 레코드를 DTO객체 저장한 후 반환한다.
		KESUserDTO dto = new KESUserDTO();
		//인파라미터가 있는 쿼리문 작성
		String query = "SELECT * FROM kesuser WHERE id=?";
		try {
			//쿼리실행을 위한 객체생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, userid);
			rs = psmt.executeQuery();
			
			//조회된 레코드가 있을때 DTO객체에 각 컬럼값을 저장한다.
			if(rs.next()) {
				psmt = con.prepareStatement(query);
				dto.setEvent(rs.getString(1));
				dto.setKorname(rs.getString(2));
				dto.setEngname(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPass(rs.getString(5));
				dto.setDate_birth(rs.getString(6));
				dto.setGender(rs.getString(7));
				dto.setAddress(rs.getString(8));
				dto.setEmail(rs.getString(9));
				dto.setMobile(rs.getString(10));
				dto.setTel(rs.getString(11));
				dto.setGrade(rs.getString(12));
			}
		}
		catch (Exception e) {
			System.out.println("유저정보 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}	
	
	public KESUserDTO Login(String userid, String passwd) {
		
		KESUserDTO dto = new KESUserDTO();
		String query = "SELECT * FROM kesuser WHERE id = ? AND pass = ?	";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, userid);
			psmt.setString(2, passwd);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setEvent(rs.getString(1));
				dto.setKorname(rs.getString(2));
				dto.setEngname(rs.getString(3));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setDate_birth(rs.getString(6));
				dto.setGender(rs.getString(7));
				dto.setAddress(rs.getString(8));
				dto.setEmail(rs.getString(9));
				dto.setMobile(rs.getString(10));
				dto.setTel(rs.getString(11));
				dto.setGrade(rs.getString(12));

			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
