package threego.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.dao.ReviewDAO;
import threego.model.vo.Review;

public class ReviewService {
	public ArrayList<Review> getReviewAll(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDAO().getReviewAll(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public List<Review> getSelectedReview(Review rev){
		Connection conn = JDBCTemplate.getConnection();
		List<Review> list = new ReviewDAO().selectedReview(conn,rev);
		JDBCTemplate.close(conn);
		return list;
	}
	public int insertReview(String parking_code, String user_no, String grade, String review_content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDAO().insertReview(conn, parking_code, user_no, grade, review_content);
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteReview(String parking_code, String user_no, String grade, String review_content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDAO().deleteReview(conn, parking_code, user_no, grade, review_content);
		JDBCTemplate.close(conn);
		return result;
	}
	
}
