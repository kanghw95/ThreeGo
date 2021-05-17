package threego.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import threego.model.dao.UserDAO;
import threego.model.vo.User;

public class UserService {
	// 전체 회원 조회
	public ArrayList<User> selectAll() {
		Connection conn = null;
		conn = getConnection();
		ArrayList<User> list = new UserDAO().selectAll(conn);
		close(conn);
		return list;
	}

	// 회원 검색
	public ArrayList<User> selectSearch(String col, String str) {
		Connection conn = getConnection();
		ArrayList<User> list = new UserDAO().selectSearch(conn, col, str);
		close(conn);
		return list;
	}
	
	   //회원 탈퇴 검증
	   public int drawlSearch(String str) {
	      Connection conn = getConnection();
	      int list = new UserDAO().drawlSearch(conn, str);
	      close(conn);
	      return list;
	   }

	// 아이디 찾기 검증용
	public ArrayList<User> selectUser(String col,String col2, String str, String str2) {
		Connection conn = getConnection();
		ArrayList<User> list = new UserDAO().selectUser(conn, col, col2, str, str2);
		close(conn);
		return list;
	}
	
	// 비밀번호 찾기, 회원탈퇴 검증용
	public ArrayList<User> selectUser(String col,String col2,String col3, String str, String str2, String str3) {
		Connection conn = getConnection();
		ArrayList<User> list = new UserDAO().selectUser(conn, col, col2, col3, str, str2, str3);
		close(conn);
		return list;
	}
	
	public int drawlUser(User vo) {
		Connection conn = getConnection();
		int list = new UserDAO().drawlUser(conn, vo);
		close(conn);
		return list;
	}

	// 회원가입
	public int userinsert(User vo) {
		int result = 0;
		Connection conn = getConnection();
		result = new UserDAO().userinsert(conn, vo);
		close(conn);
		return result;
	}

	// 아이디,닉네임 중복체크
	public ArrayList<User> id_nickCheck(String col, String str) {
		Connection conn = getConnection();
		ArrayList<User> list = new UserDAO().id_nickCheck(conn, col, str);
		close(conn);
		return list;
	}

	public User login(User vo) {
		User result = null;
		Connection conn = getConnection();
		result = new UserDAO().login(conn, vo);
		close(conn);
		return result;
	}

	public int userModify(User vo) {
		int result = 0;
		Connection conn = getConnection();
		result = new UserDAO().userModify(conn, vo);
		close(conn);
		return result;
	}

	public User idFind(String email, String name) {
		User result = null;
		Connection conn = getConnection();
		result = new UserDAO().idFind(conn, email, name);
		close(conn);
		return result;
	}

	public User pwFind(String email, String name, String id) {
		User result = null;
		Connection conn = getConnection();
		result = new UserDAO().pwFind(conn, email, name, id);
		close(conn);
		return result;
	}


}
