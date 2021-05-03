package threego.model.admin;

import java.sql.Connection;
import java.util.List;

import common.JDBCTemplate;
import threego.model.vo.User;

public class AdminService {
	public int insert(Admin vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().insert(conn, vo);
		JDBCTemplate.close(conn);
		return result;
	}
	public List<User> list() {
		Connection conn = JDBCTemplate.getConnection();
		List<User> list = new AdminDAO().list(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public List<User> getUserByPage( int start, int end, String search) {
		Connection conn = JDBCTemplate.getConnection();
		List<User> list = new AdminDAO().getUserByPage(conn,start,end,search);
		JDBCTemplate.close(conn);
		return list;
	}
	public int getUserCount(String search) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().getUserCount(conn, search);
		JDBCTemplate.close(conn);
		return result;
	}
	public int userStop(User vo) {
		System.out.println("4-1");
		Connection conn = JDBCTemplate.getConnection();
		System.out.println("4-2");
		int result = new AdminDAO().userStop(conn, vo);
		System.out.println("4-3");
		JDBCTemplate.close(conn);
		return result;		
	}
}
