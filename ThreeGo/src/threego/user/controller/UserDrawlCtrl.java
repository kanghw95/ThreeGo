package threego.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.UserService;
import threego.model.vo.User;

/**
 * Servlet implementation class UserDrawlCtrl
 */
@WebServlet("/userdrawl") // 회원탈퇴 서블릿
public class UserDrawlCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDrawlCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("paswwd");
		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(email);
		
		User vo = new User();
		
		vo.setUser_id(id);
		vo.setUser_pwd(pw);
		vo.setEmail(email);
		
		int userdel = new UserService().drawlUser(vo);
		System.out.println(userdel);
		if(userdel>0) {  
			out.println("<script>alert('회원탈퇴가 완료되었습니다.'); location.href='"+ request.getContextPath()+"/main"+"';</script>");
			request.getSession().removeAttribute("user");
			request.getSession().removeAttribute("username");
			out.flush();
			out.close();
		} else {  
			
	}
	}

}
