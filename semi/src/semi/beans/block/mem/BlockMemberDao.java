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
//	반환형 :데이터 목록(List<BlockMemberDto>)
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
			
			ps.setString(1, dto.getB_id());
			ps.setString(2, dto.getBdate());
			ps.setString(3, dto.getBadmin());
			ps.setString(4, dto.getBreason());
	
			list.add(dto);
		}
		con.close();
		
		return list;
	}	
	
//	기능:회원 차단
//	이름:blockMem
//	매개변수:(BlockMemberDto)
//	반환형:없음
	
	public void blockMem(BlockMemberDto dto)throws Exception{
		Connection con=getConnection();
		
		String sql="insert into block_mem "
					+ "values(?,sysdate,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, dto.getB_id());
			ps.setString(3, dto.getBadmin());
			ps.setString(4, dto.getBreason());
			
			ps.execute();		
		con.close();
	}
	
//	기능:회원차단 해제
//	이름:releaseMem
//	매개변수:회원 아이디(id)
//	반환형:없음
	public void releaseMem(String id) throws Exception {
		Connection con=getConnection();
		String sql="delete block_mem where b_id=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, id);
		ps.execute();
		
		con.close();
	}
	
//	기능:단일 조회
//	이름:get
//	매개변수:회원 아이디
//	반환형:BlockMemberDto
	public BlockMemberDto get(String id)throws Exception{
		Connection con=getConnection();
		String sql="select * from block_mem where b_id=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs=ps.executeQuery();
		
		BlockMemberDto dto = new BlockMemberDto();
		
		ps.setString(1, dto.getB_id());
		ps.setString(2, dto.getBdate());
		ps.setString(3, dto.getBadmin());
		ps.setString(4, dto.getBreason());
		
		rs.next();
			
			
		con.close();
		return dto;
	}
}
