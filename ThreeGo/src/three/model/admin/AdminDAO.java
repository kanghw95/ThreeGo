package three.model.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class AdminDAO {
	Admin vo = new Admin();
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//테스트용으로 만들어 봄 사용 x
	public int insert(Connection conn, Admin vo) {
		int result = 0;
		String query = "insert into yhyh values(?,?,?,?)";
		pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, vo.getYh_no());
			pstmt.setString(2, vo.getYh_name());
			pstmt.setString(3, vo.getYh_id());
			pstmt.setString(4, vo.getYh_passwd());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	//회원 리스트 보는 용도이지만 현우님이 보내주시는걸로 대체 할 예정.
	public ArrayList<Admin> list(Connection conn) {
		ArrayList<Admin> list = null;
		String query = "select * from yhyh ";
		pstmt = null;
		rs=null;
		try {		
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();	
			if (rs.next()) {
				list = new ArrayList<Admin>();
				do {
					Admin vo = new Admin();
					vo.setYh_no(rs.getInt("YH_NO"));
					vo.setYh_name(rs.getString("YH_NAME"));
					vo.setYh_id(rs.getString("YH_ID"));
					vo.setYh_passwd(rs.getString("YH_PASSWD"));
					list.add(vo);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	//검색까지 가능한 회원 리스트 보는 용도..현우님이 보내주신거 수정해서 사용.
	public List<Admin> getUserByPage(Connection conn, int start, int end, String search) {
		List<Admin> list = null;
		String sql_1= "(select * from user_tb ";
		
		if(search == null) {
			sql_1 += ")";
		} else {
			sql_1 += " where nickname = '%" + search+ "%') d";
		}
		
		String sql = "select * from "
					+ " (select rownum r, d.* from " + sql_1  + " ) "
					+ " where r >= ? and r <= ?";

		pstmt = null; rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				list = new ArrayList<Admin>();
				do {
					Admin vo = new Admin();
					vo.setYh_no(rs.getInt("YH_NO"));
					vo.setYh_name(rs.getString("YH_NAME"));
					vo.setYh_id(rs.getString("YH_ID"));
					vo.setYh_passwd(rs.getString("YH_PASSWD"));
					list.add(vo);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	//화면에 보여지는 유저 카운트.
	public int getUserCount(Connection conn, String search) {
		int cnt = 0;
		String sql = "select COUNT(*) from user_tb";
		if (search != null) {
			sql += " where nickname like '%" + search+ "%'";
		}
			
		pstmt = null; rs = null;		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}		
		return cnt;
	}
}
