package threego.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.AdminService;
import threego.admin.QNA;

/**
 * Servlet implementation class AdminQnaAnswerUpdate
 */
@WebServlet("/answerupdate")
public class AdminAnswerUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAnswerUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String answer = request.getParameter("answer");
		String qnano = request.getParameter("qnano");
		AdminService sv = new AdminService();
		QNA vo = new QNA();
		vo.setA_content(answer);
		vo.setQna_no(Integer.parseInt(qnano));
		int result = 0;
		result = sv.qnaAnswerUpdate(vo);
		System.out.println(result);
		if (result != 0) {
			request.getRequestDispatcher("/userqna").forward(request, response);
		}
	}

}
