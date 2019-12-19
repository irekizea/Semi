package semi.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.board.BoardTextDao;
import semi.beans.board.BoardTextDto;

@WebServlet(urlPatterns="/board/boardedit.do")
public class BoardEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BoardTextDto boardtextdto = new BoardTextDto();
			boardtextdto.setNo(Integer.parseInt(req.getParameter("no")));
			
			
			BoardTextDao boardtextdao = new BoardTextDao();
			resp.sendRedirect("searchResult.jsp?keyword="+req.getParameter("keyword"));
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
