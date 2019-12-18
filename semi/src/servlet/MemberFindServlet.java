package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;

@WebServlet(urlPatterns="/member/find.do")
public class MemberFindServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		// 수신
			req.setCharacterEncoding("UTF-8");
			String email = req.getParameter("email"); // 이메일을 받고 
		// 처리
			MemberDao dao = new MemberDao();
			// MemberDto dto = dto,find(email);
			String id = dao.find(email); // 아이디를 찾고 (이메일로)
			
			if(id == null) { // 아이디가 없으면
				resp.sendRedirect("/member/login.jsp");
			}
			else {
				resp.sendRedirect("/member/result.jsp");
			}
	}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
