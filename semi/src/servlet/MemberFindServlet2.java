package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/member/find.do")
public class MemberFindServlet2 extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 수신
			req.setCharacterEncoding("UTF-8");
			
		
			
			// 처리
	
			
			// 이동
		}
		
	
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
