package myBoard;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Test {
	private static DataSource ds = null;
	private static Connection conn = null;

	public static Connection getConnection() {
		try {
			Context initContext1 = new InitialContext();
			Context envContext1 = (Context) initContext1.lookup("java:/comp/env");
			ds = (DataSource) envContext1.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			if (conn == null) {
				System.out.println("******연결실패*****");
			} else {
			}
			System.out.println("******연결성공*****");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
