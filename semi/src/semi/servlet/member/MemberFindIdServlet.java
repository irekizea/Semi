package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.member.MemberDao;

@WebServlet(urlPatterns="/member/find_id.do")
public class MemberFindIdServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		// 수신
			req.setCharacterEncoding("UTF-8"); // 한글깨지지않게
			String email = req.getParameter("email"); // 이메일을 받고 
		// 처리
			MemberDao dao = new MemberDao();

			String id = dao.find_id(email); // 아이디내놔/ 이메일로찾을게
			if(id == null) { // 아이디가 없으면
				resp.sendRedirect("find_id_result.jsp");
			}
			else {
				resp.sendRedirect("find_id_result.jsp?id="+id);
			}

		// 이동
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
