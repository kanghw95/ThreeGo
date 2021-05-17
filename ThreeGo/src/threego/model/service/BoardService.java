package threego.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.dao.BoardDAO;
import threego.model.vo.Board_Attach;
import threego.model.vo.Board;
import threego.model.vo.BoardLike;

public class BoardService {

	public int boardWrite(Board vo , String bd_category) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().boardWrite(conn, vo ,bd_category);
		JDBCTemplate.close(conn);
		System.out.println("패스");
		return result;
	}

	public int getNext(String bd_category) {
		// 현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().getNext(conn , bd_category);
		JDBCTemplate.close(conn);
		return result;
	}


	public List<Board> getBoardByPage(int start, int end, String search ,String bd_category) {
		Connection conn = JDBCTemplate.getConnection();
		List<Board> list = new BoardDAO().getBoardByPage(conn, start, end, search,bd_category);
		JDBCTemplate.close(conn);
		return list;

	}
	
	   public List<Board> getBoardByPage2(  int start , int end , String search, String user_no,String bd_category_1){
		      Connection conn = JDBCTemplate.getConnection();
		      List<Board> list = new BoardDAO().getBoardByPage2(conn, start, end , search, user_no,bd_category_1);      
		      JDBCTemplate.close(conn);
		      return list;
		      
		   }  

	public int getBoardCount(String search, String bd_category) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().getBoardCount(conn, search ,bd_category);
		JDBCTemplate.close(conn);
		return result;

	}
	public int getBoardCount2(String search, String bd_category, int user_no) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().getBoardCount2(conn, search ,bd_category,user_no);
		JDBCTemplate.close(conn);
		return result;
	}
	
	  
	   public int getBoardCount(String search) {     
	      Connection conn = JDBCTemplate.getConnection();
	       int result = new BoardDAO().getBoardCount(conn, search);   
	       JDBCTemplate.close(conn);
	      return result;
	   
	   }

	public Board getBoardRead(Board inputVo , String bd_category) {
		Connection conn = JDBCTemplate.getConnection();
		Board result = new BoardDAO().getBoardRead(conn, inputVo ,bd_category);
		JDBCTemplate.close(conn);
		return result;
	}

	public int getBoardUpdate(Board vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().getBoardUpdate(conn, vo);
		JDBCTemplate.close(conn);
		return result;
	}

	// 파일 업데이트
	public int getFileUpdate(Board_Attach ao, Board vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().getFileUpdate(conn, ao, vo);
		JDBCTemplate.close(conn);
		return result;
	}

	public int getBoardDelete(Board vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().getBoardDelete(conn, vo);
		JDBCTemplate.close(conn);
		return result;
	}

	public int boardWriteF(Board_Attach ao ,String bd_category) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().boardWriteF(conn, ao, bd_category);
		JDBCTemplate.close(conn);
		return result;

	}

	public int fileinsert(Board_Attach ao, Board vo ,String bd_category) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().fileinsert(conn, ao, vo, bd_category);
		JDBCTemplate.close(conn);
		return result;
	}

	public List<Board_Attach> boardReadF(List<Board_Attach> inputF, Board vo) { // 파일
		Connection conn = JDBCTemplate.getConnection();
		List<Board_Attach> list = new BoardDAO().boardReadF(conn, inputF, vo);
		JDBCTemplate.close(conn);
		return list;
	}

	// file delete
	public int getFileDelete(Board vo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().getFileDelete(conn, vo);
		JDBCTemplate.close(conn);
		return result;

	}

	public BoardLike getLike(String bd_no, String user_no) {
		Connection conn = JDBCTemplate.getConnection();
		BoardLike result = new BoardDAO().getLike(conn, bd_no, user_no);
		JDBCTemplate.close(conn);
		return result;
	}

	public int giveLike(int bd_no, int user_no, int like) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().giveLike(conn, bd_no, user_no, like);
		JDBCTemplate.close(conn);
		return result;
	}

	public int ReportSend(String user_no, String user_no2, String report_content, String bd_content_no) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().ReportSend(conn, user_no, user_no2, report_content, bd_content_no);
		JDBCTemplate.close(conn);
		return result;
	}

}
