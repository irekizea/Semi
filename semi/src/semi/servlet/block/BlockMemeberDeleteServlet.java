package semi.servlet.block;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.block.mem.BlockMemberDao;
@WebServlet(urlPatterns = "/admin/release.do" )
public class BlockMemeberDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			BlockMemberDao dao= new BlockMemberDao();

			String id=req.getParameter("id");
			dao.releaseMem(id);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
	

}
