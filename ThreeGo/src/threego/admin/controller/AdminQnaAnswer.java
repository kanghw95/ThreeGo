package threego.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.AdminService;
import threego.admin.QNA;
import threego.admin.QNA_USER;

/**
 * Servlet implementation class AdminQnaRead
 */
@WebServlet("/adminqnaanswer")
public class AdminQnaAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaAnswer() {
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
		String qna_no = request.getParameter("no");
		System.out.println(qna_no);
		String qna_subject = request.getParameter("sub");
		String qna_content = request.getParameter("con");
		String a_content = request.getParameter("a_con");
		String nickname = request.getParameter("nickname");
		String admin_number = request.getParameter("a_num");
		String notify = request.getParameter("notify");
		
		if(qna_no !=null) {
			request.setAttribute("qna_no", Integer.parseInt(qna_no));
		}
		request.setAttribute("notify", notify);
		request.setAttribute("qna_subject", qna_subject);
		request.setAttribute("qna_content", qna_content);
		request.setAttribute("a_content", a_content);
		request.setAttribute("nickname", nickname);
		if(admin_number != null) {
		request.setAttribute("admin_number", Integer.parseInt(admin_number));
		}
		AdminService sv = new AdminService();
		List<QNA_USER> list2 = null;
		list2 = sv.getQnaInf();
		request.setAttribute("list2", list2);		

		
//		response.sendRedirect("admin/adminqnaanswer");
//		request.getRequestDispatcher("/admin/adminqnaanswer").forward(request, response);
		request.getRequestDispatcher("WEB-INF/view/admin/admin_qna_answer.jsp").forward(request, response);
		
		
	
	}

}
