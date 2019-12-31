package semi.servlet.board;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.block.mem.BlockMemberDao;
import semi.beans.block.mem.BlockMemberDto;
import semi.beans.board.BoardReplyDao;
import semi.beans.board.BoardReplyDto;

@WebServlet(urlPatterns="/board/replyInsert.do")
public class BoardReplyInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
		
			String board_title = req.getParameter("board_title");

			String writer = (String)req.getSession().getAttribute("id");
			String ip_addr = req.getRemoteAddr();
			String content = req.getParameter("content");
			
			BlockMemberDao dao = new BlockMemberDao();
			List<BlockMemberDto> list = dao.block();
			List<BlockMemberDto> list2= dao.blockIp();

			int count = 0;
			for(BlockMemberDto dato:list) {
				if(writer!=null) {
				if(writer.equals(dato.getB_id())){
					count+=1;

				}
				}
			}
			for(BlockMemberDto ipdto: list2) {
				if(writer==null) {
				if(ip_addr.equals(ipdto.getB_ip())) {
			
					count+=1;
		
				}
				}
			}
			
			if(count==0) {
				
	
			
			
			BoardReplyDto boardReplyDto = new BoardReplyDto();
			boardReplyDto.setBoard_title(board_title);
			boardReplyDto.setWriter(writer);
			boardReplyDto.setIp_addr(ip_addr);
			boardReplyDto.setContent(content);
			
			BoardReplyDao boardReplyDao = new BoardReplyDao();
			boardReplyDao.replyInsert(boardReplyDto);
			
			resp.sendRedirect(req.getContextPath()+"/board/searchResult.jsp?keyword="+URLEncoder.encode(board_title, "UTF-8"));
			}
			else {
				resp.sendError(403);
			}
		}
		catch(Exception e){
			resp.sendError(500);
		}
	}
}
