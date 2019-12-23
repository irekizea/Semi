package semi.servlet.ba_board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import semi.beans.ba_board.BA_FileDao;
import semi.beans.ba_board.BA_FileDto;

@WebServlet(urlPatterns = "/ba_board/download.do")
public class BA_FileDownloadServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		int no=Integer.parseInt(req.getParameter("no"));
		
		BA_FileDao fdao=new BA_FileDao();
		BA_FileDto fdto=fdao.get(no);
		
		File target=new File("D:/upload/kh21/ba_board",fdto.getSavename());
		byte[] data=FileUtils.readFileToByteArray(target);
		
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