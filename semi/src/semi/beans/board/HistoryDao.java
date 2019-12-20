package semi.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class HistoryDao {
	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		}
		catch(NamingException e){
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception {
		return source.getConnection();
	}
	
	
	//history 테이블로 데이터 저장하는 메소드
	public void savehistory(HistoryDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql="insert into history values(history_seq.nextval,?,?,?,to_date(?,'yy-mm-dd'),?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getBoard_text_no());
		ps.setString(2, dto.getWriter());
		ps.setString(3, dto.getBoardtitle());
		ps.setString(4, dto.getBoardtextudate().substring(0, 10));
		ps.setString(5, dto.getContent());
		ps.setString(6, dto.getIp_addr());
		
		ps.execute();
		con.close();
	}
	
	
}
