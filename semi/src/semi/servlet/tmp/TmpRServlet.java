package semi.servlet.tmp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.tm.TmpDao;
import semi.beans.tm.TmpDto;

@WebServlet
public class TmpRServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String content = req.getParameter("content");
			int Baorigin = Integer.parseInt(req.getParameter("Baorigin"));
			TmpDto dto = new TmpDto();
			dto.setBaorigin(Baorigin);
			dto.setRpcontent(content);
			
			if((String)req.getSession().getAttribute("id")!=null) {
				String id = (String)req.getSession().getAttribute("id");
				dto.setWriter(id);
			}else {
				String wip = (String)req.getSession().getAttribute("ip");
				dto.setWip(wip);
			}
			
			TmpDao dao = new TmpDao();
			dao.brwrite(dto);
			
			resp.sendRedirect("content.jsp?no="+Baorigin);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
