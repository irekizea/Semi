package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import baens.MemberDao;

@WebServlet(urlPatterns="/member/login.do")
public class MemberLoginServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
//				준비
			   req.setCharacterEncoding("UTF-8");
				String id = req.getParameter("id");
				String pw = req.getParameter("pw");
				
//				처리				
				MemberDao dao= new MemberDao();
				boolean result = dao.login(id, pw);
				
//				출력
				if(result){
					// session에 아이디 저장
					req.getSession().setAttribute("id", id);
					
					resp.sendRedirect("../index.jsp");
					
				}
				else {
					resp.sendRedirect("#");
				}
				
				
			}
			catch(Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
	}
}
