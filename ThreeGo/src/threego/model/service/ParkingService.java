package threego.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import threego.model.dao.ParkingDao;
import threego.model.vo.User;

public class ParkingService {
	public ArrayList<User> selectAll() {
		Connection conn = null;
		conn= getConnection();
		ArrayList<User> list = new ParkingDao().selectAll(conn);
		close(conn);
		return list;
	}
}
