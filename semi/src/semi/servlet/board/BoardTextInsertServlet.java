package semi.servlet.board;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.board.BoardTextDao;
import semi.beans.board.BoardTextDto;

@WebServlet(urlPatterns="/board/textInsert.do")
public class BoardTextInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			int board_no = Integer.parseInt(req.getParameter("board_no"));	
			String keyword=req.getParameter("keyword");
			String writer = (String)req.getSession().getAttribute("id");
			String ip_addr = InetAddress.getLocalHost().getHostAddress();
			
			BoardTextDto boardTextDto = new BoardTextDto();
			boardTextDto.setBoard_no(board_no);
			boardTextDto.setWriter(writer);
			boardTextDto.setSub_title(req.getParameter("sub_title"));
			boardTextDto.setContent(req.getParameter("content"));
			boardTextDto.setIp_addr(ip_addr);
			
			BoardTextDao boardTextDao = new BoardTextDao();
			boardTextDao.textInsert(boardTextDto);
			
			resp.sendRedirect(req.getContextPath()+"/board/searchResult.jsp?keyword="+URLEncoder.encode(keyword, "UTF-8")+"&board_no="+board_no);
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
