package kh.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
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
	
	public List<Board> getBoardAll(Connection conn) {
		List<Board> list = null;
		String sql = "select * from board order by bref desc, bre_step asc";
		pstmt = null; rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<Board>();
				do {
					Board vo = new Board();
					vo.setBcnt(rs.getInt("bcnt"));
					vo.setBcontent(rs.getString("bcontent"));
					vo.setBdate(rs.getTimestamp("bdate"));
					vo.setBfilepath(rs.getString("bfilepath"));
					vo.setBsubject(rs.getString("bsubject"));
					vo.setBno(rs.getInt("bno"));
					vo.setBpwd(rs.getString("bpwd"));
					vo.setBre_level(rs.getInt("bre_level"));
					vo.setBre_step(rs.getInt("bre_step"));
					vo.setBref(rs.getInt("bref"));
					vo.setBwriter_snd(rs.getString("bwriter_snd"));
					vo.setBwriter(rs.getString("bwriter"));
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
	public List<Board> getBoardByPage(Connection conn, int start, int end, String search) {
		List<Board> list = null;
		String sql_1= "(select * from board ";
		
		if(search == null) {
			sql_1 += " order by bref desc, bre_step asc) d";
		} else {
			sql_1 += " where bsubject like '%" + search+ "%' or bcontent like '%"+ search+ "%'"
					+ " order by bref desc, bre_step asc) d";
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
				list = new ArrayList<Board>();
				do {
					Board vo = new Board();
					vo.setBcnt(rs.getInt("bcnt"));
					vo.setBcontent(rs.getString("bcontent"));
					vo.setBdate(rs.getTimestamp("bdate"));
					vo.setBfilepath(rs.getString("bfilepath"));
					vo.setBsubject(rs.getString("bsubject"));
					vo.setBno(rs.getInt("bno"));
					vo.setBpwd(rs.getString("bpwd"));
					vo.setBre_level(rs.getInt("bre_level"));
					vo.setBre_step(rs.getInt("bre_step"));
					vo.setBref(rs.getInt("bref"));
					vo.setBwriter_snd(rs.getString("bwriter_snd"));
					vo.setBwriter(rs.getString("bwriter"));
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
	//BNO         NOT NULL NUMBER         
	//BSUBJECT    NOT NULL VARCHAR2(300)  
	//BCONTENT    NOT NULL VARCHAR2(1800) 
	//BDATE       NOT NULL TIMESTAMP(6)   
	//BCNT        NOT NULL NUMBER         
	//BWRITER              VARCHAR2(60)   
	//BWRITER_SND          VARCHAR2(60)   
	//BFILEPATH            VARCHAR2(1800) 
	//BPWD                 VARCHAR2(30)   
	//BREF                 NUMBER         
	//BRE_STEP             NUMBER         
	//BRE_LEVEL            NUMBER 
	public int boardWrite(Connection conn, Board vo) {
		int result = 0;

		int max = 1;
		int ref = 0;
		int re_step = 0;
		int re_level = 0;
		
		// bno 알아오기
		String sqlMaxBno = "select nvl(max(bno), 0)+1 from board";
		// 원본 글쓰기 
		String sql = "insert into board values(?,?,?, "
				+ " current_timestamp,0,  ?,?,?,?,  "
				+ " ?,?,?)";
		// 댓글 쓰기
		String sqlUpdate= "update board set bre_step=bre_step+1 "
				+ " where bref=? and bno<>bref and bre_step>?";
		
		pstmt = null; rs=null;
		try {
			pstmt = conn.prepareStatement(sqlMaxBno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt(1);
			} else {
				System.out.println("매우 이상한 상황.. 확인바람");
				return 0;
			}
			close();  // 다음 글 쓰기 쿼리를 위해 기존 것을 삭제함.
			
			if(vo.getBno() !=0) {   // 기존 글에 답글인 경우 update 문장 먼저 수행
				pstmt= conn.prepareStatement(sqlUpdate);
				pstmt.setInt(1, vo.getBref());
				pstmt.setInt(2, vo.getBre_step());
				result = pstmt.executeUpdate();
				// update 결과는 0 일수 있음. 작성하는 글이 맨 마지막에 들어가는 글일 수 있기 때문에...
				close();
				ref = vo.getBref();
				re_step = vo.getBre_step()+1;
				re_level = vo.getBre_level()+1;
			}else {  // 새글
				ref = max;
			}
			{   // 글쓰기
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, max);
				pstmt.setString(2, vo.getBsubject());
				pstmt.setString(3, vo.getBcontent());
				pstmt.setString(4, vo.getBwriter());
				pstmt.setString(5, vo.getBwriter());
				pstmt.setString(6, vo.getBfilepath());
				pstmt.setString(7, vo.getBpwd());
				pstmt.setInt(8, ref);
				pstmt.setInt(9, re_step);
				pstmt.setInt(10, re_level);
				
				result = pstmt.executeUpdate();
			}
						
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int getBoardCount(Connection conn, String search) {
		int cnt = 0;
		String sql = "select COUNT(*) from board";
		if (search != null) {
			sql += " where bsubject like '%" + search+ "%' or bcontent like '%"+ search+ "%'";
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
	public Board getBoardRead(Connection conn, Board inputVo) {
		Board vo = null;
		String sql="select * from board where bno = ?";
		pstmt = null; rs = null;		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inputVo.getBno());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new Board();
				vo.setBcnt(rs.getInt("bcnt"));
				vo.setBcontent(rs.getString("bcontent"));
				vo.setBdate(rs.getTimestamp("bdate"));
				vo.setBfilepath(rs.getString("bfilepath"));
				vo.setBsubject(rs.getString("bsubject"));
				vo.setBno(rs.getInt("bno"));
				vo.setBpwd(rs.getString("bpwd"));
				vo.setBre_level(rs.getInt("bre_level"));
				vo.setBre_step(rs.getInt("bre_step"));
				vo.setBref(rs.getInt("bref"));
				vo.setBwriter_snd(rs.getString("bwriter_snd"));
				vo.setBwriter(rs.getString("bwriter"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}	
		return vo;
	}
	
	
}
























