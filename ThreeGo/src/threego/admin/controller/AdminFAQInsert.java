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
 * Servlet implementation class AdminFAQInsert
 */
@WebServlet("/adminfaqinsert")
public class AdminFAQInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQInsert() {
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
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String faq_subject = request.getParameter("faq_subject");
		String faq_content = request.getParameter("faq_content");
		String faq_notify = request.getParameter("faq_notify");
		int result = 0;
		FAQ vo = new FAQ(); 
		AdminService sv = new AdminService();
		vo.setFaq_no(Integer.parseInt(faq_notify));
		vo.setFaq_subject(faq_subject);
		vo.setFaq_content(faq_content);
		result = sv.FQAInsert(vo);
		if(result != 0) {
			if(Integer.parseInt(faq_notify)<100) {
				request.getRequestDispatcher("/userqna").forward(request, response);
			}else {
				request.getRequestDispatcher("/adminnotify").forward(request, response);
			}
		}
		
		
	}

}
