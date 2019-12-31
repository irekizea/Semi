package semi.servlet.board;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.beans.block.mem.BlockMemberDao;
import semi.beans.block.mem.BlockMemberDto;
import semi.beans.board.BoardDto;
import semi.beans.board.BoardTextDao;
import semi.beans.board.BoardTextDto;

@WebServlet(urlPatterns="/board/textInsert.do")
public class BoardTextInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {		
// 		파일 등록 사전 설정
			String path="D:/upload/kh21";
			int max=10*1024*1024;
			String encoding="UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);

//		TextInert 메인게시글 상세글 입력
			req.setCharacterEncoding("UTF-8");
			
			int board_no = Integer.parseInt(mRequest.getParameter("board_no"));	
			String keyword = URLDecoder.decode(mRequest.getParameter("keyword"), "UTF-8");

		
	
			
			
			
			
			String writer = (String)req.getSession().getAttribute("id");
			String ip_addr = req.getRemoteAddr();
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
				
			
			BoardTextDto boardTextDto = new BoardTextDto();
			boardTextDto.setBoard_no(board_no);
			boardTextDto.setWriter(writer);
			boardTextDto.setSub_title(mRequest.getParameter("sub_title"));
			boardTextDto.setText_content(mRequest.getParameter("text_content"));
			boardTextDto.setIp_addr(ip_addr);
			
			BoardTextDao boardTextDao = new BoardTextDao();
			boardTextDao.textInsert(boardTextDto);
			
//		파일등록(목록 추가시)
			int no = boardTextDto.getNo();		// sub_title no

			File file = mRequest.getFile("file");
			
			if(file != null) {	// 파일이 있다면

			BoardTextDto textFileDto = new BoardTextDto();

			textFileDto.setText_no(no);

			textFileDto.setUploadname(mRequest.getOriginalFileName("file"));
			textFileDto.setSavename(mRequest.getFilesystemName("file"));
			textFileDto.setFiletype(mRequest.getContentType("file"));
			textFileDto.setFilesize(file.length());
										
			BoardTextDao textFileDao = new BoardTextDao();
			textFileDao.textFile(textFileDto);

			}
			
			resp.sendRedirect(req.getContextPath()+"/board/searchResult.jsp?keyword="+URLEncoder.encode(keyword, "UTF-8")+"&board_no="+board_no);
			}else {
				resp.sendError(403);
			}
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
