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
			String id = (String)req.getSession().getAttribute("id"); // 세션에서 값을 꺼낸다
			String pw = req.getParameter("pw");
			String go = req.getParameter("go");  // 로그인 성공했을 때만 사용할 거 
//			go = /member/change_pw.jsp or /member/change_info.jsp  //둘중하나 들어옴
			
//			[2] 처리
			MemberDao dao = new MemberDao();
			boolean result = dao.login(id, pw);
			
//			[3] 이동
			if(result) {//성공시
				resp.sendRedirect(req.getContextPath()+go);
//				resp.sendRedirect(req.getContextPath()+"/member/change_pw.jsp");
//				resp.sendRedirect(req.getContextPath()+"/member/change_info.jsp");
			
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
