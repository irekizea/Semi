package semi.servlet.ba_board_reply;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.beans.reply.ReplyDao;
import semi.beans.reply.ReplyDto;

@WebServlet(urlPatterns = "/ba_board/replywrite.do")
public class BA_ReplyInsertServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			 //[1] 수신 ->[2]등록-> [3]이동
			req.setCharacterEncoding("UTF-8");
			
			String reply_title = req.getParameter("reply_title");
			int no = Integer.parseInt(req.getParameter("no"));
			String writer = (String)req.getSession().getAttribute("id");
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			
			//내용과 아이피를 가져오고
			ReplyDto dto = new ReplyDto();
			dto.setReply_title(reply_title);
			dto.setBoard_no(no);

			if(writer != null) {
				dto.setId(writer);		
			} else {
				dto.setIp(ip);				
			}
			
			
			
			ReplyDao replydao = new ReplyDao();
			replydao.Rwrite(dto);
		
			
			resp.sendRedirect("content.jsp?no="+no);
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
