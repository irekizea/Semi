package servlet.reply.active;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.BABoard.BA_BoardDao;
import servlet.reply.ReplyDao;
import servlet.reply.ReplyDto;

@WebServlet(urlPatterns = "/reply/reply_insert.do")
public class ReplyInsertServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//[1] 사용자 정보를 받아 [2] DB에 등록 후 [3]이동 처리
			//-사용자 입력 : reply_title,board_no
			//-세션 :id
			String reply_title = req.getParameter("reply_title");
			int board_no = Integer.parseInt(req.getParameter("board_no"));
			
			String id = (String) req.getSession().getAttribute("id");
			
			ReplyDto dto = new ReplyDto();
			dto.setReply_title(reply_title);
			dto.setBoard_no(board_no);
			dto.setId(id);
			
			ReplyDao rdao = new ReplyDao();
			rdao.write(dto);
			
			BA_BoardDao bdao = new BA_BoardDao();
			bdao.calculate(board_no);//댓글수 수 갱신
			
			resp.sendRedirect("content.jsp?no="+board_no);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
		
	}
}
