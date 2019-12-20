package servlet.reply.active;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.BABoard.BA_BoardDao;
import servlet.reply.ReplyDao;




@WebServlet(urlPatterns = "/reply/reply_delete.do")
public class ReplyDeleteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			//[1]수신 [2] 처리 [3]이동
			int Reply_no = Integer.parseInt(req.getParameter("Reply_no"));
			int Board_no = Integer.parseInt(req.getParameter("Board_no"));
			
			ReplyDao rdao = new ReplyDao();
			rdao.delete(Reply_no);//댓글등록
			
			BA_BoardDao bdao = new BA_BoardDao();
			bdao.calculate(Board_no);//댓글 수 갱신
			
			resp.sendRedirect("content.jsp?no=" + Board_no);
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
