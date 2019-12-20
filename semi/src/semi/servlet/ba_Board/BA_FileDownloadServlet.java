package semi.servlet.ba_Board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import semi.beans.board.BA_Board.BA_FileDao;
import semi.beans.board.BA_Board.BA_FileDto;
@WebServlet(urlPatterns = "/ba_board/download.do")
public class BA_FileDownloadServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		int no=Integer.parseInt(req.getParameter("no"));
		
		BA_FileDao fdao=new BA_FileDao();
		BA_FileDto fdto=fdao.get(no);
		
		String path="D:/upload/kh21/ba_board";
		
		File target=new File(path,fdto.getSavename());
		byte[] data=FileUtils.readFileToByteArray(target);
		
		if(!target.exists()) {
			target.mkdir();//폴더 생성
			System.out.println("생성완료");
		}
		else {
			System.out.println("이미 폴더 있음");
		}	
		resp.setHeader("Content-Type", "application/octet-srtream; charset=UTF-8");
		resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(fdto.getUploadname(),"UTF-8")+"\"");
		resp.setHeader("Content-Length", String.valueOf(fdto.getFilesize()));
		
		resp.getOutputStream().write(data);	
		} catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}