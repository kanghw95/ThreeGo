package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.dao.UserDao;
import user.model.vo.User;

/**
 * Servlet implementation class SearchUser
 */
@WebServlet("/searchUser")
public class SearchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchUser() {
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
		try {
			UserDao sv = new UserDao();

			int userNo = Integer.parseInt(request.getParameter("userNo"));
			System.out.println(userNo);
			User result = sv.selectUser(userNo);

			if (result != null) {
				String id = result.getUserId();
				String name = result.getUserName();
				int age = result.getUserAge();
				int no = result.getUserNo();
				request.setAttribute("result", result);
				request.setAttribute("id", id);
				request.setAttribute("name", name);
				request.setAttribute("age", age);
				request.setAttribute("no", no);
				request.getRequestDispatcher("/view/searchSuccess.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/view/searchFail.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
