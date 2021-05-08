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

	// 회원 검색(이름)
	public ArrayList<User> selectSearch(String col, String str) {
		Connection conn = getConnection();
		ArrayList<User> list = new UserDAO().selectSearch(conn, col, str);
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
}
