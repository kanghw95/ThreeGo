package first.member.model.service;

import static first.common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import first.member.model.dao.MemberDao;
import first.member.model.vo.Member;

public class MemberService {

	// selectAll()
	public ArrayList<Member> selectAll() {
		Connection conn = null;
		conn= getConnection();
		ArrayList<Member> list = new MemberDao().selectAll(conn);
		close(conn);
		return list;
	}
	public ArrayList<Member> selectSearch(String col, String str) {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectSearch(conn, col, str);
		close(conn);
		return list;
	}
	
	// insert()
	public int insert(Member vo) {
		int result = 0;
		int result2 = 0;
		Connection conn = getConnection();
		try {
			
			//commit rollback 테스트
//			conn.setAutoCommit(false);
			
			result = new MemberDao().insert(conn, vo);
//			result2 = new MemberDao().insert(conn, vo);
			
			
//			if(result > 0 && result2 >0) {
//				commit(conn);
//			} else {
//				rollback(conn);
//			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close(conn);
		return result;
	}
	
	// update()
	public int update(String col, Member vo) {
		int result = 0;
		Connection conn = getConnection();
	
		
		result = new MemberDao().update(conn, col, vo);
		close(conn);
		return result;
	}
	
	// delete()
	public int delete(String col, String str) {
		int result = 0;
		Connection conn = getConnection();
		result = new MemberDao().delete(conn, col, str);
		close(conn);
		return result;
	}
	
	// login()
	public Member login(Member vo) {
		Member result = null;
		Connection conn = getConnection();
		result = new MemberDao().login(conn, vo);
		close(conn);
		return result;
	}
}
