package user.model.dao;
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import user.model.vo.User;
public class UserDao {
	public User selectUser(int userNo) {

		Connection conn = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		User user = null;

		String query = "select * from user_tbl where user_no=?";

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "scott", "TIGER");

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {

				user = new User();

				user.setUserNo(rset.getInt("user_no"));

				user.setUserId(rset.getString("user_id"));

				user.setUserName(rset.getString("user_name"));

				user.setUserAge(rset.getInt("user_age"));

			}

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			try {

				rset.close();

				pstmt.close();

				conn.close();

			} catch (SQLException e) {

				e.printStackTrace();

			}

		}

		return user;

	}

}
