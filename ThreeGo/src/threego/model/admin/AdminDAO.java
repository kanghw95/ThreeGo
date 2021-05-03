package threego.model.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.vo.User;



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
	//전체 회원 리스트 보는 용도
	public List<User> list(Connection conn) {
		ArrayList<User> list = null;

		pstmt = null;
		rs = null;
		String sql = "select * from user_tb order by nickname";

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
					vo.setLast_login(rs.getDate("last_login"));
					vo.setPhone(Integer.parseInt(rs.getString("phone")));
					vo.setEmail(rs.getString("email"));
					vo.setGender(rs.getString("gender").charAt(0));
					vo.setBirth(rs.getDate("birth"));
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
	//검색까지 가능한 회원 리스트
	public List<User> getUserByPage(Connection conn, int start, int end, String search) {
		List<User> list = null;
		String sql_1= "(select * from user_tb ";
		
		if(search == null) {
			sql_1 += " order by nickname) d";
		} else {
			sql_1 += " where nickname like '%" + search+ "%' order by nickname) d";
		}
		
		String sql = "select * from "
					+ " (select rownum r, d.* from " + sql_1  + " ) "
					+ " where r >= ? and r <= ?";

		pstmt = null; rs = null;

		try {
			pstmt = conn.prepareStatement(sql );
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				list = new ArrayList<User>();
				do {
					User vo = new User();
					vo.setUser_no(Integer.parseInt(rs.getString("user_no")));
					vo.setUser_id(rs.getString("user_id"));
					vo.setUser_pwd(rs.getString("user_pwd"));
					vo.setUser_name(rs.getString("user_name"));
					vo.setNickname(rs.getString("nickname"));
					vo.setAddress(rs.getString("address"));
					vo.setLast_login(rs.getDate("last_login"));
					vo.setPhone(Integer.parseInt(rs.getString("phone")));
					vo.setEmail(rs.getString("email"));
					vo.setGender(rs.getString("gender").charAt(0));
					vo.setBirth(rs.getDate("birth"));
					vo.setUser_authority(Integer.parseInt(rs.getString("user_authority")));
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
	//회원 권한 박탈시키기.
	public int userStop(Connection conn, User vo) {
		int result = 0;
		String sql = "update user_tb set user_authority =0 where user_no="+vo.getUser_no();
		System.out.println("test"+vo.getNickname());
		System.out.println("test"+vo.getUser_no());
		pstmt =null;
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}	
		return result;
	}
	//게시판 보여주기.
	public List<User> getBoardByPage(Connection conn, int start, int end, String search) {
		List<User> list = null;
		String sql_1= "(select * from user_tb ";
		
		if(search == null) {
			sql_1 += " order by nickname) d";
		} else {
			sql_1 += " where nickname like '%" + search+ "%' order by nickname) d";
		}
		
		String sql = "select * from "
					+ " (select rownum r, d.* from " + sql_1  + " ) "
					+ " where r >= ? and r <= ?";

		pstmt = null; rs = null;

		try {
			pstmt = conn.prepareStatement(sql );
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				list = new ArrayList<User>();
				do {
					User vo = new User();
					vo.setUser_no(Integer.parseInt(rs.getString("user_no")));
					vo.setUser_id(rs.getString("user_id"));
					vo.setUser_pwd(rs.getString("user_pwd"));
					vo.setUser_name(rs.getString("user_name"));
					vo.setNickname(rs.getString("nickname"));
					vo.setAddress(rs.getString("address"));
					vo.setLast_login(rs.getDate("last_login"));
					vo.setPhone(Integer.parseInt(rs.getString("phone")));
					vo.setEmail(rs.getString("email"));
					vo.setGender(rs.getString("gender").charAt(0));
					vo.setBirth(rs.getDate("birth"));
					vo.setUser_authority(Integer.parseInt(rs.getString("user_authority")));
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
}
