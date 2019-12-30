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
	
	public List<MemberStatusDto> getList() throws Exception{
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
}
