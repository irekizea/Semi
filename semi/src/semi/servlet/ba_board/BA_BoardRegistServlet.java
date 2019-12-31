package semi.servlet.ba_board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ba_board.BA_BoardDao;
import semi.beans.ba_board.BA_BoardDto;
import semi.beans.board.BoardDao;
import semi.beans.board.BoardDto;
import semi.beans.board.BoardTextDto;

@WebServlet(urlPatterns = "/ba_board/regist.do")
public class BA_BoardRegistServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BA_BoardDto dto = new BA_BoardDto();
			BA_BoardDao dao = new BA_BoardDao();
			
			int no=Integer.parseInt(req.getParameter("no"));
			int pno=Integer.parseInt(req.getParameter("pno"));
			
			BA_BoardDto badto = dao.get(no);
			
			String writer=badto.getWriter();
			String title=badto.getTitle();
			String content=badto.getContent();
			
			dto.setWriter(writer);
			dto.setTitle(title);
			
			boolean result = dao.regist(dto);
			
			if(result) {
				dao.registUpdate(no);
			}else {
			}
			
// 		"board_text" 테이블로 content 전송
			BoardDao boardDao = new BoardDao();
			BoardDto boardDto = boardDao.getSearch(title);
			
			BoardTextDto boardTextDto = new BoardTextDto();
			boardTextDto.setWriter(writer);
			boardTextDto.setText_content(content);
				
			boardTextDto.setBoard_no(boardDto.getNo());
			
			boolean result2 = dao.regist(boardTextDto);
			
			if(result2) {
				dao.registUpdate(no);
			}else {
			}
			
			resp.sendRedirect("list.jsp?pno="+pno);												
			
		}catch(Exception e){
			resp.sendError(500);
		}
		
	}
	

}
