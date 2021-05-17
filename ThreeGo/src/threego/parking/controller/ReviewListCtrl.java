package threego.parking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.ReviewService;
import threego.model.vo.Review;



/**
 * Servlet implementation class ReviewListCtrl
 */
@WebServlet("/reviewlist")
public class ReviewListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListCtrl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("WEB-INF/main/main.jsp").forward(request, response);
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int parking = Integer.parseInt(request.getParameter("parking_code"));
		Review rev = new Review();
		rev.setParking_code(parking);
		
		List<Review> list = new ReviewService().getSelectedReview(rev);
		/*
		 * ArrayList<Review> list = new ReviewService().getReviewAll(parking);
		 */
		
		if (list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/main/review_main/reviewlist.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("WEB-INF/main/main.jsp").forward(request, response);
		}

	}

}
