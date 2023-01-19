package staff;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StaffFilter implements Filter {
	
	private List<String> excludedUrlList;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String excludedUrls = filterConfig.getInitParameter("excludedUrls");
		excludedUrlList = Arrays.asList(excludedUrls.split(","));
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		if (!excludedUrlList.contains(req.getServletPath())) {
			if (req.getSession().getAttribute("loginInfo") != null) {
				chain.doFilter(request, response);
			} else res.sendRedirect("login.st");
		} else chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}

}
