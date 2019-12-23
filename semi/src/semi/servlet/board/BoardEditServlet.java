package semi.servlet.board;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.board.BoardDao;
import semi.beans.board.BoardDto;
import semi.beans.board.BoardTextDao;
import semi.beans.board.BoardTextDto;
import semi.beans.board.HistoryDao;
import semi.beans.board.HistoryDto;

@WebServlet(urlPatterns="/board/boardedit.do")
public class BoardEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
//			int boardtextno = Integer.parseInt(req.getParameter("no"));
			String writer = req.getParameter("writer");
			String boardtitle = req.getParameter("boardtitle");
			String boardtextudate = req.getParameter("boardtextudate");
			String content = req.getParameter("content");
			String keyword = req.getParameter("keyword");
			int no = Integer.parseInt(req.getParameter("no"));
			int boardno = Integer.parseInt(req.getParameter("board_no"));
			String ipaddr= req.getParameter("ip_addr");
			//역사테이블 저장기능
			HistoryDao hdao = new HistoryDao();
			HistoryDto hdto = new HistoryDto();
			
			hdto.setBoard_text_no(no);
			hdto.setWriter(writer);
			hdto.setBoardtitle(boardtitle);
			hdto.setBoardtextudate(boardtextudate);
			hdto.setContent(content);
			hdto.setIp_addr(ipaddr);
			hdao.savehistory(hdto);
			
			//현재글수정기능
			BoardTextDto bdto = new BoardTextDto();
			BoardTextDao bdao = new BoardTextDao();
			bdto.setWriter(writer);
			bdto.setText_content(content);
			bdto.setNo(no);
			
			bdao.btedit(bdto);
			
			
			BoardDao dao = new BoardDao();
			BoardDto dto = new BoardDto();
			dto.setUdate("sysdate");
			dao.bedit(boardno);
						
			// editCheck 부르기(승인후 최초 글인지, 수정된 글인지).
			BoardDao boardDao = new BoardDao();
			boardDao.editCheck(keyword);
			
			resp.sendRedirect("searchResult.jsp?keyword="+URLEncoder.encode(keyword, "UTF-8")+"&no="+no);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
