package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

//개발용 관리자 로그인 필터
public class TestAdminFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//목표:세션에 id=admin, grade=관리자를 추가하는 거(관리자 로그인)
		HttpServletRequest req=(HttpServletRequest)request;
		req.getSession().setAttribute("id", "admin");
		req.getSession().setAttribute("grade", "관리자");
		
		chain.doFilter(request, response);
		
	}
	

}
