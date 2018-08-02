package news.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entiy.News;
import com.DaoImpl.NewsDaoImpl;

public class lookfor extends HttpServlet {

	
	public lookfor() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String key = request.getParameter("key");
		NewsDaoImpl ndl = new NewsDaoImpl();
		List<News> list = ndl.getAnyNews(key);
		StringBuffer str = new StringBuffer();
		for(int i=0;i<list.size();i++){
			str=str.append(list.get(i).getTitle());
			if(i != list.size()-1){
				str=str.append("-");
			}
		}
		out.println(str);
		out.flush();
		out.close();
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
