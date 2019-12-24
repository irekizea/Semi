package semi.servlet.block;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.block.mem.BlockMemberDao;
import semi.beans.block.mem.BlockMemberDto;
@WebServlet(urlPatterns = "/admin/block.do" )
public class BlockMemeberInsertServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			BlockMemberDao dao= new BlockMemberDao();
			BlockMemberDto dto=new BlockMemberDto();
			
			String id=req.getParameter("id");
			String admin=req.getParameter("admin");
			String reason=req.getParameter("reason");
			
			dto.setB_id(id);
			dto.setBadmin(admin);
			dto.setBreason(reason);
		
			dao.blockMem(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
	

}
