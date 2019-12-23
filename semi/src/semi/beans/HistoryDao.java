package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class HistoryDao {
	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

	// history 테이블로 데이터 저장하는 메소드
	public void savehistory(HistoryDto dto) throws Exception {
		Connection con = getConnection();

		String sql = "insert into history values(history_seq.nextval,?,?,?,to_date(?,'yy-mm-dd'),?,?)";

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

	// 단일조회
	public HistoryDto get(int no) throws Exception {
		Connection con = getConnection();

		String sql = "select*from history where no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();

		HistoryDto historydto = new HistoryDto();
		if (rs.next()) {
			historydto.setNo(rs.getInt("no"));
			historydto.setBoard_text_no(rs.getInt("board_text_no"));
			historydto.setWriter(rs.getString("writer"));
			historydto.setBoardtitle(rs.getString("board_title"));
			historydto.setBoardtextudate(rs.getString("board_text_udate"));
			historydto.setContent(rs.getString("text_content"));
			historydto.setIp_addr(rs.getString("ip_addr"));
		}
		con.close();
		return historydto;
	}
	
	
	// 최신글의 writer 뽑아오는 메소드
	public int recentwriter(int board_text_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "select max(no) from history where board_text_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, board_text_no);
		ResultSet rs = ps.executeQuery();
		int recentwriter = 0;
		if (rs.next()) {
			rs.getInt(1);
			System.out.println(rs.getInt(1));
			recentwriter= rs.getInt(1);
		}
		
		con.close();
		return recentwriter;
	}
}
