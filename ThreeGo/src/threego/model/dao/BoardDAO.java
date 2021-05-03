package threego.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import threego.model.vo.Board_Attach;
import threego.model.vo.Board;



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
	
	
	
	public int getNext(Connection conn) {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select bd_content_no from board order by bd_content_no desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
                 int result = rs.getInt(1) + 1;
				return result;
			
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}

	
	
	public int getNextF(Connection conn) {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select file_no from board_attach order by file_no desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int result = rs.getInt(1) + 1;
				return result;
				
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}

	
	
	
	
public int boardWrite(Connection conn, Board vo) {
	pstmt = null; 
	int result = 0;

	
	String sql = "insert into board values (? , ? , ? , ? , ? , sysdate ,? ,? ,? ,?)";	
	try {
			pstmt= conn.prepareStatement(sql);
			
	
			pstmt.setInt(1, getNext(conn));
			System.out.println(vo.getBd_content_no());//0
	
//			pstmt.setInt(2, vo.getUser_no());
			pstmt.setInt(2, vo.getUser_no());
			
			pstmt.setString(3, vo.getBd_writer());
			System.out.println(vo.getBd_writer());//null
			
			
			pstmt.setString(4, vo.getBd_subject());
			pstmt.setString(5, vo.getBd_content());
			
			pstmt.setInt(6, vo.getBd_ref());
			pstmt.setInt(7, vo.getBd_re_step());
			pstmt.setInt(8, vo.getBd_re_level());
			pstmt.setInt(9, vo.getBd_likecnt());
			result= pstmt.executeUpdate();
			
//			String fileSql ="insert into board_attach values ( fullname = ? ) ";
//			pstmt=conn.prepareStatement(fileSql);
//			pstmt.setString(1, ao.getFullname());
//			
//			
//			fileResult= pstmt.executeUpdate();
		
	
			
		if (result <0) {
			System.out.println("작성실패");
	
		}else {
			
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close();
	}
	System.out.println("작성성공");
	return result ;
	
	}
	
	






//	public int boardComment(Connection conn, Board vo) {
//	int result =0;
//	//���� ���
//	     String sql = "insert into board values() where Bd_content_no= ? ";  
//	//����
//		String sqlUpdate="update board set bre_step = bre_step+1 where bref=? and bno<>bref and bre_step>?";  //�ۼ��ϱ�
//		
//		if (vo.getBd_content_no()!=0) {  //���� �� �� ����� ���  update ���� ���� ����
//		pstmt=conn.prepareStatement(sqlUpdate);
//		pstmt.setInt(1, vo.getBref());
//		pstmt.setInt(2, vo.getBre_step());
//		result= pstmt.executeUpdate();
//		//update ����� 0 �ϼ� ���� �ۼ��ϴ� ���� �� �������� ���� ���� �� �ֱ⶧����
//		close();
//		ref= vo.getBref();
//		re_step=vo.getBre_step()+1;
//		re_level=	vo.getBre_level()+1;
//	}else{
//		ref=max;
//	}
//}
//	
	
	




	public List<Board> getBoardAll(Connection conn) {   
		List<Board> list = null;
		Board vo= new Board();
		String sql = "select * from board  order by bd_content_no desc"; 
		pstmt = null; rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, vo.getBd_number());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<Board>();
				do {
					vo.setBd_content(rs.getString("bd_content"));
					vo.setBd_content_no(rs.getInt("bd_content_no"));
					vo.setBd_date(rs.getDate("bd_date"));
					vo.setBd_subject(rs.getString("bd_subject"));
					vo.setBd_writer(rs.getString("bd_writer"));
					vo.setUser_no(rs.getInt("user_no"));
					vo.setBd_ref(rs.getInt("bd_ref"));
					vo.setBd_re_step(rs.getInt("bd_re_step"));
					vo.setBd_re_level(rs.getInt("bd_re_level"));
					vo.setBd_likecnt(rs.getInt("bd_likecnt"));
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
		String sql_1= "(select * from board";
		
		if(search == null) {
			sql_1 += " order by bd_content_no desc) d";
		} else {
			sql_1 += " where bd_subject like '%" + search+ "%' or bd_content like '%"+ search+ "%'"
					+ " order by bd_content_no desc) d";
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
					vo.setBd_content(rs.getString("bd_content"));
					vo.setBd_content_no(rs.getInt("bd_content_no"));
					vo.setBd_date(rs.getDate("bd_date"));
					vo.setBd_subject(rs.getString("bd_subject"));
					vo.setBd_writer(rs.getString("bd_writer"));
					vo.setUser_no(rs.getInt("user_no"));
					vo.setBd_ref(rs.getInt("bd_ref"));
					vo.setBd_re_step(rs.getInt("bd_re_step"));
					vo.setBd_re_level(rs.getInt("bd_re_level"));
					vo.setBd_likecnt(rs.getInt("bd_likecnt"));
					list.add(vo);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(list);
		return list;
	}
	
	
	
	
	
	public int getBoardCount(Connection conn,String search ) { 
		int cnt = 0;
		String sql = "select COUNT(*) from board ";
		
		
		if (search != null) {
			sql += " and bd_subject like '%" + search+ "%' or bd_content like '%"+ search+ "%'";
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
	
	
	

	public Board getBoardRead(Connection conn, Board inputVo ) {
		Board vo= null;
		String sql="select * from board where bd_content_no  =? ";
		pstmt = null; rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inputVo.getBd_content_no());  
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 vo = new Board();
				 vo.setBd_content(rs.getString("bd_content"));
					vo.setBd_content_no(rs.getInt("bd_content_no"));
					vo.setBd_date(rs.getDate("bd_date"));
					vo.setBd_subject(rs.getString("bd_subject"));
					vo.setBd_writer(rs.getString("bd_writer"));
					vo.setUser_no(rs.getInt("user_no"));
					vo.setBd_ref(rs.getInt("bd_ref"));
					vo.setBd_re_step(rs.getInt("bd_re_step"));
					vo.setBd_re_level(rs.getInt("bd_re_level"));
					vo.setBd_likecnt(rs.getInt("bd_likecnt"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}		
		return vo;
	}
	
	
	
	public int getBoardUpdate(Connection conn, Board vo) {
		pstmt = null; rs=null;
		int result = 0;
		String sql = "UPDATE board SET values (? , ? , ? , ? , ? , sysdate ,? ,? ,? ,?)";	
	
		try {
				pstmt= conn.prepareStatement(sql);
						pstmt.setInt(1, getNext(conn));
						pstmt.setInt(2, vo.getUser_no());
						pstmt.setString(3, vo.getBd_writer());
						pstmt.setString(4, vo.getBd_subject());
						pstmt.setString(5, vo.getBd_content());
						pstmt.setInt(6, vo.getBd_ref());
						pstmt.setInt(7, vo.getBd_re_step());
						pstmt.setInt(8, vo.getBd_re_level());
						pstmt.setInt(9, vo.getBd_likecnt());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result ;
		
		}
	
	public int getBoardDelete(Connection conn, Board vo) {
		pstmt = null; rs=null;
		int result = 0;
		String sql = "DELETE FROM BOARD WHERE BD_CONTENT_NO = ?";	
	
		try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getBd_content_no());
				result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result ;
		
		}
		
	
	
	//writefile
	public int getBoardWriteF( Connection conn,Board_Attach inputF) {
		int result = 0;
		String sql = "insert  into board_attach values(? ,?, ? , ? ,?)";
		pstmt = null; rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNextF(conn) );  
				pstmt.setInt(2, inputF.getBd_content_no());  
				pstmt.setInt(3, );  //fullname
				pstmt.setInt(4, );  //fullsize
				pstmt.setInt(5, );  //확장자
				pstmt.setInt(6, );  //path
		result = pstmt.executeQuery();
		if(rs.next()) {
			ao = new Board_Attach();
			ao.setBd_content_no(rs.getInt("bd_content_no"));
			System.out.println("여기까지는 정상?");
			ao.setContents_type(rs.getString("contents_type"));
			System.out.println(rs.getString("contents_type"));
			
			ao.setFile_no(rs.getInt("file_no"));
			ao.setFile_size(rs.getInt("file_size"));
			ao.setFullname(rs.getString("fullname"));
			
		}
	}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}		
		return result;

	}
	
	//readfile
	public Board_Attach getBoardReadF( Connection conn,Board_Attach inputF) {
		Board_Attach ao = null;
		String sql = "select * from board_attach where bd_content_no =? ";
		pstmt = null; rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inputF.getBd_content_no());  
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ao = new Board_Attach();
				ao.setBd_content_no(rs.getInt("bd_content_no"));
				System.out.println("여기까지는 정상?");
				ao.setContents_type(rs.getString("contents_type"));
				ao.setFile_no(rs.getInt("file_no"));
				ao.setFile_size(rs.getInt("file_size"));
				ao.setFullname(rs.getString("fullname"));
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}		
		return ao;
		
	}

}
