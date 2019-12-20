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

// 사용자 기여내역(사용자의 글 작성(수정) history )
	public List<HistoryDto> memberHis (String writer, String ip_addr) throws Exception {
		Connection con = getConnection();
				
		String sql="select writer, board_title, content, board_text_udate "
					+ "from history where writer= ? or ip_addr= ? "
					+ "order by board_text_udate desc";
		PreparedStatement ps = con.prepareStatement(sql);		
		ps.setString(1, writer);
		ps.setString(2, ip_addr);
		ResultSet rs = ps.executeQuery();
			
		List<HistoryDto> list = new ArrayList<>();
		
		while(rs.next()) {
			HistoryDto memberHis = new HistoryDto();
			
			if(rs.getString("writer")!=null) {
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

}
