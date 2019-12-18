package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao {
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

//	메인검색글 상세페이지
	public BoardDto getSearch(String keyword) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT *FROM BOARD where title= ? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		BoardDto boardDto = new BoardDto();
		if(rs.next()) {
			boardDto.setWriter(rs.getString("writer"));
			boardDto.setUdate(rs.getString("udate"));
			boardDto.setTitle(rs.getString("title"));

		}
		con.close();
		return boardDto;
	}
	
}
