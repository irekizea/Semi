package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardTextDao {
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
	
// 주제1에 대한 상세글 작성
	
	
// 주제1에 대한 상세글 목록
	public List<BoardTextDto> getList(String keyword) throws Exception {
		Connection con = getConnection();
		
		String sql ="SELECT *FROM " + 
				"BOARD A left join Board_Text B " + 
				"on a.no = b.board_no where title = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<BoardTextDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BoardTextDto boardTextDto = new BoardTextDto();
			boardTextDto.setNo(rs.getInt("no"));
			boardTextDto.setBoard_no(rs.getInt("board_no"));
			boardTextDto.setWriter(rs.getString("writer"));
			boardTextDto.setSub_title(rs.getString("sub_title"));
			boardTextDto.setContent(rs.getString("content"));
			boardTextDto.setUdate(rs.getString("udate"));
			
			list.add(boardTextDto);
		}
		
		con.close();
		return list;
	}
}
