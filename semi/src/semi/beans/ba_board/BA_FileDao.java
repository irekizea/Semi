package semi.beans.ba_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BA_FileDao {
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
	}
	
//기능:파일 등록
//이름:FilesInsert
//매개변수:BA_FileDto(no,origin,uploadname,savename,filetype,filesize)
//반환형:없음
	public void fileInsert(BA_FileDto fdto)throws Exception{
		Connection con=getConnection();
		String sql="insert into ba_file "
				+ "values(ba_file_seq.nextval,?,?,?,?,?)";
		
		PreparedStatement ps=con.prepareStatement(sql);
		System.out.println(fdto.getOrigin());
		ps.setInt(1, fdto.getOrigin());
		ps.setString(2, fdto.getUploadname());
		ps.setString(3, fdto.getSavename());
		ps.setString(4, fdto.getFiletype());
		ps.setLong(5, fdto.getFilesize());
		
		ps.execute();
		con.close();
	}
	
//기능:파일 목록 조회
//이름:getList
//매개변수:게시글 번호(origin)
//반환형:List<BA_FilesDto>
		public List<BA_FileDto> getList(int origin) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from ba_file where origin = ? order by no asc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, origin);
			ResultSet rs = ps.executeQuery();
			
			List<BA_FileDto> list = new ArrayList<>();
			while(rs.next()) {
				BA_FileDto fdto = new BA_FileDto();
				fdto.setNo(rs.getInt("no"));
				fdto.setOrigin(rs.getInt("origin"));
				fdto.setUploadname(rs.getString("uploadname"));
				fdto.setSavename(rs.getString("savename"));
				fdto.setFiletype(rs.getString("filetype"));
				fdto.setFilesize(rs.getLong("filesize"));
				list.add(fdto);
			}
			
			con.close();
			return list;
		}
		
//기능:단일조회
//이름:get
//매개변수:파일 번호(no)
//반환형:BA_FileDto
		public BA_FileDto get(int no) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from ba_file where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			
			BA_FileDto fdto = null;
			if(rs.next()) {
				fdto = new BA_FileDto();
				fdto.setNo(rs.getInt("no"));
				fdto.setOrigin(rs.getInt("origin"));
				fdto.setUploadname(rs.getString("uploadname"));
				fdto.setSavename(rs.getString("savename"));
				fdto.setFiletype(rs.getString("filetype"));
				fdto.setFilesize(rs.getLong("filesize"));
			}
			
			con.close();
			return fdto;
		}
}
