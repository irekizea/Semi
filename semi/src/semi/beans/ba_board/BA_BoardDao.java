package semi.beans.ba_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BA_BoardDao {
	
	private static DataSource source;
	static {
		try {
			InitialContext ctx=new InitialContext();
			source=(DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection()throws Exception{
		return source.getConnection();
//		Class.forName("oracle.jdbc.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh21", "kh21");
//		return con;
	}

	
//	기능:목록 조회
//	이름:getList
//	매개변수:없음
//	반환형 :데이터 목록(List<BA_BoardDto>)
	public List<BA_BoardDto> getList(int start, int finish) throws Exception{
		Connection con = getConnection();
		String sql="select * from ( "
					+ "select rownum rn, A.* from ( "
						+ "select * from ba_board "
						+ "order by board_no desc "
					+ ")A "
				+ ") where rn between ? and ?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		
		ResultSet rs = ps.executeQuery();
		List<BA_BoardDto> list = new ArrayList<>();	
		while(rs.next()) {		
			
			BA_BoardDto dto = new BA_BoardDto();
			
			dto.setBoard_no(rs.getInt("board_no"));
			dto.setWriter(rs.getString("writer"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setWdate(rs.getString("wdate"));
			dto.setUp(rs.getInt("up"));
			dto.setDown(rs.getInt("down"));
			dto.setRegist(rs.getInt("regist"));
	
			list.add(dto);
		}
		con.close();
		
		return list;
	}	
	
//	기능:글쓰기
//	이름:write
//	매개변수:(BA_BordDto)
//	반환형:없음
	
	public void write(BA_BoardDto dto)throws Exception{
		Connection con=getConnection();
		
		String sql="insert into ba_board "
					+ "values(?,?,?,?,sysdate,0,0,0)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setInt(1, dto.getBoard_no());
			ps.setString(2, dto.getWriter());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			
			ps.execute();		
		con.close();
	}
		
//	기능:게시글 삭제
//	이름:delete
//	매개변수:글번호(no)
//	반환형:없음
	public void delete(int no) throws Exception {
		Connection con=getConnection();
		String sql="delete ba_board where board_no=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, no);
		ps.execute();
		
		con.close();
	}
	
//	기능:게시글 추가
//	이름:edit
//	매개변수:BA_BoarDto(제목,내용,수정할 글번호)
//	반환형:없음
	public void edit(BA_BoardDto dto) throws Exception {
		Connection con=getConnection();
		String sql="update ba_board "
					+ "set title='?',content='?',udate=sysdate "
					+ "where board_no=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, dto.getTitle());
		ps.setString(2, dto.getContent());
		ps.setInt(3, dto.getBoard_no());
		
		ps.execute();
		
		con.close();
	}
	
//	기능:(번호를 구해낸 뒤 등록)현재 페이지 조회
//	이름:grtSequence
//	매개변수:없음
//	반환형:현재 시퀀스 번호	
	public int getSequense() throws Exception {
		Connection con=getConnection();
		String sql="select ba_board_seq.nextval from dual";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		rs.next();

		int seq=rs.getInt(1);
		con.close();
		
		return seq;
	}
//	기능:단일 조회
//	이름:get
//	매개변수:글번호 (no)
//	반환형:BA_BoardDto
	public BA_BoardDto get(int no)throws Exception{
		Connection con=getConnection();
		String sql="select * from ba_board where board_no=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs=ps.executeQuery();
		
		BA_BoardDto dto = new BA_BoardDto();
		rs.next();
			dto.setBoard_no(rs.getInt("board_no"));
			dto.setWriter(rs.getString("writer"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setWdate(rs.getString("wdate"));
			dto.setUp(rs.getInt("up"));
			dto.setDown(rs.getInt("down"));
			dto.setRegist(rs.getInt("regist"));
			
		con.close();
		return dto;
	}
	
//	기능:글 개수 구하기
//	이름:getCount
//	매개변수:없음
//	반환형:int(게시판글 총 개수)
	public int getCount() throws Exception{
		Connection con = getConnection();
		
		String sql="select count(*) from ba_board";
		PreparedStatement ps=con.prepareStatement(sql);
		
		ResultSet rs= ps.executeQuery();
		rs.next();
		
		int count = rs.getInt(1);
		con.close();
		
		return count;
	}	
	
//	기능:좋아요 수 증가
//	이름:up
//	매개변수:게시글번호(board_no)
//	반환형:없음
	public void up(int no)throws Exception {
		Connection con=getConnection();
		String sql="update ba_board set up=up+1 where board_no=?";
		
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, no);
		ps.execute();
		
		con.close();
	}	
	
//	기능:싫어 수 증가	
	public void down(int no)throws Exception {
		Connection con=getConnection();
		String sql="update ba_board set down=down+1 where board_no=?";

		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, no);
		ps.execute();
		
		con.close();
	}	
//	기능:게시글 전송
//	이름:regist
//	매개변수:BA_BoarDto(제목,작성자)
//	반환형:없음
	public boolean regist(BA_BoardDto dto) throws Exception {
		Connection con=getConnection();
		String sql="insert into board(no,writer,title,wdate,udate) "
					+ "values(board_seq.nextval,?,?,sysdate,sysdate)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, dto.getWriter());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getContent());
		
		int update=ps.executeUpdate();
		
		boolean result=false;
		if(update>0) {
			result=true;
		}
		
		con.close();	
		return result;
	}

	
//	기능:게시글 등록 완료 표시
//	이름:registUpdate
//	매개변수:no
//	반환형:없음
	public void registUpdate(int no) throws Exception {
		Connection con=getConnection();
		String sql="update ba_board set regist=regist+1 where board_no=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, no);
		
		ps.execute();
		con.close();	
	}
}


