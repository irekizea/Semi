package semi.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

		String sql = "insert into history values(history_seq.nextval,?,?,to_date(?,'yyyy-mm-dd'),?,?,?)";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getWriter());
		ps.setString(2, dto.getBoardtitle());
		ps.setString(3, dto.getBoardtextudate().substring(0, 10));
		ps.setString(4, dto.getContent());
		ps.setString(5, dto.getIp_addr());
		ps.setInt(6, dto.getboard_no());
		
		ps.execute();
		con.close();
	}

// 사용자 기여내역(사용자의 글 작성(수정) history )
	public List<HistoryDto> memberHis(String writer, String ip_addr) throws Exception {
		Connection con = getConnection();

		String sql = "select writer, board_title, content, board_text_udate "
				+ "from history where writer= ? or ip_addr= ? " + "order by board_text_udate desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, writer);
		ps.setString(2, ip_addr);
		ResultSet rs = ps.executeQuery();

		List<HistoryDto> list = new ArrayList<>();

		while (rs.next()) {
			HistoryDto memberHis = new HistoryDto();

			if (rs.getString("writer") != null) {
				memberHis.setWriter(rs.getString("writer"));
			}
			memberHis.setBoardtitle(rs.getString("board_title"));
			memberHis.setContent(rs.getString("content"));
			memberHis.setBoardtextudate(rs.getString("board_text_udate"));

			list.add(memberHis);
		}
		con.close();
		return list;
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
			historydto.setboard_no(rs.getInt("board_no"));
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
	public int recentwriter(int board_no) throws Exception {
		Connection con = getConnection();

		String sql = "select max(no) from history where board_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, board_no);
		ResultSet rs = ps.executeQuery();
		int recentwriter = 0;
		if (rs.next()) {
			rs.getInt(1);
			recentwriter = rs.getInt(1);
		}

		con.close();
		return recentwriter;
	}
	public List<HistoryDto> hList(String keyword) throws Exception {
		Connection con = getConnection();
		String sql = "select*from history where board_title= ? order by board_text_udate asc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		HistoryDto historydto = new HistoryDto();
		List<HistoryDto> list = new ArrayList<>();
		while (rs.next()) {
			historydto.setWriter(rs.getString("writer"));
			historydto.setBoardtextudate(rs.getString("board_text_udate"));
			historydto.setIp_addr(rs.getString("ip_addr"));
			
			list.add(historydto);
		}
		con.close();
		return list;
	}

	
	
}
