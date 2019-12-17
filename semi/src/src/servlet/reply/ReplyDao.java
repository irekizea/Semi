package servlet.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReplyDao {
	
	//DBCP(DataBase Connection Pool)
	private static DataSource source;
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	//	필요한 기능 : 등록기능, 목록기능 , 삭제기능
	
	// 등록 기능
	
	//-이름 : write
	//-매개변수 : replytitle, id ,board_no
	//-반환형 : void
	
	public void write(ReplyDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into ba_reply(reply_no, replytitle, id, board_no "
					+ "value(reply_seq.nextval,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getReply_title());
		ps.setString(2, dto.getId());
		ps.setInt(3, dto.getBoard_no());
		
		ps.execute();
		
		con.close();
	}
		//	목록기능
		// 이름: getList
		// 매개변수 : 게시글 번호(board_no)
		// 반환형 : 댓글목록(List<Replydto>)
	
	public List<ReplyDto> getList(int board_no) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from ba_reply where board_no = ? order by no asc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, board_no);
			ResultSet rs = ps.executeQuery();
			
			List<ReplyDto> list = new ArrayList<>();
			while(rs.next()) {
				ReplyDto dto = new ReplyDto();
				dto.setReply_no(rs.getInt("reply_no"));
				dto.setReply_title(rs.getString("reply_title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setBoard_no(rs.getInt("board_no"));
				
				list.add(dto);
			}
			con.close();
			return list;
			
	}

	
	//	삭제기능
	//	이름 : delete 
	//	매개변수 : 번호(reply-no)
	//  반환형 : void
	public void delete(int reply_no) throws Exception{
		Connection con = getConnection();
		
		String sql= "delete ba_reply where reply_no = ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		
		ps.execute();
		
		con.close();
	}
	
}


