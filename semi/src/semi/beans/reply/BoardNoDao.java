package semi.beans.reply;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardNoDao {
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
	public List<BoardNoDto> getList(String keyword) throws Exception {
		Connection con = getConnection();
		
		String sql ="SELECT *FROM " + 
				"BOARD A left join Board_Text B " + 
				"on a.no = b.board_no where title = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<BoardNoDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BoardNoDto boardNoDto = new BoardNoDto();
			boardNoDto.setNo(rs.getInt("no"));
			boardNoDto.setBoard_no(rs.getInt("board_no"));
			boardNoDto.setWriter(rs.getString("writer"));
			boardNoDto.setSub_title(rs.getString("sub_title"));
			boardNoDto.setContent(rs.getString("content"));
			boardNoDto.setUdate(rs.getString("udate"));
			
			list.add(boardNoDto);
		}
		
		con.close();
		return list;
	}
	//단일조회
	public BoardNoDto get(int boardno) throws Exception{
		Connection con = getConnection();
		
		String sql = "select*from board_text where board_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardno);
		ResultSet rs = ps.executeQuery();
		
		BoardNoDto boardNodto = new BoardNoDto();
		if(rs.next()) {
			boardNodto.setNo(rs.getInt("no"));
			boardNodto.setBoard_no(rs.getInt("board_no"));
			boardNodto.setWriter(rs.getString("writer"));
			boardNodto.setSub_title(rs.getString("sub_title"));
			boardNodto.setContent(rs.getString("content"));
			boardNodto.setUdate(rs.getString("udate"));
		}
		con.close();
		return boardNodto;	
	}


		
}


