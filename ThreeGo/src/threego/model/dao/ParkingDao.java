package threego.model.dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import threego.model.vo.User;

public class ParkingDao {

	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	// SelectAll 회원 전부 조회
	public ArrayList<User> selectAll(Connection conn) {
		ArrayList<User> list = null;

		pstmt = null;
		rs = null;
		String sql = "select * from user_tb";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<User>();
				do {
					User vo = new User();
					vo.setUser_no(Integer.parseInt(rs.getString("user_no")));
					vo.setUser_id(rs.getString("user_id"));
					vo.setUser_pwd(rs.getString("user_pwd"));
					vo.setUser_name(rs.getString("user_name"));
					vo.setNickname(rs.getString("nickname"));
					vo.setAddress(rs.getString("address"));
					vo.setLast_login(rs.getTimestamp("last_login"));
					vo.setPhone(rs.getString("phone"));
					vo.setEmail(rs.getString("email"));
					vo.setGender(rs.getString("gender").charAt(0));
					vo.setBirth(rs.getDate("birth"));
					vo.setUser_authority(Integer.parseInt(rs.getString("user_authority")));
					list.add(vo);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	// Serach 회원 검색
	public ArrayList<User> selectSearch(Connection conn, String col, String str) {
		ArrayList<User> list = new ArrayList<User>();

		String sql = "select * from USER_TB where " + col + " like '%" + str +"%' ";
		
		pstmt = null;
		rs = null;

		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs != null) { // 결과가 1개이상 있다면
				if (rs.next()) {
					list = new ArrayList<User>();
					do {
						User vo = new User();
						vo.setUser_no(Integer.parseInt(rs.getString("user_no")));
						vo.setUser_id(rs.getString("user_id"));
						vo.setUser_pwd(rs.getString("user_pwd"));
						vo.setUser_name(rs.getString("user_name"));
						vo.setNickname(rs.getString("nickname"));
						vo.setAddress(rs.getString("address"));
						vo.setLast_login(rs.getTimestamp("last_login"));
						vo.setPhone(rs.getString("phone"));
						vo.setEmail(rs.getString("email"));
						vo.setGender(rs.getString("gender").charAt(0));
						vo.setBirth(rs.getDate("birth"));
						vo.setUser_authority(Integer.parseInt(rs.getString("user_authority")));
						list.add(vo);
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	
	// 아이디,닉네임 중복체크용
		public ArrayList<User> id_nickCheck(Connection conn, String col, String str) {
			ArrayList<User> list = new ArrayList<User>();

			String sql = "select * from USER_TB where " + col + " like ?";
			
			pstmt = null;
			rs = null;

			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, str);
				rs = pstmt.executeQuery();

				if (rs != null) { // 결과가 1개이상 있다면
					if (rs.next()) {
						list = new ArrayList<User>();
						do {
							User vo = new User();
							vo.setUser_id(rs.getString("user_id"));
							vo.setNickname(rs.getString("nickname"));
							list.add(vo);
						} while (rs.next());
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rs);
				JDBCTemplate.close(pstmt);
			}
			return list;
		}
	
}
