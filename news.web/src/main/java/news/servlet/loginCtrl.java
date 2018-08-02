package news.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DaoImpl.UserDaoImpl;

public class loginCtrl extends HttpServlet {

	public loginCtrl() {
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

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");             //请求获得输入的用户名
		String password = request.getParameter("password");		//获得输入的密码
		
		UserDaoImpl udl = new UserDaoImpl();
		String num;
		//执行方法返回boolean值为真则表示存在此用户
		boolean reg = udl.YesUser(name, password);
		//登录验证
		if(reg){
			if("zk".equals(name)){
				num = "1";
			}else{
				num = "2";
			}
			//登录成功时保存用户名信息
			request.getSession().setAttribute("login", name);
		}else{
			num = "3";
		}
		PrintWriter out = response.getWriter();
		out.print(num);
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
