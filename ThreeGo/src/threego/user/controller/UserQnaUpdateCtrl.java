package threego.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.AdminService;
import threego.admin.QNA;

/**
 * Servlet implementation class UserQnaUpdateCtrl
 */
@WebServlet("/userqnaupdate")
public class UserQnaUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserQnaUpdateCtrl() {
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
		String qna_no = request.getParameter("no");
		String qna_subject = request.getParameter("sub");
		String qna_content = request.getParameter("con");
		String qna_kind = request.getParameter("select");
		System.out.println("qna_kind"+qna_kind);
		
		QNA vo = new QNA();
		vo.setQna_content(qna_content);
		vo.setQna_kind(qna_kind);
		vo.setQna_no(Integer.parseInt(qna_no));
		vo.setQna_subject(qna_subject);
		
		AdminService sv= new AdminService();
		sv.QNAUpdate(vo);
		request.getRequestDispatcher("/userqna?user=user").forward(request, response);
		
	}

}
