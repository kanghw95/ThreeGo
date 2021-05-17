package threego.model.dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.vo.Parking;
import threego.model.vo.Review;
import threego.model.vo.User;

public class ParkingDAO {

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public List<Parking> getParkingRead(Connection conn) {
		Parking inputVo = null;
		String sql = " select * from PK_LOT";
		pstmt = null;
		List<Parking> list = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			list = new ArrayList<Parking>();
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					inputVo = new Parking();
					inputVo.setAddr(rs.getString("addr"));
					inputVo.setAdd_rates(rs.getInt("add_rates"));
					inputVo.setAdd_time_rate(rs.getInt("add_time_rate"));
					inputVo.setCapacity(rs.getInt("capacity"));
					inputVo.setParking_code(rs.getInt("parking_code"));
					inputVo.setDay_maximum(rs.getInt("day_maximum"));
					inputVo.setFulltime_monthly(rs.getString("fulltime_monthly"));
					inputVo.setHoliday_begin_time(rs.getString("holiday_begin_time"));
					inputVo.setHoliday_end_time(rs.getString("holiday_end_time"));
					inputVo.setHoliday_pay_nm(rs.getString("holiday_pay_nm"));
					inputVo.setLat(rs.getFloat("lat"));
					inputVo.setLng(rs.getFloat("lng"));
					inputVo.setParking_name(rs.getString("parking_name"));
					inputVo.setNight_free_open(rs.getString("night_free_open").charAt(0));
					inputVo.setNight_free_open_nm(rs.getString("night_free_open_nm"));
					inputVo.setOperation_rule(rs.getString("operation_rule").charAt(0));
					inputVo.setOperation_rule_nm(rs.getString("operation_rule_nm"));
					inputVo.setPay_nm(rs.getString("pay_nm"));
					inputVo.setPay_yn(rs.getString("pay_yn").charAt(0));
					inputVo.setRates(rs.getInt("rates"));
					inputVo.setSaturday_pay_nm(rs.getString("saturday_pay_nm"));
					inputVo.setSaturday_pay_yn(rs.getString("saturday_pay_yn").charAt(0));
					inputVo.setSync_time(rs.getString("sync_time"));
					inputVo.setTel(rs.getString("tel"));
					inputVo.setTime_rate(rs.getInt("time_rate"));
					inputVo.setParking_type(rs.getString("parking_type"));
					inputVo.setParking_type_nm(rs.getString("parking_type_nm"));
					inputVo.setWeekday_begin_time(rs.getString("weekday_begin_time"));
					inputVo.setWeekday_end_time(rs.getString("weekday_end_time"));
					inputVo.setWeekend_begin_time(rs.getString("weekend_begin_time"));
					list.add(inputVo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;

	}

	public ArrayList<Parking> getParkingAll(Connection conn) {
		ArrayList<Parking> list = null;
		pstmt = null;
		rs = null;
		String sql = "select * from PK_LOT";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Parking>();
				do {
					Parking vo = new Parking();
					vo.setAddr(rs.getString("addr"));
					vo.setAdd_rates(rs.getInt("add_rates"));
					vo.setAdd_time_rate(rs.getInt("add_time_rate"));
					vo.setCapacity(rs.getInt("capacity"));
					vo.setParking_code(rs.getInt("parking_code"));
					vo.setDay_maximum(rs.getInt("day_maximum"));
					vo.setFulltime_monthly(rs.getString("fulltime_monthly"));
					vo.setHoliday_begin_time(rs.getString("holiday_begin_time"));
					vo.setHoliday_end_time(rs.getString("holiday_end_time"));
					vo.setHoliday_pay_nm(rs.getString("holiday_pay_nm"));
					vo.setLat(rs.getFloat("lat"));
					vo.setLng(rs.getFloat("lng"));
					vo.setParking_name(rs.getString("parking_name"));
					vo.setNight_free_open(rs.getString("night_free_open").charAt(0));
					vo.setNight_free_open_nm(rs.getString("night_free_open_nm"));
					vo.setOperation_rule(rs.getString("operation_rule").charAt(0));
					vo.setOperation_rule_nm(rs.getString("operation_rule_nm"));
					vo.setPay_nm(rs.getString("pay_nm"));
					vo.setPay_yn(rs.getString("pay_yn").charAt(0));
					vo.setRates(rs.getInt("rates"));
					vo.setSaturday_pay_nm(rs.getString("saturday_pay_nm"));
					vo.setSaturday_pay_yn(rs.getString("saturday_pay_yn").charAt(0));
					vo.setSync_time(rs.getString("sync_time"));
					vo.setTel(rs.getString("tel"));
					vo.setTime_rate(rs.getInt("time_rate"));
					vo.setParking_type(rs.getString("parking_type"));
					vo.setParking_type_nm(rs.getString("parking_type_nm"));
					vo.setWeekday_begin_time(rs.getString("weekday_begin_time"));
					vo.setWeekday_end_time(rs.getString("weekday_end_time"));
					vo.setWeekend_begin_time(rs.getString("weekend_begin_time"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int getParkingCount(Connection conn, String search) {
		int cnt = 0;
		String sql = "select COUNT(*) from PK_LOT";
		if (search != null) {
			sql += " where parking_name like '%" + search + "%'";
		}

		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();

		}
		return cnt;
	}

	public List<Parking> getParkingByPage(Connection conn, int start, int end, String search) {
		List<Parking> list = null;
		String sql_1 = "(select * from PK_LOT ";

		if (search == null) {
			sql_1 += " order by parking_code asc, pay_yn desc) d";
		} else {
			sql_1 += " where parking_name like '%" + search + "%'" + " order by parking_code asc, pay_yn desc) d";
		}

		String sql = "select * from " + " (select rownum r, d.* from " + sql_1 + " ) " + " where r >= ? and r <= ?";

		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Parking>();
				do {
					Parking vo = new Parking();
					vo.setAddr(rs.getString("addr"));
					vo.setAdd_rates(rs.getInt("add_rates"));
					vo.setAdd_time_rate(rs.getInt("add_time_rate"));
					vo.setCapacity(rs.getInt("capacity"));
					vo.setParking_code(rs.getInt("parking_code"));
					vo.setDay_maximum(rs.getInt("day_maximum"));
					vo.setFulltime_monthly(rs.getString("fulltime_monthly"));
					vo.setHoliday_begin_time(rs.getString("holiday_begin_time"));
					vo.setHoliday_end_time(rs.getString("holiday_end_time"));
					vo.setHoliday_pay_nm(rs.getString("holiday_pay_nm"));
					vo.setLat(rs.getFloat("lat"));
					vo.setLng(rs.getFloat("lng"));
					vo.setParking_name(rs.getString("parking_name"));
					vo.setNight_free_open(rs.getString("night_free_open").charAt(0));
					vo.setNight_free_open_nm(rs.getString("night_free_open_nm"));
					vo.setOperation_rule(rs.getString("operation_rule").charAt(0));
					vo.setOperation_rule_nm(rs.getString("operation_rule_nm"));
					vo.setPay_nm(rs.getString("pay_nm"));
					vo.setPay_yn(rs.getString("pay_yn").charAt(0));
					vo.setRates(rs.getInt("rates"));
					vo.setSaturday_pay_nm(rs.getString("saturday_pay_nm"));
					vo.setSaturday_pay_yn(rs.getString("saturday_pay_yn").charAt(0));
					vo.setSync_time(rs.getString("sync_time"));
					vo.setTel(rs.getString("tel"));
					vo.setTime_rate(rs.getInt("time_rate"));
					vo.setParking_type(rs.getString("parking_type"));
					vo.setParking_type_nm(rs.getString("parking_type_nm"));
					vo.setWeekday_begin_time(rs.getString("weekday_begin_time"));
					vo.setWeekday_end_time(rs.getString("weekday_end_time"));
					vo.setWeekend_begin_time(rs.getString("weekend_begin_time"));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public ArrayList<Parking> p_selectSearch(Connection conn, String col, String str) {
		ArrayList<Parking> list = new ArrayList<Parking>();
		float result = 0;

pstmt = null;
rs = null;


		String sql = "SELECT * FROM PK_LOT WHERE " + col + " LIKE '%" + str + "%' ";
		String sql2 = "select avg(grade) from simple_rv where parking_code = ?";

		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, 1452075);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result	 = rs.getFloat(1);
			} 

			close();

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs != null) { // 결과가 1개이상 있다면
				if (rs.next()) {
					list = new ArrayList<Parking>();
					do {
						Parking vo = new Parking();
						vo.setGrade(result);
						vo.setAddr(rs.getString("addr"));
						vo.setAdd_rates(rs.getInt("add_rates"));
						vo.setAdd_time_rate(rs.getInt("add_time_rate"));
						vo.setCapacity(rs.getInt("capacity"));
						vo.setParking_code(rs.getInt("parking_code"));
						vo.setDay_maximum(rs.getInt("day_maximum"));
						vo.setFulltime_monthly(rs.getString("fulltime_monthly"));
						vo.setHoliday_begin_time(rs.getString("holiday_begin_time"));
						vo.setHoliday_end_time(rs.getString("holiday_end_time"));
						vo.setHoliday_pay_nm(rs.getString("holiday_pay_nm"));
						vo.setLat(rs.getFloat("lat"));
						vo.setLng(rs.getFloat("lng"));
						vo.setParking_name(rs.getString("parking_name"));
						vo.setNight_free_open(rs.getString("night_free_open").charAt(0));
						vo.setNight_free_open_nm(rs.getString("night_free_open_nm"));
						vo.setOperation_rule(rs.getString("operation_rule").charAt(0));
						vo.setOperation_rule_nm(rs.getString("operation_rule_nm"));
						vo.setPay_nm(rs.getString("pay_nm"));
						vo.setPay_yn(rs.getString("pay_yn").charAt(0));
						vo.setRates(rs.getInt("rates"));
						vo.setSaturday_pay_nm(rs.getString("saturday_pay_nm"));
						vo.setSaturday_pay_yn(rs.getString("saturday_pay_yn").charAt(0));
						vo.setSync_time(rs.getString("sync_time"));
						vo.setTel(rs.getString("tel"));
						vo.setTime_rate(rs.getInt("time_rate"));
						vo.setParking_type(rs.getString("parking_type"));
						vo.setParking_type_nm(rs.getString("parking_type_nm"));
						vo.setWeekday_begin_time(rs.getString("weekday_begin_time"));
						vo.setWeekday_end_time(rs.getString("weekday_end_time"));
						vo.setWeekend_begin_time(rs.getString("weekend_begin_time"));
						list.add(vo);
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public Parking getParkingRead(Connection conn, Parking inputVo) {

		ArrayList<Parking> list = new ArrayList<Parking>();

		Parking vo = null;
		String sql = "select * from parking where name = ?";
		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputVo.getParking_name());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new Parking();
				vo.setAddr(rs.getString("addr"));
				vo.setAdd_rates(rs.getInt("add_rates"));
				vo.setAdd_time_rate(rs.getInt("add_time_rate"));
				vo.setCapacity(rs.getInt("capacity"));
				vo.setParking_code(rs.getInt("parking_code"));
				vo.setDay_maximum(rs.getInt("day_maximum"));
				vo.setFulltime_monthly(rs.getString("fulltime_monthly"));
				vo.setHoliday_begin_time(rs.getString("holiday_begin_time"));
				vo.setHoliday_end_time(rs.getString("holiday_end_time"));
				vo.setHoliday_pay_nm(rs.getString("holiday_pay_nm"));
				vo.setLat(rs.getFloat("lat"));
				vo.setLng(rs.getFloat("lng"));
				vo.setParking_name(rs.getString("parking_name"));
				vo.setNight_free_open(rs.getString("night_free_open").charAt(0));
				vo.setNight_free_open_nm(rs.getString("night_free_open_nm"));
				vo.setOperation_rule(rs.getString("operation_rule").charAt(0));
				vo.setOperation_rule_nm(rs.getString("operation_rule_nm"));
				vo.setPay_nm(rs.getString("pay_nm"));
				vo.setPay_yn(rs.getString("pay_yn").charAt(0));
				vo.setRates(rs.getInt("rates"));
				vo.setSaturday_pay_nm(rs.getString("saturday_pay_nm"));
				vo.setSaturday_pay_yn(rs.getString("saturday_pay_yn").charAt(0));
				vo.setSync_time(rs.getString("sync_time"));
				vo.setTel(rs.getString("tel"));
				vo.setTime_rate(rs.getInt("time_rate"));
				vo.setParking_type(rs.getString("parking_type"));
				vo.setParking_type_nm(rs.getString("parking_type_nm"));
				vo.setWeekday_begin_time(rs.getString("weekday_begin_time"));
				vo.setWeekday_end_time(rs.getString("weekday_end_time"));
				vo.setWeekend_begin_time(rs.getString("weekend_begin_time"));
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	
	
	


	
}
