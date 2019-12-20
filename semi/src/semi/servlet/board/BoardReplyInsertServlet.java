package semi.servlet.board;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.board.BoardReplyDao;
import semi.beans.board.BoardReplyDto;

@WebServlet(urlPatterns="/board/replyInsert.do")
public class BoardReplyInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
		
			String board_title = req.getParameter("board_title");

			String writer = (String)req.getSession().getAttribute("id");
			String ip = InetAddress.getLocalHost().getHostAddress();
			String content = req.getParameter("content");
			
			BoardReplyDto boardReplyDto = new BoardReplyDto();
			boardReplyDto.setBoard_title(board_title);
			boardReplyDto.setWriter(writer);
			boardReplyDto.setIp(ip);
			boardReplyDto.setContent(content);
			
			BoardReplyDao boardReplyDao = new BoardReplyDao();
			boardReplyDao.replyInsert(boardReplyDto);
			
			resp.sendRedirect(req.getContextPath()+"/board/searchResult.jsp?keyword="+URLEncoder.encode(board_title, "UTF-8"));
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
