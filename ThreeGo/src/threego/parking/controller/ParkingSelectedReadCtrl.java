package threego.parking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.ParkingService;
import threego.model.vo.Parking;
import threego.model.vo.User;

/**
 * Servlet implementation class ParkingSelectedReadCtrl
 */
@WebServlet("/ParkingSelectedRead")
public class ParkingSelectedReadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParkingSelectedReadCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("searchpark");
		System.out.println(search);
			ArrayList<Parking> searchlist = new ParkingService().p_selectSearch("parking_name", search);
		
		      if (searchlist != null) {
		          System.out.println("조회 성공");
		          System.out.println("파킹셀렉트리드컨트롤러" + searchlist);
		          request.setAttribute("listpark",searchlist);
		          request.getRequestDispatcher("WEB-INF/main/review_main/list.jsp").forward(request, response);
		       } else {
		          System.out.println("조회 실패");
		          request.getRequestDispatcher("WEB-INF/main/review_main/list.jsp").forward(request, response);
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
