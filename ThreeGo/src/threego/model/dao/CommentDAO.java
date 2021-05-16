package threego.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.vo.Board;
import threego.model.vo.Board_Attach;
import threego.model.vo.Comment_tb;

public class CommentDAO {
	private Statement stmt = null;
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
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Comment_tb> getCommentAll(Connection conn, int bd_content_no) {
		List<Comment_tb> list = null;
		String sql = "select * from comment_tb order by rv_date asc where bd_content_no=?";
		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_content_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Comment_tb>();
				do {
					Comment_tb co = new Comment_tb();
					co.setCom_no(rs.getInt("com_no"));
					co.setBd_content_no(rs.getInt("bd_content_no"));
					co.setUser_no(rs.getInt("user_no"));
					co.setCom_writer(rs.getString("com_writer"));
					co.setCom_contents(rs.getString("com_contents"));
					//co.setRv_date(rs.getDate("rv_date"));
					co.setCom_ref(rs.getInt("com_ref"));
					co.setCom_re_level(rs.getInt("com_re_level"));
					co.setCom_re_step(rs.getInt("com_re_step"));
					list.add(co);

				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int getNextComment(Connection conn) {
		// 현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select COM_NO from comment_tb order by COM_NO desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int result = rs.getInt(1) + 1;
				return result;

			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

//	public int CommentWrite(Connection conn, Comment_tb co) {
//		pstmt = null; 
//		int result = 0;
//
//		
//		String sql = "insert into comment_tb values (? , ? , ? , ? , ? , sysdate,?,?,?)";	
//		try {
//				pstmt= conn.prepareStatement(sql);
//				System.out.println(co);
//				pstmt.setInt(1, getNextComment(conn));
//				pstmt.setInt(2, co.getBd_content_no());
//				pstmt.setInt(3, co.getUser_no());
//				pstmt.setString(4, co.getCom_writer());
//				pstmt.setString(5, co.getCom_contents());
//				pstmt.setInt(6, co.getCom_ref());
//				pstmt.setInt(7, co.getCom_re_step());
//				pstmt.setInt(8, co.getCom_re_level());
//				
//				
//				result= pstmt.executeUpdate();
//				
//				
//			if (result <0) {
//				System.out.println("작성실패");
//		
//			}else {
//				
//				
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close();
//		}
//		System.out.println("작성성공");
//		return result ;
//		
//		}

	public int CommentWrite(Connection conn, Comment_tb co) {
		int result = 0;

		int max = 1;
		int com_ref = 0;
		int com_re_step = 0;
		int com_re_level = 0;

		// bno 알아오기
		String sqlMaxBno = "select nvl(max(com_no), 0)+1 from comment_tb";
		// 원본 글쓰기
		String sql = "insert into comment_tb values (? , ? , ? , ? , ? , sysdate,?,?,?)";
		// 댓글 쓰기
		String sqlUpdate = "update comment_tb set com_re_step=com_re_step+1 "
				+ " where com_ref=? and com_no<>com_ref and com_re_step>?";

		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sqlMaxBno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				max = rs.getInt(1);
			} else {
				System.out.println("매우 이상한 상황.. 확인바람");
				return 0;
			}
			close(); // 다음 글 쓰기 쿼리를 위해 기존 것을 삭제함.

			if (co.getCom_no() != 0) { // 기존 글에 답글인 경우 update 문장 먼저 수행
				pstmt = conn.prepareStatement(sqlUpdate);
				pstmt.setInt(1, co.getCom_ref());
				pstmt.setInt(2, co.getCom_re_step());
				result = pstmt.executeUpdate();
				// update 결과는 0 일수 있음. 작성하는 글이 맨 마지막에 들어가는 글일 수 있기 때문에...
				close();
				com_ref = co.getCom_ref();
				com_re_step = co.getCom_re_step() + 1;
				com_re_level = co.getCom_re_level() + 1;
			} else { // 새글
				com_ref = max;
			}
			{ // 글쓰기
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, max);
				pstmt.setInt(2, co.getBd_content_no());
				pstmt.setInt(3, co.getUser_no());
				pstmt.setString(4, co.getCom_writer());
				pstmt.setString(5, co.getCom_contents());
				pstmt.setInt(6, co.getCom_ref());
				pstmt.setInt(7, co.getCom_re_step());
				pstmt.setInt(8, co.getCom_re_level());

				result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}


	public ArrayList<Comment_tb> getCommentByPage(Connection conn, int start, int end,  int bd_content_no) {
		  ArrayList<Comment_tb> list = null;
//	      String sql_1 = "( select * from Comment_tb where bd_content_no = ? ";
//
//	      if (search != null) {
//	         sql_1 += " and ( com_writer like '%" + search + "%' or com_contents like '%" + search + "%' ) ";
//	      }
//	      sql_1 += " order by rv_date asc ) d ";
//
//	      String sql = "select d2.bd_content_no, d2.com_writer, d2.com_contents, to_char(d2.rv_date,'yyyy-mm-dd hh24:mi:ss') "
//	      		+ " from (select rownum r, d.* from " + sql_1 + " ) d2 where d2.r >= ? and d2.r <= ?";
		  
		  String sql = " select com_writer, com_contents, to_char(rv_date,'yyyy-mm-dd hh24:mi:ss') from Comment_tb where bd_content_no = ? ";
		close();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_content_no);
//			pstmt.setInt(2, start);
//			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Comment_tb>();
				do {
					Comment_tb co = new Comment_tb();
					
					//co.setBd_content_no(rs.getInt("bd_content_no"));
					co.setCom_writer(rs.getString("com_writer"));
					co.setCom_contents(rs.getString("com_contents"));
					co.setRv_date(rs.getString(3));
					
					list.add(co);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	public ArrayList<Comment_tb> getCommentByPage(Connection conn, int start, int end,  String user_no) {
		  ArrayList<Comment_tb> list = null;
//	      String sql_1 = "( select * from Comment_tb where bd_content_no = ? ";
//
//	      if (search != null) {
//	         sql_1 += " and ( com_writer like '%" + search + "%' or com_contents like '%" + search + "%' ) ";
//	      }
//	      sql_1 += " order by rv_date asc ) d ";
//
//	      String sql = "select d2.bd_content_no, d2.com_writer, d2.com_contents, to_char(d2.rv_date,'yyyy-mm-dd hh24:mi:ss') "
//	      		+ " from (select rownum r, d.* from " + sql_1 + " ) d2 where d2.r >= ? and d2.r <= ?";
		  
		  String sql = "select com_writer, com_contents, to_char(rv_date,'yyyy-mm-dd hh24:mi:ss') from comment_tb a join user_tb b on a.user_no = b.user_no where b.user_no = ? order by bd_content_no desc";
//		close();
		
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, user_no);
			pstmt.setInt(1, Integer.parseInt(user_no));
//			pstmt.setInt(2, start);
//			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<Comment_tb>();
				do {
					Comment_tb co = new Comment_tb();
					
					//co.setBd_content_no(rs.getInt("bd_content_no"));
					co.setCom_writer(rs.getString("com_writer"));
					co.setCom_contents(rs.getString("com_contents"));
					co.setRv_date(rs.getString(3));
					list.add(co);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	public int getCommentCount(Connection conn, int bd_content_no) {
		int cnt = 0;
		String sql = "select COUNT(*) from Comment_tb where bd_content_no = ?";
		
		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_content_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println("getCommentCount: " + cnt);
		return cnt;
	}

	public int getCommentUpdate(Connection conn, Comment_tb co) {
		pstmt = null; rs=null;
		int result = 0;
		String sql = "UPDATE comment_tb SET  com_contents=?, bd_date=sysdate where BD_CONTENT_NO = ?";	
	
		try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, co.getCom_contents());
				pstmt.setInt(2, co.getBd_content_no());
				result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result ;
		
		}
	
	public int getCommentDelete(Connection conn, Comment_tb co) {
		pstmt = null; rs=null;
		int result = 0;
		String sql = "DELETE FROM comment_tb WHERE BD_CONTENT_NO = ?";	
	
		try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, co.getBd_content_no());
				result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result ;
		
		}

}
