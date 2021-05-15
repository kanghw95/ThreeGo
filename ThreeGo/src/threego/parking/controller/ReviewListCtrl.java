/*
 * package threego.parking.controller;
 * 
 * import java.io.IOException; import java.util.ArrayList;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import threego.model.service.ReviewService; import threego.model.vo.Review;
 * 
 * 
 * 
 *//**
	 * Servlet implementation class ReviewListCtrl
	 */
/*
 * @WebServlet("/reviewlist") public class ReviewListCtrl extends HttpServlet {
 * private static final long serialVersionUID = 1L;
 * 
 *//**
	 * @see HttpServlet#HttpServlet()
	 */
/*
 * public ReviewListCtrl() { super(); }
 * 
 *//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
/*
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * 
 * 
 * ArrayList<Review> list = new
 * ReviewService().getSelectedReview("parking_code", int); int parking =
 * Integer.parseInt(request.getParameter("parking_code"));
 * 
 * System.out.println(parking);
 * 
 * ArrayList<Review> list = new ReviewService().getReviewAll(parking);
 * 
 * 
 * if (list != null) { request.setAttribute("list", list);
 * request.getRequestDispatcher("WEB-INF/view/review/review.jsp").forward(
 * request, response); } else {
 * request.getRequestDispatcher("WEB-INF/view/review/review.jsp").forward(
 * request, response); }
 * 
 * }
 * 
 * 
 *//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { // TODO Auto-generated
		 * method stub doGet(request, response); }
		 * 
		 * }
		 */