package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.member.MemberDao;

@WebServlet(urlPatterns="/member/check.do")
public class MemberCheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			[1] 수신
			String id = (String)req.getSession().getAttribute("id");
			String pw = req.getParameter("pw");
			String go = req.getParameter("go");
//			go = /member/change_pw.jsp or /member/change_info.jsp or /member/exit.do
			
//			[2] 처리
			MemberDao dao = new MemberDao();
			boolean result = dao.login(id, pw);
			
//			[3] 이동
			if(result) {//성공시
				resp.sendRedirect(req.getContextPath()+"/index.jsp");
			}
			else {//실패시
				resp.sendRedirect("check.jsp?error&go="+go);
			}

		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
