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
import threego.model.vo.User;

public class ParkingDao {

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

	// SelectAll 회원 전부 조회
	public ArrayList<User> selectAll(Connection conn) {
		ArrayList<User> list = null;

		pstmt = null;
		rs = null;
		String sql = "select * from user_tb";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<User>();
				do {
					User vo = new User();
					vo.setUser_no(Integer.parseInt(rs.getString("user_no")));
					vo.setUser_id(rs.getString("user_id"));
					vo.setUser_pwd(rs.getString("user_pwd"));
					vo.setUser_name(rs.getString("user_name"));
					vo.setNickname(rs.getString("nickname"));
					vo.setAddress(rs.getString("address"));
					vo.setLast_login(rs.getString("last_login"));
					vo.setPhone(rs.getString("phone"));
					vo.setEmail(rs.getString("email"));
					vo.setGender(rs.getString("gender").charAt(0));
					vo.setBirth(rs.getString("birth"));
					vo.setUser_authority(Integer.parseInt(rs.getString("user_authority")));
					list.add(vo);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	// Serach 회원 검색
	public ArrayList<User> selectSearch(Connection conn, String col, String str) {
		ArrayList<User> list = new ArrayList<User>();

		String sql = "select * from USER_TB where " + col + " like '%" + str + "%' ";

		pstmt = null;
		rs = null;

		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs != null) { // 결과가 1개이상 있다면
				if (rs.next()) {
					list = new ArrayList<User>();
					do {
						User vo = new User();
						vo.setUser_no(Integer.parseInt(rs.getString("user_no")));
						vo.setUser_id(rs.getString("user_id"));
						vo.setUser_pwd(rs.getString("user_pwd"));
						vo.setUser_name(rs.getString("user_name"));
						vo.setNickname(rs.getString("nickname"));
						vo.setAddress(rs.getString("address"));
						vo.setLast_login(rs.getString("last_login"));
						vo.setPhone(rs.getString("phone"));
						vo.setEmail(rs.getString("email"));
						vo.setGender(rs.getString("gender").charAt(0));
						vo.setBirth(rs.getString("birth"));
						vo.setUser_authority(Integer.parseInt(rs.getString("user_authority")));
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

	// 아이디,닉네임 중복체크용
	public ArrayList<User> id_nickCheck(Connection conn, String col, String str) {
		ArrayList<User> list = new ArrayList<User>();

		String sql = "select * from USER_TB where " + col + " like ?";

		pstmt = null;
		rs = null;

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();

			if (rs != null) { // 결과가 1개이상 있다면
				if (rs.next()) {
					list = new ArrayList<User>();
					do {
						User vo = new User();
						vo.setUser_id(rs.getString("user_id"));
						vo.setNickname(rs.getString("nickname"));
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
	//회원가입
	public int userinsert(Connection conn, User vo) {
		int result = 0;
		int max = 1;
		pstmt = null;
		rs = null;
		String sqlMaxUser_no = "select nvl(max(USER_NO),0)+1 from user_tb";
		String sql = "insert into user_tb values(?,?,?,?,?,?,sysdate,?,?,'"+vo.getGender()+"',to_date(?,'yyyy-mm-dd'),DEFAULT)";


		try {
			pstmt = conn.prepareStatement(sqlMaxUser_no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				max = rs.getInt(1);
				System.out.println(max);
			} else {
				return 0;
			}
			
			{ 
				close();

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, max);
				pstmt.setString(2, vo.getUser_id());
				pstmt.setString(3, vo.getUser_pwd());
				pstmt.setString(4, vo.getUser_name());
				pstmt.setString(5, vo.getNickname());
				pstmt.setString(6, vo.getAddress());
				pstmt.setString(7, vo.getPhone());
				pstmt.setString(8, vo.getEmail());
				pstmt.setString(9, vo.getBirth());

				result = pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public User login(Connection conn, User vo) {
		String id = vo.getUser_id();
		String pw = vo.getUser_pwd();
		
		pstmt = null;
		rs = null;
		User resultVo = null;
		
		String sql = "select * from user_tb where user_id = ?";
		String sql2 ="update user_tb set last_login = sysdate where user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				resultVo = new User();
				resultVo.setUser_no(rs.getInt("user_no"));
				resultVo.setUser_id(rs.getString("user_id"));
				resultVo.setUser_pwd(rs.getString("user_pwd"));
				resultVo.setUser_name(rs.getString("user_name"));
				resultVo.setNickname(rs.getString("nickname"));
				resultVo.setAddress(rs.getString("address"));
				resultVo.setLast_login(rs.getString("last_login"));
				resultVo.setPhone(rs.getString("phone"));
				resultVo.setEmail(rs.getString("email"));
				resultVo.setGender(rs.getString("gender").charAt(0));
				resultVo.setBirth(rs.getString("birth"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return resultVo;
	}
	
	public List<Parking> getParkingAll(Connection conn) {
		List<Parking> list = null;
		String sql = "select * from board order by bref desc, bre_step asc";
		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Parking>();
				do {
					Parking vo = new Parking();

					vo.setAddr(rs.getString("addr"));
					vo.setAddrates(rs.getInt("addrates"));
					vo.setAddtimerate(rs.getInt("addtimerate"));
					vo.setCapacity(rs.getInt("capacity"));
					vo.setCode(rs.getInt("code"));
					vo.setDaymaximum(rs.getInt("daymaximum"));
					vo.setFulltimemonthly(rs.getString("fulltimemonthly"));
					vo.setHolidaybegintime(rs.getString("columnIndex"));
					vo.setHolidayendtime(rs.getString("holidayendtime"));
					vo.setHolidaypaynm(rs.getString("holidaypaynm"));
					vo.setLat(rs.getFloat("lat"));
					vo.setLng(rs.getFloat("lng"));
					vo.setName(rs.getString("name"));
					vo.setNightfreeopen(rs.getString("nightfreeopen").charAt(0));
					vo.setNightfreeopennm(rs.getString("nightfreeopennm"));
					vo.setOperrule(rs.getString("operrule").charAt(0));
					vo.setOperrulenm(rs.getString("operrulenm"));
					vo.setPaynm(rs.getString("paynm"));
					vo.setPayyn(rs.getString("payyn").charAt(0));
					vo.setRates(rs.getInt("rates"));
					vo.setSaturdaypaynm(rs.getString("saturdaypaynm"));
					vo.setSaturdaypayyn(rs.getString("saturdaypayyn").charAt(0));
					vo.setSynctime(rs.getString("synctime"));
					vo.setTel(rs.getString("tel"));
					vo.setTimerate(rs.getInt("timerate"));
					vo.setType(rs.getString("type"));
					vo.setTypenm(rs.getString("typenm"));
					vo.setWeekdaybegintime(rs.getString("weekdaybegintime"));
					vo.setWeekdayendtime(rs.getString("weekdayendtime"));
					vo.setWeekendbegintime(rs.getString("weekendbegintime"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public Parking getParkingRead(Connection conn, Parking inputVo) {
		Parking vo = null;
		String sql = "select * from parking where name = ?";
		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputVo.getName());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new Parking();
				vo.setAddr(rs.getString("addr"));
				vo.setAddrates(rs.getInt("addrates"));
				vo.setAddtimerate(rs.getInt("addtimerate"));
				vo.setCapacity(rs.getInt("capacity"));
				vo.setCode(rs.getInt("code"));
				vo.setDaymaximum(rs.getInt("daymaximum"));
				vo.setFulltimemonthly(rs.getString("fulltimemonthly"));
				vo.setHolidaybegintime(rs.getString("columnIndex"));
				vo.setHolidayendtime(rs.getString("holidayendtime"));
				vo.setHolidaypaynm(rs.getString("holidaypaynm"));
				vo.setLat(rs.getFloat("lat"));
				vo.setLng(rs.getFloat("lng"));
				vo.setName(rs.getString("name"));
				vo.setNightfreeopen(rs.getString("nightfreeopen").charAt(0));
				vo.setNightfreeopennm(rs.getString("nightfreeopennm"));
				vo.setOperrule(rs.getString("operrule").charAt(0));
				vo.setOperrulenm(rs.getString("operrulenm"));
				vo.setPaynm(rs.getString("paynm"));
				vo.setPayyn(rs.getString("payyn").charAt(0));
				vo.setRates(rs.getInt("rates"));
				vo.setSaturdaypaynm(rs.getString("saturdaypaynm"));
				vo.setSaturdaypayyn(rs.getString("saturdaypayyn").charAt(0));
				vo.setSynctime(rs.getString("synctime"));
				vo.setTel(rs.getString("tel"));
				vo.setTimerate(rs.getInt("timerate"));
				vo.setType(rs.getString("type"));
				vo.setTypenm(rs.getString("typenm"));
				vo.setWeekdaybegintime(rs.getString("weekdaybegintime"));
				vo.setWeekdayendtime(rs.getString("weekdayendtime"));
				vo.setWeekendbegintime(rs.getString("weekendbegintime"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	public int userModify(Connection conn, User vo) {
		int result = 0;
		int max = 1;
		
		pstmt = null;
		rs = null;
		
		String sql = "update user_tb set user_pwd = ?, nickname = ?, address = ?, phone = ?, email = ? where user_id = ?";
		try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getUser_pwd());
				pstmt.setString(2, vo.getNickname());
				pstmt.setString(3, vo.getAddress());
				pstmt.setString(4, vo.getPhone());
				pstmt.setString(5, vo.getEmail());
				pstmt.setString(6, vo.getUser_id());

				result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

}
