package semi.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardReplyDao {
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

// 메인상세글 댓글(토론) 입력
	public void replyInsert(BoardReplyDto boardReplyDto) throws Exception{
		Connection con = getConnection();
			
		String sql="insert into board_reply (reply_no, board_title, writer, ip_addr, content) "
				+ "values(board_reply_seq.nextval, ?, ?, ?, 'sad')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardReplyDto.getBoard_title());
		ps.setString(2, boardReplyDto.getWriter());
		ps.setString(3, boardReplyDto.getIp_addr());
		ps.setString(4, boardReplyDto.getContent());
		
		ps.execute();
		
		con.close();
	}
	
	
// 메인상세글 댓글(토론) 목록
	public List<BoardReplyDto> replyList (String keyword) throws Exception {
		Connection con = getConnection();

		String sql="select *from board_reply where board_title=? "
				+ "order by wdate asc";
		PreparedStatement ps = con.prepareStatement(sql);		
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<BoardReplyDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BoardReplyDto boardReplyDto = new BoardReplyDto();
			
			boardReplyDto.setReply_no(rs.getInt("reply_no"));
			boardReplyDto.setBoard_title(rs.getString("board_title"));
			boardReplyDto.setContent(rs.getString("content"));
			boardReplyDto.setWriter(rs.getString("writer"));
			boardReplyDto.setIp_addr(rs.getString("ip_addr"));
			boardReplyDto.setWdate(rs.getString("wdate"));
			
			list.add(boardReplyDto);
		}
		
		con.close();		
		return list;
	}
}
