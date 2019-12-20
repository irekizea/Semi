package semi.beans.board;

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
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
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
		if (rs.next()) {
			boardDto.setNo(rs.getInt("no"));
			boardDto.setWriter(rs.getString("writer"));
			boardDto.setTitle(rs.getString("title"));
			boardDto.setUdate(rs.getString("udate"));
			boardDto.setSearchCount(rs.getInt("searchCount"));
		}
		con.close();
		return boardDto;
	}

	// board 테이블 최종변경시간 업데이트 메소드
	public void bedit(int no) throws Exception {
		Connection con = getConnection();

		String sql = "update board set udate=sysdate where no=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, no);

		ps.execute();

		con.close();
	}
	
// 검색어 count
	public void searchCount(String keyword) throws Exception {
		Connection con = getConnection();
		
		String sql="update board set searchcount=searchcount+1 where title=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.execute();
		
		con.close();
	}
	public List<BoardDto> getTitleList() throws Exception {
		Connection con = getConnection();
		
		String sql="select rownum, B. *from( "
						+ "select title from board order by board.searchcount desc " 
					+ ")B where rownum <=3";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list =new ArrayList<>();
		while(rs.next()){
			BoardDto boardDto = new BoardDto();
			boardDto.setTitle(rs.getString("title"));
			
			list.add(boardDto);
		}
		con.close();
		return list;
	}
}

