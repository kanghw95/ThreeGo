package threego.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.service.ParkingService;


/**
 * Servlet implementation class ParkingListCtrl
 */
@WebServlet("/parkinglist.do")
public class ParkingListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParkingListCtrl() {
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
	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final int pageSize = 5;
		
		ParkingService sv = new ParkingService();
		
		int cnt = 0;
		
		String search= request.getParameter("search");
		if(search != null && !search.equals("")) {
		}else {
			search = null;
		}
		}
}
