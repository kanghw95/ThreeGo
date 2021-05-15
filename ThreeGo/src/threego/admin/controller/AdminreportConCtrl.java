package threego.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminreportConCtrl
 */
@WebServlet("/adminreport")
public class AdminreportConCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminreportConCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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

	String bd_report_no = request.getParameter("bd_report_no");
	String bd_content_no = request.getParameter("bd_content_no");
	String reported = request.getParameter("reported");
	String bd_content = request.getParameter("bd_content");
	String reporter = request.getParameter("reporter");
	String report_content = request.getParameter("report_content");
	
	System.out.println(bd_report_no);
	System.out.println(bd_content_no);
	System.out.println(reported);
	System.out.println(bd_content);
	System.out.println(reporter);
	System.out.println(report_content);
	
	request.setAttribute("bd_report_no", bd_report_no);
	request.setAttribute("bd_content_no", bd_content_no);
	request.setAttribute("reported", reported);
	request.setAttribute("bd_content", bd_content);
	request.setAttribute("reporter", reporter);
	request.setAttribute("report_content", report_content);
	
	request.getRequestDispatcher("/WEB-INF/main/admin_main/adminreportcon.jsp").forward(request, response);
	
	}

}
