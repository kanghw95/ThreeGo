package threego.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminBoardCtrl
 */
@WebServlet("/adminboard")
public class AdminBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardCtrl() {
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
		// TODO Auto-generated method stub
		String boardmenu =request.getParameter("menu");
		System.out.println(boardmenu);
		if(boardmenu.equals("park")) {
			System.out.println("맞습니당.");
		}
		if(boardmenu.equals("sharing")) {
			System.out.println("맞습니당.");
		}
		if(boardmenu.equals("drive")) {
			System.out.println("맞습니당.");
		}
		if(boardmenu.equals("free")) {
			System.out.println("맞습니당.");
		}
		if(boardmenu.equals("proud")) {
			System.out.println("맞습니당.");
		}


	}

}
