package common.jdbc;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;




public class JDBCConectionPool {
	public static Connection getConnection() {
		Connection conn = null;
		Properties prop = new Properties();
		String currentPath = JDBCConectionPool.class.getResource("./").getPath(); // 현재 이 클래스가 있는 경로를 알기
		System.out.println(JDBCConectionPool.class.getResource("./"));
		System.out.println(currentPath);
		try {
			prop.load(new BufferedReader(new FileReader(currentPath + "driver.properties")));

			Class.forName(prop.getProperty("driver"));
			conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"),
					prop.getProperty("pwd"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
