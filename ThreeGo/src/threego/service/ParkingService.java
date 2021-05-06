package threego.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.dao.ParkingDao;
import threego.vo.Parking;
import threego.vo.User;


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
	
	// 회원가입
	public int userinsert(User vo) {
		int result = 0;
		Connection conn = getConnection();
		result = new ParkingDao().userinsert(conn, vo);
		close(conn);
		return result;
	}
	
	// 아이디,닉네임 중복체크
	public ArrayList<User> id_nickCheck(String col, String str) {
		Connection conn = getConnection();
		ArrayList<User> list = new ParkingDao().id_nickCheck(conn, col, str);
		close(conn);
		return list;
	}

	public User login(User vo) {
		User result = null;
		Connection conn = getConnection();
		result = new ParkingDao().login(conn, vo);
		close(conn);
		return result;
	}
	
	public List<Parking> getParkingAll(){
		Connection conn = JDBCTemplate.getConnection();
		List<Parking> list = new ParkingDao().getParkingAll(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public Parking getParkingRead(Parking inputVo) {
		Connection conn = JDBCTemplate.getConnection();
		Parking result = new ParkingDao().getParkingRead(conn, inputVo);
		JDBCTemplate.close(conn);
		return result;
	}
}
