package servlet.reply.active;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.reply.ReplyDao;
import servlet.reply.ReplyDto;

@WebServlet(urlPatterns = "/reply/reply_update.jsp")
public class ReplyUpdateServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			ReplyDao dao = new ReplyDao();
			
			ReplyDto dto = new ReplyDto();
			dto.setReply_no(Integer.parseInt(req.getParameter("reply_no")));
			dto.setReply_title(req.getParameter("reply_title"));
			dto.setWdate(req.getParameter("wdate"));
			
			dao.update(dto);
			
			resp.sendRedirect("reply.contentjsp?no="+dto.getReply_no());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
