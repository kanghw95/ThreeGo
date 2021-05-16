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
import threego.model.service.UserService;
import threego.model.vo.Review;
import threego.model.vo.User;



/**
 * Servlet implementation class ReviewListCtrl
 */
@WebServlet("/reviewdelete")
public class ReviewDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteCtrl() {
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
		int result = 0;
		String parking_code = request.getParameter("parking_code");
		String user_no = request.getParameter("user_no");
		String grade = request.getParameter("grade");
		String review_content = request.getParameter("review_content");
		
		Review rev = new Review();
		
		rev.setParking_code(Integer.parseInt(parking_code));
		rev.setUser_no(Integer.parseInt(user_no));
		rev.setGrade(Integer.parseInt(grade));
		rev.setS_contents(review_content);
		
		
		result = new ReviewService().deleteReview(parking_code,user_no,grade,review_content);
		
		if(result > 0) {
			request.getRequestDispatcher("WEB-INF/main/main.jsp").forward(request, response);
		}
		
		
	}

}
