package threego.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.vo.Review;

public class ReviewDAO {
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private void close() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public ArrayList<Review> selectedReview(Connection conn, String col, int num) {
		ArrayList<Review> list = null;
		String sql = "select * from simple_rv where " + col + " like ' + num + '";
		pstmt = null;
		stmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Review>();
			}do {
					Review vo = new Review();
					vo.setSimple_rv_no(rs.getInt("simple_rv_no"));
					vo.setUser_no(rs.getInt("user_no"));
					vo.setParking_code(rs.getInt("parking_code"));
					vo.setGrade(rs.getInt("grade"));
					vo.setS_contents(rs.getString("s_contents"));
					list.add(vo);
				} while (rs.next());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public ArrayList<Review> getReviewAll(Connection conn) {
		ArrayList<Review> list = null;
		String sql = "select * from simple_rv order by simple_rv_no desc";
		pstmt = null;
		stmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Review>();
				do {
					Review vo = new Review();
					vo.setSimple_rv_no(rs.getInt("simple_rv_no"));
					vo.setUser_no(rs.getInt("user_no"));
					vo.setParking_code(rs.getInt("parking_code"));
					vo.setGrade(rs.getInt("grade"));
					vo.setS_contents(rs.getString("s_contents"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int ReviewWrite(Connection conn, Review vo) {
		int result = 0;
		String sqlMaxNo = "select nvl(max(simple_sv_no), 0)+1 from simple_sv";
		String sql = "insert into simple_rv values(?, ?, ?, ?, ?)";
		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sqlMaxNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			} else {
				System.out.println("?");
				return 0;
			}
			close();
			{
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getSimple_rv_no());
				pstmt.setInt(2, vo.getParking_code());
				pstmt.setInt(3, vo.getUser_no());
				pstmt.setInt(4, vo.getGrade());
				pstmt.setString(5, vo.getS_contents());

				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;

	}

	

	public int update(Connection conn, Review vo) {
		int result = 0;
		String sql = "update simple_rv set s_contents = ?, grade = ?, where user_no = ?";
		pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getS_contents());
			pstmt.setInt(2, vo.getGrade());
			pstmt.setInt(3, vo.getUser_no());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int delete(Connection conn, Review vo) {
		int result = 0;
		String sql = "delete from simple_rv where user_no = ?";
		pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getUser_no());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
			}
		return result;
	}
	public int insertReview(Connection conn, String parking_code, String user_no, String grade, String review_content) {
		int result = 0;
		int max = 1;
		pstmt = null;
		rs = null;
		String sqlMaxUser_no = "select nvl(max(simple_rv_no),0)+1 from simple_rv";
		String sql = "insert into simple_rv values(?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sqlMaxUser_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				max = rs.getInt(1);
			} else {
				return 0;
			}

			{
				close();

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, max);
				pstmt.setInt(2, Integer.parseInt(parking_code));
				pstmt.setInt(3, Integer.parseInt(user_no));
				pstmt.setInt(4, Integer.parseInt(grade));
				pstmt.setString(5, review_content);

				result = pstmt.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	
}
