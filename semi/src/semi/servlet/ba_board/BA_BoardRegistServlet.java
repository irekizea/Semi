package semi.servlet.ba_board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import semi.beans.board.BA_Board.BA_BoardDao;
import semi.beans.board.BA_Board.BA_BoardDto;
import semi.beans.board.BA_Board.BA_FileDao;
import semi.beans.board.BA_Board.BA_FileDto;
@WebServlet(urlPatterns = "/ba_board/regist.do")
public class BA_BoardRegistServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			MultipartRequest mRequest = new MultipartRequest(req, "D:/upload/kh21/board", 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());

			BA_BoardDto dto = new BA_BoardDto();
			BA_BoardDao dao = new BA_BoardDao();
			
			String title=mRequest.getParameter("title");
			String content=mRequest.getParameter("content");
			
			dto.setTitle(title);
			dto.setContent(content);
			
			String id=(String)req.getSession().getAttribute("id");
			dto.setWriter(id);
			
			int no=Integer.parseInt(mRequest.getParameter("no"));
			dto.setBoard_no(no);
			
			dao.regist(dto);
			
			//파일 전송
			BA_FileDto bfdto=new BA_FileDto();
			BA_FileDao bfdao=new BA_FileDao();
			List<BA_FileDto> list = bfdao.getList(no);
			
			System.out.println(bfdao.get(no));
			
			resp.sendRedirect("list.jsp");
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
	

}
