package semi.servlet.board;

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

@WebServlet(urlPatterns="/board/fileorigin.do")
public class BoardFileOriginServlet extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				String keyword = req.getParameter("keyword");
				
				BA_FileDao fileDao = new BA_FileDao();
				BA_FileDto fileDto = fileDao.get(keyword);
				
				File originFile = new File("D:/upload/kh21", fileDto.getSavename());
				byte[] originData = FileUtils.readFileToByteArray(originFile);
				
				resp.setHeader("Content-Type", "application/octet-srtream; charset=UTF-8");
				resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(fileDto.getUploadname(),"UTF-8")+"\"");
				resp.setHeader("Content-Length", String.valueOf(fileDto.getFilesize()));
				
				resp.getOutputStream().write(originData);
			}
			catch(Exception e){
				resp.sendError(500);
			}
		}
}
