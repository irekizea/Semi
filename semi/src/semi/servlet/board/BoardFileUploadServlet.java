package semi.servlet.board;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.beans.ba_board.BA_FileDao;
import semi.beans.ba_board.BA_FileDto;

@WebServlet(urlPatterns = "/board/fileupload.do")
public class BoardFileUploadServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파일만 받아서 저장하는 코드
		//[1] fname이라는 이름의 파일을 받는다
		try {
		MultipartRequest mRequest = new MultipartRequest(req, "D:/upload/kh21", 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		System.out.println(mRequest.getParameter("no"));
		
		//[2] 파일을 원하는 위치에 저장하고 DB에도 정보를 남긴다
		File file = mRequest.getFile("fname");
		String no=mRequest.getParameter("no");
		BA_FileDao boardfiledao = new BA_FileDao();
		BA_FileDto boardfiledto = new BA_FileDto();
		boardfiledto.setUploadname(mRequest.getOriginalFileName("fname"));
		boardfiledto.setSavename(mRequest.getFilesystemName("fname"));
		boardfiledto.setFiletype(mRequest.getContentType("fname"));
		boardfiledto.setFilesize(file.length());
		boardfiledto.setTitle_key(no);
		
		//fileseq : 등록된 파일의 식별번호
		int fileseq = boardfiledao.curval();
		boardfiledto.setNo(fileseq);
		boardfiledao.board_fileInsert(boardfiledto);
		
		//[3] 파일을 다운로드 하기 위한 주소를 알아낸다
		//[4] resp를 이용하여 주소를 사용자에게 쏜다
		
		//저장된 후 이 파일을 가져갈 수 있는 주소를 작성(다운로드 주소)
		resp.getWriter().println(req.getContextPath()+"/ba_board/download.do?no="+fileseq);
		
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
