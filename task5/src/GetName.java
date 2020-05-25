import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetName extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String str = request.getParameter("name");
        if(str.length()<=100){
            response.getOutputStream().println("Name is " + str);
        }
        else{
            response.getOutputStream().println("The name is too long");
        }
    }
}
