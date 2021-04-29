package three.model.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import three.model.admin.Admin;
import three.model.admin.AdminService;

/**
 * Servlet implementation class AdminCtrl
 */
@WebServlet("/adminctrl")
public class AdminCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCtrl() {
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
		Admin vo = new Admin();
		AdminService sv= new AdminService();

		//		inset 함수
//		int no = Integer.parseInt(request.getParameter("no"));
//		String name = request.getParameter("name");
//		String id = request.getParameter("id");
//		String passwd = request.getParameter("passwd");
//		
//		vo.setYh_no(no);
//		vo.setYh_name(name);
//		vo.setYh_id(id);
//		vo.setYh_passwd(passwd);
//		sv.insert(vo);
		ArrayList<Admin> list = sv.list();
		request.setAttribute("list", list);
		if(list==null) {
			System.out.println("비었음");
		}else{
			System.out.println("안비었음");
			System.out.println(list);
		}
		request.getRequestDispatcher("/view/admin_user.jsp").forward(request, response);
	}

}
