package threego.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.dao.ParkingDao;
import threego.model.service.ParkingService;
import threego.model.vo.User;

/**
 * Servlet implementation class SearchUserCtrl
 */
@WebServlet("/p_searchuser.do")
public class SearchUserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchUserCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("searchuser");
		
		ArrayList<User> searchlist = new ParkingService().selectSearch("user_name", search);
		
		if (searchlist != null && !searchlist.isEmpty()) {
			System.out.println("조회 성공");
			request.setAttribute("list",searchlist);
			request.getRequestDispatcher("WEB-INF/view/user/UserAllView.jsp").forward(request, response);
		} else {
			System.out.println("조회 실패");
			request.getRequestDispatcher("WEB-INF/view/user/UserAllView.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
