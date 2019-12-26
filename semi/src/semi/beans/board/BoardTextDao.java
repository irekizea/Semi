package semi.beans.board;

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
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

// 주제1에 대한 상세글 작성(목차 추가)	
	public void textInsert(BoardTextDto boardTextDto) throws Exception {
		Connection con = getConnection();
		
		String sql="insert into board_text(no, writer, sub_title, text_content, board_no, ip_addr) "
				+ "values(board_text_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardTextDto.getWriter());
		ps.setString(2, boardTextDto.getSub_title());
		ps.setString(3, boardTextDto.getText_content());
		ps.setInt(4, boardTextDto.getBoard_no());
		ps.setString(5, boardTextDto.getIp_addr());
		ps.execute();

		con.close();
	}

// 주제1에 대한 상세글 목록
	public List<BoardTextDto> getList(String keyword) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT A.no, B.writer, A.title, A.wdate, A.udate, A.searchcount, B.text_content, B.board_no, B.sub_title, B.ip_addr FROM BOARD A left join Board_Text B on a.no = b.board_no where title = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		List<BoardTextDto> list = new ArrayList<>();

		while (rs.next()) {
			BoardTextDto boardTextDto = new BoardTextDto();
			boardTextDto.setNo(rs.getInt("no"));
			boardTextDto.setBoard_no(rs.getInt("board_no"));
			boardTextDto.setWriter(rs.getString("writer"));
			boardTextDto.setSub_title(rs.getString("sub_title"));
			boardTextDto.setUdate(rs.getString("udate"));
			boardTextDto.setIp_addr(rs.getString("ip_addr"));

			boardTextDto.setText_content(rs.getString("text_content"));
			boardTextDto.setUdate(rs.getString("udate"));

			list.add(boardTextDto);
		}

		con.close();
		return list;
	}

	// 단일조회
	public BoardTextDto get(int boardno) throws Exception {
		Connection con = getConnection();

		String sql = "select*from board_text where no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardno);
		ResultSet rs = ps.executeQuery();

		BoardTextDto boardtextdto = new BoardTextDto();
		if (rs.next()) {
			boardtextdto.setNo(rs.getInt("no"));
			boardtextdto.setBoard_no(rs.getInt("board_no"));
			boardtextdto.setWriter(rs.getString("writer"));
			boardtextdto.setSub_title(rs.getString("sub_title"));
			boardtextdto.setText_content(rs.getString("text_content"));
			boardtextdto.setUdate(rs.getString("udate"));
			boardtextdto.setIp_addr(rs.getString("ip_addr"));
		}
		con.close();

		return boardtextdto;
	}

	// 편집 메소드
	public void btedit(BoardTextDto dto) throws Exception {
		Connection con = getConnection();
		
		String sql = "update board_text set udate=sysdate, writer=?, text_content=?, ip_addr=? where no=? ";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getWriter());
		ps.setString(2, dto.getText_content());
		ps.setString(3, dto.getIp_addr());
		ps.setInt(4, dto.getNo());

		ps.execute();

		con.close();

	}

	
	
	
//	목차추가 파일 업로드(DB text_file)
	public void textFile(BoardTextDto textFileDto) throws Exception {
		Connection con = getConnection();

		String sql="insert into text_file(file_no, text_no, uploadname, savename, filetype, filesize) "
				+ "values(text_file_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, textFileDto.getText_no());
		ps.setString(2, textFileDto.getUploadname());
		ps.setString(3, textFileDto.getSavename());
		ps.setString(4, textFileDto.getFiletype());
		ps.setLong(5, textFileDto.getFilesize());
		ps.execute();

		con.close();
	}
}

