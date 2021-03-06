package semi.servlet.ba_board;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ba_board.BA_BoardDao;
import semi.beans.ba_board.BA_BoardDto;
@WebServlet(urlPatterns = "/ba_board/dislike.do")
public class BA_BoardDislikeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		//사용자에게 받아야할 정보 : 아이디(세션),글번호(파라미터)
		int no=Integer.parseInt(req.getParameter("no"));
		String id = (String)req.getSession().getAttribute("id");
		BA_BoardDto dto=new BA_BoardDto();
		BA_BoardDao dao= new BA_BoardDao();
		
		//좋아요 싫어요 수 증가 방지
		Set<Integer> dislike = (Set<Integer>)req.getSession().getAttribute("dislike");
		if(dislike == null){
			dislike = new HashSet<>();
		}
		boolean isFirst = dislike.add(no);

		req.getSession().setAttribute("dislike", dislike);		
		
		boolean isMine = id.equals(dto.getWriter());		
		
		if(!isMine && isFirst){
			dao.down(no);
		}else {
		}
		
		resp.sendRedirect("content.jsp?no="+no);
		}catch(Exception e) {
			resp.sendError(500);
		}
	}
	

}
