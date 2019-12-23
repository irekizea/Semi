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
			e.printStackTrace();
		}
	}
	
	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	//	필요한 기능 : 등록기능, 목록기능 , 삭제기능
	
	// 등록 기능 insert
	
	//-이름 : write
	//-매개변수 : replytitle, id ,board_no
	//-반환형 : void
	
	public void write(ReplyDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into ba_reply(reply_no, replytitle, id "
					+ "value(ba_reply_seq.nextval,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getReply_no());
		ps.setString(2, dto.getReply_title());
		ps.setString(3, dto.getId());
		
		
		ps.execute();
		
		con.close();
	}
	
	public void replyCreate(ReplyDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into ba_reply (reply_no, reply_title, id, wdate "
				+ "values(ba_reply_seq.nextval, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getReply_title());
		ps.setString(2, dto.getId());
		ps.setString(3, dto.getWdate());
		
		ps.execute();
		
		con.close();
		
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
    //목록기능
    //이름:getList
    //매개변수 : 게시글번호(board no)
    //반환형 : 댓글목록(List<ReplyDt>)
	
	public List<ReplyDto> rList (int boardno) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from ba_reply where board_no = ? "
					+ "order by wdate asc";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, boardno);
			ResultSet rs = ps.executeQuery();
			
			List<ReplyDto> list = new ArrayList<>();
			if(rs.next()) {
				ReplyDto dto = new ReplyDto();
				dto.setReply_no(rs.getInt("reply_no"));
				dto.setId(rs.getString("id"));
				dto.setReply_title(rs.getString("reply_title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setBoard_no(rs.getInt("board_no"));
				
				list.add(dto);
			}
			
			con.close();
			return list;	
	}
	
	//댓글 목록
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
			boardReplyDto.setIp(rs.getString("ip"));
			boardReplyDto.setWdate(rs.getString("wdate"));
			
			list.add(boardReplyDto);
		}
		
		con.close();		
		return list;
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
	
	// 테이블 no 로 데이터 한개 가져오기 : get1()
	public ReplyDto get1(int reply_no) throws Exception{
		ReplyDto dto = new ReplyDto();
		String sql = "select * from Ba_reply where reply_no= ?";
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		dto.setReply_no(rs.getInt("reply_no"));
		dto.setReply_title(rs.getString("reply_title"));
		dto.setWdate(rs.getString("wdate"));
		dto.setBoard_no(rs.getInt("board_no"));
	
		return dto;
		
	}
	
	//테이블에 데이터 수정 구현 :update()

	
	public void insert(ReplyDto dto) throws Exception{
		Connection con = getConnection();
		String sql= "insert into ba_reply(reply_no,id,replytitle,wdate) values(ba_reply_seq.nextval,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, dto.getReply_no());
		ps.setString(2, dto.getId());
		ps.setString(3, dto.getReply_title());
		ps.setString(4, dto.getWdate());
		
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


