package threego.model.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.admin.AdminService;
import threego.model.vo.User;

/**
 * Servlet implementation class Adminstop
 */
@WebServlet("/adminstop")
public class AdminstopCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminstopCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	String sel = request.getParameter("select"); // 몇 일 정지 멕일지.
	int no = Integer.parseInt(request.getParameter("no1"));
		
	String nickname = request.getParameter("nickname");
	
//	int result=0;
//	User vo = new User();
//	AdminService sv = new AdminService();
//	vo.setNickname(nickname);
//	result = sv.userStop(vo);
//	
//	if(result != 0) {
//	request.setAttribute("list", result );
//	request.getRequestDispatcher("view/admin_user.jsp").forward(request, response);
//	}
	User vo = new User();
	AdminService sv = new AdminService();
	PrintWriter out = response.getWriter();
	if(nickname != null) {
		vo.setUser_no(no);
		vo.setNickname(nickname);
		sv.userStop(vo);
		out.println("<scrpit>alert('정지가 되었습니다')</script>");
		out.println("<script>history.back();</script>");
	}
	
	
	}

}
