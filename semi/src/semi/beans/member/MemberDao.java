package semi.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {

	// 자원을 참조하는 변수 생성(리모컨)
	// private static DataSource source = context.xml의 자원 정보;
	private static DataSource source;
	static {
		// source에 context.xml의 Resource 정보를 설정
		// [1] 탐색 도구 생성
		// [2] 도구를 이용하여 탐색 후 source에 대입
		try {
			InitialContext ctx = new InitialContext();// [1]
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 연결 메소드
	public Connection getConnection() throws Exception {
		return source.getConnection();
	}
// 기능 : 회원가입
// 이름 : regist
// 매개변수 :  id, pw, email
// 반환형 없음 void

// public + void = 반환형 상태/ List면 list/ boolean/ 이름/ 매개변수
	public void regist(MemberDto dto) throws Exception {
		Connection con = getConnection();

		String sql = "insert into member values(?,?,?,'일반',0)";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getEmail());

		ps.execute();

		con.close();

	}

// 	기능 : 로그인
// 이름 : login
// 매개변수 : id, pw
// 반환형 : boolean

	public boolean login(String id, String pw) throws Exception {
		Connection con = getConnection();

		String sql = "select * from member where id=? and pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		ResultSet rs = ps.executeQuery();

		boolean result = rs.next();

		con.close();
		return result;

	}

	public boolean login(MemberDto dto) throws Exception {
		boolean result = this.login(dto.getId(), dto.getPw());
		return result;
	}

	// 기능 : 이메일로 아이디 찾기
	// 이름 : find
	// 매개변수 : email
	// 반환형 : id

	// 전체 공개 / 반환String (입력 받을게 email인데 형식이 String이라서 )
	public String find(String email) throws Exception {
		// 연결하기/ con은 별칭 / get.onnection / 연결하기 가져오겠다를
		Connection con = getConnection();

		String sql = "select id from member where email=?"; 
		PreparedStatement ps = con.prepareStatement(sql); /* 준비된 명령 */
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();

		String  id= null;
		if (rs.next()) {
			id = rs.getString("id");
		}
		
		con.close();

		return id; // 아이디를 내놓겠다

	}
	// 단일 조회
	public MemberDto get(String id) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from member where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,id);
		ResultSet rs = ps.executeQuery();
		
		MemberDto dto;
		if(rs.next()) {
			dto = new MemberDto();
			
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setEmail(rs.getString("email"));
			dto.setGrade(rs.getString("grade"));
			dto.setPoint(rs.getInt("point"));
		}
		else {
			dto = null;
		}
		
		con.close();
		return dto;
		
				
	}
	
	// 비밀번호 변경 메소드
	public void changePassword(String id,String pw) throws Exception{
		// 공개합니다. 결과는 없고요 준비물은 아이디랑, 비번이구요 예외는 나도 모르오 
		Connection con = getConnection();
	
		String sql ="update member set pw=? where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, pw);
		ps.setString(2, id);
		
		ps.execute();
		
		con.close();
	
	}
}
