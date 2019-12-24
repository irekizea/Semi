package semi.servlet.ba_board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ba_board.BA_BoardDao;
import semi.beans.ba_board.BA_BoardDto;

@WebServlet(urlPatterns = "/ba_board/regist.do")
public class BA_BoardRegistServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BA_BoardDto dto = new BA_BoardDto();
			BA_BoardDao dao = new BA_BoardDao();
			
			int no=Integer.parseInt(req.getParameter("no"));
			
			BA_BoardDto badto = dao.get(no);
			
			String writer=badto.getWriter();
			String title=badto.getTitle();
			String content=badto.getContent();
			
			dto.setWriter(writer);
			dto.setTitle(title);
			dto.setContent(content);
			
			
			boolean result = dao.regist(dto);
			
			if(result) {
				dao.registUpdate(no);
			}else {
				System.out.println("등록 실패");
			}
			
			resp.sendRedirect("list.jsp");												
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
	

}
