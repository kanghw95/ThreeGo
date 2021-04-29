package common.jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCConectionPool {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context i1 = new InitialContext();
			Context i2 = (Context) i1.lookup("java:/comp/env"); // web.xml
			DataSource ds = (DataSource) i2.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			if (conn == null) {
				System.out.println("*************연결실패*************");
			} else {
				System.out.println("!!!!!!!!! 연결성공 !!!!!!!!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void colse(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
