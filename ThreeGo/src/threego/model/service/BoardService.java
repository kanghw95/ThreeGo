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

public class BoardService {

	public int boardWrite(Board vo) {
			Connection conn = JDBCTemplate.getConnection();
			int result= new BoardDAO().boardWrite(conn, vo );
			JDBCTemplate.close(conn);
			System.out.println("패스");
			return result;
	}
	
	public int getNext() {
		// 현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		Connection conn = JDBCTemplate.getConnection();
		int result= new BoardDAO().getNext(conn );
		JDBCTemplate.close(conn);
		return result;
	}
	
	
	public List<Board> getBoardByPage(  int start , int end , String search){
		Connection conn = JDBCTemplate.getConnection();
		List<Board> list = new BoardDAO().getBoardByPage(conn, start, end , search);		
		JDBCTemplate.close(conn);
		return list;
		
	}	
	
	
	public int getBoardCount(String search) {     
		Connection conn = JDBCTemplate.getConnection();
	    int result = new BoardDAO().getBoardCount(conn, search);	
	    JDBCTemplate.close(conn);
		return result;
	
	}
	
	public Board getBoardRead( Board inputVo ) {
		Connection conn = JDBCTemplate.getConnection();
	    Board result = new BoardDAO().getBoardRead(conn, inputVo);	
	    JDBCTemplate.close(conn);
		return result;
	}
	public int getBoardUpdate( Board vo ) {
		Connection conn = JDBCTemplate.getConnection();
	    int result = new BoardDAO().getBoardUpdate(conn, vo);	
	    JDBCTemplate.close(conn);
		return result;
	}
	public int getBoardDelete( Board vo ) {
		Connection conn = JDBCTemplate.getConnection();
	    int result = new BoardDAO().getBoardDelete(conn, vo);	
	    JDBCTemplate.close(conn);
		return result;
	}
	
	
	public int boardWriteF(  Board_Attach ao) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDAO().boardWriteF(conn, ao );	
		JDBCTemplate.close(conn);
		return result;
		
		
		
	}
	
	public Board_Attach boardReadF( Board_Attach inputF) {   //파일
		Connection conn = JDBCTemplate.getConnection();
		Board_Attach result = new BoardDAO().boardReadF(conn, inputF);	
		JDBCTemplate.close(conn);
		return result;
	}
	
	
	
	
	
	}
	

