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
			dto.setB_id(rs.getString("b_id"));
			dto.setBadmin(rs.getString("badmin"));
			dto.setBdate(rs.getString("bdate"));
			dto.setBreason(rs.getString("breason"));
	
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
		
		String sql="insert into block_mem values(?,sysdate,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, dto.getB_id());
			ps.setString(2, dto.getBadmin());
			ps.setString(3, dto.getBreason());
			
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
		rs.next();
		
		BlockMemberDto dto = new BlockMemberDto();
		
		dto.setB_id(rs.getString("b_id"));
		dto.setBadmin(rs.getString("badmin"));
		dto.setBdate(rs.getString("bdate"));
		dto.setBreason(rs.getString("breason"));
		
			
			
		con.close();
		return dto;
	}
	
//	기능:총 차단 회원 수 구하기
//	이름:getCount
//	매개변수:없음
//	반환형:차단 회원 수(int)
	public int getCount(String type, String keyword) throws Exception {
		Connection con=getConnection();
		boolean isSearch=type!=null&&keyword!=null;
		
		String sql="select count(*)from block_mem";
		if(isSearch) {
			sql+=" where " + type +" like '%'||?||'%'";
		}
		PreparedStatement ps=con.prepareStatement(sql);
		if(isSearch) {
			ps.setString(1, keyword);		
		}
		
		ResultSet rs=ps.executeQuery();//결과는 무조건 1개
		rs.next();

		int count=rs.getInt(1);
		
		con.close();
		return count;
	}
//	기능:총 차단 회원 검색
//	이름:search
//	매개변수:검색타입, 검색어, 시작점, 끝점
//	반환형:차단 회원 수(int)
	public List<BlockMemberDto> search(String type, String keyword, int start, int finish) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from ( "
							+ "select rownum rn, A.* from( "
								+ "select * from block_mem "
								+ "where "+type+" like '%'||?||'%' "
								+ "order by bdate desc "
							+ ")A "
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		//변환
		List<BlockMemberDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BlockMemberDto dto=new BlockMemberDto();
			
			dto.setB_id(rs.getString("b_id"));
			dto.setBadmin(rs.getString("badmin"));
			dto.setBdate(rs.getString("bdate"));
			dto.setBreason(rs.getString("breason"));
			
			list.add(dto);
		}
		
		con.close();
		
		return list;
	}
//	기능:차단 회원 검사
//	이름:same
//	매개변수:없음
//	반환형:List
	public List<String> same() throws Exception{
		Connection con = getConnection();	
		String sql="select B.b_id from member M "
					+ "inner join block_mem B "
						+ "on M.id=B.b_id";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		List<String> list = new ArrayList<>();
		while(rs.next()) {
			list.add(rs.getString("b_id"));
		}
//		System.out.println(list);
		con.close();
		return list;
	}
	
	public List<BlockMemberDto> block() throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from block_mem ";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		//변환
		List<BlockMemberDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BlockMemberDto dto=new BlockMemberDto();
			
			dto.setB_id(rs.getString("b_id"));
			
			list.add(dto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<BlockMemberDto> blockIp() throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from block_ip ";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		//변환
		List<BlockMemberDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BlockMemberDto dto=new BlockMemberDto();
			
			dto.setB_ip(rs.getString("b_ip"));
			
			list.add(dto);
		}
		
		con.close();
		
		return list;
	}
	

}
