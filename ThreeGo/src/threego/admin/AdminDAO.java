package threego.admin;

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
					vo.setLast_login(rs.getString("last_login"));
					vo.setPhone(rs.getString("phone"));
					vo.setEmail(rs.getString("email"));
					vo.setGender(rs.getString("gender").charAt(0));
					vo.setBirth(rs.getString("birth"));
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
	
	//회원 정보 보기
	public List<User> selectUser(Connection conn, int no) {
		List<User> list = new ArrayList<User>();

		String sql = "select * from USER_TB where user_no="+no;

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
			close();
		}
		return list;
	}
	
	
	
	
	
	//게시판 보여주기.**게시판 목록 왼성되면 그거 사용**
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
					vo.setLast_login(rs.getString("last_login"));
					vo.setPhone(rs.getString("phone"));
					vo.setEmail(rs.getString("email"));
					vo.setGender(rs.getString("gender").charAt(0));
					vo.setBirth(rs.getString("birth"));
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
	
	//유저 qna 리스트 보이기
	public List<QNA> getQNAByPage(Connection conn, int start, int end, String search) {
		List<QNA> list = null;
		String sql_1= "(select * from QNA ";
		
		if(search == null) {
			sql_1 += " order by qna_no desc) d";
		} else {
			sql_1 += " where qna_subject like '%" + search+ "%' order by qna_no desc) d";
		}					
		
		String sql = "select * from "
					+ " (select rownum r, d.* from " + sql_1  + " ) "
					+ " where r >= ? and r <= ?";
		System.out.println(sql);
		pstmt = null; rs = null;

		try {
			pstmt = conn.prepareStatement(sql );
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				list = new ArrayList<QNA>();
				do {
					QNA vo = new QNA();
					vo.setUser_no(Integer.parseInt(rs.getString("user_no")));
					vo.setQna_no(rs.getInt("qna_no"));
					vo.setUser_no(rs.getInt("user_no"));//여기서 의문 : FK일시 여기서 가지고 오는게 맞는건가?
					vo.setQna_subject(rs.getString("qna_subject"));
					vo.setQna_content(rs.getString("qna_content"));
					vo.setQna_pwd(rs.getString("qna_pwd"));
					vo.setQna_open(rs.getInt("qna_open"));
					vo.setA_content(rs.getString("a_content"));
					vo.setQna_kind(rs.getString("qna_kind"));
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
	//화면에 보여지는 qna 카운트.
	public int getQNACount(Connection conn, String search) {
		int cnt = 0;
		String sql = "select COUNT(*) from qna";
		if (search != null) {
			sql += " where qna_subject like '%" + search+ "%'";
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
	//qna 답변하기
	public int qnaAnswerUpdate(Connection conn, QNA vo) {
		int result = 0;
		String query = "update qna set a_content=? where qna_no=?";
		pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getA_content());
			pstmt.setInt(2, vo.getQna_no());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	//qna user 조인해서 닉네임 뽑아오기
	public List<QNA_USER> getQnaInf(Connection conn) {
		List<QNA_USER> list = null;
		String sql= "select q.qna_no as a,q.user_no as b,u.nickname,q.a_content from qna q join user_tb u on q.user_no=u.user_no order by qna_no desc ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<QNA_USER>();
				do {
					QNA_USER vo = new QNA_USER();
					vo.setQna_no(rs.getInt(1));
					vo.setUser_no(rs.getInt(2));
					vo.setNickname(rs.getString(3));
					vo.setA_content(rs.getString(4));
					list.add(vo);
				}while(rs.next());
			};
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return list;
		
	}
	//FAQ 리스트 뽑아오기
	public List<FAQ> getFAQByPage(Connection conn) {
		List<FAQ> list = null;
		String sql= "select * from faq where faq_no<1000 order by faq_no desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<FAQ>();
				do {
					FAQ vo = new FAQ();
					vo.setFaq_no(rs.getInt("faq_no"));
					vo.setFaq_subject(rs.getString("faq_subject"));
					vo.setFaq_content(rs.getString("faq_content"));
					vo.setAdmin_number(rs.getInt("admin_number"));
					list.add(vo);
				}while(rs.next());
			};
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return list;
		
	}
	//FAQ,공지사항 답변 수정하기
	public int FQAUpdate(Connection conn, FAQ vo) {
		int result = 0;
		String sql ="update faq set faq_subject=?, faq_content=? where faq_no=?";
		pstmt = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getFaq_subject());
			pstmt.setString(2, vo.getFaq_content());
			pstmt.setInt(3, vo.getFaq_no());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return result;
	}
	//FAQ,공지사항 글쓰기
	public int FQAInsert(Connection conn, FAQ vo) {
		int result = 0;
		int max = 0;
		String sqlMaxno = "";
		if(vo.getFaq_no()<100) {
			sqlMaxno = "select nvl(max(faq_no), 0)+1 from faq where faq_no<1000";
		}else {
			sqlMaxno = "select nvl(max(faq_no), 0)+1 from faq where faq_no>1000";
		}
		String sql = "insert into faq values(?,?,?,5) ";
		pstmt = null; rs=null;
		try {
			pstmt = conn.prepareStatement(sqlMaxno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt(1);
			}
			close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, max );
			pstmt.setString(2, vo.getFaq_subject());
			pstmt.setString(3, vo.getFaq_content());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
			
		return result;
	}
	//FAQ,공지사항 삭제
	public int FQAdelete(Connection conn, int no) {
		int result = 0;
		String sql = "delete from faq where faq_no =? ";
		pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return result;
	}
	//FAQ 리스트 뽑아오기
	public List<FAQ> getNotifyByPage(Connection conn,int start,int end, String search) {
		List<FAQ> list = null;
		String sql= "(select * from faq ";
		if(search == null ) {
			sql+=" where faq_no>1000 order by faq_no desc) d";
		}else {
			sql+=" where faq_no>1000 and faq_subject like '%"+search+"%' order by faq_no desc) d";
		}
		String sql1 = "select * from "
				+ " (select rownum r, d.* from " + sql  + " ) "
				+ " where r >= ? and r <= ?";
		System.out.println(sql1);
		System.out.println(start);
		System.out.println(end);
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<FAQ>();
				do {
					FAQ vo = new FAQ();
					vo.setFaq_no(rs.getInt("faq_no"));
					vo.setFaq_subject(rs.getString("faq_subject"));
					vo.setFaq_content(rs.getString("faq_content"));
					vo.setAdmin_number(rs.getInt("admin_number"));
					list.add(vo);
				}while(rs.next());
			};
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return list;
		
	}
	//화면에 보여지는 공지사항 카운트.
	public int getNotifyCount(Connection conn, String search) {
		int cnt = 0;
		String sql = "select COUNT(*) from faq";
		if (search != null) {
			sql += " where faq_subject like '%" + search+ "%' and faq_no>1000";
		}else {
			sql += " where faq_no>1000";
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
	//FAQ,공지사항 글쓰기
	public int QNAInsert(Connection conn, QNA vo) {
		int result = 0;
		int max = 0;
		String sqlMaxno = "";
			sqlMaxno = "select nvl(max(qna_no), 0)+1 from qna ";
	
		String sql = "insert into qna values(?,?,?,?,?,?,?,?) ";
		pstmt = null; rs=null;
		try {
			pstmt = conn.prepareStatement(sqlMaxno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt(1);
			}
			close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, max );
			pstmt.setInt(2, vo.getUser_no());
			pstmt.setString(3, vo.getQna_subject());
			pstmt.setString(4, vo.getQna_content());
			pstmt.setString(5, vo.getQna_pwd());
			System.out.println("pwd:"+vo.getQna_pwd());
			int open=0;
			if(!vo.getQna_pwd().equals("")) {
				open=1;
			}
			pstmt.setInt(6, open);
			pstmt.setString(7, null);
			pstmt.setString(8, vo.getQna_kind());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
			
		return result;
	}
	//FAQ,공지사항 답변 수정하기
		public int QNAUpdate(Connection conn, QNA vo) {
			int result = 0;
			String sql ="update qna set qna_subject=?, qna_content=?, qna_kind=? where qna_no=?";
			pstmt = null;
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, vo.getQna_subject());
				pstmt.setString(2, vo.getQna_subject());
				pstmt.setString(3, vo.getQna_kind());
				pstmt.setInt(4, vo.getQna_no());
				
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return result;
		}
		//관리자 정보
		public Admin adminlogin(Connection conn, Admin vo) {

			pstmt = null;
			rs = null;
			Admin resultVo = null;

			String sql = "select * from admin_tb where admin_id = ?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getAdmin_id());
			
				rs = pstmt.executeQuery();

				if (rs.next()) {
					resultVo = new Admin();
					resultVo.setAdmin_id(rs.getString("admin_id"));
					resultVo.setAdmin_name(rs.getString("admin_name"));
					resultVo.setAdmin_number(rs.getInt("admin_number"));
					resultVo.setAdmin_pwd(rs.getString("admin_pwd"));
					
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			

			return resultVo;
		}
}
