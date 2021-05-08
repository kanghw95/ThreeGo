package threego.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.AdminService;
import threego.admin.FAQ;

/**
 * Servlet implementation class AdminFAQupdate
 */
@WebServlet("/adminfaqupdate")
public class AdminFAQUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQUpdate() {
        super();
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
		String faq_no =request.getParameter("no");
		String faq_content = request.getParameter("con");
		String faq_subject = request.getParameter("sub");
		
		int result =0;
		AdminService sv= new AdminService();
		FAQ vo = new FAQ();
		
		vo.setFaq_no(Integer.parseInt(faq_no));
		vo.setFaq_content(faq_content);
		vo.setFaq_subject(faq_subject);
		result=sv.FQAUpdate(vo);
		if(result !=0) {
			if(Integer.parseInt(faq_no)>1000) {
			request.getRequestDispatcher("/adminnotify").forward(request, response);
			}else {
			request.getRequestDispatcher("/userqna").forward(request, response);
			}
		}
	}

}
