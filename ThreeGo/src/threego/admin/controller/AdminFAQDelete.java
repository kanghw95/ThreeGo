package threego.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.AdminService;

/**
 * Servlet implementation class AdminFAQDelete
 */
@WebServlet("/adminfaqdelete")
public class AdminFAQDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQDelete() {
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
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String faq_no = request.getParameter("no");
		System.out.println(faq_no);
		AdminService sv= new AdminService();
		int result = 0;
		result = sv.FQAdelete(Integer.parseInt(faq_no));
		
		if(result != 0) {
			if(Integer.parseInt(faq_no)<1000) {
				request.getRequestDispatcher("/userqna").forward(request, response);
			}else {
				request.getRequestDispatcher("/adminnotify").forward(request, response);
			}
		}
		
		
	}

}
