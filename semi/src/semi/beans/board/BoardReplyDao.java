package semi.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
	public void replyInsert(BoardReplyDto boardReplyDto) throws Exception{
		Connection con = getConnection();
				
		String sql="insert into board_reply (reply_no, board_title, writer, content) "
				+ "values(board_reply_seq.nextval, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardReplyDto.getBoard_title());
		ps.setString(2, boardReplyDto.getWriter());
		ps.setString(3, boardReplyDto.getContent());
		
		ps.execute();
		
		con.close();
	}
	
}
