package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	
	//자원을 참조하는 변수 생성(리모컨)
		//private static DataSource source = context.xml의 자원 정보;
		private static DataSource source;
		static {
			//source에 context.xml의 Resource 정보를 설정
			//[1] 탐색 도구 생성
			//[2] 도구를 이용하여 탐색 후 source에 대입
			try {
				InitialContext ctx = new InitialContext();//[1]
				source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");			
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		
		//연결 메소드
		public Connection getConnection() throws Exception{
			return source.getConnection();
		}
// 기능 : 회원가입
// 이름 : regist
// 매개변수 :  id, pw, email
// 반환형 없음 void

// public + void = 반환형 상태/ List면 list/ boolean/ 이름/ 매개변수
		public void regist(MemberDto dto) throws Exception{
			Connection con = getConnection();
			
			String sql = "insert into member values(?,?,?,'일반',0)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2,dto.getPw());
			ps.setString(3,dto.getEmail());
			
			ps.execute();
			
			con.close();
			
		}
}




