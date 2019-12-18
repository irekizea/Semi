package servlet.BABoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BABoardDao {

	//자원접근객체 생성
	private static DataSource source;
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}
		catch(NamingException e) {
			e.printStackTrace();
		}
			}

	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	public List<BABoardDto> getList(int Board_no, String id) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * ba_board where board_no = ? order by no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, Board_no);
		ResultSet rs = ps.executeQuery();
		
		List<BABoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BABoardDto dto = new BABoardDto();
			dto.setBoard_no(rs.getInt("board_no"));
			dto.setWriter(rs.getString("writer"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setWdate(rs.getString("wdate"));
			dto.setUdate(rs.getString("udate"));
			
			list.add(dto);
		}
		con.close();
		return list;
	}
	
		public BABoardDao get(int board_no) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from ba_board where board_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, board_no);
			ResultSet rs = ps.executeQuery();
			
			//불러온 rs boardDto 변환
			//BABoardDto dto;
			BABoardDto dto = new BABoardDto();
			if(rs.next()) {

				dto.setBoard_no(rs.getInt("board_no"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setUdate(rs.getString("udate"));
				
		
				}
				else {
				dto = null;
				}
			
			con.close();
			return dto;
			
		}
		

	
}
