package first.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import first.common.JDBCTemplate;
import first.member.model.vo.Member;

public class MemberDao {   // CRUD에 해당하는 메소드 존재
	
	// selectAll()
	public ArrayList<Member> selectAll(Connection conn) {
		ArrayList<Member> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "select * from TEST_MEMBER";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset.next()) {   // record 한줄 위치
				list = new ArrayList<Member>();
				do {
					Member vo = new Member();
					vo.setId(rset.getString("id"));  
					vo.setName(rset.getString("name"));
					vo.setPasswd(rset.getString("passwd"));
					vo.setEmail(rset.getString("email"));		
					vo.setGrade(rset.getString("grade"));
					vo.setGender(rset.getString("gender").charAt(0));
					vo.setRegdate(rset.getDate("regdate"));	
					list.add(vo);
				}while(rset.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}
	public ArrayList<Member> selectSearch(Connection conn, String col, String str) {
		ArrayList<Member> list = new ArrayList<Member>();
		String sql1="select * from TEST_MEMBER where " + col + " like '%" + str + "%'" ;
		String sql2="select * from TEST_MEMBER where " + col + " like ?" ;    // PreparedStatement
		String sql3="select * from TEST_MEMBER where " + col + " = '" + str + "' ";
		String sql4="select * from TEST_MEMBER where " + col + " = ? ";
		
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			// 방법 Statement 사용
//			stmt = conn.createStatement();
//			rset = stmt.executeQuery(sql3);   // sql1
			
			// 방법 PreparedStatement
			pstmt = conn.prepareStatement(sql4);   // sql2
			pstmt.setString(1, str);
			rset = pstmt.executeQuery();
			
			if(rset != null) {   // 결과가 1개이상 있다면
				while(rset.next()) {
					list.add(  new Member( 
							rset.getString("id"),  rset.getString("passwd"),
							rset.getString("name"), rset.getString("email")
							, rset.getString("grade") , rset.getString("gender").charAt(0)
							, rset.getDate("regdate"))   );
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	// insert()
	public int insert(Connection conn, Member vo) {
		int result = 0;	
		
		// id, pwd , name, email
		String sql= "insert into test_member values( '"+ vo.getId() + "', '" + vo.getPasswd() + "', '"+vo.getName()+"' , '"+vo.getEmail()+"')";
		String sql2= "insert into test_member values(?,?,?,?,?,?,sysdate)";
		
		
		Statement stmt = null;
		PreparedStatement pstmt = null;
		// 필요없음 ResultSet rs = null;
		
		try {
			//방법 Statement
//			stmt = conn.createStatement();
//			result = stmt.executeUpdate(sql);
			
			//방법 PreparedStatement
			//pstmt = conn.prepareStatement(sql);  // sql 도 가능
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, String.valueOf(vo.getGender()));
//			pstmt.setDate(7, vo.getRegdate());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(pstmt);
		}	
		
		return result;
	}
	
	// update()
	public int update(Connection conn, String col, Member vo) {
		int result = 0;
		String sql = "update test_member set "+ col + " = ?  where id = ?" ;
		
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			switch(col) {
			case "name":
				pstmt.setString(1, vo.getName());
				break;
			case "passwd":
				pstmt.setString(1, vo.getPasswd());
				break;
			case "email":
				pstmt.setString(1, vo.getEmail());
				break;
			}
			pstmt.setString(2, vo.getId());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	// delete()
	public int delete(Connection conn, String col, String str) {
		int result = 0;
		
		return result;
	}
	
	// login()
	public Member login(Connection conn, Member vo) {
		String id =  vo.getId();
		String passwd = vo.getPasswd();
		
		String sql = "select * from test_member where id=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member resultVO = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				resultVO = new Member();
				resultVO.setId(rs.getString("id"));  
				resultVO.setName(rs.getString("name"));
				resultVO.setPasswd(rs.getString("passwd"));
				resultVO.setEmail(rs.getString("email"));		
				resultVO.setGrade(rs.getString("grade"));
				resultVO.setGender(rs.getString("gender").charAt(0));
				resultVO.setRegdate(rs.getDate("regdate"));	
			}
			
			
			// 로그인에 대한 결과를 확인하는 방식
//			if(rs != null) {  // id 가 존재함.
//				rs.next();
//				String dbPasswd = rs.getString("passwd");
//				if(dbPasswd.equals(passwd)) {
//					// 아이디와 pass 동일
//					return 0;
//				} else {
//					//password 틀림
//					return -1;
//				}
//			} else {  // id 존재하지 않음
//				return -2;
//			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return resultVO;
	}
	
	
}
