package threego.admin;

import java.sql.Connection;
import java.util.List;

import common.JDBCTemplate;
import threego.model.vo.User;

public class AdminService {

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
	public int userStart( User vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().userStart(conn, vo);
		JDBCTemplate.close(conn);
		return result;	
	}
	public List<User> selectUser( int no) {
		Connection conn = JDBCTemplate.getConnection();
		List<User> list = new AdminDAO().selectUser(conn,no);
		JDBCTemplate.close(conn);
		return list;
	}
	public List<QNA> getQNAByPage(int start, int end, String search) {
		Connection conn = JDBCTemplate.getConnection();
		List<QNA> list = new AdminDAO().getQNAByPage(conn,start,end,search);
		JDBCTemplate.close(conn);
		return list;
	}
	public int getQNACount( String search) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().getQNACount(conn, search);
		JDBCTemplate.close(conn);
		return result;
	}
	public int qnaAnswerUpdate(QNA vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().qnaAnswerUpdate(conn, vo);
		JDBCTemplate.close(conn);
		return result;
	}
	public List<QNA_USER> getQnaInf() {
		Connection conn = JDBCTemplate.getConnection();
		List<QNA_USER> list = new AdminDAO().getQnaInf(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public List<FAQ> getFAQByPage() {
		Connection conn = JDBCTemplate.getConnection();
		List<FAQ> list = new AdminDAO().getFAQByPage(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public int FQAUpdate( FAQ vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().FQAUpdate(conn, vo);
		JDBCTemplate.close(conn);
		return result;		
	}
	public int FQAInsert( FAQ vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().FQAInsert(conn, vo);
		JDBCTemplate.close(conn);
		return result;		
	}
	public int FQAdelete( int no) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().FQAdelete(conn, no);
		JDBCTemplate.close(conn);
		return result;		
	}
	public List<FAQ> getNotifyByPage(int start,int end, String search) {
		Connection conn = JDBCTemplate.getConnection();
		List<FAQ> list = new AdminDAO().getNotifyByPage(conn,start,end,search);
		JDBCTemplate.close(conn);
		return list;	
	}
	public int getNotifyCount(String search) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().getNotifyCount(conn, search);
		JDBCTemplate.close(conn);
		return result;		
	}
	public int QNAInsert( QNA vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().QNAInsert(conn, vo);
		JDBCTemplate.close(conn);
		return result;
	}
	public int QNAUpdate( QNA vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().QNAUpdate(conn, vo);
		JDBCTemplate.close(conn);
		return result;
	}
	public Admin adminlogin( Admin vo) {
		Connection conn = JDBCTemplate.getConnection();
		Admin result = new AdminDAO().adminlogin(conn, vo);
		JDBCTemplate.close(conn);
		return result;
	}
	public List<Report> getPeportByPage(int start, int end, String type) {
		Connection conn = JDBCTemplate.getConnection();
		List<Report> list = new AdminDAO().getPeportByPage(conn, start,end, type);
		JDBCTemplate.close(conn);
		return list;
	}
	public int getReportCount( String type) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDAO().getReportCount(conn, type);
		JDBCTemplate.close(conn);
		return result;
	}

}
