import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Filter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        double start = System.currentTimeMillis();
        chain.doFilter(request, response);
        double end = System.currentTimeMillis();

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getRequestURI();
        String method = httpRequest.getMethod();
        System.out.println(String.format("%s - %s -  %d ms", method, path, end - start));
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
