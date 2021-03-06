package semi.servlet.member;

import java.io.IOException;	

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.member.MemberDao;
@WebServlet(urlPatterns="/member/find_pw.do")
public class MemberFindPwServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		// 수신
			req.setCharacterEncoding("UTF-8"); // 한글깨지지않게
			String id = req.getParameter("id"); // 아이디를 받고 
			String email = req.getParameter("email"); // 이메일도 받고 
		// 처리
			MemberDao dao = new MemberDao();
	
			String pw = dao.find_pw(id, email); // 비번내놔/ 아이디로찾을게

			if(pw == null) { // 비번 없으면
				resp.sendRedirect("find_pw_result.jsp");
			}
			else {
				resp.sendRedirect("find_pw_result.jsp?pw="+pw);
			}

		// 이동
		}
		catch(Exception e) {
			resp.sendError(500);
		}
	}
}
