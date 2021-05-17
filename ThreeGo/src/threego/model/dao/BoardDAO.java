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
import threego.model.vo.BoardLike;

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

	public int getNextF(Connection conn, String bd_category) {
		// 현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select file_no from board_attach";

		sql += " order by file_no desc";
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

	public int getNext(Connection conn, String bd_category) {
		String sql = "select bd_content_no from board";
		System.out.println("erwe" + bd_category);
		if (bd_category == "bd_category_1" || bd_category.equals("bd_category_1")) {
			sql += " where bd_content_no<1001";
		} else if (bd_category == "bd_category_2" || bd_category.equals("bd_category_2")) {
			sql += " where bd_content_no>1000 and bd_content_no<2001";
		} else if (bd_category == "bd_category_3" || bd_category.equals("bd_category_3")) {
			sql += " where bd_content_no>2000 and bd_content_no<3001";
		} else if (bd_category == "bd_category_4" || bd_category.equals("bd_category_4")) {
			sql += " where bd_content_no>3000 and bd_content_no<4001";
		} else {
			sql += " where bd_content_no>4000 and bd_content_no<5001";
		}

		sql += " order by bd_content_no desc";

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

	public int boardWrite(Connection conn, Board vo, String bd_category) {
		pstmt = null;
		int result = 0;
		String sql = "insert into board values (? , ? , ? , ? , ? , sysdate ,? ,null)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, getNext(conn, bd_category));

			pstmt.setInt(2, vo.getUser_no());

			pstmt.setString(3, vo.getBd_writer());
			System.out.println(vo.getBd_writer());

			pstmt.setString(4, vo.getBd_subject());
			pstmt.setString(5, vo.getBd_content());

			pstmt.setInt(6, vo.getBd_likecnt());

			result = pstmt.executeUpdate();

			if (result < 0) {
				System.out.println("작성실패");

			} else {

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println("작성성공");
		return result;

	}

	public List<Board> getBoardByPage(Connection conn, int start, int end, String search, String bd_category) {
		List<Board> list = null;

		String sql_1 = "(select * from board";

		if (bd_category == "bd_category_1" || bd_category.equals("bd_category_1")) {
			sql_1 += " where bd_content_no<1001";
		} else if (bd_category == "bd_category_2" || bd_category.equals("bd_category_2")) {
			sql_1 += " where bd_content_no>1000 and bd_content_no<2001";
		} else if (bd_category == "bd_category_3" || bd_category.equals("bd_category_3")) {
			sql_1 += " where bd_content_no>2000 and bd_content_no<3001";
		} else if (bd_category == "bd_category_4" || bd_category.equals("bd_category_4")) {
			sql_1 += " where bd_content_no>3000 and bd_content_no<4001";
		} else {
			sql_1 += " where bd_content_no>4000 and bd_content_no<5001";
		}
		if (search == null) {
			sql_1 += " order by bd_content_no desc) d";
		} else {
			sql_1 += " and (bd_subject like '%" + search + "%' or bd_content like '%" + search + "%')"
					+ " order by bd_content_no desc) d";
		}

		String sql = "select * from  (select rownum r, d.* from " + sql_1 + " ) where r >= ? and r <= ?";
		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Board>();
				do {
					Board vo = new Board();
					vo.setBd_content(rs.getString("bd_content"));
					vo.setBd_content_no(rs.getInt("bd_content_no"));
					vo.setBd_date(rs.getDate("bd_date"));
					vo.setBd_subject(rs.getString("bd_subject"));
					vo.setBd_writer(rs.getString("bd_writer"));
					vo.setUser_no(rs.getInt("user_no"));
					vo.setBd_likecnt(rs.getInt("bd_likecnt"));
					vo.setBd_category(rs.getString("bd_category"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(list);
		return list;
	}
	
	public List<Board> getBoardByPage2(Connection conn, int start, int end, String search,String User_no,String bd_category) {
		List<Board> list = null;
		String sql_1 = "(select * from board ";

		if (bd_category == "bd_category_1" || bd_category.equals("bd_category_1")) {
			sql_1 += " where bd_content_no<1001";
		} else if (bd_category == "bd_category_2" || bd_category.equals("bd_category_2")) {
			sql_1 += " where bd_content_no>1000 and bd_content_no<2001";
		} else if (bd_category == "bd_category_3" || bd_category.equals("bd_category_3")) {
			sql_1 += " where bd_content_no>2000 and bd_content_no<3001";
		} else if (bd_category == "bd_category_4" || bd_category.equals("bd_category_4")) {
			sql_1 += " where bd_content_no>3000 and bd_content_no<4001";
		} else {
			sql_1 += " where bd_content_no>4000 and bd_content_no<5001";
		}
		if (search == null) {
			sql_1 += " and user_no=? order by bd_content_no desc) d";
		} else {
			sql_1 += " and user_no=? and (bd_subject like '%" + search + "%' or bd_content like '%" + search + "%')"
					+ " order by bd_content_no desc) d";
		}

		String sql = "select * from  (select rownum r, d.* from " + sql_1 + " ) where r >= ? and r <= ?";

		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(User_no));
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Board>();
				do {
					Board vo = new Board();
					vo.setBd_content(rs.getString("bd_content"));
					vo.setBd_content_no(rs.getInt("bd_content_no"));
					vo.setBd_date(rs.getDate("bd_date"));
					vo.setBd_subject(rs.getString("bd_subject"));
					vo.setBd_writer(rs.getString("bd_writer"));
					vo.setUser_no(rs.getInt("user_no"));
					vo.setBd_likecnt(rs.getInt("bd_likecnt"));
					vo.setBd_category(rs.getString("bd_category"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(list);
		return list;
	}

	public int getBoardCount(Connection conn, String search, String bd_category) {
		int cnt = 0;
		String sql = "select COUNT(*) from board ";
		if (bd_category == "bd_category_1" || bd_category.equals("bd_category_1")) {
			sql += "where bd_content_no<1001";
		} else if (bd_category == "bd_category_2" || bd_category.equals("bd_category_2")) {
			sql += " where bd_content_no>1000 and bd_content_no<2001";
		} else if (bd_category == "bd_category_3" || bd_category.equals("bd_category_3")) {
			sql += " where bd_content_no>2000 and bd_content_no<3001";
		} else if (bd_category == "bd_category_4" || bd_category.equals("bd_category_4")) {
			sql += " where bd_content_no>3000 and bd_content_no<4001";
		} else {
			sql += " where bd_content_no>4000 and bd_content_no<5001";
		}
		if (search != null) {
			sql += " and bd_subject like '%" + search + "%' or bd_content like '%" + search + "%'";
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
	//내가 쓴 글 갯수 알아오기
	public int getBoardCount2(Connection conn, String search, String bd_category, int user_no) {
		int cnt = 0;
		String sql = "select COUNT(*) from board ";
		if (bd_category == "bd_category_1" || bd_category.equals("bd_category_1")) {
			sql += " where bd_content_no<1001";
		} else if (bd_category == "bd_category_2" || bd_category.equals("bd_category_2")) {
			sql += " where bd_content_no>1000 and bd_content_no<2001";
		} else if (bd_category == "bd_category_3" || bd_category.equals("bd_category_3")) {
			sql += " where bd_content_no>2000 and bd_content_no<3001";
		} else if (bd_category == "bd_category_4" || bd_category.equals("bd_category_4")) {
			sql += " where bd_content_no>3000 and bd_content_no<4001";
		} else {
			sql += " where bd_content_no>4000 and bd_content_no<5001";
		}
		
		sql+=" and user_no="+user_no;
		
		if (search != null) {
			sql += " and (bd_subject like '%" + search + "%' or bd_content like '%" + search + "%')";
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
	
	public int getBoardCount(Connection conn, String search) {
		int cnt = 0;
		String sql = "select COUNT(*) from board ";

		if (search != null) {
			sql += " and bd_subject like '%" + search + "%' or bd_content like '%" + search + "%'";
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


	public Board getBoardRead(Connection conn, Board inputVo, String bd_category) {
		Board vo = null;
		String sql = "select * from board where bd_content_no  =? ";

		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inputVo.getBd_content_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new Board();
				vo.setBd_content(rs.getString("bd_content"));
				vo.setBd_content_no(rs.getInt("bd_content_no"));
				vo.setBd_date(rs.getDate("bd_date"));
				vo.setBd_subject(rs.getString("bd_subject"));
				vo.setBd_writer(rs.getString("bd_writer"));
				vo.setUser_no(rs.getInt("user_no"));
				vo.setBd_likecnt(rs.getInt("bd_likecnt"));
				vo.setBd_category(rs.getString("bd_category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	public int getBoardUpdate(Connection conn, Board vo) {
		pstmt = null;
		rs = null;
		int result = 0;
		String sql = "UPDATE board  SET bd_subject=?, bd_content=?, bd_date=sysdate  where BD_CONTENT_NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBd_subject());
			pstmt.setString(2, vo.getBd_content());

			pstmt.setInt(3, vo.getBd_content_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;

	}

	public int getFileUpdate(Connection conn, Board_Attach ao, Board vo) {
		pstmt = null;
		rs = null;
		int result = 0;
		String sql = "UPDATE board_attach  SET BD_CONTENT_NO =? ,FILE_NO=? , FULLNAME=? , CONTENTS_TYPE=? , FILEPATH=?  where BD_CONTENT_NO =? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ao.getBd_content_no());
			pstmt.setInt(2, ao.getFile_no());
			pstmt.setString(3, ao.getFullname());
			pstmt.setString(4, ao.getContents_type());
			pstmt.setString(5, ao.getFilepath());
			pstmt.setInt(6, ao.getBd_content_no());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;

	}

	public int getBoardDelete(Connection conn, Board vo) {
		pstmt = null;
		rs = null;
		int result = 0;
		String sql = "DELETE FROM BOARD WHERE BD_CONTENT_NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBd_content_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;

	}

	// writefile
	public int boardWriteF(Connection conn, Board_Attach ao, String bd_category) {
		int result = 0;
		pstmt = null;
		rs = null;
		String sql = "insert  into board_attach values(? , ? , ? ,  ? , ?)";
		String sqlB = "select bd_content_no from board"; // bd_content_no 부모키 값 가져오기
		if (bd_category == "bd_category_1" || bd_category.equals("bd_category_1")) {
			sqlB += " where bd_content_no<1001";
		} else if (bd_category == "bd_category_2" || bd_category.equals("bd_category_2")) {
			sqlB += " where bd_content_no>1000 and bd_content_no<2001";
		} else if (bd_category == "bd_category_3" || bd_category.equals("bd_category_3")) {
			sqlB += " where bd_content_no>2000 and bd_content_no<3001";
		} else if (bd_category == "bd_category_4" || bd_category.equals("bd_category_4")) {
			sqlB += " where bd_content_no>3000 and bd_content_no<4001";
		} else {
			sqlB += " where bd_content_no>4000 and bd_content_no<5001";
		}
		sqlB += " order by bd_content_no desc";

		try {
			System.out.println("첨부 dao 진입성공");
			pstmt = conn.prepareStatement(sqlB);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ao.setBd_content_no(rs.getInt("bd_content_no"));
				close();
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNextF(conn, bd_category));

			pstmt.setInt(2, ao.getBd_content_no());

			pstmt.setString(3, ao.getFullname());

			pstmt.setString(4, ao.getContents_type()); // 확장자

			pstmt.setString(5, ao.getFilepath()); // path
			result = pstmt.executeUpdate();
			System.out.println("첨부파일 업로드 성공");
			if (result < 0) {
				System.out.println("업로드 실패");

			} else {

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// fileinsert == update
	public int fileinsert(Connection conn, Board_Attach ao, Board vo, String bd_category) {
		int result = 0;
		pstmt = null;
		rs = null;
		String sql = "insert  into board_attach values(? , ? , ? ,  ? , ?)";
//      String sqlB = "select bd_content_no from board order by bd_content_no  desc"; // bd_content_no 부모키 값 가져오기
		try {

			pstmt = conn.prepareStatement(sql); // delete한 no가져오기 --> 포기 최신값으로
			pstmt.setInt(1, getNextF(conn, bd_category));

			pstmt.setInt(2, vo.getBd_content_no()); // vo

			pstmt.setString(3, ao.getFullname());

			pstmt.setString(4, ao.getContents_type()); // 확장자

			pstmt.setString(5, ao.getFilepath()); // path
			result = pstmt.executeUpdate();
			System.out.println("첨부파일까지 ...성공?");
			System.out.println("첨부파일 수정 성공");
			if (result < 0) {
				System.out.println("첨부파일 수정 실패");

			} else {

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// readfile
	public List<Board_Attach> boardReadF(Connection conn, List<Board_Attach> inputF, Board vo) {
		List<Board_Attach> list = null;

		String sql = "select * from board_attach where bd_content_no =? ";
		pstmt = null;
		rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBd_content_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Board_Attach>();
				do {
					Board_Attach ao = new Board_Attach();
					ao.setFile_no(rs.getInt("file_no"));
					ao.setBd_content_no(rs.getInt("bd_content_no"));
					ao.setFullname(rs.getString("fullname"));
					ao.setContents_type(rs.getString("contents_type"));
					ao.setFilepath(rs.getString("filepath"));
					list.add(ao);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;

	}

//file delete
	public int getFileDelete(Connection conn, Board vo) {
		pstmt = null;
		rs = null;
		int result = 0;
		String sql = "DELETE FROM Board_Attach WHERE BD_CONTENT_NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBd_content_no());
			result = pstmt.executeUpdate();
			System.out.println("기존 첨부파일 삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;

	}

//좋아요 정보
	public BoardLike getLike(Connection conn, String bd_no, String user_no) {

		pstmt = null;
		rs = null;
		BoardLike resultVo = null;

		String sql = "select * from board_like where user_no=? and bd_content_no=?";
		if(user_no!=null) {
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(user_no));
			pstmt.setInt(2, Integer.parseInt(bd_no));

			rs = pstmt.executeQuery();

			if (rs.next()) {
				resultVo = new BoardLike();
				resultVo.setBd_content_no(rs.getInt("bd_content_no"));
				resultVo.setLikecheck(rs.getInt("likecheck"));
				resultVo.setUser_no(rs.getInt("user_no"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		}

		return resultVo;
	}

//좋아요 업데이트
	public int giveLike(Connection conn, int bd_no, int user_no, int like) {
		int result = 0;
		pstmt = null;
		rs = null;
		String sql = "";
		String count = "select COUNT(*) from board_like  where bd_content_no=? group by bd_content_no";
		int likecnt = 0;
		int ck=0;
		String check="select COUNT(*) from board_like where user_no =? and bd_content_no=?";
		
		
		String update = "update board set bd_likecnt =? where bd_content_no=?";

		if (like == 0) {
			sql = "delete from board_like where bd_content_no=? and user_no=?";
		} else {
			sql = "insert into board_like values(?,?,1)";
		}

		try {
//			pstmt = conn.prepareStatement(check);
//			pstmt.setInt(2, bd_no);
//			pstmt.setInt(1, user_no);
//			rs=pstmt.executeQuery();
//			ck=rs.getInt(1);
//			close();
//			if(ck=)
//			
//			
//			close();
//			return= result;
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bd_no);
			pstmt.setInt(2, user_no);

			result = pstmt.executeUpdate();

			close();

			pstmt = conn.prepareStatement(count);
			pstmt.setInt(1, bd_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				likecnt = rs.getInt(1);
				System.out.println("likecnt" + likecnt);
			}
			close();
			pstmt = conn.prepareStatement(update);
			pstmt.setInt(1, likecnt);
			pstmt.setInt(2, bd_no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public int ReportSend(Connection conn, String user_no, String user_no2, String report_content,
			String bd_content_no) {
		int result = 0;
		int max = 1;

		pstmt = null;
		rs = null;

		String sqlMaxReport_no = "select nvl(max(bd_report_no),0)+1 from board_report";
		String sql = "insert into board_report values(? , ? , ? ,  ? , ?, sysdate)";
		try {
			pstmt = conn.prepareStatement(sqlMaxReport_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				max = rs.getInt(1);
			} else {
				return 0;
			}

			{
				close();

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, max);
				pstmt.setInt(2, Integer.parseInt(user_no));
				pstmt.setInt(3, Integer.parseInt(bd_content_no));
				pstmt.setInt(4, Integer.parseInt(user_no2));
				pstmt.setString(5, report_content);

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

}
