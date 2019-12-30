package semi.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.beans.block.mem.BlockMemberDao;
import semi.beans.block.mem.BlockMemberDto;

@WebFilter
public class BlockFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse resp= (HttpServletResponse) response;
		try {	
			HttpServletRequest req= (HttpServletRequest) request;
			HttpSession session = req.getSession();
		
			
			System.out.println("a");
			String id = (String) session.getAttribute("id");
			String ip = request.getRemoteAddr();
			BlockMemberDao dao = new BlockMemberDao();

			int count = 0;
			
				List<BlockMemberDto> list = dao.block();
				List<BlockMemberDto> list2= dao.blockIp();
				System.out.println("b");
				for(BlockMemberDto dato:list) {
					System.out.println("c");
					if(id!=null) {
					if(id.equals(dato.getB_id())){
						count+=1;
						System.out.println("1 오류");
					}
					}
				}
				for(BlockMemberDto ipdto: list2) {
					System.out.println("d");
					if(id==null) {
					if(ip.equals(ipdto.getB_ip())) {
						System.out.println("e");
						count+=1;
						System.out.println("2오류");
					}
					}
				}
				
				if(count>0) {
					System.out.println(count+"1");
					throw new Exception();
					
				}else {
					System.out.println(count+"2");
					chain.doFilter(request, response);	
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				resp.sendError(403);
			}
		
	}
	

}
