package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.member.MemberDto;

@WebServlet(urlPatterns="/member/change_info.do")
public class MemberChangeInfoServlet extends HttpServlet {

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	//			[1] 수신 : 1개 (email)
				req.setCharacterEncoding("UTF-8");
				String email =req.getParameter("email");
	
				String id = (String)req.getSession().getAttribute("id");
	
//				[2] 처리
				MemberDto dto = new MemberDto();
				dto.setEmail(email);

// [3] 이동
				resp.sendRedirect("change_info_result.jsp");
				
				
				
}
catch(Exception e){
	e.printStackTrace();
	resp.sendError(500);

}
	
	
	
}
}
