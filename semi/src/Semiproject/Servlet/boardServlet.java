package Semiproject.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Semiproject.beans.BoardDao;
import Semiproject.beans.BoardDto;

@WebServlet(urlPatterns="/board/search.do")
public class boardServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/plain; charset=UTF-8");	
			
			BoardDao boardDao = new BoardDao();
			BoardDto boardDto =boardDao.	getDto(req.getParameter("keyword"));
			
			resp.getWriter().println("작성자: "+boardDto.getWriter());
			resp.getWriter().println(""+boardDto.getTitle());
			resp.getWriter().println(""+boardDto.getContent());

			
			// 페이지이동
			
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
	
}
