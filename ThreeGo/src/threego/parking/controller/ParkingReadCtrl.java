package threego.parking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.ParkingService;
import threego.model.vo.Parking;

/**
 * Servlet implementation class ParkingReadCtrl
 */
@WebServlet("/parkingRead")
public class ParkingReadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParkingReadCtrl() {
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
		ParkingService sv =new ParkingService();
		
		Parking vo = new Parking();
		List<Parking> list = null;
		if(vo!=null) {
			list = sv.getParkingRead();
			System.out.println(list);
			if(list != null) {
				request.setAttribute("parkingcontent", list);
				request.getRequestDispatcher("WEB-INF/main/main.jsp").forward(request, response);
			} else {
				System.out.println("vo가 널입니다.");
			}
		}
		
	}

}