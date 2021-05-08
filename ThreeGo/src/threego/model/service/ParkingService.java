package threego.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.dao.ParkingDAO;
import threego.model.vo.Parking;
import threego.model.vo.User;


public class ParkingService {
	//전체 주차장 조회
		public List<Parking> getParkingAll(){
			Connection conn = JDBCTemplate.getConnection();
			List<Parking> list = null;///new ParkingDao().getParkingAll(conn);
			JDBCTemplate.close(conn);
			return list;
		}
		//주차장 검색 
		public ArrayList<Parking> p_selectSearch(String col, String str) {
			Connection conn = getConnection();
			ArrayList<Parking> list = new ParkingDAO().p_selectSearch(conn, col, str);
			close(conn);
			return list;
		}
		
		//주차장 읽기
		public List<Parking> getParkingRead() {
			Connection conn = JDBCTemplate.getConnection();
			List<Parking> result = new ParkingDAO().getParkingRead(conn);
			JDBCTemplate.close(conn);
			return result;
		}
		
		
		public int getParkingCount(String search) {
			Connection conn = JDBCTemplate.getConnection();
			int result = new ParkingDAO().getParkingCount(conn, search);
			JDBCTemplate.close(conn);
			return result;
		}
		public List<Parking> getParkingByPage(int start, int end, String search){
			Connection conn = JDBCTemplate.getConnection();
			List<Parking> list = new ParkingDAO().getParkingByPage(conn, start, end, search);
			JDBCTemplate.close(conn);
			return list;
		}
		
}
