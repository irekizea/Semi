package semi.beans.reply;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.reply.BoardReplyDto;

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
	
	
	
	public void bupdate(int board_no) throws Exception {
		Connection con = getConnection();

		String sql = "update board set udate=sysdate where board_no=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, board_no);

		ps.execute();

		con.close();
	}

	public BoardReplyDto getSearch(String typing) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM BA_BOARD where title= ? ";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, typing);
		ResultSet rs = ps.executeQuery();

		BoardReplyDto boardreplydto = new BoardReplyDto();
		if (rs.next()) {
			boardreplydto.setBoard_no(rs.getInt("board_no"));
			boardreplydto.setWriter(rs.getString("writer"));
			boardreplydto.setTitle(rs.getString("title"));
			boardreplydto.setUdate(rs.getString("udate"));
			
		}
		con.close();
		return boardreplydto;
	}
}


