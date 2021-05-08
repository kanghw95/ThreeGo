package threego.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.UserService;
import threego.model.vo.User;

/**
 * Servlet implementation class ParkingSelectAllUserCtrl
 */
@WebServlet("/selectalluser")
public class SelectAllUserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectAllUserCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArrayList<User> list = new UserService().selectAll();
		if (list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/view/user/UserAllView.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("WEB-INF/view/user/UserAllView.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
