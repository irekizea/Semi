package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.member.MemberDao;

@WebServlet(urlPatterns = "/member/change_pw.do")
public class MemberChangePwServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
	//    [1] 수신
			req.setCharacterEncoding("UTF-8"); // 한글로 받겠다
			String pw = req.getParameter("pw");  //파라미터는 전달하는 데이터를 받겠다
			
			String id = (String)req.getSession().getAttribute("id"); //pw와는 다름/session에서 꺼내서 해야함
	
	// 		[2] 처리
			MemberDao dao = new MemberDao();
			dao.changePassword(id,pw);
			
			
	//		[3] 이동
			resp.sendRedirect("change_pw_result.jsp");
			}
		catch(Exception e) {
			resp.sendError(500);
		}
	}

	
}
