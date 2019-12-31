package semi.beans.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import semi.beans.board.BoardReplyDto;



public class ReplyDao {
	
	//DBCP(DataBase Connection Pool)
	private static DataSource source;
	static {
		try {
			Context ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			
		}
		catch(Exception e) {
		}
	}
	
	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	


	
	
	//	삭제기능
	//	이름 : delete 
	//	매개변수 : 번호(reply-no)
	//  반환형 : void
	public void delete(int reply_no) throws Exception {
		Connection con = getConnection();
		String sql = "delete Ba_reply where reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		ps.execute();
		
		con.close();
		
	}



	
	public List<ReplyDto> select(int board_no)throws Exception{
	
		  List<ReplyDto> list = new ArrayList<>();
	        Connection con = getConnection();
	        String sql = "select * from ba_reply where board_no=? order by no";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, board_no);
	        ResultSet rs = ps.executeQuery();
	
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
	
    //목록기능
    //이름:getList
    //매개변수 : 게시글번호(board no)
    //반환형 : 댓글목록(List<ReplyDt>)
	
	// 테이블 no 로 데이터 한개 가져오기 : ReplyList()
	public List<ReplyDto> ReplyList(int board_no) throws Exception{
		Connection con = getConnection();
		String sql = "select * from Ba_reply where Board_no = ? order by reply_no asc";
	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, board_no);
		
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> list = new ArrayList<>();
		
		while(rs.next()) {
		ReplyDto dto = new ReplyDto();
		dto.setReply_no(rs.getInt("reply_no"));
		dto.setId(rs.getString("id"));
		dto.setBoard_no(rs.getInt("board_no"));
		dto.setReply_title(rs.getString("reply_title"));
		dto.setWdate(rs.getString("wdate"));
		dto.setIp(rs.getString("ip"));
	
		list.add(dto);
		
	}
	con.close();
	return list;
	}	

	public void Rwrite(ReplyDto dto) throws Exception{
		Connection con = getConnection();
		
		
		String sql= "insert into ba_reply(reply_no,id,board_no,reply_title,wdate,ip) values(ba_reply_seq.nextval,?,?,?,sysdate,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		
		ps.setString(1, dto.getId());
		ps.setInt(2, dto.getBoard_no());
		ps.setString(3, dto.getReply_title());
		ps.setString(4, dto.getIp());
		
		ps.execute();
		ps.close();
		
	}
	
	//테이블에 데이터 수정 구현 :update()
	public void update(ReplyDto dto) throws Exception{
		Connection con = getConnection();
		String sql= "update Ba_reply set id=?, replytitle=?,wdate=? where reply_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, dto.getReply_no());
		ps.setString(2, dto.getReply_title());
		ps.setString(3, dto.getId());
		ps.setString(4, dto.getWdate());
		
		ps.execute();
		ps.close();
		
		
	}
	


	
}
