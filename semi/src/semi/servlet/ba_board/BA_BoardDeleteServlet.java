package semi.servlet.ba_board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ba_board.BA_BoardDao;
@WebServlet(urlPatterns = "/ba_board/delete.do")
public class BA_BoardDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int no=Integer.parseInt(req.getParameter("no"));
			
			BA_BoardDao dao=new BA_BoardDao();
			dao.delete(no);
			
			resp.sendRedirect("list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
