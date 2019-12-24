package semi.servlet.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.beans.ba_board.BA_FileDao;
import semi.beans.ba_board.BA_FileDto;
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

//		TestInert 메인게시글 상세글 입력
			req.setCharacterEncoding("UTF-8");
			
			
			int board_no = Integer.parseInt(mRequest.getParameter("board_no"));	
			String keyword = mRequest.getParameter("keyword");
			String writer = (String)req.getSession().getAttribute("id");
			String ip_addr = req.getRemoteAddr();
			
			BoardTextDto boardTextDto = new BoardTextDto();
			boardTextDto.setBoard_no(board_no);
			boardTextDto.setWriter(writer);
			boardTextDto.setSub_title(mRequest.getParameter("sub_title"));
			boardTextDto.setText_content(mRequest.getParameter("text_content"));
			boardTextDto.setIp_addr(ip_addr);
			
			BoardTextDao boardTextDao = new BoardTextDao();
			boardTextDao.textInsert(boardTextDto);
			
//		파일등록(승인 대기에서 넘어온 처음)
//			int no = boardTextDao.getSequence();

			File file = mRequest.getFile("file");
			
			if(file != null) {	// 파일이 있다면
				if(boardTextDto.getText_content()==null) {		// board_Text의 Text_content가 null이면 넘어오는 파일

					BA_FileDto boardFileDto = new BA_FileDto();
					boardFileDto.setUploadname(mRequest.getOriginalFileName("file"));
					boardFileDto.setSavename(mRequest.getFilesystemName("file"));
					boardFileDto.setFiletype(mRequest.getContentType("file"));
					boardFileDto.setFilesize(file.length());
					boardFileDto.setTitle_key(keyword);
					
					BA_FileDao boardFileDao = new BA_FileDao();
					boardFileDao.board_fileInsert(boardFileDto);
					}
				else {										// board_Text의 Text_content가 null이 아니면 추가 등록

					BoardTextDto textFileDto = new BoardTextDto();

//					textFileDto.setText_no(no);
					System.out.println(textFileDto.getText_no()+"textno");
					textFileDto.setUploadname(mRequest.getOriginalFileName("file"));
					textFileDto.setSavename(mRequest.getFilesystemName("file"));
					textFileDto.setFiletype(mRequest.getContentType("file"));
					textFileDto.setFilesize(file.length());
					
					System.out.println(boardTextDto.getNo()+"no"+mRequest.getContentType("file")+"type");
					
					BoardTextDao textFileDao = new BoardTextDao();
					textFileDao.textFile(textFileDto);
				}
			}
			
			resp.sendRedirect(req.getContextPath()+"/board/searchResult.jsp?keyword="+URLEncoder.encode(keyword, "UTF-8")+"&board_no="+board_no);
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
