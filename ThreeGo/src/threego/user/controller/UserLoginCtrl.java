package threego.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.Admin;
import threego.admin.AdminService;
import threego.model.service.UserService;
import threego.model.vo.User;

/**
 * Servlet implementation class UserLoginCtrl
 */
@WebServlet("/userlogin")
public class UserLoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		PrintWriter out = response.getWriter();
		String admin_id=request.getParameter("id");
		String admin_pwd = request.getParameter("passwd");
		
		User vo = new User();
		vo.setUser_id(id);
		vo.setUser_pwd(passwd);
		
		User resultVo = new User();
		resultVo = new UserService().login(vo);
		
		Admin adminvo= new Admin();
		adminvo.setAdmin_id(admin_id);
		
		Admin adminResult = new Admin();
		adminResult = new AdminService().adminlogin(adminvo);
		
		if(adminResult !=null) {
			if(admin_pwd.equals(adminResult.getAdmin_pwd())) {
				request.getSession().setAttribute("admin", adminResult);
				response.sendRedirect(request.getContextPath() + "/admin/adminmain");
			} else {
				out.println("<script>alert('비밀번호가 맞지 않습니다.');</script>");
				out.println("<script>history.back();</script>");
				out.flush();
				out.close();
			}
			
		}else {
			if (resultVo == null) {
				out.println("<script>alert('아이디가 없습니다. 회원가입을 해주세요');</script>");
				out.println("<script>history.back();</script>");
				out.flush();
				out.close();
			} else if (passwd.equals(resultVo.getUser_pwd())) {
				request.getSession().setAttribute("msg", id+"님 접속을 환영합니다.");
				request.getSession().setAttribute("user", resultVo);
				request.getSession().setAttribute("username", resultVo.getUser_name());
				response.sendRedirect(request.getContextPath() + "/main");
			} else {
				out.println("<script>alert('비밀번호가 맞지 않습니다.');</script>");
				out.println("<script>history.back();</script>");
				out.flush();
				out.close();
			}
		}
	}

}
