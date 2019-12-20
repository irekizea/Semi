package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.member.MemberDao;
import semi.beans.member.MemberDto;

@WebServlet(urlPatterns = "/member/login.do")
public class MemberLoginServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
//			준비
			req.setCharacterEncoding("UTF-8");
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
//			처리
			MemberDao dao = new MemberDao();
			boolean result = dao.login(id, pw);
			
//			출력
			if(result) {//로그인 성공 시
				
//				session에 아이디와 권한을 저장
				req.getSession().setAttribute("id", id);
				MemberDto dto = dao.get(id);//id를 이용하여 전체 회원정보를 불러온다.
				req.getSession().setAttribute("grade", dto.getGrade());
				
//				추가 : 사용자의 최종 로그인 시각을 수정
//				dao.updateLastLogin(id);
				
				resp.sendRedirect(req.getContextPath());
			}
			else {//로그인 실패 시
//				error 메시지가 표시되는 로그인 화면으로 이동해라
				resp.sendRedirect("login_fail.jsp");

			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}