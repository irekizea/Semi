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
				String id = (String)req.getSession().getAttribute("id");
				
				req.setCharacterEncoding("UTF-8");
				String email =req.getParameter("email");
	
	
//				[2] 처리
				MemberDto dto = new MemberDto();
				dto.setEmail(email);

	
}
catch(Exception e){
	e.printStackTrace();
	resp.sendError(500);

}
	
	
	
}
}
