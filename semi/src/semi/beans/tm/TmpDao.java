package semi.beans.tm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class TmpDao {
	
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
	public void brwrite(TmpDto dto) throws Exception{
		Connection con = getConnection();
		
		
		String sql = "insert into reply (no, wdate, writer, wip, rpcontent, baorigin) "
				+ "values(tmp_seq.nextval, sysdate, ?, ?, ?, ?";
		PreparedStatement ps = con.prepareStatement(sql);
		if(dto.getWriter()!=null) {
			ps.setString(1, dto.getWriter());
			ps.setString(2, null);
		}else {
			ps.setString(1, null);
			ps.setString(2, dto.getWip());
		}
		
		ps.setString(3, dto.getRpcontent());
		ps.setInt(4, dto.getBaorigin());
		
		ps.execute();
		
		con.close();
		
		
		
	}
	
	public List<TmpDto> getList(int Baorigin) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from reply where baorigin=? order by no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, Baorigin);
		ResultSet rs = ps.executeQuery();
		
		
		List<TmpDto> list = new ArrayList<>();
		while(rs.next()) {
			TmpDto dto = new TmpDto();
			dto.setNo(rs.getInt("no"));
			dto.setRpcontent(rs.getString("rpcontent"));
			dto.setWdate(rs.getString("wdate"));
			dto.setWip(rs.getString("wip"));
			dto.setWriter(rs.getString("writer"));
			
			list.add(dto);
			
		}
		
		con.close();
		return list;
	}
	
	public void delete(int no) throws Exception{
		Connection con = getConnection();
		
		String sql = "delete reply where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		
		ps.execute();
		
		con.close();
		
		
	}
	
	
	
	

}
