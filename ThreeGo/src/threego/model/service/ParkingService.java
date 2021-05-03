package threego.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import threego.model.dao.ParkingDao;
import threego.model.vo.User;


public class ParkingService {
	// 전체 회원 조회
	public ArrayList<User> selectAll() {
		Connection conn = null;
		conn= getConnection();
		ArrayList<User> list = new ParkingDao().selectAll(conn);
		close(conn);
		return list;
	}
	
	// 회원 검색(이름)
	public ArrayList<User> selectSearch(String col, String str) {
		Connection conn = getConnection();
		ArrayList<User> list = new ParkingDao().selectSearch(conn, col, str);
		close(conn);
		return list;
	}
	
	// 아이디,닉네임 중복체크
	public ArrayList<User> id_nickCheck(String col, String str) {
		Connection conn = getConnection();
		ArrayList<User> list = new ParkingDao().id_nickCheck(conn, col, str);
		close(conn);
		return list;
	}

}
