package semi.beans.block.mem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberStatusDao {
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
	
	public List<MemberStatusDto> getList(int start,int finish) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from member_status";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<MemberStatusDto> list = new ArrayList<>();
		
		while(rs.next()) {
			MemberStatusDto dto = new MemberStatusDto();
			dto.setId(rs.getString("id"));
			dto.setEmail(rs.getString("email"));
			dto.setGrade(rs.getString("grade"));
			dto.setReason(rs.getString("reason"));//db에 만든 이름
			
			list.add(dto);
		}
		
		con.close();
		return list;
	}
	
//	기능:총 차단 회원 수 구하기
//	이름:getCount
//	매개변수:없음
//	반환형:차단 회원 수(int)
	public int getCount(String type, String keyword) throws Exception {
		Connection con=getConnection();
		boolean isSearch=type!=null&&keyword!=null;
		
		String sql="select count(*)from member_status";
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
	public List<MemberStatusDto> search(String type, String keyword, int start, int finish) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from ( "
							+ "select rownum rn, A.* from( "
								+ "select * from member_status "
								+ "where "+type+" like '%'||?||'%' "
								+ "order by id desc "
							+ ")A "
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		//변환
		List<MemberStatusDto> list = new ArrayList<>();
		
		while(rs.next()) {
			MemberStatusDto dto=new MemberStatusDto();
			
			dto.setId(rs.getString("id"));
			dto.setEmail(rs.getString("email"));
			dto.setGrade(rs.getString("grade"));
			dto.setReason(rs.getString("reason"));//db에 만든 이름
			
			list.add(dto);
		}
		
		con.close();
		
		return list;
	}
}
