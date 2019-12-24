package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter
public class MemberBlockFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req= (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		String id = (String) session.getAttribute("id");
		String ip = request.getRemoteAddr();
		
		if(true) {
			chain.doFilter(request, response);
			
		}
		else {
			HttpServletResponse resp=(HttpServletResponse) response;
			resp.sendError(403);
		}
		
	}
	
}
