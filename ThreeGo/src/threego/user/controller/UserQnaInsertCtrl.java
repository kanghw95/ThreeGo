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
 * Servlet implementation class UserQnaInsertCtrl
 */
@WebServlet("/userqnainsert")
public class UserQnaInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserQnaInsertCtrl() {
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
		String user_no = request.getParameter("user_no");
		System.out.println("유저넘버"+user_no);
		String qna_subject = request.getParameter("qna_subject");
		String qna_content = request.getParameter("qna_content");
		String qna_kind = request.getParameter("select");
		String qna_pwd = request.getParameter("pwd");
		
		QNA vo = new QNA();
		AdminService sv = new AdminService();
		
		vo.setUser_no(Integer.parseInt(user_no));
		vo.setQna_subject(qna_subject);
		vo.setQna_content(qna_content);
		vo.setQna_kind(qna_kind);
		vo.setQna_pwd(qna_pwd);
		
		sv.QNAInsert(vo);
		
		request.getRequestDispatcher("/userqna?user=user").forward(request, response);
	}

}
