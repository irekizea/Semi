package semi.beans.block.mem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi.beans.ba_board.BA_BoardDto;

public class BlockMemberDao {
	
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
	
//	기능:차단 목록 조회
//	이름:getList
//	매개변수:없음
//	반환형 :데이터 목록(List<BlockMembeDto>)
	public List<BlockMemberDto> getList(int start, int finish) throws Exception{
		Connection con = getConnection();
		String sql="select * from ( "
					+ "select rownum rn, A.* from ( "
						+ "select * from block_mem "
						+ "order by bdate desc "
					+ ")A "
				+ ") where rn between ? and ?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		
		ResultSet rs = ps.executeQuery();
		List<BlockMemberDto> list = new ArrayList<>();	
		while(rs.next()) {		
			
			BlockMemberDto dto = new BlockMemberDto();
			
			dto.setB_id(rs.getString("b_id"));
			dto.setBdate(rs.getString("bdate"));
//			dto.set
	
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
					+ "values(?,?,?,?,sysdate,null,0,0,0)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setInt(1, dto.getBoard_no());
			ps.setString(2, dto.getWriter());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			
			ps.execute();		
		con.close();
	}

}
