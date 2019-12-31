package semi.servlet.member;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.member.MemberDao;
import semi.beans.member.MemberDto;


@WebServlet(urlPatterns="/member/regist.do")
public class MemberRegistServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			[1] 수신
			req.setCharacterEncoding("UTF-8");
			MemberDto dto = new MemberDto();
			dto.setId(req.getParameter("id"));
			dto.setPw(req.getParameter("pw"));
			dto.setEmail(req.getParameter("email"));
			
//			[2] 처리
			MemberDao dao = new MemberDao();
			dao.regist(dto);
			
//			[3] 이동			
			resp.sendRedirect("regist_success.jsp");
			
		}
			
		catch(SQLIntegrityConstraintViolationException e) {
			resp.sendRedirect("regist_fail.jsp");
		}
		catch(Exception e){
			resp.sendError(500);
		}
	}
}
