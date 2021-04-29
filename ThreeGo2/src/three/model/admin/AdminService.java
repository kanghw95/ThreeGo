package three.model.admin;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;

public class AdminService {
	public int insert(Admin vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().insert(conn, vo);
		JDBCTemplate.close(conn);
		return result;
	}
	public ArrayList<Admin> list() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Admin> list = new AdminDAO().list(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public List<Admin> getUserByPage( int start, int end, String search) {
		Connection conn = JDBCTemplate.getConnection();
		List<Admin> list = new AdminDAO().getUserByPage(conn,start,end,search);
		JDBCTemplate.close(conn);
		return list;
	}
	public int getUserCount(String search) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().getUserCount(conn, search);
		JDBCTemplate.close(conn);
		return result;
	}
}
