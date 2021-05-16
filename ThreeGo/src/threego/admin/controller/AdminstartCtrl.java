package threego.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.AdminService;
import threego.model.vo.User;

/**
 * Servlet implementation class Adminstop
 */
@WebServlet("/adminstart")
public class AdminstartCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminstartCtrl() {
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
	System.out.println(no);
	String nickname = request.getParameter("nickname");
	System.out.println(nickname);
	User vo = new User();
	AdminService sv = new AdminService();
	PrintWriter out = response.getWriter();
	if(nickname != null) {
		vo.setUser_no(no);
		vo.setNickname(nickname);
		sv.userStart(vo);
		out.println("<scrpit>alert('정지가 풀렸습니다')</script>");
//		out.println("<script>history.back();</script>");
		request.getRequestDispatcher("/adminctrl").forward(request, response);
	}
	
	
	}

}
