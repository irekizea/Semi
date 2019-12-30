package semi.servlet.ba_board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.beans.ba_board.BA_BoardDao;
import semi.beans.ba_board.BA_BoardDto;
import semi.beans.ba_board.BA_FileDao;
import semi.beans.ba_board.BA_FileDto;

@WebServlet(urlPatterns = "/ba_board/write.do")
public class BA_BoardWriteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		
		String path="D:/upload";
		File Folder=new File(path);
		
		String path21="D:/upload/kh21";
		File Folder21=new File(path21);
		
		
		if(!Folder.exists()||!Folder21.exists()) {
			Folder.mkdir();
			Folder21.mkdir();
			
			System.out.println("생성 완료");
		}else {
			System.out.println("이미 있습니다");
		}
			
		MultipartRequest mRequest = new MultipartRequest(req, path21, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		BA_BoardDto dto = new BA_BoardDto();
		BA_BoardDao dao = new BA_BoardDao();
		
		String title=mRequest.getParameter("title");
		String content=mRequest.getParameter("content");
				
		dto.setTitle(title);
		dto.setContent(content);
		
		String id=(String)req.getSession().getAttribute("id");
//		String id=mRequest.getParameter("id");
		dto.setWriter(id);
		
		int no=dao.getSequense();
		dto.setBoard_no(no);

		dao.write(dto);
		
		//파일 등록
		File file=mRequest.getFile("file");
		if(file != null) {
			BA_FileDto fdto = new BA_FileDto();
			fdto.setOrigin(no);
			fdto.setUploadname(mRequest.getOriginalFileName("file"));
			fdto.setSavename(mRequest.getFilesystemName("file"));
			fdto.setFiletype(mRequest.getContentType("file"));
			fdto.setFilesize(file.length());
			fdto.setTitle_key(title);
			
			BA_FileDao fdao = new BA_FileDao();
			fdao.fileInsert(fdto);
		}
		
		resp.sendRedirect("content.jsp?no="+no);
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
	

}
