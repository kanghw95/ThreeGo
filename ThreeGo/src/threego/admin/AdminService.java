package threego.admin;

import java.sql.Connection;
import java.util.List;

import common.JDBCTemplate;
import threego.vo.User;

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
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().userStop(conn, vo);
		JDBCTemplate.close(conn);
		return result;		
	}
	public List<UserQNA> getQNAByPage(int start, int end, String search) {
		Connection conn = JDBCTemplate.getConnection();
		List<UserQNA> list = new AdminDAO().getQNAByPage(conn,start,end,search);
		JDBCTemplate.close(conn);
		return list;
	}
	public int getQNACount( String search) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().getQNACount(conn, search);
		JDBCTemplate.close(conn);
		return result;
	}
}
